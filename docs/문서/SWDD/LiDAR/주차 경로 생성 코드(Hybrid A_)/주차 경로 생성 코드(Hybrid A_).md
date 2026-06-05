# 주차 경로 생성 코드(Hybrid A*)


```python
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node  (v3 — Nav2 핵심 기능 추가)
=======================================================================

【v3 추가 사항】 (v2 버그 수정 위에 추가)

  1. Analytic Expansion  (Nav2: analytic_expansion_ratio)
       탐색 도중 일정 주기마다 현재 노드 → 목표까지
       Reeds-Shepp 경로가 충돌 없이 연결되면 즉시 탐색 종료.
       직각주차 탐색 속도 약 10배 향상.
       의존 패키지: pip install rsplan
       미설치 시 자동으로 비활성화되어 v2 동작과 동일.

  2. 이중 휴리스틱  (Nav2: cache_obstacle_heuristic)
       기존: max(euclidean, r_min × |Δyaw|)
       추가: Dijkstra 로 목표→전체 셀 실제 이동비용 사전 계산
       조합: max(기존, obstacle_heuristic[iy, ix])
       장애물 환경에서 탐색 방향을 더 효율적으로 유도.

  3. Motion primitive 자동 계산  (Nav2: motion primitive sizing)
       auto_step_size=True 시 step = max(res, r_min × yaw_res) 자동 결정.
       기본값 False → step_size 파라미터 직접 지정 방식 유지.

【v2 버그 수정 사항】
  1. goal_yaw 결정 오류 수정 (markers[0] 가정 제거)
  2. _extract_path 체인 끊김 버그 수정
  3. _key() 해시 충돌 수정
  4. 후륜 차축 오프셋 적용
  5. 목표 충돌 사전 검사 추가

【Nav2 연동】
  use_nav2=False (기본): 자체 구현 Hybrid A* (v3 기능 포함)
  use_nav2=True        : Nav2 ComputePathToPose Action 호출

【구독 토픽】
  /parking_spaces        (PoseArray)
  /parking_spaces_info   (String/JSON)  goal_yaw·type 포함
  /parking_space_markers (MarkerArray)
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)
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

# Nav2 Action (use_nav2=True 일 때만 실제 사용)
try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False

# Reeds-Shepp (Analytic Expansion 용)
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
        self.steer     = steer
        self.direction = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Obstacle Heuristic 사전 계산 (Nav2: cache_obstacle_heuristic)
# ─────────────────────────────────────────────────────────────────────────────

def _build_obstacle_heuristic(
    goal_ix: int, goal_iy: int,
    grid: np.ndarray,
    res: float,
    occ_thresh: int = 50,
) -> np.ndarray:
    """
    목표 셀에서 역방향 Dijkstra 로 전체 맵의 실제 이동 비용(m) 사전 계산.

    Nav2 SmacPlannerHybrid 의 cache_obstacle_heuristic 에 해당.
    장애물 우회 비용이 반영되므로 유클리드 거리보다 정확한 휴리스틱 하한값.
    plan() 호출당 1회만 수행.
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

    return dist  # shape (H, W), 단위 [m]


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float       = 0.06,
        n_steer: int           = 7,
        yaw_resolution: float  = math.radians(5.0),
        goal_xy_tol: float     = 0.08,
        goal_yaw_tol: float    = math.radians(10.0),
        reverse_cost: float    = 1.5,
        dir_change_cost: float = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int     = 50,
        max_iter: int          = 80000,
        # ── ★ 추가: Nav2 대응 기능 3가지 ────────────────────────────
        analytic_expansion_ratio: int  = 3,    # 매 N×n_steer×2 iter 마다 RS expansion 시도
        use_obstacle_heuristic: bool   = True, # 이중 휴리스틱 ON/OFF
        auto_step_size: bool           = False, # True 시 step = max(res, r_min×yaw_res) 자동 계산
    ):
        self.vc               = vehicle_cfg
        self.step             = step_size
        self.n_steer          = n_steer
        self.yaw_res          = yaw_resolution
        self.goal_xy_tol      = goal_xy_tol
        self.goal_yaw_tol     = goal_yaw_tol
        self.reverse_cost     = reverse_cost
        self.dir_change_cost  = dir_change_cost
        self.steer_chg_cost   = steer_change_cost
        self.occ_thresh       = occ_threshold
        self.max_iter         = max_iter

        # ── ★ 추가 속성 ─────────────────────────────────────────────
        self._step_override          = step_size
        self._auto_step_size         = auto_step_size
        self._analytic_ratio         = analytic_expansion_ratio
        self._use_obstacle_heuristic = use_obstacle_heuristic
        self._obs_heuristic: Optional[np.ndarray] = None  # plan() 시 사전 계산

        self.steers = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
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

        # ── ★ 추가 3: Motion primitive 자동 계산 ─────────────────────
        if self._auto_step_size:
            r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
            self.step = max(resolution, r_min * self.yaw_res)
        else:
            self.step = self._step_override

        # ── ★ 추가 2: Obstacle heuristic 사전 계산 ───────────────────
        self._r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        if self._use_obstacle_heuristic:
            gix = max(0, min(self._width  - 1, int(round((goal_x - origin_x) / resolution))))
            giy = max(0, min(self._height - 1, int(round((goal_y - origin_y) / resolution))))
            self._obs_heuristic = _build_obstacle_heuristic(
                gix, giy, occ_grid, resolution, self.occ_thresh
            )
        else:
            self._obs_heuristic = None

        # ── ★ Analytic Expansion 주기 ─────────────────────────────────
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

            # ── ★ 추가 1: Analytic Expansion ─────────────────────────
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
                path = self._extract_path(cur, closed_dict, open_dict)
                return path  # None 이면 체인 끊김 → 탐색 실패로 처리

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
        """
        ★ Analytic Expansion (Nav2: analytic_expansion_ratio)

        현재 노드 → 목표까지 Reeds-Shepp 경로를 계산하고,
        충돌이 없으면 경로를 반환해 탐색을 즉시 종료.
        rsplan 패키지 미설치 시 자동으로 비활성화됨.
        """
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
                steer_diff = abs(steer - node.steer)
                cost += steer_diff * self.steer_chg_cost

                new_g = node.g + cost
                child = self._make_node(nx, ny, nyaw, g=new_g,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx   = x + d * math.cos(mid_yaw)
        ny   = y + d * math.sin(mid_yaw)
        nyaw = self._norm_angle(yaw + delta_yaw)
        return nx, ny, nyaw

    def _in_collision(self, x, y, yaw):
        """
        차량 직사각형 풋프린트 샘플링 충돌 검사.
        전후 방향 n_samples 점 × 좌우 5열 (폭 방향 커버리지 향상).
        """
        cos_t = math.cos(yaw)
        sin_t = math.sin(yaw)
        hw    = self.vc.width / 2.0
        n_lon = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        # 폭 방향 샘플: 이전 3점 → 5점으로 확대 (얇은 벽 탐지 강화)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                px = cx - w * sin_t
                py = cy + w * cos_t
                if self._cell_occupied(px, py):
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
        ★ 이중 휴리스틱 (Nav2: cache_obstacle_heuristic)

        h1 = max(euclidean, r_min × |Δyaw|)   ← 기존 kinematic 하한
        h2 = obstacle_heuristic[iy, ix]         ← ★ 장애물 반영 실제 비용
        h  = max(h1, h2)                         ← 둘 중 더 큰 하한 선택
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

    # ── [★ 수정] _extract_path: 체인 끊기면 None 반환 ────────────────
    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        목표 노드 → 시작 노드 역추적.

        [버그 수정]
        이전: 체인 끊겨도 start 좌표를 강제 append → 불연속 경로 반환
        수정: 체인이 끊기면 (parent_key 가 어디에도 없으면) None 반환.
              parent_key=None 인 노드(시작 노드)를 만날 때만 정상 종료.
        """
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                # 시작 노드에 도달 → 정상 종료
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        # 체인 끊김: 복구 불가 → None
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

    # ── [★ 수정] _key: Python 내장 hash 로 충돌 제거 ─────────────────
    def _key(self, node: HANode) -> int:
        """
        (ix, iy, iyaw) 3-튜플을 Python 내장 hash 로 인코딩.

        [버그 수정]
        이전: iyaw + yaw_bins*(ix + 100000*iy)
              → ix > 100000 (맵 5km 이상) 이면 충돌 발생
        수정: hash((ix, iy, iyaw)) — Python tuple hash 는 충돌이 사실상 없고
              음수가 나올 수 있으므로 dict key 로 직접 사용 (음수 OK).
        """
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
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2 로 경로를 계획·발행.

    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출 (권장)
    use_nav2=False → 자체 구현 Hybrid A* 실행 (Nav2 없이 동작)
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        # ── 파라미터 선언 ─────────────────────────────────────────────
        self.declare_parameter('wheelbase',           0.25)
        self.declare_parameter('max_steer_deg',       35.0)
        self.declare_parameter('vehicle_length',      0.35)
        self.declare_parameter('vehicle_width',       0.22)
        self.declare_parameter('front_overhang',      0.05)
        self.declare_parameter('rear_overhang',       0.05)
        self.declare_parameter('step_size',           0.06)
        self.declare_parameter('n_steer',             7)
        self.declare_parameter('yaw_resolution_deg',  5.0)
        self.declare_parameter('goal_xy_tol',         0.08)
        self.declare_parameter('goal_yaw_tol_deg',    10.0)
        self.declare_parameter('reverse_cost',        1.5)
        self.declare_parameter('dir_change_cost',     3.0)
        self.declare_parameter('steer_change_cost',   0.5)
        self.declare_parameter('occ_threshold',       50)
        self.declare_parameter('max_iter',            80000)
        self.declare_parameter('base_frame',          'base_link')
        # ── ★ 추가: Nav2 대응 파라미터 ──────────────────────────────
        self.declare_parameter('analytic_expansion_ratio', 3)
        self.declare_parameter('use_obstacle_heuristic',   True)
        self.declare_parameter('auto_step_size',           False)
        # Nav2 연동 파라미터
        self.declare_parameter('use_nav2',            False)
        self.declare_parameter('nav2_planner_id',     'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',    30.0)

        self._load_params()

        # ── 상태 머신 ─────────────────────────────────────────────────
        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        # ── 최신 데이터 저장 ─────────────────────────────────────────
        self._latest_map:     Optional[OccupancyGrid] = None
        self._latest_spaces:  Optional[PoseArray]     = None
        self._latest_info:    Optional[List[dict]]    = None  # ★ JSON info
        self._target_info:    Optional[dict]          = None  # BEST 후보 스냅샷

        # ── TF2 ──────────────────────────────────────────────────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ─────────────────────────────────────────────────
        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        # ── 서브스크라이버 ────────────────────────────────────────────
        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,     10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces,  10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,    10)  # ★

        # ── Nav2 Action 클라이언트 (use_nav2=True 일 때) ──────────────
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
                    'Nav2 Action 클라이언트 생성 완료. '
                    f'planner_id={self._nav2_planner_id}'
                )

        # ── 키보드 확인 스레드 ────────────────────────────────────────
        kb = threading.Thread(target=self._keyboard_listener, daemon=True)
        kb.start()

        mode = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A* v3'
        ae_status  = f'ON (ratio={self.get_parameter("analytic_expansion_ratio").value})' if _RSPLAN_AVAILABLE else 'OFF (rsplan 미설치)'
        oh_status  = 'ON' if self.get_parameter('use_obstacle_heuristic').value else 'OFF'
        self.get_logger().info(
            f'HybridAStarPlanner v3 시작 [{mode}]\n'
            f'  Analytic Expansion: {ae_status}\n'
            f'  Obstacle Heuristic: {oh_status}\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────────

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
            vehicle_cfg                = vc,
            step_size                  = self.get_parameter('step_size').value,
            n_steer                    = self.get_parameter('n_steer').value,
            yaw_resolution             = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol                = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol               = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost               = self.get_parameter('reverse_cost').value,
            dir_change_cost            = self.get_parameter('dir_change_cost').value,
            steer_change_cost          = self.get_parameter('steer_change_cost').value,
            occ_threshold              = self.get_parameter('occ_threshold').value,
            max_iter                   = self.get_parameter('max_iter').value,
            # ── ★ 추가 ────────────────────────────────────────────────
            analytic_expansion_ratio   = self.get_parameter('analytic_expansion_ratio').value,
            use_obstacle_heuristic     = self.get_parameter('use_obstacle_heuristic').value,
            auto_step_size             = self.get_parameter('auto_step_size').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    # ── 콜백: /map ───────────────────────────────────────────────────────

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    # ── 콜백: /parking_spaces_info (JSON) ────────────────────────────────
    # ★ 핵심 수정: markers[0] 가정 제거, JSON 으로 정확한 정보 수신

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    # ── 콜백: /parking_spaces ────────────────────────────────────────────

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

            # ★ is_best=True 항목 검색 (index 매칭)
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

    # ── 키보드 확인 스레드 ────────────────────────────────────────────────

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

    # ── 경로 계획 실행 ───────────────────────────────────────────────────

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        # 1. 로봇 현재 포즈
        start_x, start_y, start_yaw = self._get_robot_pose()

        # 2. 주차 공간 중심
        space_cx = info['mx']
        space_cy = info['my']

        # ── [★ 수정] goal_yaw: detector 가 계산한 기준각 + ±π flip ────
        goal_yaw = self._resolve_goal_yaw(
            base_yaw  = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # ── [★ 2nd version 통합] 후륜 차축 오프셋 보정 ──────────────
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
            f'경로 계획 — '
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        # 3. 목표 충돌 사전 검사
        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox, oy, res = m.info.origin.position.x, m.info.origin.position.y, m.info.resolution

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

        # 4. 경로 계획 (Nav2 or 자체 구현)
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

    # ── [★ 수정] goal_yaw 해석: 기준각 + ±π flip ─────────────────────

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        detector 가 계산한 기준각(base_yaw)에 대해
        0°↔180° (또는 90°↔-90°) 중 접근 방향과 더 가까운 쪽을 선택.

        접근 방향 벡터와의 내적이 양수인 쪽을 선택함으로써
        로봇이 목표를 향해 전진하는 방향으로 진입하도록 유도.

        예) base_yaw=0.0, approach=-170° → 180° 선택 (뒤로 진입이 더 자연스러움)
        """
        approach = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)

        diff_a = abs(self._norm_angle(candidate_a - approach))
        diff_b = abs(self._norm_angle(candidate_b - approach))

        selected = candidate_a if diff_a <= diff_b else candidate_b
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

    # ── 자체 Hybrid A* 실행 ───────────────────────────────────────────────

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0   = time.monotonic()
        path = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    # ── Nav2 SmacPlannerHybrid Action 호출 ───────────────────────────────

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action 으로 SmacPlannerHybrid 경로 요청.

        Nav2 설정 (nav2_params.yaml) 에 아래가 필요:
          planner_server:
            ros__parameters:
              planner_plugins: ["HybridAStar"]
              HybridAStar:
                plugin: "nav2_smac_planner/SmacPlannerHybrid"
                minimum_turning_radius: 0.30       # wheelbase/tan(max_steer) 보다 크게
                motion_model_for_search: "REEDS_SHEPP"
                angle_quantization_bins: 72        # 5° 해상도
                smooth_path: true
                max_planning_time: 10.0

        반환: [(x, y, yaw), ...] or None
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id = 'map'
        goal_msg.goal.header.stamp    = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x = gx
        goal_msg.goal.pose.position.y = gy
        goal_msg.goal.pose.position.z = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        # 시작 포즈 (현재 로봇 위치)
        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id = 'map'
        goal_msg.start.header.stamp    = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x = sx
        goal_msg.start.pose.position.y = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        # 동기식 대기 (Action 결과 수신까지 블로킹)
        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(
            self, future, timeout_sec=self._nav2_timeout_sec
        )

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(
            self, result_future, timeout_sec=self._nav2_timeout_sec
        )

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        result = result_future.result().result
        nav2_path: Path = result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x = ps.pose.position.x
            y = ps.pose.position.y
            qz = ps.pose.orientation.z
            qw = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(
            f'Nav2 경로 수신: {len(path)}개 웨이포인트'
        )
        return path

    # ── TF: 로봇 포즈 ────────────────────────────────────────────────────

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx = tf.transform.translation.x
            ty = tf.transform.translation.y
            q  = tf.transform.rotation
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

    # ── /parking_path 발행 ───────────────────────────────────────────────

    def _publish_path(self, path):
        ros_path = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps = PoseStamped()
            ps.header = ros_path.header
            ps.pose.position.x = x
            ps.pose.position.y = y
            ps.pose.orientation.z = math.sin(yaw / 2.0)
            ps.pose.orientation.w = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    # ── /parking_path_markers 발행 ───────────────────────────────────────

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point(); p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow = Marker()
            arrow.header.stamp    = stamp
            arrow.header.frame_id = 'map'
            arrow.ns              = 'parking_path_arrows'
            arrow.id              = i + 1
            arrow.type            = Marker.ARROW
            arrow.action          = Marker.ADD
            arrow.pose.position.x = x
            arrow.pose.position.y = y
            arrow.pose.position.z = 0.05
            arrow.pose.orientation.z = math.sin(yaw / 2.0)
            arrow.pose.orientation.w = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color           = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec    = 10
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


```python
import cv2
import numpy as np
import heapq

