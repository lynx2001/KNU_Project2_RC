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
        self.declare_parameter('space_length',       0.50)
        self.declare_parameter('space_width',        0.40)
        self.declare_parameter('free_threshold',     30)
        self.declare_parameter('occupied_threshold', 65)
        self.declare_parameter('search_radius',      2.0)
        self.declare_parameter('wall_border',        0.05)
        self.declare_parameter('min_wall_sides',     3)
        self.declare_parameter('min_free_ratio',     0.70)
        self.declare_parameter('wall_occ_ratio',     0.30)
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
        H = height * s   # 픽셀 높이 (y 뒤집기용)
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)
        vis[occ_map  > 0] = (100, 100, 100)
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        def sc(v):
            return int(round(v * s))

        def fr(v):                       # flipped row: +y 가 이미지 위쪽 (RViz 일치)
            return (H - 1) - int(round(v * s))

        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)
        cv2.circle(vis, (sc(rx_cell), fr(ry_cell)), sc(radius_cells),
                   (255, 0, 0), line_w)

        for idx, c in enumerate(candidates):
            r0, c0 = fr(c['r']), sc(c['c'])
            r1 = fr(c['r'] + c['wh'])
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