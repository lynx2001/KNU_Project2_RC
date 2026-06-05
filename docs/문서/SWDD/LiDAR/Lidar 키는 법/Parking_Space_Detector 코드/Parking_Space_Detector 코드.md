# Parking_Space_Detector 코드


```python
#!/usr/bin/env python3
"""
SPAS Parking Space Detector Node  ―  슬라이딩 윈도우 알고리즘
=============================================================

【전체 동작 흐름】
  /map (OccupancyGrid)
    │
    ├─① 맵 이진화
    │    OccupancyGrid의 각 셀 값(0~100, -1=미탐색)을
    │    free_map(빈 공간=1.0)과 occ_map(점유=1.0)으로 분리
    │
    ├─② 탐색 반경 마스크
    │    TF로 로봇 현재 위치를 읽어 search_radius(기본 2m) 원 안만 탐색
    │
    ├─③ 슬라이딩 윈도우 탐지
    │    목표 주차 공간 크기(space_length × space_width)의 직사각형 창을
    │    탐색 반경 안에서 1셀씩 이동하며 두 가지를 확인:
    │      (a) 창 내부: 자유 공간 비율 ≥ min_free_ratio
    │      (b) 창 외곽 4면: 각 면마다 점유 셀 비율 확인 →
    │          wall_occ_ratio 이상이면 '벽 있음'으로 판정
    │          벽 있는 면 수 ≥ min_wall_sides 이면 후보 등록
    │
    ├─④ NMS(비최대 억제)
    │    동일 공간에 겹치는 중복 후보를 스코어 기준으로 한 개만 남김
    │
    └─⑤ 발행 & 저장
         /parking_spaces      (PoseArray)    ← 중심 좌표
         /parking_space_markers (MarkerArray) ← RViz2 박스
         ~/sample_th/map/*.png               ← 디버그 이미지

【평행주차 vs 직각주차 판별 기준 — travel_direction 파라미터】

  핵심 원칙:
    공간의 '긴 변'이 차의 이동 방향(맵 좌표계 기준)과 평행하면 → 평행주차
    공간의 '긴 변'이 차의 이동 방향과 수직이면          → 직각주차

  travel_direction = 'x'  (차가 맵 X축 방향으로 이동)
  ┌────────────────────────────────────────────────────────────┐
  │  가로 창 (긴변=X방향, ww=sl, wh=sw)                        │
  │  긴변이 X축 = 차 이동 방향과 평행  →  평행주차              │
  └────────────────────────────────────────────────────────────┘
  ┌──────────┐
  │세로 창   │ (긴변=Y방향, wh=sl, ww=sw)
  │긴변이 Y축│ = 차 이동 방향과 수직  →  직각주차
  └──────────┘

  travel_direction = 'y'  (차가 맵 Y축 방향으로 이동)
    → 위 분류가 반전됨:
      세로 창(긴변=Y) = 차 방향과 평행 → 평행주차
      가로 창(긴변=X) = 차 방향과 수직 → 직각주차

  ★ SLAM 맵은 로봇이 처음 켜진 방향 기준으로 좌표계가 정해집니다.
    물리적으로 수평인 공간이 맵 Y축 방향으로 표현될 수 있습니다.
    차가 물리적으로 수평 이동 → 맵에서 Y축 이동 → travel_direction='y' 로 설정.

【파라미터 요약】
  space_length      : 주차 공간 긴 변 (m)
  space_width       : 주차 공간 짧은 변 (m)
  travel_direction  : 차의 맵 좌표계 이동 방향 ('x' 또는 'y')
  search_radius     : 로봇 중심 탐색 반경 (m)
  wall_border       : 창 바깥쪽 벽 검사 띠 두께 (m)
  min_wall_sides    : 벽으로 인정할 최소 면 수 (2~4), 높일수록 엄격
  min_free_ratio    : 창 내부 자유 셀 비율 하한 (0~1)
  wall_occ_ratio    : 검사 띠에서 점유 셀 비율 하한 (0~1), 낮추면 민감
"""

import os
import time

import cv2
import numpy as np
import rclpy
import tf2_ros
from geometry_msgs.msg import Pose, PoseArray, Quaternion
from nav_msgs.msg import OccupancyGrid
from rclpy.node import Node
from std_msgs.msg import ColorRGBA
from visualization_msgs.msg import Marker, MarkerArray


class ParkingSpaceDetectorNode(Node):
    """
    OccupancyGrid 맵을 구독하고 슬라이딩 윈도우로 주차 공간을 탐지해 발행하는 노드.
    """

    def __init__(self):
        super().__init__('parking_space_detector')

        # ── 파라미터 선언 ───────────────────────────────────────────────
        # ROS 2 파라미터: 실행 시 --params-file 로 YAML 파일로 덮어쓸 수 있음
        self.declare_parameter('space_length',       0.40)  # 주차 공간 긴 변 (m)
        self.declare_parameter('space_width',        0.30)  # 주차 공간 짧은 변 (m)
        self.declare_parameter('free_threshold',     30)    # 이 값 이하 셀 = 빈 공간
        self.declare_parameter('occupied_threshold', 65)    # 이 값 이상 셀 = 벽/장애물
        self.declare_parameter('search_radius',      2.0)   # 로봇 중심 탐색 반경 (m)
        self.declare_parameter('wall_border',        0.05)  # 벽 검사 띠 두께 (m)
        self.declare_parameter('min_wall_sides',     3)     # 벽 있는 면 최소 수
        self.declare_parameter('min_free_ratio',     0.70)  # 내부 자유 셀 비율 하한
        self.declare_parameter('wall_occ_ratio',     0.20)  # 벽 판정 점유 비율 하한
        self.declare_parameter('base_frame',         'base_link')  # 로봇 TF 프레임
        # 차의 맵 좌표계 이동 방향: 'x' 또는 'y'
        # SLAM 맵 좌표계는 로봇이 처음 켜진 방향 기준으로 정해짐.
        # 물리적으로 수평(좌우) 이동하더라도 맵에서 Y축 방향으로 표현될 수 있음.
        # → 검출된 공간이 세로(portrait)인데 실제로는 평행주차라면 'y'로 변경
        self.declare_parameter('travel_direction',   'x')
        # PNG 저장 시 업스케일 배율 (1셀 → scale×scale 픽셀)
        # 기본 4배: 0.05m/셀 → 1픽셀=0.0125m, 400×400셀 맵이면 1600×1600px 저장
        self.declare_parameter('map_save_scale',     4)

        self._load_params()

        # 맵 PNG 저장 디렉토리 생성
        self._map_dir = os.path.expanduser('~/sample_th/maps')
        os.makedirs(self._map_dir, exist_ok=True)

        # ── TF2: 맵 안에서 로봇의 현재 위치를 읽기 위해 사용 ───────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── ROS 2 퍼블리셔 ─────────────────────────────────────────────
        # /parking_spaces     : 탐지된 주차 공간 중심 좌표 배열
        # /parking_space_markers: RViz2 시각화용 박스 마커
        self._pub_spaces  = self.create_publisher(PoseArray,   '/parking_spaces',        10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_space_markers', 10)

        # ── ROS 2 서브스크라이버 ───────────────────────────────────────
        # slam_toolbox 가 발행하는 /map 토픽을 수신
        self._sub_map = self.create_subscription(
            OccupancyGrid, '/map', self._map_callback, 10
        )

        self.get_logger().info(
            f'ParkingSpaceDetector started [sliding-window]. '
            f'space={self._space_length:.2f}x{self._space_width:.2f}m  '
            f'radius={self._search_radius:.1f}m  '
            f'travel_dir={self._travel_direction}  '
            f'wall_sides≥{self._min_wall_sides}  '
            f'free_thresh={self._free_threshold}  '
            f'png_scale={self._map_save_scale}x'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────
    def _load_params(self):
        """선언된 ROS 2 파라미터를 인스턴스 변수에 저장."""
        self._space_length   = self.get_parameter('space_length').value
        self._space_width    = self.get_parameter('space_width').value
        self._free_threshold = self.get_parameter('free_threshold').value
        self._occ_threshold  = self.get_parameter('occupied_threshold').value
        self._search_radius  = self.get_parameter('search_radius').value
        self._wall_border    = self.get_parameter('wall_border').value
        self._min_wall_sides = self.get_parameter('min_wall_sides').value
        self._min_free_ratio = self.get_parameter('min_free_ratio').value
        self._wall_occ_ratio    = self.get_parameter('wall_occ_ratio').value
        self._base_frame        = self.get_parameter('base_frame').value
        self._travel_direction  = self.get_parameter('travel_direction').value  # 'x' 또는 'y'
        self._map_save_scale    = max(1, int(self.get_parameter('map_save_scale').value))

    # ── TF 로봇 위치 조회 ─────────────────────────────────────────────
    def _get_robot_map_pos(self):
        """
        TF 트리에서 map → base_link 변환을 읽어 로봇의 맵 좌표 (x, y)를 반환.
        TF가 아직 없거나 타임아웃이면 map 원점 (0, 0)으로 폴백.
        """
        try:
            tf = self._tf_buffer.lookup_transform(
                'map',           # 목표 프레임
                self._base_frame,  # 원본 프레임 (로봇 기준)
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.1)
            )
            return tf.transform.translation.x, tf.transform.translation.y
        except tf2_ros.TransformException:
            self.get_logger().warn(
                f'TF map→{self._base_frame} 없음; 원점(0,0) 사용',
                throttle_duration_sec=5.0
            )
            return 0.0, 0.0

    # ── 메인 콜백 ─────────────────────────────────────────────────────
    def _map_callback(self, msg: OccupancyGrid):
        """
        /map 토픽 수신 시 호출. 맵 처리 → 탐지 → 발행 전체 파이프라인 실행.
        """
        self.get_logger().info('Map received — sliding-window detection 시작.')

        # OccupancyGrid 메타데이터 추출
        resolution = msg.info.resolution   # 1셀 = resolution 미터 (예: 0.05m)
        origin     = msg.info.origin       # 맵 원점의 월드 좌표 (Pose)
        width      = msg.info.width        # 맵 가로 셀 수
        height     = msg.info.height       # 맵 세로 셀 수

        # ── ① 맵 이진화 ─────────────────────────────────────────────
        # OccupancyGrid.data 는 1D 리스트(길이 = width×height)
        # 값: 0~100 (점유 확률), -1 (미탐색)
        # reshape 으로 2D 배열로 변환 (행=세로, 열=가로)
        grid = np.array(msg.data, dtype=np.int8).reshape((height, width))

        # 빈 공간 맵: 값이 [0, free_threshold] 범위인 셀만 1.0
        # → 미탐색(-1), 점유(값 큰 셀)는 0.0 으로 처리
        free_map = ((grid >= 0) & (grid <= self._free_threshold)).astype(np.float32)

        # 점유(벽) 맵: 값이 occupied_threshold 이상인 셀만 1.0
        occ_map  = (grid >= self._occ_threshold).astype(np.float32)

        # ── ② 탐색 반경 계산 ────────────────────────────────────────
        # 로봇의 맵 좌표 (미터) 를 셀 좌표로 변환
        robot_x, robot_y = self._get_robot_map_pos()
        rx_cell = (robot_x - origin.position.x) / resolution  # 로봇 열 위치
        ry_cell = (robot_y - origin.position.y) / resolution  # 로봇 행 위치

        self.get_logger().info(
            f'탐색 중심: ({robot_x:.2f}, {robot_y:.2f}) m  '
            f'반경: {self._search_radius:.1f} m'
        )

        # ── ③ 슬라이딩 윈도우 탐지 ──────────────────────────────────
        candidates = self._sliding_window_detect(
            free_map, occ_map, rx_cell, ry_cell, origin, resolution, height, width
        )

        self.get_logger().info(f'탐지된 주차 공간 수: {len(candidates)}')

        # ── ④ 발행 데이터 구성 ───────────────────────────────────────
        pose_array              = PoseArray()
        pose_array.header.stamp    = self.get_clock().now().to_msg()
        pose_array.header.frame_id = 'map'
        marker_array = MarkerArray()

        # BEST 후보: score 내림차순 정렬된 candidates 중 0번이 최고 스코어
        best_idx = 0

        for i, c in enumerate(candidates):
            # ── Pose: 주차 공간 중심 좌표 ──────────────────────────
            pose = Pose()
            pose.position.x  = c['mx']
            pose.position.y  = c['my']
            pose.position.z  = 0.0
            pose.orientation = Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)
            pose_array.poses.append(pose)

            # ── 마커 색상 결정 ──────────────────────────────────────
            # ★ BEST : 빨간색(진함)  평행주차: 초록  직각주차: 파랑
            is_best = (i == best_idx)
            if is_best:
                color = ColorRGBA(r=1.0, g=0.0, b=0.0, a=0.85)  # 빨강
            elif c['type'] == '평행주차':
                color = ColorRGBA(r=0.0, g=0.8, b=0.0, a=0.30)  # 초록 반투명
            else:
                color = ColorRGBA(r=0.0, g=0.0, b=0.8, a=0.30)  # 파랑 반투명

            marker_array.markers.append(
                self._make_box_marker(
                    i, pose_array.header,
                    c['mx'], c['my'], c['pw'], c['ph'], color
                )
            )

            best_tag = ' ★ BEST' if is_best else ''
            self.get_logger().info(
                f'Space #{i} [{c["type"]}]{best_tag} '
                f'at ({c["mx"]:.3f}, {c["my"]:.3f}) m  '
                f'size={c["pw"]:.2f}x{c["ph"]:.2f}m  '
                f'walls={c["walls"]}  score={c["score"]:.3f}'
            )

        self._pub_spaces.publish(pose_array)
        self._pub_markers.publish(marker_array)
        self._save_map_png(free_map, occ_map, rx_cell, ry_cell,
                           candidates, best_idx, resolution, height, width)

    # ── 슬라이딩 윈도우 탐지 ──────────────────────────────────────────
    def _sliding_window_detect(self, free_map, occ_map,
                                rx_cell, ry_cell,
                                origin, resolution, height, width):
        """
        목표 크기의 직사각형 창을 탐색 반경 내에서 슬라이딩하며
        '내부 자유 + 외곽 벽' 조건을 만족하는 위치를 탐지.

        Returns: score 내림차순 정렬된 후보 딕셔너리 리스트
        """

        # ── 셀 단위 변환 ────────────────────────────────────────────
        # space_length(긴 변)와 space_width(짧은 변)을 셀 수로 변환
        # round 후 max(1, ...) 로 0셀이 되는 것을 방지
        sl = max(1, int(round(self._space_length / resolution)))  # 긴 변 셀 수
        sw = max(1, int(round(self._space_width  / resolution)))  # 짧은 변 셀 수
        b  = max(1, int(round(self._wall_border  / resolution)))  # 벽 검사 띠 셀 수

        radius_cells = self._search_radius / resolution  # 탐색 반경(셀 단위)

        # ── 탐색 범위 한정 ───────────────────────────────────────────
        # 반경 바깥은 순회하지 않아 대형 맵에서도 빠르게 동작
        r_lo = max(0,      int(ry_cell - radius_cells) - b)
        r_hi = min(height, int(ry_cell + radius_cells) + b + 1)
        c_lo = max(0,      int(rx_cell - radius_cells) - b)
        c_hi = min(width,  int(rx_cell + radius_cells) + b + 1)

        # ── 적분 이미지(Integral Image) 생성 ─────────────────────────
        # 적분 이미지는 임의 직사각형 영역의 합을 O(1)에 계산 가능하게 해줌.
        # 일반 합산은 O(area)이지만 적분 이미지를 쓰면 4번의 참조로 해결.
        # cv2.integral(M)[r2,c2] - [r1,c2] - [r2,c1] + [r1,c1]
        #   = M[r1:r2, c1:c2] 의 합
        fi = cv2.integral(free_map)  # 자유 공간 적분 이미지
        oi = cv2.integral(occ_map)   # 점유 공간 적분 이미지

        def box_sum(intg, r1, c1, r2, c2):
            """
            적분 이미지를 이용해 (r1,c1)~(r2,c2) 사각형 영역의 합을 반환.
            경계 클램핑 포함.
            """
            r1, c1 = max(0, r1), max(0, c1)
            r2, c2 = min(height, r2), min(width, c2)
            if r2 <= r1 or c2 <= c1:
                return 0.0
            return float(intg[r2, c2] - intg[r1, c2]
                         - intg[r2, c1] + intg[r1, c1])

        raw = []  # 조건을 만족한 모든 후보 (NMS 전)

        # ── 두 가지 창 방향을 모두 시도 ─────────────────────────────
        # travel_direction 파라미터로 차의 맵 좌표계 이동 방향을 지정.
        #
        # 판별 원칙:
        #   공간의 긴 변이 차 이동 방향과 평행 → 평행주차
        #   공간의 긴 변이 차 이동 방향과 수직 → 직각주차
        #
        # travel_direction='x' 일 때 (차가 맵 X축 방향 이동):
        #   가로 창 (ww=sl: 긴변=X방향) → 긴변이 X와 평행 → 평행주차
        #   세로 창 (wh=sl: 긴변=Y방향) → 긴변이 X와 수직 → 직각주차
        #
        # travel_direction='y' 일 때 (차가 맵 Y축 방향 이동):
        #   세로 창 (wh=sl: 긴변=Y방향) → 긴변이 Y와 평행 → 평행주차
        #   가로 창 (ww=sl: 긴변=X방향) → 긴변이 Y와 수직 → 직각주차
        #
        # ★ SLAM 맵 좌표계는 로봇이 매핑 시작 시 바라보던 방향에 따라 결정됨.
        #   물리적으로 수평 이동하더라도 맵에서 Y축으로 나타날 수 있으므로
        #   실측 결과를 보고 'x'/'y' 를 선택.

        if self._travel_direction == 'y':
            # 차가 맵 Y축 방향 이동: 세로 창=평행, 가로 창=직각
            orientations = [('평행주차', sl, sw)]   # wh=sl(긴변=세로=Y방향)
            if sl != sw:
                orientations.append(('직각주차', sw, sl))  # wh=sw(짧은변=세로), ww=sl(긴변=X방향)
        else:
            # 차가 맵 X축 방향 이동(기본): 가로 창=평행, 세로 창=직각
            orientations = [('평행주차', sw, sl)]   # wh=sw(짧은변=세로), ww=sl(긴변=X방향)
            if sl != sw:
                orientations.append(('직각주차', sl, sw))  # wh=sl(긴변=세로=Y방향)

        for mtype, wh, ww in orientations:
            # wh: 창의 세로(행) 셀 수,  ww: 창의 가로(열) 셀 수

            for r in range(r_lo, min(r_hi, height - wh + 1)):
                for c in range(c_lo, min(c_hi, width - ww + 1)):

                    # ── 탐색 반경 체크 ──────────────────────────────
                    # 창 중심이 로봇 반경 내에 있어야 함
                    dr = (r + wh / 2.0) - ry_cell  # 행 방향 거리
                    dc = (c + ww / 2.0) - rx_cell  # 열 방향 거리
                    if dr * dr + dc * dc > radius_cells ** 2:
                        continue

                    # ── 조건 (a): 창 내부 자유 공간 비율 확인 ────────
                    # 창 안의 전체 셀 수 대비 자유 셀 수의 비율을 계산
                    # 예: 8×6 창(48셀) 중 자유셀이 34개 → 34/48 ≈ 0.71
                    area = float(wh * ww)
                    interior_free = box_sum(fi, r, c, r + wh, c + ww)
                    free_ratio = interior_free / area
                    if free_ratio < self._min_free_ratio:
                        continue  # 내부가 충분히 비어있지 않으면 건너뜀

                    # ── 조건 (b): 창 외곽 4면 벽 검사 ───────────────
                    # 창 바깥 b셀 두께의 띠 영역에서 점유 셀 비율을 계산
                    # 각 면의 전체 셀 수 = 띠 두께(b) × 면 길이(ww 또는 wh)

                    top_area = float(b * ww)  # 위쪽 띠 셀 수
                    lr_area  = float(wh * b)  # 좌우 띠 셀 수

                    # 각 면의 점유 셀 합산
                    top_occ = box_sum(oi, r - b,     c,      r,          c + ww)
                    bot_occ = box_sum(oi, r + wh,    c,      r + wh + b, c + ww)
                    lft_occ = box_sum(oi, r,         c - b,  r + wh,     c     )
                    rgt_occ = box_sum(oi, r,         c + ww, r + wh,     c + ww + b)

                    # 각 면별로 점유 비율 ≥ wall_occ_ratio 이면 '벽 있음'(+1)
                    walls = 0
                    if top_area > 0 and top_occ / top_area >= self._wall_occ_ratio: walls += 1
                    if top_area > 0 and bot_occ / top_area >= self._wall_occ_ratio: walls += 1
                    if lr_area  > 0 and lft_occ / lr_area  >= self._wall_occ_ratio: walls += 1
                    if lr_area  > 0 and rgt_occ / lr_area  >= self._wall_occ_ratio: walls += 1

                    if walls < self._min_wall_sides:
                        continue  # 벽이 부족하면 건너뜀

                    # ── 스코어 계산 ──────────────────────────────────
                    # 자유 공간 비율(클수록 좋음) + 벽 수 보너스
                    # free_ratio 는 0~1 범위, walls 는 0~4
                    score = free_ratio + 0.05 * walls

                    # ── 창 중심을 맵 좌표(미터)로 변환 ─────────────
                    # 셀 좌표 → 맵 원점 기준 미터 좌표
                    # +0.5 는 셀 중심 보정 (셀 좌표는 왼쪽 모서리 기준이므로)
                    cx_cell = c + ww / 2.0
                    cy_cell = r + wh / 2.0
                    mx = origin.position.x + (cx_cell + 0.5) * resolution
                    my = origin.position.y + (cy_cell + 0.5) * resolution

                    raw.append({
                        'mx':    mx,               # 맵 X 좌표 (m)
                        'my':    my,               # 맵 Y 좌표 (m)
                        'pw':    ww * resolution,  # 공간 폭 (m)
                        'ph':    wh * resolution,  # 공간 높이 (m)
                        'score': score,
                        'walls': walls,
                        'type':  mtype,
                        'r': r, 'c': c, 'wh': wh, 'ww': ww,  # PNG 그리기용 셀 좌표
                    })

        self.get_logger().info(f'윈도우 후보 수 (NMS 전): {len(raw)}')

        # ── NMS (Non-Maximum Suppression) ────────────────────────────
        # 같은 실제 공간에서 수십 개의 창이 겹쳐 후보로 등록됨.
        # 거리 기준으로 가장 스코어 높은 것만 남기고 나머지 억제.
        #
        # 억제 거리 기준: space_length 이내에 있는 후보는 중복으로 간주
        # → 예: 0.40m 이내에 다른 후보가 있으면 스코어가 낮은 쪽 제거
        raw.sort(key=lambda x: -x['score'])  # 스코어 내림차순 정렬
        nms_dist_sq = self._space_length ** 2
        kept = []
        for cand in raw:
            # 이미 채택된 후보들과의 거리 확인
            too_close = any(
                (cand['mx'] - k['mx']) ** 2 + (cand['my'] - k['my']) ** 2 < nms_dist_sq
                for k in kept
            )
            if not too_close:
                kept.append(cand)  # 충분히 멀면 채택

        return kept  # 최종 후보 리스트 (score 내림차순)

    # ── RViz2 마커 생성 ───────────────────────────────────────────────
    def _make_box_marker(self, mid, header, x, y, sx, sy, color):
        """
        RViz2에 표시할 반투명 박스 마커를 생성.
          mid  : 마커 고유 ID (같은 namespace 내 중복 불가)
          sx/sy: 박스 가로/세로 크기 (m)
          color: RGBA (0~1 범위)
        """
        m = Marker()
        m.header  = header
        m.ns      = 'parking_spaces'
        m.id      = mid
        m.type    = Marker.CUBE          # 박스 형태
        m.action  = Marker.ADD
        m.pose.position.x    = x
        m.pose.position.y    = y
        m.pose.position.z    = 0.1       # 맵 평면 위 0.1m 에 표시
        m.pose.orientation.w = 1.0       # 회전 없음
        m.scale.x = sx                   # 가로 크기 = 공간 폭
        m.scale.y = sy                   # 세로 크기 = 공간 깊이
        m.scale.z = 0.05                 # 박스 두께 (시각적으로 납작하게)
        m.color   = color
        m.lifetime.sec = 1               # 1초 후 자동 소멸 (맵 업데이트 멈추면 사라짐)
        return m

    # ── PNG 디버그 이미지 저장 ────────────────────────────────────────
    def _save_map_png(self, free_map, occ_map, rx_cell, ry_cell,
                      candidates, best_idx, resolution, height, width):
        """
        탐지 결과를 시각화한 PNG를 ~/sample_th/map/ 에 저장.
          흰색: 빈 공간  회색: 점유(벽)  검정: 미탐색
          파란 원: 탐색 반경
          빨간 굵은 사각형: ★ BEST 후보
          초록 사각형: 나머지 후보

        map_save_scale(기본 4)배 업스케일 후 저장.
        원본 맵이 1셀=1픽셀이라 0.05m 해상도에서 픽셀이 크게 보이는 문제를
        해소하기 위해 INTER_NEAREST 로 확대. 선·원 두께도 scale에 맞게 조정.
        """
        s = self._map_save_scale  # 업스케일 배율

        # ── 배경 이미지 생성 (원본 셀 해상도) ──────────────────────
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)  # 빈 공간 = 흰색
        vis[occ_map  > 0] = (100, 100, 100)  # 점유   = 회색

        # ── 업스케일 ─────────────────────────────────────────────
        # INTER_NEAREST: 셀 경계를 흐리지 않고 픽셀 단위로 확대
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        # 업스케일 후 모든 좌표·크기에 s 를 곱해서 그림
        def sc(v):
            """셀 좌표 → 스케일된 픽셀 좌표 변환"""
            return int(round(v * s))

        # 탐색 반경 경계선 (파란 원)
        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)  # 선 두께: 배율에 비례
        cv2.circle(vis,
                   (sc(rx_cell), sc(ry_cell)),
                   sc(radius_cells),
                   (255, 0, 0),   # BGR: 파랑
                   line_w)

        # 탐지된 주차 공간 사각형 그리기
        for idx, c in enumerate(candidates):
            r0, c0 = sc(c['r']), sc(c['c'])
            r1 = sc(c['r'] + c['wh'])
            c1 = sc(c['c'] + c['ww'])

            if idx == best_idx:
                # ★ BEST: 빨간색 두꺼운 사각형 + 중심 십자 표시
                rect_w  = max(2, s)
                cross_s = max(6, s * 3)  # 십자 크기도 배율 반영
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 0, 255), rect_w)
                cx = (c0 + c1) // 2
                cy = (r0 + r1) // 2
                cv2.drawMarker(vis, (cx, cy), (0, 0, 255),
                               cv2.MARKER_CROSS, cross_s, max(1, s // 2))
            else:
                # 나머지: 초록 얇은 사각형
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 200, 0),
                              max(1, s // 2))

        # 타임스탬프 파일명으로 저장
        timestamp = time.strftime('%Y%m%d_%H%M%S')
        fname = os.path.join(self._map_dir, f'map_{timestamp}.png')
        cv2.imwrite(fname, vis)
        self.get_logger().info(
            f'Map 저장 → {fname}  ({width*s}×{height*s}px, {s}x scale)'
        )


# ── 진입점 ────────────────────────────────────────────────────────────
def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    try:
        rclpy.spin(node)  # 노드 이벤트 루프 실행 (콜백 대기)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```


개선 버전


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
         ~/sample_th/maps/*.png              ← 디버그 이미지

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

        self._map_dir = os.path.expanduser('~/sample_th/maps')
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