# 1. 휴리스틱(Heuristic) 함수: 두 점 사이의 직선 거리(유클리디안 거리) 계산
# A* 알고리즘이 "이쪽으로 가면 목적지랑 가까워지겠네!"라고 힌트를 얻는 데 사용됩니다.
def heuristic(a, b):
    return np.sqrt((a[0] - b[0])**2 + (a[1] - b[1])**2)

# 2. 핵심 알고리즘: A* 경로 탐색
def a_star_search(costmap, start, goal):
    # 로봇이 픽셀 상에서 이동할 수 있는 8방향 (상, 하, 좌, 우, 대각선)
    neighbors = [(0,1), (0,-1), (1,0), (-1,0), (1,1), (1,-1), (-1,1), (-1,-1)]

    # 탐색할 노드들을 비용이 적은 순서대로 정렬해두는 우선순위 큐(Heap)
    open_set = []
    heapq.heappush(open_set, (0, start))

    # 경로를 다 찾은 후 선을 긋기 위해, '내가 어디서 왔는지' 발자취를 저장하는 딕셔너리
    came_from = {}

    # 시작점에서 현재 픽셀까지 오는데 걸린 '실제 이동 비용'
    g_score = {start: 0}

    while open_set:
        # 가장 최적일 것으로 예상되는 픽셀을 꺼냅니다.
        current = heapq.heappop(open_set)[1]

        # 🎯 목적지에 도착했다면? 발자취를 거꾸로 추적해서 최종 경로(선)를 만듭니다.
        if current == goal:
            path = []
            while current in came_from:
                path.append(current)
                current = came_from[current]
            path.append(start)
            path.reverse() # 시작점 -> 도착점 순서로 뒤집기
            return path

        # 주변 8방향 픽셀들을 둘러봅니다.
        for dx, dy in neighbors:
            nx, ny = current[0] + dx, current[1] + dy
            neighbor = (nx, ny)

            # [예외 1] 이미지(맵) 범위를 벗어나면 탐색 안 함
            if nx < 0 or ny < 0 or nx >= costmap.shape[1] or ny >= costmap.shape[0]:
                continue

            # [예외 2] 장애물 판별 (흰색이 자유 공간, 검은색/회색이 장애물)
            # OpenCV 이미지는 costmap[y, x] 순서로 접근해야 합니다.
            # 픽셀 값이 200보다 작으면(어두우면) 하드보드지 벽으로 간주하고 통과하지 못하게 막습니다.
            if costmap[ny, nx] < 200:
                continue

            # 직선 이동은 비용 1, 대각선 이동은 비용 1.414 (루트 2)를 추가
            cost = 1.414 if dx != 0 and dy != 0 else 1
            tentative_g_score = g_score[current] + cost

            # 더 지름길을 발견했거나, 처음 와본 길이라면 데이터 갱신!
            if neighbor not in g_score or tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                
                # f_score = 지금까지 온 거리(g) + 앞으로 갈 예상 거리(heuristic)
                f_score = tentative_g_score + heuristic(neighbor, goal)
                heapq.heappush(open_set, (f_score, neighbor))

    return None # 맵이 다 막혀있어서 경로를 찾을 수 없는 경우

