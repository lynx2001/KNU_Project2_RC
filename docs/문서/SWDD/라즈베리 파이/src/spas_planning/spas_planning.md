# spas_planning


## spas_planning

## parking_space_detector.py

```python
#!/usr/bin/env python3
"""
SPAS Parking Space Detector Node  ―  슬라이딩 윈도우 알고리즘
=============================================================

【동작 흐름】
  /map (OccupancyGrid)
    │
    ├─① 맵 이진화
    │    OccupancyGrid 셀 값을 free_map / occ_map 으로 분리
    │
    ├─② 탐색 반경 마스크
    │    TF 로 로봇 위치를 읽어 search_radius 원 안만 탐색
    │
    ├─③ 슬라이딩 윈도우 탐지
    │    space_length × space_width 창을 두 방향(가로/세로)으로 모두 탐색
    │      (a) 창 내부 자유 공간 비율 ≥ min_free_ratio
    │      (b) 창 외곽 4면 벽 검사: 각 면 점유 비율 ≥ wall_occ_ratio 인 면 수 ≥ min_wall_sides
    │    후보마다 뚫린 면 방향(open_yaw) 계산
    │
    ├─④ NMS
    │    동일 공간 중복 후보 제거 (score 기준)
    │
    ├─⑤ 주차 유형 판별 (travel_direction 무관)
    │    탐지 창의 깊이(depth) vs 입구 폭(opening) 비교:
    │      depth > opening  →  직각주차
    │      depth ≤ opening  →  평행주차
    │    여기서 depth = 뚫린 면에 수직인 변의 길이
    │
    ├─⑥ goal_yaw 계산
    │    TF 에서 차체 현재 yaw 읽기
    │    직각주차: 뚫린 면의 법선 방향 (open_yaw) → 차 앞쪽이 입구를 향함
    │    평행주차: 뚫린 면과 평행한 방향 (open_yaw ± π/2)
    │    최종 부호(±)는 플래너가 접근 방향 보고 선택
    │
    └─⑦ 발행 & 저장
         /parking_spaces        (PoseArray)   ← 중심 좌표
         /parking_spaces_info   (String/JSON) ← type, goal_yaw, open_yaw 포함
         /parking_space_markers (MarkerArray) ← RViz2 박스
         ~/spas_ws/maps/*.png              ← 디버그 이미지

【주차 유형 판별 상세】
  슬라이딩 윈도우는 항상 가로창(ww=sl, wh=sw) / 세로창(ww=sw, wh=sl) 두 방향 탐색.
  벽 검사 결과에서 점유 비율이 낮은 면 = 뚫린 면(입구).
  뚫린 면에 수직인 변 = depth, 뚫린 면과 평행한 변 = opening.
    depth > opening  →  공간이 진입 방향으로 깊게 파여있음  →  직각주차
    depth ≤ opening  →  공간이 옆으로 넓게 열려있음         →  평행주차

【goal_yaw 상세】
  open_yaw: 뚫린 면의 법선 방향 (맵 좌표계 기준, rad)
    뚫린 면이 top (row 방향 위) → 차가 위쪽으로 진입 → open_yaw = -π/2
    뚫린 면이 bot               → open_yaw = +π/2
    뚫린 면이 lft (col 방향 왼) → open_yaw = π
    뚫린 면이 rgt               → open_yaw = 0.0

  직각주차 goal_yaw = open_yaw
    (차 앞쪽이 입구 방향을 향한 채로 주차 완료)

  평행주차 goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 선택)
    (차가 공간과 나란히 정렬되어 주차 완료)

【파라미터】
  space_length      : 주차 공간 긴 변 (m)
  space_width       : 주차 공간 짧은 변 (m)
  free_threshold    : 이 값 이하 셀 = 빈 공간
  occupied_threshold: 이 값 이상 셀 = 벽/장애물
  search_radius     : 로봇 중심 탐색 반경 (m)
  wall_border       : 창 외곽 벽 검사 띠 두께 (m)
  min_wall_sides    : 벽으로 인정할 최소 면 수 (2~4)
  min_free_ratio    : 창 내부 자유 셀 비율 하한 (0~1)
  wall_occ_ratio    : 벽 판정 점유 비율 하한 (0~1)
  base_frame        : 로봇 TF 프레임
  map_save_scale    : PNG 저장 업스케일 배율
"""

import json
import math
import os
import time

import cv2
import numpy as np
import rclpy
import tf2_ros
from geometry_msgs.msg import Pose, PoseArray, Quaternion
from nav_msgs.msg import OccupancyGrid
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from tf_transformations import euler_from_quaternion
from visualization_msgs.msg import Marker, MarkerArray


class ParkingSpaceDetectorNode(Node):
    def __init__(self):
        super().__init__('parking_space_detector')

        # ── 파라미터 선언 ───────────────────────────────────────────────
        self.declare_parameter('space_length',       0.40)
        self.declare_parameter('space_width',        0.30)
        self.declare_parameter('free_threshold',     30)
        self.declare_parameter('occupied_threshold', 65)
        self.declare_parameter('search_radius',      2.0)
        self.declare_parameter('wall_border',        0.05)
        self.declare_parameter('min_wall_sides',     3)
        self.declare_parameter('min_free_ratio',     0.70)
        self.declare_parameter('wall_occ_ratio',     0.20)
        self.declare_parameter('base_frame',         'base_link')
        self.declare_parameter('map_save_scale',     4)

        self._load_params()

        self._map_dir = os.path.expanduser('~/spas_ws/maps')
        os.makedirs(self._map_dir, exist_ok=True)

        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ───────────────────────────────────────────────────
        self._pub_spaces  = self.create_publisher(PoseArray,   '/parking_spaces',        10)
        self._pub_info    = self.create_publisher(String,      '/parking_spaces_info',   10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_space_markers', 10)

        self._sub_map = self.create_subscription(
            OccupancyGrid, '/map', self._map_callback, 10
        )

        self.get_logger().info(
            f'ParkingSpaceDetector 시작. '
            f'space={self._space_length:.2f}x{self._space_width:.2f}m  '
            f'search_radius={self._search_radius:.1f}m'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────
    def _load_params(self):
        self._space_length   = self.get_parameter('space_length').value
        self._space_width    = self.get_parameter('space_width').value
        self._free_threshold = self.get_parameter('free_threshold').value
        self._occ_threshold  = self.get_parameter('occupied_threshold').value
        self._search_radius  = self.get_parameter('search_radius').value
        self._wall_border    = self.get_parameter('wall_border').value
        self._min_wall_sides = self.get_parameter('min_wall_sides').value
        self._min_free_ratio = self.get_parameter('min_free_ratio').value
        self._wall_occ_ratio = self.get_parameter('wall_occ_ratio').value
        self._base_frame     = self.get_parameter('base_frame').value
        self._map_save_scale = max(1, int(self.get_parameter('map_save_scale').value))

    # ── TF: 로봇 위치 + 차체 yaw ──────────────────────────────────────
    def _get_robot_pose(self):
        """
        TF 에서 map → base_frame 변환을 읽어
        로봇 위치 (x, y) 와 차체 yaw (rad) 를 반환.
        TF 실패 시 (0.0, 0.0, 0.0) 폴백.
        """
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.1)
            )
            t = tf.transform.translation
            q = tf.transform.rotation
            _, _, yaw = euler_from_quaternion([q.x, q.y, q.z, q.w])
            return t.x, t.y, yaw
        except tf2_ros.TransformException:
            self.get_logger().warn(
                f'TF map→{self._base_frame} 없음; 원점(0,0) yaw=0 사용',
                throttle_duration_sec=5.0
            )
            return 0.0, 0.0, 0.0

    # ── 주차 유형 판별 ────────────────────────────────────────────────
    def _classify_parking_type(self, open_face: str, pw: float, ph: float) -> str:
        """
        뚫린 면(open_face)을 기준으로 depth / opening 을 결정한 뒤
        주차 유형을 판별한다.

        open_face 가 'top' 또는 'bot' (행 방향으로 뚫림):
          depth   = ph  (세로 변, 뚫린 면에 수직)
          opening = pw  (가로 변, 뚫린 면에 평행)

        open_face 가 'lft' 또는 'rgt' (열 방향으로 뚫림):
          depth   = pw  (가로 변, 뚫린 면에 수직)
          opening = ph  (세로 변, 뚫린 면에 평행)

        depth > opening  →  직각주차  (그림의 오른쪽 케이스)
        depth ≤ opening  →  평행주차  (그림의 왼쪽 케이스)
        """
        if open_face in ('top', 'bot'):
            depth, opening = ph, pw
        else:  # 'lft', 'rgt'
            depth, opening = pw, ph

        return '직각주차' if depth > opening else '평행주차'

    # ── 뚫린 면의 법선 방향 계산 ─────────────────────────────────────
    def _open_face_yaw(self, open_face: str) -> float:
        """
        뚫린 면의 법선이 맵 좌표계에서 향하는 방향각 (rad) 반환.
        차가 이 방향을 정면으로 향한 채 진입하면 공간 안으로 들어간다.

          top  → 공간 위쪽이 열림 → 차는 위(-Y) 방향으로 들어감 → -π/2
          bot  → 공간 아래쪽이 열림 → 차는 아래(+Y) 방향        → +π/2
          lft  → 공간 왼쪽이 열림  → 차는 왼쪽(-X) 방향         → π
          rgt  → 공간 오른쪽이 열림 → 차는 오른쪽(+X) 방향      → 0.0
        """
        return {
            'top': -math.pi / 2.0,
            'bot':  math.pi / 2.0,
            'lft':  math.pi,
            'rgt':  0.0,
        }[open_face]

    # ── goal_yaw 계산 ─────────────────────────────────────────────────
    def _compute_goal_yaw(self, parking_type: str, open_yaw: float) -> float:
        """
        주차 완료 시 차체가 향할 방향각 (기준각, rad).

        직각주차:
          차 앞쪽이 입구(open_yaw)를 향한 채 주차 완료.
          goal_yaw = open_yaw

        평행주차:
          차가 공간과 나란히 정렬된 채 주차 완료.
          goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 접근 방향 보고 선택)

        반환값은 기준각이며 플래너가 실제 접근 방향을 보고
        goal_yaw vs goal_yaw + π 중 가까운 쪽을 선택한다.
        """
        if parking_type == '직각주차':
            return open_yaw
        else:  # 평행주차
            return open_yaw + math.pi / 2.0

    # ── 메인 콜백 ─────────────────────────────────────────────────────
    def _map_callback(self, msg: OccupancyGrid):
        self.get_logger().info('Map received — sliding-window detection 시작.')

        resolution = msg.info.resolution
        origin     = msg.info.origin
        width      = msg.info.width
        height     = msg.info.height

        grid     = np.array(msg.data, dtype=np.int8).reshape((height, width))
        free_map = ((grid >= 0) & (grid <= self._free_threshold)).astype(np.float32)
        occ_map  = (grid >= self._occ_threshold).astype(np.float32)

        robot_x, robot_y, robot_yaw = self._get_robot_pose()
        rx_cell = (robot_x - origin.position.x) / resolution
        ry_cell = (robot_y - origin.position.y) / resolution

        candidates = self._sliding_window_detect(
            free_map, occ_map, rx_cell, ry_cell, origin, resolution, height, width
        )

        self.get_logger().info(f'탐지된 주차 공간 수: {len(candidates)}')

        pose_array = PoseArray()
        pose_array.header.stamp    = self.get_clock().now().to_msg()
        pose_array.header.frame_id = 'map'
        marker_array = MarkerArray()
        info_list    = []

        best_idx = 0
        for i, c in enumerate(candidates):
            # ── Pose ──────────────────────────────────────────────────
            pose = Pose()
            pose.position.x  = c['mx']
            pose.position.y  = c['my']
            pose.position.z  = 0.0
            pose.orientation = Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)
            pose_array.poses.append(pose)

            # ── 주차 유형 판별 & goal_yaw 계산 ──────────────────────
            open_face    = c['open_face']
            open_yaw     = self._open_face_yaw(open_face)
            parking_type = self._classify_parking_type(open_face, c['pw'], c['ph'])
            goal_yaw     = self._compute_goal_yaw(parking_type, open_yaw)

            info_list.append({
                'index':      i,
                'is_best':    (i == best_idx),
                'mx':         round(c['mx'],   4),
                'my':         round(c['my'],   4),
                'pw':         round(c['pw'],   4),
                'ph':         round(c['ph'],   4),
                'type':       parking_type,
                'open_face':  open_face,
                'open_yaw':   round(open_yaw,  6),
                'goal_yaw':   round(goal_yaw,  6),
                'score':      round(c['score'], 4),
                'walls':      c['walls'],
            })

            # ── 마커 색상 ───────────────────────────────────────────
            is_best = (i == best_idx)
            if is_best:
                color = ColorRGBA(r=1.0, g=0.0, b=0.0, a=0.85)
            elif parking_type == '평행주차':
                color = ColorRGBA(r=0.0, g=0.8, b=0.0, a=0.30)
            else:
                color = ColorRGBA(r=0.0, g=0.0, b=0.8, a=0.30)

            marker_array.markers.append(
                self._make_box_marker(
                    i, pose_array.header,
                    c['mx'], c['my'], c['pw'], c['ph'],
                    color, parking_type
                )
            )

            best_tag = ' ★ BEST' if is_best else ''
            self.get_logger().info(
                f'Space #{i} [{parking_type}]{best_tag} '
                f'at ({c["mx"]:.3f}, {c["my"]:.3f}) m  '
                f'open={open_face}  open_yaw={open_yaw:.3f}rad  '
                f'goal_yaw={goal_yaw:.3f}rad  score={c["score"]:.3f}'
            )

        self._pub_spaces.publish(pose_array)

        info_msg      = String()
        info_msg.data = json.dumps(info_list, ensure_ascii=False)
        self._pub_info.publish(info_msg)

        self._pub_markers.publish(marker_array)
        self._save_map_png(free_map, occ_map, rx_cell, ry_cell,
                           candidates, best_idx, resolution, height, width)

    # ── 슬라이딩 윈도우 탐지 ──────────────────────────────────────────
    def _sliding_window_detect(self, free_map, occ_map,
                                rx_cell, ry_cell,
                                origin, resolution, height, width):
        sl = max(1, int(round(self._space_length / resolution)))
        sw = max(1, int(round(self._space_width  / resolution)))
        b  = max(1, int(round(self._wall_border  / resolution)))

        radius_cells = self._search_radius / resolution

        r_lo = max(0,      int(ry_cell - radius_cells) - b)
        r_hi = min(height, int(ry_cell + radius_cells) + b + 1)
        c_lo = max(0,      int(rx_cell - radius_cells) - b)
        c_hi = min(width,  int(rx_cell + radius_cells) + b + 1)

        fi = cv2.integral(free_map)
        oi = cv2.integral(occ_map)

        def box_sum(intg, r1, c1, r2, c2):
            r1, c1 = max(0, r1), max(0, c1)
            r2, c2 = min(height, r2), min(width, c2)
            if r2 <= r1 or c2 <= c1:
                return 0.0
            return float(intg[r2, c2] - intg[r1, c2]
                         - intg[r2, c1] + intg[r1, c1])

        raw = []

        # 두 방향 모두 탐색 (travel_direction 무관)
        orientations = [(sw, sl), (sl, sw)] if sl != sw else [(sw, sl)]

        for wh, ww in orientations:
            for r in range(r_lo, min(r_hi, height - wh + 1)):
                for c in range(c_lo, min(c_hi, width - ww + 1)):

                    dr = (r + wh / 2.0) - ry_cell
                    dc = (c + ww / 2.0) - rx_cell
                    if dr * dr + dc * dc > radius_cells ** 2:
                        continue

                    area = float(wh * ww)
                    interior_free = box_sum(fi, r, c, r + wh, c + ww)
                    free_ratio = interior_free / area
                    if free_ratio < self._min_free_ratio:
                        continue

                    top_area = float(b * ww)
                    lr_area  = float(wh * b)

                    top_occ = box_sum(oi, r - b,     c,      r,          c + ww)
                    bot_occ = box_sum(oi, r + wh,    c,      r + wh + b, c + ww)
                    lft_occ = box_sum(oi, r,         c - b,  r + wh,     c     )
                    rgt_occ = box_sum(oi, r,         c + ww, r + wh,     c + ww + b)

                    top_hit = top_area > 0 and top_occ / top_area >= self._wall_occ_ratio
                    bot_hit = top_area > 0 and bot_occ / top_area >= self._wall_occ_ratio
                    lft_hit = lr_area  > 0 and lft_occ / lr_area  >= self._wall_occ_ratio
                    rgt_hit = lr_area  > 0 and rgt_occ / lr_area  >= self._wall_occ_ratio

                    walls = sum([top_hit, bot_hit, lft_hit, rgt_hit])
                    if walls < self._min_wall_sides:
                        continue

                    # ── 뚫린 면 결정 ──────────────────────────────
                    # 벽이 없는(점유 비율이 낮은) 면 = 입구
                    # 여러 면이 뚫려있으면 점유 비율이 가장 낮은 면을 입구로 선택
                    face_occ = {
                        'top': top_occ / top_area if top_area > 0 else 1.0,
                        'bot': bot_occ / top_area if top_area > 0 else 1.0,
                        'lft': lft_occ / lr_area  if lr_area  > 0 else 1.0,
                        'rgt': rgt_occ / lr_area  if lr_area  > 0 else 1.0,
                    }
                    open_face = min(face_occ, key=face_occ.get)

                    score = free_ratio + 0.05 * walls

                    cx_cell = c + ww / 2.0
                    cy_cell = r + wh / 2.0
                    mx = origin.position.x + (cx_cell + 0.5) * resolution
                    my = origin.position.y + (cy_cell + 0.5) * resolution

                    raw.append({
                        'mx': mx, 'my': my,
                        'pw': ww * resolution,
                        'ph': wh * resolution,
                        'score': score,
                        'walls': walls,
                        'open_face': open_face,
                        'r': r, 'c': c, 'wh': wh, 'ww': ww,
                    })

        self.get_logger().info(f'윈도우 후보 수 (NMS 전): {len(raw)}')

        raw.sort(key=lambda x: -x['score'])
        nms_dist_sq = self._space_length ** 2
        kept = []
        for cand in raw:
            too_close = any(
                (cand['mx'] - k['mx']) ** 2 + (cand['my'] - k['my']) ** 2 < nms_dist_sq
                for k in kept
            )
            if not too_close:
                kept.append(cand)

        return kept

    # ── RViz2 마커 생성 ───────────────────────────────────────────────
    def _make_box_marker(self, mid, header, x, y, sx, sy, color, parking_type=''):
        m = Marker()
        m.header  = header
        m.ns      = 'parking_spaces'
        m.id      = mid
        m.type    = Marker.CUBE
        m.action  = Marker.ADD
        m.pose.position.x    = x
        m.pose.position.y    = y
        m.pose.position.z    = 0.1
        m.pose.orientation.w = 1.0
        m.scale.x = sx
        m.scale.y = sy
        m.scale.z = 0.05
        m.color   = color
        m.text    = parking_type
        m.lifetime.sec = 1
        return m

    # ── PNG 디버그 이미지 저장 ────────────────────────────────────────
    def _save_map_png(self, free_map, occ_map, rx_cell, ry_cell,
                      candidates, best_idx, resolution, height, width):
        s = self._map_save_scale
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)
        vis[occ_map  > 0] = (100, 100, 100)
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        def sc(v):
            return int(round(v * s))

        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)
        cv2.circle(vis, (sc(rx_cell), sc(ry_cell)), sc(radius_cells),
                   (255, 0, 0), line_w)

        for idx, c in enumerate(candidates):
            r0, c0 = sc(c['r']), sc(c['c'])
            r1 = sc(c['r'] + c['wh'])
            c1 = sc(c['c'] + c['ww'])
            if idx == best_idx:
                rect_w  = max(2, s)
                cross_s = max(6, s * 3)
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 0, 255), rect_w)
                cx = (c0 + c1) // 2
                cy = (r0 + r1) // 2
                cv2.drawMarker(vis, (cx, cy), (0, 0, 255),
                               cv2.MARKER_CROSS, cross_s, max(1, s // 2))
            else:
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 200, 0),
                              max(1, s // 2))

        timestamp = time.strftime('%Y%m%d_%H%M%S')
        fname = os.path.join(self._map_dir, f'map_{timestamp}.png')
        cv2.imwrite(fname, vis)
        self.get_logger().info(f'Map 저장 → {fname}  ({width*s}×{height*s}px)')


def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


## hybrid_A_star_node.py

```python
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node

