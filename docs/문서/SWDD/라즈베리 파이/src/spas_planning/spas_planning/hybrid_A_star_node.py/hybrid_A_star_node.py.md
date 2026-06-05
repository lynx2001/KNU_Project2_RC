# hybrid_A_star_node.py


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