# 3. 메인 실행부
if __name__ == "__main__":
    # 📷 매니저님이 뽑아내신 PNG 파일(코스트맵)을 흑백 모드로 불러옵니다.
    # ('map_image.png' 부분을 실제 파일 이름으로 바꿔주세요)
    img = cv2.imread('map_image.png', cv2.IMREAD_GRAYSCALE)

    # 경로(초록색 선)를 예쁘게 그리기 위해 컬러 캔버스를 하나 복사해 둡니다.
    result_img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)

    # 🚦 시작점과 도착점 좌표 설정 (X, Y 픽셀 좌표)
    # 이미지 확인 후 실제 로봇 위치와 탐지된 빨간 십자가 중심 픽셀 좌표를 넣으시면 됩니다!
    start_point = (50, 400)   # 예시: 로봇 현재 위치
    goal_point = (350, 150)   # 예시: 탐지된 주차 공간 좌표

    print("자율 주차 경로 탐색을 시작합니다...")
    path = a_star_search(img, start_point, goal_point)

    # 🖌️ 결과 시각화
    if path:
        print(f"경로 탐색 성공! 총 {len(path)}개의 픽셀을 지납니다.")

        # 시작점은 파란색(Blue), 도착점은 빨간색(Red) 원으로 표시
        cv2.circle(result_img, start_point, 5, (255, 0, 0), -1)
        cv2.circle(result_img, goal_point, 5, (0, 0, 255), -1)

        # A*가 찾은 경로를 따라 초록색 선(Green Line) 긋기
        for i in range(len(path) - 1):
            pt1 = path[i]
            pt2 = path[i+1]
            cv2.line(result_img, pt1, pt2, (0, 255, 0), 2)

        # 결과 화면 띄우기
        cv2.imshow("A* Parking Path Planning", result_img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        
        # 이미지 파일로 저장해 두기
        cv2.imwrite("final_parking_path.png", result_img)
    else:
        print("하드보드지 벽에 완전히 막혀있어 경로를 생성할 수 없습니다!")
```


다른 버전


```python
#Hybrid_A_star.py
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node  (v2 — 버그 수정 + Nav2 연동)
=======================================================================

【v2 수정 사항】

  [버그 수정]
  1. goal_yaw 결정 오류 수정
       이전: markers[0] 가정 + 오직 0°/180° 고집
       수정: /parking_spaces_info (JSON) 에서 index 매칭으로 정확한 goal_yaw 획득.
             detector 가 travel_direction 기반으로 이미 계산한 값을 그대로 사용.
             ±π flip 은 접근 방향과의 내적으로 결정.

  2. _extract_path 체인 끊김 버그 수정
       이전: chain 끊겨도 start 를 강제 append → 불연속 경로 반환
       수정: chain 끊기면 즉시 None 반환 → 탐색 실패로 처리.

  3. _key() 해시 충돌 수정
       이전: iyaw + yaw_bins*(ix + 100000*iy)  → ix>100000 이면 충돌
       수정: Cantor 쌍 함수 기반 3D 튜플 해시 (Python 내장 hash 사용)

  4. markers[0] 가정 제거
       이전: self._latest_markers.markers[0] 으로 BEST 공간 정보 추정
       수정: /parking_spaces_info JSON 의 is_best=True 항목에서 직접 읽기.

  5. 후륜 차축 오프셋 적용 (2nd version 의 수정 사항 통합)
       공간 중심 ≠ 후륜 차축 목표. (lf-lb)/2 오프셋 보정.

  6. 목표 충돌 사전 검사 추가

  [Nav2 연동 — 권장 방식]
  use_nav2 파라미터를 True 로 설정하면 Nav2 SmacPlannerHybrid Action 을 호출.
  Nav2 스택(planner_server, costmap)이 실행 중이어야 함.

  use_nav2=False (기본): 자체 구현 Hybrid A* 실행 (Nav2 없이도 동작)
  use_nav2=True        : Nav2 ComputePathToPose Action 호출

  Nav2 사용 시 nav2_params.yaml 에 아래 설정 필요:
    planner_server:
      ros__parameters:
        planner_plugins: ["HybridAStar"]
        HybridAStar:
          plugin: "nav2_smac_planner/SmacPlannerHybrid"
          minimum_turning_radius: 0.30
          motion_model_for_search: "REEDS_SHEPP"
          angle_quantization_bins: 72
          smooth_path: true

【구독 토픽】
  /parking_spaces        (PoseArray)   ← detector 발행 (기존 호환)
  /parking_spaces_info   (String/JSON) ← detector 발행 ★신규: goal_yaw·type 포함
  /parking_space_markers (MarkerArray) ← detector 발행
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)
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