【구독 토픽】
  /parking_spaces        (PoseArray)
  /parking_spaces_info   (String/JSON)  goal_yaw·type 포함
  /parking_space_markers (MarkerArray)
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)

【Nav2 연동】
  use_nav2=False (기본): 자체 구현 Hybrid A*
  use_nav2=True        : Nav2 ComputePathToPose Action 호출
"""

import json
import math
import heapq
import sys
import threading
import time
from enum import Enum
from typing import Dict, List, Optional, Tuple

import numpy as np
import rclpy
import rclpy.action
import tf2_ros
from geometry_msgs.msg import Point, PoseArray, PoseStamped
from nav_msgs.msg import OccupancyGrid, Path
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from visualization_msgs.msg import Marker, MarkerArray

try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False

# pip install rsplan
try:
    from rsplan import path as _rs_path
    _RSPLAN_AVAILABLE = True
except ImportError:
    _RSPLAN_AVAILABLE = False


# ─────────────────────────────────────────────────────────────────────────────
# 상태 머신
# ─────────────────────────────────────────────────────────────────────────────

class State(Enum):
    SEARCHING = 1
    WAITING   = 2
    PARKING   = 3


# ─────────────────────────────────────────────────────────────────────────────
# 차량 파라미터
# ─────────────────────────────────────────────────────────────────────────────

class VehicleConfig:
    def __init__(self, wheelbase=0.25, max_steer_deg=35.0,
                 length=0.35, width=0.22,
                 front_overhang=0.05, rear_overhang=0.05):
        self.wheelbase      = wheelbase
        self.max_steer      = math.radians(max_steer_deg)
        self.length         = length
        self.width          = width
        self.front_overhang = front_overhang
        self.rear_overhang  = rear_overhang
        self.lf = wheelbase + front_overhang   # 후축 → 차량 전면
        self.lb = rear_overhang                # 후축 → 차량 후면


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 탐색 노드
# ─────────────────────────────────────────────────────────────────────────────

class HANode:
    __slots__ = ('x', 'y', 'yaw', 'ix', 'iy', 'iyaw',
                 'g', 'h', 'steer', 'direction', 'parent_key')

    def __init__(self, x, y, yaw, ix, iy, iyaw,
                 g, h, steer, direction, parent_key=None):
        self.x,  self.y,  self.yaw  = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw
        self.g, self.h = g, h
        self.steer      = steer
        self.direction  = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Obstacle Heuristic 사전 계산
# ─────────────────────────────────────────────────────────────────────────────

def _build_obstacle_heuristic(
    goal_ix: int, goal_iy: int,
    grid: np.ndarray,
    res: float,
    occ_thresh: int = 50,
) -> np.ndarray:
    """
    목표 셀에서 역방향 Dijkstra로 전체 맵의 실제 이동 비용(m)을 사전 계산.
    plan() 호출당 1회 수행.
    """
    H, W = grid.shape
    dist = np.full((H, W), np.inf, dtype=np.float32)
    dist[goal_iy, goal_ix] = 0.0

    heap = [(0.0, goal_ix, goal_iy)]

    DIRS  = [(1,0),(0,1),(-1,0),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]
    COSTS = [1.0,  1.0,  1.0,  1.0,   1.414, 1.414, 1.414, 1.414]

    while heap:
        d, cx, cy = heapq.heappop(heap)
        if d > dist[cy, cx]:
            continue
        for (dx, dy), c in zip(DIRS, COSTS):
            nx, ny = cx + dx, cy + dy
            if not (0 <= nx < W and 0 <= ny < H):
                continue
            if int(grid[ny, nx]) >= occ_thresh:
                continue
            nd = d + c * res
            if nd < dist[ny, nx]:
                dist[ny, nx] = nd
                heapq.heappush(heap, (nd, nx, ny))

    return dist


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float         = 0.06,
        n_steer: int             = 7,
        yaw_resolution: float    = math.radians(5.0),
        goal_xy_tol: float       = 0.08,
        goal_yaw_tol: float      = math.radians(10.0),
        reverse_cost: float      = 1.5,
        dir_change_cost: float   = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int       = 50,
        max_iter: int            = 80000,
        analytic_expansion_ratio: int = 3,   # 매 N×n_steer×2 iter 마다 RS expansion 시도
        use_obstacle_heuristic: bool  = True,
        auto_step_size: bool          = False,  # True 시 step = max(res, r_min×yaw_res) 자동 계산
    ):
        self.vc              = vehicle_cfg
        self.step            = step_size
        self.n_steer         = n_steer
        self.yaw_res         = yaw_resolution
        self.goal_xy_tol     = goal_xy_tol
        self.goal_yaw_tol    = goal_yaw_tol
        self.reverse_cost    = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost  = steer_change_cost
        self.occ_thresh      = occ_threshold
        self.max_iter        = max_iter

        self._step_override          = step_size
        self._auto_step_size         = auto_step_size
        self._analytic_ratio         = analytic_expansion_ratio
        self._use_obstacle_heuristic = use_obstacle_heuristic
        self._obs_heuristic: Optional[np.ndarray] = None

        self.steers    = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
        self._yaw_bins = max(1, int(round(2 * math.pi / self.yaw_res)))

    def plan(
        self,
        start_x, start_y, start_yaw,
        goal_x,  goal_y,  goal_yaw,
        occ_grid: np.ndarray,
        origin_x: float, origin_y: float,
        resolution: float,
    ) -> Optional[List[Tuple[float, float, float]]]:

        self._occ    = occ_grid
        self._ox     = origin_x
        self._oy     = origin_y
        self._res    = resolution
        self._height, self._width = occ_grid.shape

        # step 자동 계산 (auto_step_size=True 일 때)
        if self._auto_step_size:
            r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
            self.step = max(resolution, r_min * self.yaw_res)
        else:
            self.step = self._step_override

        # obstacle heuristic 사전 계산
        self._r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        if self._use_obstacle_heuristic:
            gix = max(0, min(self._width  - 1, int(round((goal_x - origin_x) / resolution))))
            giy = max(0, min(self._height - 1, int(round((goal_y - origin_y) / resolution))))
            self._obs_heuristic = _build_obstacle_heuristic(
                gix, giy, occ_grid, resolution, self.occ_thresh
            )
        else:
            self._obs_heuristic = None

        ae_interval = max(1, self._analytic_ratio * self.n_steer * 2)

        s = self._make_node(start_x, start_y, start_yaw, g=0.0,
                            steer=0.0, direction=1, parent_key=None)
        s.h = self._heuristic(s.x, s.y, s.yaw, goal_x, goal_y, goal_yaw)

        open_heap: List[Tuple[float, HANode]] = []
        heapq.heappush(open_heap, (s.f, s))
        open_dict:   Dict[int, HANode] = {self._key(s): s}
        closed_dict: Dict[int, HANode] = {}

        iterations = 0
        t0 = time.monotonic()

        while open_heap:
            iterations += 1
            if iterations > self.max_iter:
                if closed_dict:
                    best_node = min(
                        closed_dict.values(),
                        key=lambda n: math.hypot(n.x - goal_x, n.y - goal_y)
                    )
                    print(
                        f'[DBG] max_iter({self.max_iter}) 소진. '
                        f'최근접=({best_node.x:.3f},{best_node.y:.3f}) '
                        f'목표까지={math.hypot(best_node.x-goal_x, best_node.y-goal_y):.3f}m',
                        file=sys.stderr, flush=True
                    )
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)
            if ckey in closed_dict:
                continue
            closed_dict[ckey] = cur

            if iterations % 10000 == 0:
                print(
                    f'[DBG] iter={iterations} closed={len(closed_dict)} '
                    f'cur=({cur.x:.3f},{cur.y:.3f},{math.degrees(cur.yaw):.1f}°) '
                    f'경과={time.monotonic()-t0:.1f}s',
                    file=sys.stderr, flush=True
                )

            # Analytic Expansion: 현재 노드 → 목표까지 RS 경로 시도
            if _RSPLAN_AVAILABLE and iterations % ae_interval == 0:
                rs_result = self._try_analytic_expansion(
                    cur.x, cur.y, cur.yaw,
                    goal_x, goal_y, goal_yaw,
                )
                if rs_result is not None:
                    search_path = self._extract_path(cur, closed_dict, open_dict)
                    if search_path is not None:
                        return search_path + rs_result[1:]
                    return rs_result

            if self._reached_goal(cur.x, cur.y, cur.yaw, goal_x, goal_y, goal_yaw):
                return self._extract_path(cur, closed_dict, open_dict)

            for succ in self._expand(cur, goal_x, goal_y, goal_yaw):
                skey = self._key(succ)
                if skey in closed_dict:
                    continue
                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _try_analytic_expansion(
        self,
        sx: float, sy: float, syaw: float,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """현재 노드 → 목표까지 Reeds-Shepp 경로를 계산하고 충돌이 없으면 반환."""
        try:
            p = _rs_path(
                (sx, sy, syaw),
                (gx, gy, gyaw),
                turn_radius=self._r_min,
                runway_length=0,
                step_size=self.step,
            )
        except Exception:
            return None

        waypoints = list(p.waypoints())
        if not waypoints:
            return None

        for wp in waypoints:
            if self._in_collision(wp.x, wp.y, wp.yaw):
                return None

        return [(wp.x, wp.y, wp.yaw) for wp in waypoints]

    def _expand(self, node, gx, gy, gyaw):
        children = []
        for direction in (1, -1):
            for steer in self.steers:
                nx, ny, nyaw = self._bicycle_step(
                    node.x, node.y, node.yaw, steer, direction
                )
                if not self._in_bounds(nx, ny):
                    continue
                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step
                if direction == -1:
                    cost *= self.reverse_cost
                if direction != node.direction:
                    cost += self.dir_change_cost * self.step
                cost += abs(steer - node.steer) * self.steer_chg_cost

                child = self._make_node(nx, ny, nyaw, g=node.g + cost,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d         = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx        = x + d * math.cos(mid_yaw)
        ny        = y + d * math.sin(mid_yaw)
        return nx, ny, self._norm_angle(yaw + delta_yaw)

    def _in_collision(self, x, y, yaw):
        """차량 풋프린트 샘플링 충돌 검사 (전후 n점 × 좌우 5열)."""
        cos_t      = math.cos(yaw)
        sin_t      = math.sin(yaw)
        hw         = self.vc.width / 2.0
        n_lon      = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                if self._cell_occupied(cx - w * sin_t, cy + w * cos_t):
                    return True
        return False

    def _cell_occupied(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True
        val = int(self._occ[iy, ix])
        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):
        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm_angle(yaw - gyaw))
        return dist <= self.goal_xy_tol and dyaw <= self.goal_yaw_tol

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):
        """
        이중 휴리스틱:
          h1 = max(euclidean, r_min × |Δyaw|)
          h2 = obstacle_heuristic[iy, ix]
          h  = max(h1, h2)
        """
        dist  = math.hypot(x - gx, y - gy)
        dyaw  = abs(self._norm_angle(yaw - gyaw))
        r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        h1    = max(dist, r_min * dyaw)

        if self._obs_heuristic is not None:
            ix = max(0, min(self._width  - 1, int(round((x - self._ox) / self._res))))
            iy = max(0, min(self._height - 1, int(round((y - self._oy) / self._res))))
            h2 = float(self._obs_heuristic[iy, ix])
        else:
            h2 = 0.0

        return max(h1, h2)

    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """목표 노드 → 시작 노드 역추적. 체인 끊기면 None 반환."""
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        print('[ERR] _extract_path: 경로 체인 끊김', file=sys.stderr, flush=True)
        return None

    def _make_node(self, x, y, yaw, g, steer, direction, parent_key):
        ix   = int(round((x - self._ox) / self._res))
        iy   = int(round((y - self._oy) / self._res))
        raw  = int(round(self._norm_angle(yaw) / self.yaw_res))
        iyaw = raw % self._yaw_bins
        return HANode(x, y, yaw, ix, iy, iyaw,
                      g=g, h=0.0,
                      steer=steer, direction=direction,
                      parent_key=parent_key)

    def _key(self, node: HANode) -> int:
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a


# ─────────────────────────────────────────────────────────────────────────────
# ROS 2 노드
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarNode(Node):
    """
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2로 경로를 계획·발행.
    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출
    use_nav2=False → 자체 구현 Hybrid A*
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        self.declare_parameter('wheelbase',                0.25)
        self.declare_parameter('max_steer_deg',            35.0)
        self.declare_parameter('vehicle_length',           0.35)
        self.declare_parameter('vehicle_width',            0.22)
        self.declare_parameter('front_overhang',           0.05)
        self.declare_parameter('rear_overhang',            0.05)
        self.declare_parameter('step_size',                0.06)
        self.declare_parameter('n_steer',                  7)
        self.declare_parameter('yaw_resolution_deg',       5.0)
        self.declare_parameter('goal_xy_tol',              0.08)
        self.declare_parameter('goal_yaw_tol_deg',         10.0)
        self.declare_parameter('reverse_cost',             1.5)
        self.declare_parameter('dir_change_cost',          3.0)
        self.declare_parameter('steer_change_cost',        0.5)
        self.declare_parameter('occ_threshold',            50)
        self.declare_parameter('max_iter',                 80000)
        self.declare_parameter('base_frame',               'base_link')
        self.declare_parameter('analytic_expansion_ratio', 3)
        self.declare_parameter('use_obstacle_heuristic',   True)
        self.declare_parameter('auto_step_size',           False)
        self.declare_parameter('use_nav2',                 False)
        self.declare_parameter('nav2_planner_id',          'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',         30.0)

        self._load_params()

        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        self._latest_map:    Optional[OccupancyGrid] = None
        self._latest_spaces: Optional[PoseArray]     = None
        self._latest_info:   Optional[List[dict]]    = None
        self._target_info:   Optional[dict]          = None

        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,    10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces, 10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,   10)

        self._nav2_client = None
        if self._use_nav2:
            if not _NAV2_AVAILABLE:
                self.get_logger().error(
                    'use_nav2=True 이지만 nav2_msgs 패키지를 찾을 수 없습니다. '
                    'sudo apt install ros-<distro>-nav2-msgs 로 설치하세요. '
                    'use_nav2=False 로 폴백합니다.'
                )
                self._use_nav2 = False
            else:
                self._nav2_client = ActionClient(self, ComputePathToPose,
                                                 'compute_path_to_pose')
                self.get_logger().info(
                    f'Nav2 Action 클라이언트 생성 완료. planner_id={self._nav2_planner_id}'
                )

        threading.Thread(target=self._keyboard_listener, daemon=True).start()

        mode      = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A*'
        ae_status = f'ON (ratio={self.get_parameter("analytic_expansion_ratio").value})' \
                    if _RSPLAN_AVAILABLE else 'OFF (rsplan 미설치)'
        oh_status = 'ON' if self.get_parameter('use_obstacle_heuristic').value else 'OFF'
        self.get_logger().info(
            f'HybridAStarPlanner 시작 [{mode}]\n'
            f'  Analytic Expansion: {ae_status}\n'
            f'  Obstacle Heuristic: {oh_status}\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    def _load_params(self):
        vc = VehicleConfig(
            wheelbase      = self.get_parameter('wheelbase').value,
            max_steer_deg  = self.get_parameter('max_steer_deg').value,
            length         = self.get_parameter('vehicle_length').value,
            width          = self.get_parameter('vehicle_width').value,
            front_overhang = self.get_parameter('front_overhang').value,
            rear_overhang  = self.get_parameter('rear_overhang').value,
        )
        self._planner = HybridAStarPlanner(
            vehicle_cfg              = vc,
            step_size                = self.get_parameter('step_size').value,
            n_steer                  = self.get_parameter('n_steer').value,
            yaw_resolution           = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol              = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol             = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost             = self.get_parameter('reverse_cost').value,
            dir_change_cost          = self.get_parameter('dir_change_cost').value,
            steer_change_cost        = self.get_parameter('steer_change_cost').value,
            occ_threshold            = self.get_parameter('occ_threshold').value,
            max_iter                 = self.get_parameter('max_iter').value,
            analytic_expansion_ratio = self.get_parameter('analytic_expansion_ratio').value,
            use_obstacle_heuristic   = self.get_parameter('use_obstacle_heuristic').value,
            auto_step_size           = self.get_parameter('auto_step_size').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    def _cb_spaces(self, msg: PoseArray):
        self._latest_spaces = msg

        with self._state_lock:
            if self._state != State.SEARCHING:
                return
            if not msg.poses:
                return
            if self._latest_map is None:
                self.get_logger().warn('/map 미수신 — 대기 중.',
                                       throttle_duration_sec=3.0)
                return
            if self._latest_info is None:
                self.get_logger().warn(
                    '/parking_spaces_info 미수신 — goal_yaw 결정 불가, 스킵.',
                    throttle_duration_sec=2.0)
                return

            best_info = next(
                (item for item in self._latest_info if item.get('is_best', False)),
                None
            )
            if best_info is None:
                self.get_logger().warn('is_best=True 항목 없음, 스킵.')
                return

            self._target_info = best_info
            self._state       = State.WAITING

        self.get_logger().info(
            f'[발견] 목표: ({self._target_info["mx"]:.3f}, {self._target_info["my"]:.3f}) '
            f'type={self._target_info["type"]}  '
            f'goal_yaw={math.degrees(self._target_info["goal_yaw"]):.1f}°\n'
            '  터미널에서 Y(주차 시작) / N(취소) 를 입력하세요.'
        )

    def _keyboard_listener(self):
        while rclpy.ok():
            with self._state_lock:
                state = self._state

            if state == State.WAITING and self._target_info is not None:
                info = self._target_info
                try:
                    ans = input(
                        f'\n목표: ({info["mx"]:.3f}, {info["my"]:.3f})  '
                        f'[{info["type"]}]\n'
                        '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                    ).strip().upper()
                except EOFError:
                    time.sleep(0.2)
                    continue

                if ans == 'Y':
                    with self._state_lock:
                        self._state = State.PARKING
                    self._run_parking()
                elif ans == 'N':
                    self._reset_to_searching()
                    print('주차 취소 — 계속 탐색합니다.')
            else:
                time.sleep(0.2)

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        start_x, start_y, start_yaw = self._get_robot_pose()

        space_cx = info['mx']
        space_cy = info['my']

        goal_yaw = self._resolve_goal_yaw(
            base_yaw = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # 후륜 차축 오프셋 보정: 공간 중심 → 후축 목표
        lf = self._planner.vc.lf
        lb = self._planner.vc.lb
        half_offset = (lf - lb) / 2.0
        goal_x = space_cx - half_offset * math.cos(goal_yaw)
        goal_y = space_cy - half_offset * math.sin(goal_yaw)

        self.get_logger().info(
            f'공간중심=({space_cx:.3f},{space_cy:.3f})  '
            f'goal_yaw={math.degrees(goal_yaw):.1f}°  '
            f'후축목표=({goal_x:.3f},{goal_y:.3f})  '
            f'오프셋={half_offset:.3f}m'
        )
        self.get_logger().info(
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox  = m.info.origin.position.x
        oy  = m.info.origin.position.y
        res = m.info.resolution

        self._planner._occ    = occ
        self._planner._ox     = ox
        self._planner._oy     = oy
        self._planner._res    = res
        self._planner._height, self._planner._width = occ.shape

        if self._planner._in_collision(goal_x, goal_y, goal_yaw):
            self.get_logger().error(
                '목표 위치에서 차량 풋프린트 충돌 감지. '
                '공간이 차량보다 좁거나 vehicle_length/width 파라미터 확인 필요.'
            )
            self._reset_to_searching()
            return

        if self._use_nav2:
            path = self._plan_with_nav2(goal_x, goal_y, goal_yaw)
        else:
            path = self._plan_with_self(
                start_x, start_y, start_yaw,
                goal_x,  goal_y,  goal_yaw,
                occ, ox, oy, res,
            )

        if path is None:
            self.get_logger().error('경로를 찾지 못했습니다.')
            self._reset_to_searching()
            return

        self.get_logger().info(f'경로 계획 완료: {len(path)}개 웨이포인트')
        self._publish_path(path)
        self._publish_vis_markers(path)
        self._reset_to_searching()

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        기준각(base_yaw)과 그 반대(+π) 중 접근 방향에 더 가까운 쪽을 선택.
        예) base_yaw=0.0, approach=-170° → 180° 선택
        """
        approach    = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)
        diff_a      = abs(self._norm_angle(candidate_a - approach))
        diff_b      = abs(self._norm_angle(candidate_b - approach))
        selected    = candidate_a if diff_a <= diff_b else candidate_b

        self.get_logger().info(
            f'[goal_yaw] base={math.degrees(base_yaw):.1f}°  '
            f'approach={math.degrees(approach):.1f}°  '
            f'선택={math.degrees(selected):.1f}°'
        )
        return selected

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0      = time.monotonic()
        path    = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action으로 SmacPlannerHybrid 경로 요청.

        nav2_params.yaml 설정 필요:
          planner_plugins: ["HybridAStar"]
          HybridAStar:
            plugin: "nav2_smac_planner/SmacPlannerHybrid"
            minimum_turning_radius: 0.30
            motion_model_for_search: "REEDS_SHEPP"
            angle_quantization_bins: 72
            smooth_path: true
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg            = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id    = 'map'
        goal_msg.goal.header.stamp       = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x    = gx
        goal_msg.goal.pose.position.y    = gy
        goal_msg.goal.pose.position.z    = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id    = 'map'
        goal_msg.start.header.stamp       = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x    = sx
        goal_msg.start.pose.position.y    = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(self, future, timeout_sec=self._nav2_timeout_sec)

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(self, result_future, timeout_sec=self._nav2_timeout_sec)

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        nav2_path: Path = result_future.result().result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x   = ps.pose.position.x
            y   = ps.pose.position.y
            qz  = ps.pose.orientation.z
            qw  = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(f'Nav2 경로 수신: {len(path)}개 웨이포인트')
        return path

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf   = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx   = tf.transform.translation.x
            ty   = tf.transform.translation.y
            q    = tf.transform.rotation
            siny = 2.0 * (q.w * q.z + q.x * q.y)
            cosy = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
            return tx, ty, math.atan2(siny, cosy)
        except tf2_ros.TransformException as e:
            self.get_logger().warn(f'TF 오류 ({e}); 원점(0,0,0) 사용',
                                   throttle_duration_sec=5.0)
            return 0.0, 0.0, 0.0

    def _reset_to_searching(self):
        with self._state_lock:
            self._target_info = None
            self._state       = State.SEARCHING
        self.get_logger().info('SEARCHING 상태로 복귀.')

    def _publish_path(self, path):
        ros_path             = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps                        = PoseStamped()
            ps.header                 = ros_path.header
            ps.pose.position.x        = x
            ps.pose.position.y        = y
            ps.pose.orientation.z     = math.sin(yaw / 2.0)
            ps.pose.orientation.w     = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line                 = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point()
            p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow                      = Marker()
            arrow.header.stamp         = stamp
            arrow.header.frame_id      = 'map'
            arrow.ns                   = 'parking_path_arrows'
            arrow.id                   = i + 1
            arrow.type                 = Marker.ARROW
            arrow.action               = Marker.ADD
            arrow.pose.position.x      = x
            arrow.pose.position.y      = y
            arrow.pose.position.z      = 0.05
            arrow.pose.orientation.z   = math.sin(yaw / 2.0)
            arrow.pose.orientation.w   = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color                = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec         = 10
            ma.markers.append(arrow)

        self._pub_markers.publish(ma)


# ─────────────────────────────────────────────────────────────────────────────
# 진입점
# ─────────────────────────────────────────────────────────────────────────────

def main(args=None):
    rclpy.init(args=args)
    node = HybridAStarNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


## vehicle_control_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry, Path
from geometry_msgs.msg import Twist
from std_msgs.msg import Bool
import math

class VehicleControlNode(Node):
    def __init__(self):
        super().__init__('vehicle_control_node')

    # 1. 서브스크라이버 선언: 현재 위치, 주차 경로, 긴급 정지 상황 구독
        self.odom_sub = self.create_subscription(Odometry, '/odom', self.odom_callback, 10)
        self.path_sub = self.create_subscription(Path, '/parking_path', self.path_callback, 10)
        self.trigger_sub = self.create_subscription(Bool, '/emergency_trigger', self.emergency_callback, 10)

        # 2. 퍼블리셔 선언: safety_node가 가로채서 검사할 수 있도록 RAW 토픽으로 발행!
        self.cmd_pub = self.create_publisher(Twist, '/cmd_vel_raw', 10)

        # 3. 제어 알고리즘 파라미터 (RC카 제원에 맞춰 선언)
        self.wheelbase = 0.25         # 축거 (바퀴 축 간격, m)
        self.lookahead_dist = 0.3      # 조준 거리 (m, 값이 작을수록 경로에 칼같이 붙고, 크면 부드러워짐)
        self.target_speed = 0.15       # 기본 주행 속도 (m/s, 안전한 주차를 위해 저속 세팅)

        # 상태 변수 초기화
        self.current_path = None
        self.emergency_triggered = False
        self.robot_x = 0.0
        self.robot_y = 0.0
        self.robot_yaw = 0.0

        self.get_logger().info("Pure Pursuit 주차 추적 제어기(Vehicle Control Node) 활성화 완료.")

    def path_callback(self, msg):
        """ 새 주차 경로가 들어오면 제어기에 경로를 등록합니다. """
        if len(msg.poses) > 0:
            self.current_path = msg.poses
            self.get_logger().info(f"새로운 주차 경로가 제어기에 등록되었습니다. 웨이포인트 개수: {len(msg.poses)}")

    def emergency_callback(self, msg):
        """ 긴급 정지 상황 여부를 실시간으로 업데이트합니다. """
        self.emergency_triggered = msg.data

    def odom_callback(self, msg):
        """ 오도메트리가 들어올 때마다(약 50Hz) 가야 할 조향각을 실시간 연산하여 모터 명령 생성 """
        # 현재 차량 포즈 업데이트
        self.robot_x = msg.pose.pose.position.x
        self.robot_y = msg.pose.pose.position.y
        
        # 쿼터니언 각도를 Yaw 각도로 변환
        qz = msg.pose.pose.orientation.z
        qw = msg.pose.pose.orientation.w
        self.robot_yaw = 2.0 * math.atan2(qz, qw)

        # 출력할 속도 명령 박스 준비
        cmd_msg = Twist()

        # 만약 긴급 정지 상황이거나 등록된 주차 경로가 없으면 정지 명령을 쏩니다.
        if self.emergency_triggered or self.current_path is None:
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 🎯 Pure Pursuit 핵심 연산 시작
        target_pt = self.get_lookahead_point()

        if target_pt is None:
            # 경로의 끝자락(종점)에 거의 도달했거나 경로를 완전히 이탈한 경우 정지
            self.get_logger().info("주차 목표 지점에 도달 완료하여 차량을 정지합니다.")
            self.current_path = None # 경로 초기화
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 차량 기준 좌표계(Local Frame)로 조준점 위치 변환
        dx = target_pt.pose.position.x - self.robot_x
        dy = target_pt.pose.position.y - self.robot_y

        # 회전 변환 행렬을 적용하여 차량 중심 기준 상대 좌표(local_x, local_y) 도출
        local_x = dx * math.cos(-self.robot_yaw) - dy * math.sin(-self.robot_yaw)
        local_y = dx * math.sin(-self.robot_yaw) + dy * math.cos(-self.robot_yaw)

        # 🔄 전진/후진 판별 로직
        # 조준점이 차량 앞쪽에 있으면 전진, 뒤쪽에 있으면 후진 주차 상황임
        direction = 1.0 if local_x >= 0.0 else -1.0

        # 기하학적 Pure Pursuit 곡률 계산 공식
        # 조준 거리 정방형 분의 2 * 상대 Y축 변위
        L_sq = self.lookahead_dist ** 2
        curvature = (2.0 * local_y) / L_sq if L_sq > 0 else 0.0

        # 아커만 조향(Ackermann Steering) 공식에 따른 최종 핸들 조향각 계산
        # delta = atan(휠베이스 * 곡률)
        steering_angle = math.atan2(self.wheelbase * curvature, 1.0)

        # 최종 명령 적재 후 발행
        cmd_msg.linear.x = self.target_speed * direction  # 전진은 +, 후진은 - 속도 배정
        cmd_msg.angular.z = steering_angle                # 조향각 (라디안 단위)
        
        self.cmd_pub.publish(cmd_msg)

    def get_lookahead_point(self):
        """ 현재 차량 위치에서 조준 거리(Look-ahead)와 가장 일치하는 경로 상의 점을 검색 """
        best_wp = None
        min_dist_error = float('inf')

        for wp in self.current_path:
            dist = math.hypot(wp.pose.position.x - self.robot_x, wp.pose.position.y - self.robot_y)
            error = abs(dist - self.lookahead_dist)
            
            # 내가 설정한 조준 거리(30cm)와 거리 차이가 가장 적은 포인트를 픽합니다.
            if error < min_dist_error:
                min_dist_error = error
                best_wp = wp

        # 만약 최적의 포인트를 찾았더라도, 경로의 최종 종점과 내 차의 거리가 5cm 이내라면 다 온 것으로 판정
        final_wp = self.current_path[-1]
        final_dist = math.hypot(final_wp.pose.position.x - self.robot_x, final_wp.pose.position.y - self.robot_y)
        if final_dist < 0.05:
            return None

        return best_wp

def main(args=None):
    rclpy.init(args=args)
    node = VehicleControlNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## safety_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray, Bool
from geometry_msgs.msg import Twist

class SafetyNode(Node):
    def __init__(self):
        super().__init__('safety_node')

        # 1. 서브스크라이버 선언: 초음파 거리 및 차량의 원래 제어 명령 감시
        # [전, 후, 좌, 우] 형태의 배열 수신
        self.distance_sub = self.create_subscription(Float32MultiArray, '/filtered_distance', self.distance_callback, 10)
        # vehicle_control_node가 보내는 주행 명령을 가로채기 위해 구독
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel_raw', self.cmd_vel_raw_callback, 10)

        # 2. 퍼블리셔 선언: 최종 안전이 검증된 명령 송신 및 긴급 제동 플래그 발행
        # stm32_bridge_node가 최종적으로 받아서 실행할 안전한 cmd_vel
        self.cmd_vel_pub = self.create_publisher(Twist, '/cmd_vel', 10)
        # 다른 노드들에게 긴급 상황임을 알리는 플래그 방송
        self.trigger_pub = self.create_publisher(Bool, '/emergency_trigger', 10)

        # 3. 안전 파라미터 및 상태 변수 설정
        self.CRITICAL_DISTANCE = 4.0  # 긴급 정지 임계치 (4.0cm)
        self.emergency_trigger = False
        
        # 최신 초음파 거리 저장용 변수 [전, 후, 좌, 우] (초기값은 충분히 먼 거리인 400cm)
        self.current_distances = [400.0, 400.0, 400.0, 400.0]

        self.get_logger().info("안전 감시 브레인(Safety Node)이 활성화되었습니다.")

    def distance_callback(self, msg):
        """ 초음파 센서 값을 받아 실시간으로 거리를 갱신하는 콜백 함수 """
        if len(msg.data) == 4:
            self.current_distances = msg.data

    def cmd_vel_raw_callback(self, msg):
        """ 주행 제어기가 보낸 명령을 받아서, 안전 검사 후 STM32 브리지로 토스하는 핵심 함수 """
        front_dist = self.current_distances[0]
        back_dist  = self.current_distances[1]

        # 기본적으로 주행 노드가 보낸 속도와 조향각을 복사
        safe_cmd = Twist()
        safe_cmd.linear.x = msg.linear.x
        safe_cmd.angular.z = msg.angular.z

        # 🚨 [안전 검사 로직]
        # 상황 A: 차량이 전진(속도 > 0)하려는데 전방 거리가 임계치보다 가까운 경우
        if msg.linear.x > 0.0 and front_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [전방 위험!] 정면 장애물 감지 ({front_dist:.1f}cm). 강제 제동합니다!")

        # 상황 B: 차량이 후진(속도 < 0)하려는데 후방 거리가 임계치보다 가까운 경우
        elif msg.linear.x < 0.0 and back_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [후방 위험!] 후면 장애물 감지 ({back_dist:.1f}cm). 강제 제동합니다!")
        
        else:
            # 위험 상황이 아니면 플래그 해제
            self.emergency_trigger = False

        # 🛑 긴급 상황일 경우 모든 속도 명령을 무조건 0으로 차단!
        if self.emergency_trigger:
            safe_cmd.linear.x = 0.0
            # 조향(핸들)은 안전을 위해 그대로 유지하거나 필요시 0으로 제어
            safe_cmd.angular.z = msg.angular.z  

        # 최종 검증된(또는 차단된) 안전한 명령을 STM32 브리지가 보고 있는 토픽으로 최종 발행
        self.cmd_vel_pub.publish(safe_cmd)

        # 다른 노드들에게도 현재 긴급 상황 여부를 실시간 방송
        trigger_msg = Bool()
        trigger_msg.data = self.emergency_trigger
        self.trigger_pub.publish(trigger_msg)

def main(args=None):
    rclpy.init(args=args)
    node = SafetyNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## parking_operator.py

```javascript
#!/usr/bin/env python3
"""
SPAS Parking Operator Node  ―  Y/N 키보드 조작 노드
=====================================================

hybrid_A_star_node 가 주차 공간을 찾아 WAITING 상태가 되면 /parking_waiting
토픽으로 대상 정보를 발행한다. 이 노드는 그 신호를 받아 터미널에 Y/N
프롬프트를 띄우고, 입력 결과를 /parking_start(Bool) 로 발행한다.

플래너(hybrid_A_star_node)는 launch 안에 그대로 두고, 이 노드만 자체
터미널에서 단독 실행하면 Y/N 키보드 입력을 그대로 쓸 수 있다.
  ros2 run spas_planning parking_operator

【구독】 /parking_waiting (String/JSON)  비어있으면 대기 공간 없음(프롬프트 닫힘)
【발행】 /parking_start   (Bool)         True=주차 시작 / False=취소
"""

import json
import threading
import time

import rclpy
from rclpy.node import Node
from rclpy.qos import DurabilityPolicy, QoSProfile
from std_msgs.msg import Bool, String


class ParkingOperatorNode(Node):
    def __init__(self):
        super().__init__('parking_operator')

        # 플래너의 /parking_waiting 은 transient_local(래치)로 발행되므로
        # 이 노드가 늦게 떠도 마지막 상태를 받도록 동일 QoS 로 구독한다.
        latched_qos = QoSProfile(depth=1, durability=DurabilityPolicy.TRANSIENT_LOCAL)
        self.create_subscription(String, '/parking_waiting', self._cb_waiting, latched_qos)
        self._pub_start = self.create_publisher(Bool, '/parking_start', 10)

        self._lock         = threading.Lock()
        self._waiting_info = None   # dict(대상 정보) 또는 None
        self._waiting_seq  = 0      # WAITING 진입마다 증가 → 중복/지연 프롬프트 구분

        threading.Thread(target=self._prompt_loop, daemon=True).start()
        self.get_logger().info(
            'parking_operator 시작. 주차 공간 발견 시 이 터미널에서 Y/N 를 입력하세요.'
        )

    # ── /parking_waiting 콜백 ─────────────────────────────────────────
    def _cb_waiting(self, msg: String):
        data = msg.data.strip()
        with self._lock:
            if data:
                try:
                    self._waiting_info = json.loads(data)
                except json.JSONDecodeError:
                    self._waiting_info = {}
                self._waiting_seq += 1
            else:
                # WAITING 이탈 → 프롬프트 닫힘 표시
                self._waiting_info = None

    # ── Y/N 프롬프트 루프 (별도 스레드, input 블로킹) ─────────────────
    def _prompt_loop(self):
        handled_seq = -1
        while rclpy.ok():
            with self._lock:
                info = self._waiting_info
                seq  = self._waiting_seq

            # 대기 공간이 없거나 이미 처리한 세션이면 쉬어간다.
            if info is None or seq == handled_seq:
                time.sleep(0.2)
                continue

            mx    = info.get('mx')
            my    = info.get('my')
            ptype = info.get('type', '?')
            try:
                ans = input(
                    f'\n[주차 공간 발견] 목표: ({mx}, {my})  [{ptype}]\n'
                    '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                ).strip().upper()
            except EOFError:
                self.get_logger().error(
                    'stdin(TTY)이 없어 키보드 입력을 받을 수 없습니다. '
                    '이 노드는 ros2 run 으로 단독 실행해야 합니다.'
                )
                time.sleep(1.0)
                continue

            # 입력하는 동안 상태가 바뀌었으면(다른 경로로 시작/취소) 무시.
            with self._lock:
                still_waiting = (self._waiting_info is not None
                                 and self._waiting_seq == seq)
            if not still_waiting:
                print('상태가 변경되어 입력을 무시합니다.')
                handled_seq = seq
                continue

            if ans == 'Y':
                self._publish(True)
                print('▶ 주차 시작 명령을 전송했습니다.')
                handled_seq = seq
            elif ans == 'N':
                self._publish(False)
                print('■ 주차 취소 명령을 전송했습니다.')
                handled_seq = seq
            else:
                print('Y 또는 N 만 입력하세요.')
                # handled_seq 갱신 안 함 → 같은 세션을 다시 프롬프트

    def _publish(self, decision: bool):
        msg = Bool()
        msg.data = decision
        self._pub_start.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = ParkingOperatorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```