# Nav2 Action (use_nav2=True 일 때만 실제 사용)
try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False


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
        self.steer     = steer
        self.direction = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float       = 0.06,
        n_steer: int           = 7,
        yaw_resolution: float  = math.radians(5.0),
        goal_xy_tol: float     = 0.08,
        goal_yaw_tol: float    = math.radians(10.0),
        reverse_cost: float    = 1.5,
        dir_change_cost: float = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int     = 50,
        max_iter: int          = 80000,
    ):
        self.vc               = vehicle_cfg
        self.step             = step_size
        self.n_steer          = n_steer
        self.yaw_res          = yaw_resolution
        self.goal_xy_tol      = goal_xy_tol
        self.goal_yaw_tol     = goal_yaw_tol
        self.reverse_cost     = reverse_cost
        self.dir_change_cost  = dir_change_cost
        self.steer_chg_cost   = steer_change_cost
        self.occ_thresh       = occ_threshold
        self.max_iter         = max_iter

        self.steers = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
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

            if self._reached_goal(cur.x, cur.y, cur.yaw, goal_x, goal_y, goal_yaw):
                path = self._extract_path(cur, closed_dict, open_dict)
                return path  # None 이면 체인 끊김 → 탐색 실패로 처리

            for succ in self._expand(cur, goal_x, goal_y, goal_yaw):
                skey = self._key(succ)
                if skey in closed_dict:
                    continue
                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

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
                steer_diff = abs(steer - node.steer)
                cost += steer_diff * self.steer_chg_cost

                new_g = node.g + cost
                child = self._make_node(nx, ny, nyaw, g=new_g,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx   = x + d * math.cos(mid_yaw)
        ny   = y + d * math.sin(mid_yaw)
        nyaw = self._norm_angle(yaw + delta_yaw)
        return nx, ny, nyaw

    def _in_collision(self, x, y, yaw):
        """
        차량 직사각형 풋프린트 샘플링 충돌 검사.
        전후 방향 n_samples 점 × 좌우 5열 (폭 방향 커버리지 향상).
        """
        cos_t = math.cos(yaw)
        sin_t = math.sin(yaw)
        hw    = self.vc.width / 2.0
        n_lon = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        # 폭 방향 샘플: 이전 3점 → 5점으로 확대 (얇은 벽 탐지 강화)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                px = cx - w * sin_t
                py = cy + w * cos_t
                if self._cell_occupied(px, py):
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
        dist  = math.hypot(x - gx, y - gy)
        dyaw  = abs(self._norm_angle(yaw - gyaw))
        r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        return max(dist, r_min * dyaw)

    # ── [★ 수정] _extract_path: 체인 끊기면 None 반환 ────────────────
    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        목표 노드 → 시작 노드 역추적.

        [버그 수정]
        이전: 체인 끊겨도 start 좌표를 강제 append → 불연속 경로 반환
        수정: 체인이 끊기면 (parent_key 가 어디에도 없으면) None 반환.
              parent_key=None 인 노드(시작 노드)를 만날 때만 정상 종료.
        """
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                # 시작 노드에 도달 → 정상 종료
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        # 체인 끊김: 복구 불가 → None
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

    # ── [★ 수정] _key: Python 내장 hash 로 충돌 제거 ─────────────────
    def _key(self, node: HANode) -> int:
        """
        (ix, iy, iyaw) 3-튜플을 Python 내장 hash 로 인코딩.

        [버그 수정]
        이전: iyaw + yaw_bins*(ix + 100000*iy)
              → ix > 100000 (맵 5km 이상) 이면 충돌 발생
        수정: hash((ix, iy, iyaw)) — Python tuple hash 는 충돌이 사실상 없고
              음수가 나올 수 있으므로 dict key 로 직접 사용 (음수 OK).
        """
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
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2 로 경로를 계획·발행.

    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출 (권장)
    use_nav2=False → 자체 구현 Hybrid A* 실행 (Nav2 없이 동작)
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        # ── 파라미터 선언 ─────────────────────────────────────────────
        self.declare_parameter('wheelbase',           0.25)
        self.declare_parameter('max_steer_deg',       35.0)
        self.declare_parameter('vehicle_length',      0.35)
        self.declare_parameter('vehicle_width',       0.22)
        self.declare_parameter('front_overhang',      0.05)
        self.declare_parameter('rear_overhang',       0.05)
        self.declare_parameter('step_size',           0.06)
        self.declare_parameter('n_steer',             7)
        self.declare_parameter('yaw_resolution_deg',  5.0)
        self.declare_parameter('goal_xy_tol',         0.08)
        self.declare_parameter('goal_yaw_tol_deg',    10.0)
        self.declare_parameter('reverse_cost',        1.5)
        self.declare_parameter('dir_change_cost',     3.0)
        self.declare_parameter('steer_change_cost',   0.5)
        self.declare_parameter('occ_threshold',       50)
        self.declare_parameter('max_iter',            80000)
        self.declare_parameter('base_frame',          'base_link')
        # Nav2 연동 파라미터
        self.declare_parameter('use_nav2',            False)
        self.declare_parameter('nav2_planner_id',     'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',    30.0)

        self._load_params()

        # ── 상태 머신 ─────────────────────────────────────────────────
        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        # ── 최신 데이터 저장 ─────────────────────────────────────────
        self._latest_map:     Optional[OccupancyGrid] = None
        self._latest_spaces:  Optional[PoseArray]     = None
        self._latest_info:    Optional[List[dict]]    = None  # ★ JSON info
        self._target_info:    Optional[dict]          = None  # BEST 후보 스냅샷

        # ── TF2 ──────────────────────────────────────────────────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ─────────────────────────────────────────────────
        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        # ── 서브스크라이버 ────────────────────────────────────────────
        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,     10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces,  10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,    10)  # ★

        # ── Nav2 Action 클라이언트 (use_nav2=True 일 때) ──────────────
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
                    'Nav2 Action 클라이언트 생성 완료. '
                    f'planner_id={self._nav2_planner_id}'
                )

        # ── 키보드 확인 스레드 ────────────────────────────────────────
        kb = threading.Thread(target=self._keyboard_listener, daemon=True)
        kb.start()

        mode = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A*'
        self.get_logger().info(
            f'HybridAStarPlanner v2 시작 [{mode}] — 주차 공간 탐색 중...\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────────

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
            vehicle_cfg       = vc,
            step_size         = self.get_parameter('step_size').value,
            n_steer           = self.get_parameter('n_steer').value,
            yaw_resolution    = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol       = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol      = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost      = self.get_parameter('reverse_cost').value,
            dir_change_cost   = self.get_parameter('dir_change_cost').value,
            steer_change_cost = self.get_parameter('steer_change_cost').value,
            occ_threshold     = self.get_parameter('occ_threshold').value,
            max_iter          = self.get_parameter('max_iter').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    # ── 콜백: /map ───────────────────────────────────────────────────────

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    # ── 콜백: /parking_spaces_info (JSON) ────────────────────────────────
    # ★ 핵심 수정: markers[0] 가정 제거, JSON 으로 정확한 정보 수신

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    # ── 콜백: /parking_spaces ────────────────────────────────────────────

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

            # ★ is_best=True 항목 검색 (index 매칭)
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

    # ── 키보드 확인 스레드 ────────────────────────────────────────────────

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

    # ── 경로 계획 실행 ───────────────────────────────────────────────────

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        # 1. 로봇 현재 포즈
        start_x, start_y, start_yaw = self._get_robot_pose()

        # 2. 주차 공간 중심
        space_cx = info['mx']
        space_cy = info['my']

        # ── [★ 수정] goal_yaw: detector 가 계산한 기준각 + ±π flip ────
        goal_yaw = self._resolve_goal_yaw(
            base_yaw  = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # ── [★ 2nd version 통합] 후륜 차축 오프셋 보정 ──────────────
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
            f'경로 계획 — '
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        # 3. 목표 충돌 사전 검사
        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox, oy, res = m.info.origin.position.x, m.info.origin.position.y, m.info.resolution

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

        # 4. 경로 계획 (Nav2 or 자체 구현)
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

    # ── [★ 수정] goal_yaw 해석: 기준각 + ±π flip ─────────────────────

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        detector 가 계산한 기준각(base_yaw)에 대해
        0°↔180° (또는 90°↔-90°) 중 접근 방향과 더 가까운 쪽을 선택.

        접근 방향 벡터와의 내적이 양수인 쪽을 선택함으로써
        로봇이 목표를 향해 전진하는 방향으로 진입하도록 유도.

        예) base_yaw=0.0, approach=-170° → 180° 선택 (뒤로 진입이 더 자연스러움)
        """
        approach = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)

        diff_a = abs(self._norm_angle(candidate_a - approach))
        diff_b = abs(self._norm_angle(candidate_b - approach))

        selected = candidate_a if diff_a <= diff_b else candidate_b
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

    # ── 자체 Hybrid A* 실행 ───────────────────────────────────────────────

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0   = time.monotonic()
        path = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    # ── Nav2 SmacPlannerHybrid Action 호출 ───────────────────────────────

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action 으로 SmacPlannerHybrid 경로 요청.

        Nav2 설정 (nav2_params.yaml) 에 아래가 필요:
          planner_server:
            ros__parameters:
              planner_plugins: ["HybridAStar"]
              HybridAStar:
                plugin: "nav2_smac_planner/SmacPlannerHybrid"
                minimum_turning_radius: 0.30       # wheelbase/tan(max_steer) 보다 크게
                motion_model_for_search: "REEDS_SHEPP"
                angle_quantization_bins: 72        # 5° 해상도
                smooth_path: true
                max_planning_time: 10.0

        반환: [(x, y, yaw), ...] or None
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id = 'map'
        goal_msg.goal.header.stamp    = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x = gx
        goal_msg.goal.pose.position.y = gy
        goal_msg.goal.pose.position.z = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        # 시작 포즈 (현재 로봇 위치)
        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id = 'map'
        goal_msg.start.header.stamp    = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x = sx
        goal_msg.start.pose.position.y = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        # 동기식 대기 (Action 결과 수신까지 블로킹)
        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(
            self, future, timeout_sec=self._nav2_timeout_sec
        )

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(
            self, result_future, timeout_sec=self._nav2_timeout_sec
        )

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        result = result_future.result().result
        nav2_path: Path = result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x = ps.pose.position.x
            y = ps.pose.position.y
            qz = ps.pose.orientation.z
            qw = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(
            f'Nav2 경로 수신: {len(path)}개 웨이포인트'
        )
        return path

    # ── TF: 로봇 포즈 ────────────────────────────────────────────────────

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx = tf.transform.translation.x
            ty = tf.transform.translation.y
            q  = tf.transform.rotation
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

    # ── /parking_path 발행 ───────────────────────────────────────────────

    def _publish_path(self, path):
        ros_path = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps = PoseStamped()
            ps.header = ros_path.header
            ps.pose.position.x = x
            ps.pose.position.y = y
            ps.pose.orientation.z = math.sin(yaw / 2.0)
            ps.pose.orientation.w = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    # ── /parking_path_markers 발행 ───────────────────────────────────────

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point(); p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow = Marker()
            arrow.header.stamp    = stamp
            arrow.header.frame_id = 'map'
            arrow.ns              = 'parking_path_arrows'
            arrow.id              = i + 1
            arrow.type            = Marker.ARROW
            arrow.action          = Marker.ADD
            arrow.pose.position.x = x
            arrow.pose.position.y = y
            arrow.pose.position.z = 0.05
            arrow.pose.orientation.z = math.sin(yaw / 2.0)
            arrow.pose.orientation.w = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color           = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec    = 10
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


```yaml
# ============================================================
# nav2_params_parking.yaml
# SPAS 소형 로봇 주차 전용 Nav2 파라미터
# ============================================================
#
# 사용법:
#   ros2 launch nav2_bringup navigation_launch.py \
#       params_file:=$(pwd)/nav2_params_parking.yaml
#
# 또는 기존 nav2_params.yaml 에 아래 섹션을 병합.
# ============================================================

# ── Planner Server ──────────────────────────────────────────
planner_server:
  ros__parameters:
    # HybridAStar 이름으로 SmacPlannerHybrid 플러그인 등록
    planner_plugins: ["HybridAStar"]

    HybridAStar:
      plugin: "nav2_smac_planner/SmacPlannerHybrid"

      # ── 기하 ──────────────────────────────────────────────
      # minimum_turning_radius = wheelbase / tan(max_steer)
      #   = 0.25 / tan(35°) ≈ 0.357m  → 여유 있게 0.30 설정
      minimum_turning_radius: 0.30

      # ── 탐색 모드 ─────────────────────────────────────────
      # REEDS_SHEPP: 전진+후진 모두 허용 → 좁은 주차공간 필수
      # DUBIN: 전진만 허용 (단방향 이동 환경용)
      motion_model_for_search: "REEDS_SHEPP"

      # ── 방향각 이산화 ─────────────────────────────────────
      # 360° / 72 = 5° 해상도 (촘촘할수록 정밀하지만 느림)
      angle_quantization_bins: 72

      # ── 경로 평활화 ───────────────────────────────────────
      smooth_path: true
      smoother_max_iterations: 1000
      smoother_w_smooth: 0.3
      smoother_w_data: 0.2
      smoother_tolerance: 1.0e-10

      # ── 탐색 비용 ─────────────────────────────────────────
      reverse_penalty: 1.5          # 후진 비용 배수
      change_penalty: 0.0           # 방향 전환 페널티 (0=비활성)
      non_straight_penalty: 1.2     # 조향 비용 배수
      cost_penalty: 2.0             # costmap 값 반영 비율

      # ── 탐색 제한 ─────────────────────────────────────────
      max_planning_time: 10.0       # 초 (소형 실내 환경에서 충분)
      max_on_approach_iterations: 1000
      max_iterations: 1000000

      # ── 목표 도달 허용 오차 ───────────────────────────────
      analytic_expansion_ratio: 3.5
      analytic_expansion_max_length: 3.0
      analytic_expansion_max_cost: 200.0
      retrospective_penalty: 0.015

      # ── 허용 격자 해상도 ──────────────────────────────────
      lookup_table_size: 20.0       # 조회 테이블 크기 (m)
      cache_obstacle_heuristic: true
      allow_unknown: true           # 미탐색 영역 통과 허용

      # ── 디버그 ────────────────────────────────────────────
      debug_visualizations: false   # true 면 /plan_smoothed 등 추가 토픽 발행


# ── Costmap (로컬) ──────────────────────────────────────────
# SmacPlannerHybrid 는 global_costmap 을 사용.
# 소형 로봇에 맞게 inflation_radius 를 차량 폭의 절반으로 설정.
#
# 참고: inflation_radius 가 너무 크면 좁은 주차 공간 진입이 막힘.
#       vehicle_width/2 = 0.22/2 = 0.11m → 0.12m 로 설정.

global_costmap:
  global_costmap:
    ros__parameters:
      update_frequency: 1.0
      publish_frequency: 1.0
      global_frame: map
      robot_base_frame: base_link
      robot_radius: 0.18          # 소형 로봇 반경 (충돌 마진 포함)
      resolution: 0.05
      track_unknown_space: true
      plugins: ["static_layer", "inflation_layer"]

      static_layer:
        plugin: "nav2_costmap_2d::StaticLayer"
        map_subscribe_transient_local: true

      inflation_layer:
        plugin: "nav2_costmap_2d::InflationLayer"
        # 핵심: inflation_radius = vehicle_width/2 + 여유 (0.03m)
        # 너무 크게 설정하면 주차 공간 진입 자체가 costmap 상 불가능해짐
        inflation_radius: 0.12
        cost_scaling_factor: 3.0

local_costmap:
  local_costmap:
    ros__parameters:
      update_frequency: 5.0
      publish_frequency: 2.0
      global_frame: odom
      robot_base_frame: base_link
      robot_radius: 0.18
      resolution: 0.05
      rolling_window: true
      width: 3
      height: 3
      plugins: ["obstacle_layer", "inflation_layer"]

      obstacle_layer:
        plugin: "nav2_costmap_2d::ObstacleLayer"
        enabled: true
        observation_sources: scan
        scan:
          topic: /scan
          max_obstacle_height: 2.0
          clearing: true
          marking: true
          data_type: "LaserScan"

      inflation_layer:
        plugin: "nav2_costmap_2d::InflationLayer"
        inflation_radius: 0.12
        cost_scaling_factor: 3.0

```


테스트


```python
#평행주차
#!/usr/bin/env python3

import math, heapq, time
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches


# ─────────────────────────────────────────────
# Vehicle
# ─────────────────────────────────────────────

class VehicleConfig:
    def __init__(
        self,
        wheelbase=0.25,
        max_steer_deg=35.0,
        length=0.35,
        width=0.22,
        front_overhang=0.05,
        rear_overhang=0.05
    ):
        self.wheelbase = wheelbase
        self.max_steer = math.radians(max_steer_deg)

        self.length = length
        self.width = width

        self.front_overhang = front_overhang
        self.rear_overhang = rear_overhang

        self.lf = wheelbase + front_overhang
        self.lb = rear_overhang


# ─────────────────────────────────────────────
# Node
# ─────────────────────────────────────────────

class HANode:

    __slots__ = (
        'x', 'y', 'yaw',
        'ix', 'iy', 'iyaw',
        'g', 'h',
        'steer', 'direction',
        'parent_key'
    )

    def __init__(
        self,
        x, y, yaw,
        ix, iy, iyaw,
        g, h,
        steer, direction,
        parent_key=None
    ):
        self.x, self.y, self.yaw = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw

        self.g, self.h = g, h
        self.steer = steer
        self.direction = direction

        self.parent_key = parent_key

    @property
    def f(self):
        return self.g + self.h

    def __lt__(self, other):
        return self.f < other.f


# ─────────────────────────────────────────────
# Hybrid A*
# ─────────────────────────────────────────────

class HybridAStarPlanner:

    def __init__(
        self,
        vehicle_cfg,
        step_size=0.06,
        n_steer=7,
        yaw_resolution=math.radians(5),
        goal_xy_tol=0.08,
        goal_yaw_tol=math.radians(10),
        reverse_cost=1.5,
        dir_change_cost=1.5,
        steer_change_cost=0.5,
        occ_threshold=50,
        max_iter=80000
    ):

        self.vc = vehicle_cfg

        self.step = step_size
        self.yaw_res = yaw_resolution

        self.goal_xy_tol = goal_xy_tol
        self.goal_yaw_tol = goal_yaw_tol

        self.reverse_cost = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost = steer_change_cost

        self.occ_thresh = occ_threshold
        self.max_iter = max_iter

        self.steers = np.linspace(
            -self.vc.max_steer,
            self.vc.max_steer,
            n_steer
        )

        self._yaw_bins = max(
            1,
            int(round(2 * math.pi / self.yaw_res))
        )

    def plan(
        self,
        sx, sy, syaw,
        gx, gy, gyaw,
        occ_grid,
        ox, oy,
        res
    ):

        self._occ = occ_grid
        self._ox, self._oy = ox, oy
        self._res = res

        self._height, self._width = occ_grid.shape

        start = self._make_node(
            sx, sy, syaw,
            g=0.0,
            steer=0.0,
            direction=1,
            parent_key=None
        )

        start.h = self._heuristic(
            sx, sy, syaw,
            gx, gy, gyaw
        )

        open_heap = [(start.f, start)]
        open_dict = {self._key(start): start}
        closed_dict = {}

        iterations = 0

        while open_heap:

            iterations += 1

            if iterations > self.max_iter:
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)

            if ckey in closed_dict:
                continue

            closed_dict[ckey] = cur

            if self._reached_goal(
                cur.x, cur.y, cur.yaw,
                gx, gy, gyaw
            ):
                return self._extract_path(
                    cur,
                    closed_dict,
                    open_dict
                )

            for succ in self._expand(cur, gx, gy, gyaw):

                skey = self._key(succ)

                if skey in closed_dict:
                    continue

                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _expand(self, node, gx, gy, gyaw):

        children = []

        for direction in (1, -1):

            for steer in self.steers:

                nx, ny, nyaw = self._bicycle_step(
                    node.x,
                    node.y,
                    node.yaw,
                    steer,
                    direction
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

                child = self._make_node(
                    nx, ny, nyaw,
                    g=node.g + cost,
                    steer=steer,
                    direction=direction,
                    parent_key=self._key(node)
                )

                child.h = self._heuristic(
                    nx, ny, nyaw,
                    gx, gy, gyaw
                )

                children.append(child)

        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):

        d = self.step * direction

        dyaw = (d / self.vc.wheelbase) * math.tan(steer)

        mid = yaw + dyaw / 2

        nx = x + d * math.cos(mid)
        ny = y + d * math.sin(mid)

        return nx, ny, self._norm(yaw + dyaw)

    def _in_collision(self, x, y, yaw):

        c, s = math.cos(yaw), math.sin(yaw)

        hw = self.vc.width / 2

        n_lon = max(
            3,
            int(math.ceil(self.vc.length / self._res)) + 1
        )

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):

            cx = x + d * c
            cy = y + d * s

            for w in np.linspace(-hw, hw, 5):

                px = cx - w * s
                py = cy + w * c

                if self._cell_occupied(px, py):
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
        dyaw = abs(self._norm(yaw - gyaw))

        return (
            dist <= self.goal_xy_tol and
            dyaw <= self.goal_yaw_tol
        )

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)

        dyaw = abs(self._norm(yaw - gyaw))

        rmin = self.vc.wheelbase / math.tan(self.vc.max_steer)

        return max(dist, rmin * dyaw)

    def _extract_path(self, goal_node, closed_dict, open_dict):

        all_nodes = {**closed_dict, **open_dict}

        path = []
        node = goal_node

        while node is not None:

            path.append((node.x, node.y, node.yaw))

            if node.parent_key is None:
                path.reverse()
                return path

            node = all_nodes.get(node.parent_key)

        return None

    def _make_node(
        self,
        x, y, yaw,
        g,
        steer,
        direction,
        parent_key
    ):

        ix = int(round((x - self._ox) / self._res))
        iy = int(round((y - self._oy) / self._res))

        raw = int(round(self._norm(yaw) / self.yaw_res))

        iyaw = raw % self._yaw_bins

        return HANode(
            x, y, yaw,
            ix, iy, iyaw,
            g=g,
            h=0.0,
            steer=steer,
            direction=direction,
            parent_key=parent_key
        )

    def _key(self, node):
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm(a):

        while a > math.pi:
            a -= 2 * math.pi

        while a < -math.pi:
            a += 2 * math.pi

        return a


# ─────────────────────────────────────────────
# Map Utils
# ─────────────────────────────────────────────

def make(w, h, res=0.05):

    ny = int(round(h / res))
    nx = int(round(w / res))

    return np.zeros((ny, nx), dtype=np.int8)


def fill(grid, x0, y0, x1, y1, res=0.05, val=100):

    iy0 = max(0, int(round(y0 / res)))
    iy1 = min(grid.shape[0], int(round(y1 / res)))

    ix0 = max(0, int(round(x0 / res)))
    ix1 = min(grid.shape[1], int(round(x1 / res)))

    grid[iy0:iy1, ix0:ix1] = val


def ow(grid, w, h, res=0.05):

    fill(grid, 0, 0, w, res)
    fill(grid, 0, h - res, w, h)

    fill(grid, 0, 0, res, h)
    fill(grid, w - res, 0, w, h)


# ─────────────────────────────────────────────
# Draw Car
# ─────────────────────────────────────────────

def draw_car(ax, x, y, yaw, vc, color='green', alpha=0.3):

    c, s = math.cos(yaw), math.sin(yaw)

    corners = [
        (vc.lf,  vc.width / 2),
        (vc.lf, -vc.width / 2),
        (-vc.lb, -vc.width / 2),
        (-vc.lb,  vc.width / 2)
    ]

    pts = []

    for lx, ly in corners:

        gx = x + lx * c - ly * s
        gy = y + lx * s + ly * c

        pts.append([gx, gy])

    poly = patches.Polygon(
        pts,
        closed=True,
        edgecolor=color,
        facecolor=color,
        alpha=alpha,
        lw=1.5
    )

    ax.add_patch(poly)


# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────

def main():

    print("=== Hybrid A* Test ===")

    width_m = 1.8
    height_m = 1.6
    res = 0.05

    g = make(width_m, height_m, res)

    ow(g, width_m, height_m, res)

    px, py = 0.875, 1.1
    pw, ph = 0.4, 0.60

    fill(
        g,
        px - ph/2 - 0.06,
        py + pw/2 - 0.06,
        px + ph/2 + 0.06,
        py + pw/2,
        res
    )

    fill(
        g,
        px - ph/2 - 0.06,
        py - pw/2,
        px - ph/2,
        py + pw/2,
        res
    )

    fill(
        g,
        px + ph/2,
        py - pw/2,
        px + ph/2 + 0.06,
        py + pw/2,
        res
    )

    vc = VehicleConfig()

    planner = HybridAStarPlanner(
        vc,
        step_size=0.08,
        max_iter=80000
    )

    sx, sy, syaw = 0.75, 0.60, 0.0

    gyaw = 0.0

    offset = (vc.lf - vc.lb) / 2

    gx = px - offset * math.cos(gyaw)
    gy = py - offset * math.sin(gyaw)

    t0 = time.monotonic()

    path = planner.plan(
        sx, sy, syaw,
        gx, gy, gyaw,
        g,
        0.0, 0.0,
        res
    )

    elapsed_ms = (time.monotonic() - t0) * 1000

    fig, ax = plt.subplots(figsize=(7, 6))

    ax.imshow(
        g,
        cmap='binary',
        origin='lower',
        extent=[0, width_m, 0, height_m],
        alpha=0.6
    )

    if path:

        print(f"SUCCESS ({elapsed_ms:.1f}ms)")

        path_x = [p[0] for p in path]
        path_y = [p[1] for p in path]

        ax.plot(path_x, path_y, color='red', linewidth=2)

        draw_car(ax, sx, sy, syaw, vc, 'green', 0.4)
        draw_car(ax, gx, gy, gyaw, vc, 'blue', 0.4)

        sample_step = max(1, len(path) // 4)

        for idx in range(sample_step, len(path)-1, sample_step):

            x, y, yaw = path[idx]

            draw_car(
                ax,
                x, y, yaw,
                vc,
                'red',
                0.1
            )

        ax.set_title(
            f"SUCCESS ({elapsed_ms:.1f}ms)"
        )

    else:

        print(f"FAIL ({elapsed_ms:.1f}ms)")

        ax.set_title(
            f"FAIL ({elapsed_ms:.1f}ms)"
        )

    ax.set_xlim(-0.05, width_m + 0.05)
    ax.set_ylim(-0.05, height_m + 0.05)

    ax.grid(True)

    plt.savefig(
        "hybrid_astar_test_result.png",
        dpi=150,
        bbox_inches='tight'
    )

    plt.close()

    print("saved: hybrid_astar_test_result.png")


if __name__ == '__main__':
    main()
```


![hybrid_astar_test_result.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f4488183-c564-4609-89eb-6a9114b2eadc/hybrid_astar_test_result.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZALOTJBS%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222149Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEeSE0otlFO4SX3ijczFpeX3aADXWrTj5uRveamI%2BV8dAiAsR2XWHmV9uVOpphvaT46o1HndcQBtWJD%2B9rAVbgCpzCr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIM2I9ZZ4ZVRAUfAlZxKtwDfQT8tQ%2FjuYAzwj2yr8EPTFX3zrVXEKbOoACUSqFOfNwDX7O%2F%2BC85L1smm%2BYkjArlw%2FOFCb1eakfxh2bCp0%2F2%2F32PMkO7vl5HYoioaNULDJHQvgKkXyU0vhLFBIZvR1epkVSFUHW8zseCKbEsfa5f%2Bc10FbRmw1WhTWqMNUU551e12qoxGa3QzREZzWPtK%2B1Aw7VJFa3cvzSA8irHqNokiQ5AHaaXJY7bu0wprBuZnwMkanCqA3caz9Bt9gLYCmMS8swoD2MX%2Bq%2FxjBCMyYcHpYjAS4qMQg8%2Bl2UgJQF0pBLd3O5dDaTsvx%2FgkI8wuWkQLvMExVYy9ferEXywERyk7CEocol%2FAEYmOK3kmfWGKIIIPYTIQbaK2LaIzTDWa7V8Y3hsEsFfHAXJH4azhdNP5qo%2BK7QZrf6Y8GfTq4AWd8G0ILwYA5ZkK1lptkQBFoodqfHnCKMCdyyM5oVRA5GGeEfZgRuL%2FWAAnzD4bbAPoPsqmVYKCCJE4JzL%2Fo4LLFfeNfjv5TZGLmo5XMKIcOVK0cNb6BEfjS16A%2FfY4UJD4JiHQg7cFzghqkwNoQwnPQuSxgkC%2BwJIlHBF2x4wKulfvfXgMA%2BTHE03UaVVjag7b80kIpOTWwg06uKlIFswhbKM0QY6pgFifALokzEnnMZ7IIXTrvWqWgrc%2F3mjlxaMrJPzIPKiIkY4kgniRS2wyhH2aG6LV4WR3tgrSumxy0rMhjaLzruBZ1FIRxTd4v1TDIdBqoynTA2eewhAoGkCJqazCIqbrWPBjR9TM0gMyNjVXr3PVqloWaRRHwSL220J%2Be0jh5LF%2BeatzhSG%2FWz%2FHqttqXr8QIr0yd6M6qPsQUbqzOLBwH9ReqQ7KQJa&X-Amz-Signature=a4deafbaef800efcae09d8239926af595c08417c10a40c748038f894c7374c99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


```python
#T자 주차
#!/usr/bin/env python3

import math, heapq, time
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches


# ─────────────────────────────────────────────
# Vehicle
# ─────────────────────────────────────────────

class VehicleConfig:
    def __init__(
        self,
        wheelbase=0.25,
        max_steer_deg=35.0,
        length=0.35,
        width=0.22,
        front_overhang=0.05,
        rear_overhang=0.05
    ):
        self.wheelbase = wheelbase
        self.max_steer = math.radians(max_steer_deg)

        self.length = length
        self.width = width

        self.front_overhang = front_overhang
        self.rear_overhang = rear_overhang

        self.lf = wheelbase + front_overhang
        self.lb = rear_overhang


# ─────────────────────────────────────────────
# Node
# ─────────────────────────────────────────────

class HANode:

    __slots__ = (
        'x', 'y', 'yaw',
        'ix', 'iy', 'iyaw',
        'g', 'h',
        'steer', 'direction',
        'parent_key'
    )

    def __init__(
        self,
        x, y, yaw,
        ix, iy, iyaw,
        g, h,
        steer, direction,
        parent_key=None
    ):
        self.x, self.y, self.yaw = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw

        self.g, self.h = g, h
        self.steer = steer
        self.direction = direction

        self.parent_key = parent_key

    @property
    def f(self):
        return self.g + self.h

    def __lt__(self, other):
        return self.f < other.f


# ─────────────────────────────────────────────
# Hybrid A*
# ─────────────────────────────────────────────

class HybridAStarPlanner:

    def __init__(
        self,
        vehicle_cfg,
        step_size=0.06,
        n_steer=7,
        yaw_resolution=math.radians(5),
        goal_xy_tol=0.08,
        goal_yaw_tol=math.radians(10),
        reverse_cost=1.5,
        dir_change_cost=1.5,
        steer_change_cost=0.5,
        occ_threshold=50,
        max_iter=80000
    ):

        self.vc = vehicle_cfg

        self.step = step_size
        self.yaw_res = yaw_resolution

        self.goal_xy_tol = goal_xy_tol
        self.goal_yaw_tol = goal_yaw_tol

        self.reverse_cost = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost = steer_change_cost

        self.occ_thresh = occ_threshold
        self.max_iter = max_iter

        self.steers = np.linspace(
            -self.vc.max_steer,
            self.vc.max_steer,
            n_steer
        )

        self._yaw_bins = max(
            1,
            int(round(2 * math.pi / self.yaw_res))
        )

    def plan(
        self,
        sx, sy, syaw,
        gx, gy, gyaw,
        occ_grid,
        ox, oy,
        res
    ):

        self._occ = occ_grid
        self._ox, self._oy = ox, oy
        self._res = res

        self._height, self._width = occ_grid.shape

        start = self._make_node(
            sx, sy, syaw,
            g=0.0,
            steer=0.0,
            direction=1,
            parent_key=None
        )

        start.h = self._heuristic(
            sx, sy, syaw,
            gx, gy, gyaw
        )

        open_heap = [(start.f, start)]
        open_dict = {self._key(start): start}
        closed_dict = {}

        iterations = 0

        while open_heap:

            iterations += 1

            if iterations > self.max_iter:
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)

            if ckey in closed_dict:
                continue

            closed_dict[ckey] = cur

            if self._reached_goal(
                cur.x, cur.y, cur.yaw,
                gx, gy, gyaw
            ):
                return self._extract_path(
                    cur,
                    closed_dict,
                    open_dict
                )

            for succ in self._expand(cur, gx, gy, gyaw):

                skey = self._key(succ)

                if skey in closed_dict:
                    continue

                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _expand(self, node, gx, gy, gyaw):

        children = []

        for direction in (1, -1):

            for steer in self.steers:

                nx, ny, nyaw = self._bicycle_step(
                    node.x,
                    node.y,
                    node.yaw,
                    steer,
                    direction
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

                child = self._make_node(
                    nx, ny, nyaw,
                    g=node.g + cost,
                    steer=steer,
                    direction=direction,
                    parent_key=self._key(node)
                )

                child.h = self._heuristic(
                    nx, ny, nyaw,
                    gx, gy, gyaw
                )

                children.append(child)

        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):

        d = self.step * direction

        dyaw = (d / self.vc.wheelbase) * math.tan(steer)

        mid = yaw + dyaw / 2

        nx = x + d * math.cos(mid)
        ny = y + d * math.sin(mid)

        return nx, ny, self._norm(yaw + dyaw)

    def _in_collision(self, x, y, yaw):

        c, s = math.cos(yaw), math.sin(yaw)

        hw = self.vc.width / 2

        n_lon = max(
            3,
            int(math.ceil(self.vc.length / self._res)) + 1
        )

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):

            cx = x + d * c
            cy = y + d * s

            for w in np.linspace(-hw, hw, 5):

                px = cx - w * s
                py = cy + w * c

                if self._cell_occupied(px, py):
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
        dyaw = abs(self._norm(yaw - gyaw))

        return (
            dist <= self.goal_xy_tol and
            dyaw <= self.goal_yaw_tol
        )

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)

        dyaw = abs(self._norm(yaw - gyaw))

        rmin = self.vc.wheelbase / math.tan(self.vc.max_steer)

        return max(dist, rmin * dyaw)

    def _extract_path(self, goal_node, closed_dict, open_dict):

        all_nodes = {**closed_dict, **open_dict}

        path = []
        node = goal_node

        while node is not None:

            path.append((node.x, node.y, node.yaw))

            if node.parent_key is None:
                path.reverse()
                return path

            node = all_nodes.get(node.parent_key)

        return None

    def _make_node(
        self,
        x, y, yaw,
        g,
        steer,
        direction,
        parent_key
    ):

        ix = int(round((x - self._ox) / self._res))
        iy = int(round((y - self._oy) / self._res))

        raw = int(round(self._norm(yaw) / self.yaw_res))

        iyaw = raw % self._yaw_bins

        return HANode(
            x, y, yaw,
            ix, iy, iyaw,
            g=g,
            h=0.0,
            steer=steer,
            direction=direction,
            parent_key=parent_key
        )

    def _key(self, node):
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm(a):

        while a > math.pi:
            a -= 2 * math.pi

        while a < -math.pi:
            a += 2 * math.pi

        return a


# ─────────────────────────────────────────────
# Map Utils
# ─────────────────────────────────────────────

def make(w, h, res=0.05):

    ny = int(round(h / res))
    nx = int(round(w / res))

    return np.zeros((ny, nx), dtype=np.int8)


def fill(grid, x0, y0, x1, y1, res=0.05, val=100):

    iy0 = max(0, int(round(y0 / res)))
    iy1 = min(grid.shape[0], int(round(y1 / res)))

    ix0 = max(0, int(round(x0 / res)))
    ix1 = min(grid.shape[1], int(round(x1 / res)))

    grid[iy0:iy1, ix0:ix1] = val


def ow(grid, w, h, res=0.05):

    fill(grid, 0, 0, w, res)
    fill(grid, 0, h - res, w, h)

    fill(grid, 0, 0, res, h)
    fill(grid, w - res, 0, w, h)


# ─────────────────────────────────────────────
# Draw Car
# ─────────────────────────────────────────────

def draw_car(ax, x, y, yaw, vc, color='green', alpha=0.3):

    c, s = math.cos(yaw), math.sin(yaw)

    corners = [
        (vc.lf,  vc.width / 2),
        (vc.lf, -vc.width / 2),
        (-vc.lb, -vc.width / 2),
        (-vc.lb,  vc.width / 2)
    ]

    pts = []

    for lx, ly in corners:

        gx = x + lx * c - ly * s
        gy = y + lx * s + ly * c

        pts.append([gx, gy])

    poly = patches.Polygon(
        pts,
        closed=True,
        edgecolor=color,
        facecolor=color,
        alpha=alpha,
        lw=1.5
    )

    ax.add_patch(poly)


# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────

def main():

    print("=== Hybrid A* Test ===")

    width_m = 1.8
    height_m = 1.6
    res = 0.05

    g = make(width_m, height_m, res)

    ow(g, width_m, height_m, res)

    px, py = 0.65, 0.37
    pw, ph = 0.30, 0.40

    fill(
        g,
        px - pw/2 - 0.06,
        py - ph/2 - 0.06,
        px + pw/2 + 0.06,
        py - ph/2,
        res
    )

    fill(
        g,
        px - pw/2 - 0.06,
        py - ph/2,
        px - pw/2,
        py + ph/2,
        res
    )

    fill(
        g,
        px + pw/2,
        py - ph/2,
        px + pw/2 + 0.06,
        py + ph/2,
        res
    )

    vc = VehicleConfig()

    planner = HybridAStarPlanner(
        vc,
        step_size=0.08,
        max_iter=80000
    )

    sx, sy, syaw = 0.25, 0.80, 0.0

    gyaw = math.pi / 2

    offset = (vc.lf - vc.lb) / 2

    gx = px - offset * math.cos(gyaw)
    gy = py - offset * math.sin(gyaw)

    t0 = time.monotonic()

    path = planner.plan(
        sx, sy, syaw,
        gx, gy, gyaw,
        g,
        0.0, 0.0,
        res
    )

    elapsed_ms = (time.monotonic() - t0) * 1000

    fig, ax = plt.subplots(figsize=(7, 6))

    ax.imshow(
        g,
        cmap='binary',
        origin='lower',
        extent=[0, width_m, 0, height_m],
        alpha=0.6
    )

    if path:

        print(f"SUCCESS ({elapsed_ms:.1f}ms)")

        path_x = [p[0] for p in path]
        path_y = [p[1] for p in path]

        ax.plot(path_x, path_y, color='red', linewidth=2)

        draw_car(ax, sx, sy, syaw, vc, 'green', 0.4)
        draw_car(ax, gx, gy, gyaw, vc, 'blue', 0.4)

        sample_step = max(1, len(path) // 4)

        for idx in range(sample_step, len(path)-1, sample_step):

            x, y, yaw = path[idx]

            draw_car(
                ax,
                x, y, yaw,
                vc,
                'red',
                0.1
            )

        ax.set_title(
            f"SUCCESS ({elapsed_ms:.1f}ms)"
        )

    else:

        print(f"FAIL ({elapsed_ms:.1f}ms)")

        ax.set_title(
            f"FAIL ({elapsed_ms:.1f}ms)"
        )

    ax.set_xlim(-0.05, width_m + 0.05)
    ax.set_ylim(-0.05, height_m + 0.05)

    ax.grid(True)

    plt.savefig(
        "hybrid_astar_test_result_T.png",
        dpi=150,
        bbox_inches='tight'
    )

    plt.close()

    print("saved: hybrid_astar_T_test_result.png")


if __name__ == '__main__':
    main()
```


![hybrid_astar_test_result_T.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bca57554-2c9f-4ed7-b409-f7ba4c60899d/hybrid_astar_test_result_T.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZALOTJBS%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222149Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEeSE0otlFO4SX3ijczFpeX3aADXWrTj5uRveamI%2BV8dAiAsR2XWHmV9uVOpphvaT46o1HndcQBtWJD%2B9rAVbgCpzCr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIM2I9ZZ4ZVRAUfAlZxKtwDfQT8tQ%2FjuYAzwj2yr8EPTFX3zrVXEKbOoACUSqFOfNwDX7O%2F%2BC85L1smm%2BYkjArlw%2FOFCb1eakfxh2bCp0%2F2%2F32PMkO7vl5HYoioaNULDJHQvgKkXyU0vhLFBIZvR1epkVSFUHW8zseCKbEsfa5f%2Bc10FbRmw1WhTWqMNUU551e12qoxGa3QzREZzWPtK%2B1Aw7VJFa3cvzSA8irHqNokiQ5AHaaXJY7bu0wprBuZnwMkanCqA3caz9Bt9gLYCmMS8swoD2MX%2Bq%2FxjBCMyYcHpYjAS4qMQg8%2Bl2UgJQF0pBLd3O5dDaTsvx%2FgkI8wuWkQLvMExVYy9ferEXywERyk7CEocol%2FAEYmOK3kmfWGKIIIPYTIQbaK2LaIzTDWa7V8Y3hsEsFfHAXJH4azhdNP5qo%2BK7QZrf6Y8GfTq4AWd8G0ILwYA5ZkK1lptkQBFoodqfHnCKMCdyyM5oVRA5GGeEfZgRuL%2FWAAnzD4bbAPoPsqmVYKCCJE4JzL%2Fo4LLFfeNfjv5TZGLmo5XMKIcOVK0cNb6BEfjS16A%2FfY4UJD4JiHQg7cFzghqkwNoQwnPQuSxgkC%2BwJIlHBF2x4wKulfvfXgMA%2BTHE03UaVVjag7b80kIpOTWwg06uKlIFswhbKM0QY6pgFifALokzEnnMZ7IIXTrvWqWgrc%2F3mjlxaMrJPzIPKiIkY4kgniRS2wyhH2aG6LV4WR3tgrSumxy0rMhjaLzruBZ1FIRxTd4v1TDIdBqoynTA2eewhAoGkCJqazCIqbrWPBjR9TM0gMyNjVXr3PVqloWaRRHwSL220J%2Be0jh5LF%2BeatzhSG%2FWz%2FHqttqXr8QIr0yd6M6qPsQUbqzOLBwH9ReqQ7KQJa&X-Amz-Signature=13901c8ee09068f90746b532ce2d9bdb3b3a3eadd5cc72243c250bdc2eefe91b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

