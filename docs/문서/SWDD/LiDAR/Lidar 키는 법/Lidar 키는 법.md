# Lidar 키는 법


```bash
source /opt/ros/humble/setup.bash
ros2 launch sllidar_ros2 sllidar_a1_launch.py
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher --x 0 --y 0 --z 0.1 --frame-id base_link --child-frame-id laser
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher --x 0 --y 0 --z 0 --frame-id odom --child-frame-id base_link
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch slam_toolbox online_async_launch.py slam_params_file:=$HOME/spas_slam_params.yaml use_sim_time:=false
```


```bash
nano ~/spas_slam_params.yaml #설정 변경
```


이렇게 하면 발행되어야 하는 토픽들


/map
/map_metadata
/map_updates
/scan
/slam_toolbox/feedback
/slam_toolbox/graph_visualization
/slam_toolbox/scan_visualization
/slam_toolbox/update
/tf
/tf_static


~/sample_th/parking_space_detector_node.py 에 현재 주차 공간 탐색 코드 작성
관련 문서 


## parking_space_detector_node.py 정리

## DOCTYPE

# 주차 공간 탐지 노드


SLAM이 생성한 OccupancyGrid 맵을 실시간 분석해 주차 가능 공간을 자동 탐지하고 RViz2에 시각화하는 ROS 2 노드


플랫폼 Raspberry Pi 4


OS Ubuntu 22.04


ROS Humble


LiDAR RPLiDAR A1


워크스페이스 ~/sample_th


파일 parking_space_detector_node.py


## 프로젝트 컨텍스트


🤖


대상 차량


RC카 (소형)


📡


센서


2D LiDAR RPLiDAR A1


🗺️


SLAM


slam_toolbox → /map


📐


차량 크기


0.30 m × 0.18 m


RPLiDAR A1이 수집한 2D 스캔 데이터를 `slam_toolbox`가 실시간으로 OccupancyGrid 맵(`/map` 토픽)으로 변환하면, 이 노드가 맵을 구독해 빈 공간을 탐지하고 주차 가능 위치를 발행합니다.


## 입출력 구조


구독 (Input)


/map


nav_msgs/OccupancyGrid


→


노드


parking_space
_detector


→


발행 (Output)


/parking_spaces


geometry_msgs/PoseArray


발행 (Output)


/parking_space_markers


visualization_msgs/MarkerArray


| 방향  | 토픽                       | 메시지 타입                           | 설명                           |
| --- | ------------------------ | -------------------------------- | ---------------------------- |
| SUB | `/map`                   | `nav_msgs/OccupancyGrid`         | slam_toolbox가 생성한 점유 격자 맵    |
| PUB | `/parking_spaces`        | `geometry_msgs/PoseArray`        | 탐지된 주차 공간 중심 좌표 배열 (map 프레임) |
| PUB | `/parking_space_markers` | `visualization_msgs/MarkerArray` | RViz2 시각화용 반투명 박스 마커         |


## 탐지 알고리즘


맵 콜백이 호출될 때마다 아래 7단계 파이프라인이 실행됩니다.


1


### OccupancyGrid → NumPy 2D 배열


`msg.data`(1D 리스트)를 `np.int8`로 캐스팅한 뒤 `(height, width)` 형태로 reshape합니다. 셀 값은 0(빈 공간) ~ 100(완전 점유), −1(미탐색)입니다.


2


### 자유 공간 마스킹


값이 `[0, free_threshold]` 범위인 셀을 빈 공간(`255`)으로, 나머지(점유·미탐색)를 `0`으로 처리합니다. 기본 임계값은 **30**입니다.


```text
free_mask = ((grid >= 0) & (grid <= free_threshold)).astype(uint8) * 255
```


3


### 형태학적 노이즈 제거


3×3 사각형 커널로 **OPEN**(작은 노이즈 제거) → **CLOSE**(작은 구멍 메우기) 순서로 처리해 LiDAR 반사 오차에 의한 단편 셀을 정리합니다.


```text
kernel  = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
cleaned = cv2.morphologyEx(free_mask, cv2.MORPH_OPEN,  kernel)
cleaned = cv2.morphologyEx(cleaned,   cv2.MORPH_CLOSE, kernel)
```


4


### 연결 영역 레이블링


`cv2.connectedComponentsWithStats`(8-connectivity)로 연속된 빈 공간 영역에 레이블을 부여합니다. 각 영역의 LEFT, TOP, WIDTH, HEIGHT, AREA를 `stats` 배열에서 즉시 읽어 추가 탐색 없이 바운딩 박스를 얻습니다.


**scipy 대신 OpenCV 사용**
Raspberry Pi 4의 시스템 scipy가 NumPy 2.x와 ABI 충돌을 일으키므로 `scipy.ndimage.label` 대신 OpenCV 내장 함수를 채택했습니다. 결과는 동일하며 외부 의존성이 줄어듭니다.


5


### 크기 필터링


각 영역의 바운딩 박스를 **가로·세로 양방향**(평행/직각 주차 모두)으로 검사합니다. 최소 요구 공간은 아래 계산식에서 도출합니다.


| 항목         | 값                       | 출처             |
| ---------- | ----------------------- | -------------- |
| 차량 길이      | 0.30 m                  | RC카 실측         |
| 차량 폭       | 0.18 m                  | RC카 실측         |
| 전후 여유 (×2) | +0.40 m                 | SRS SW-APA-002 |
| 좌우 여유 (×2) | +0.30 m                 | SRS SW-APA-002 |
| **최소 길이**  | **0.70 m → min 0.50 m** | 스펙 하한 적용       |
| **최소 폭**   | **0.48 m**              | 스펙 하한 적용       |


6


### 맵 좌표 변환 및 발행


바운딩 박스 중심 셀 좌표를 `origin`과 `resolution`을 이용해 미터 단위 **map 프레임** 좌표로 변환한 뒤 `PoseArray`로 발행합니다.


```text
map_x = origin.position.x + (cx_cell + 0.5) * resolution
map_y = origin.position.y + (cy_cell + 0.5) * resolution
```


7


### RViz2 마커 생성


탐지된 각 공간을 `Marker.CUBE`로 표현합니다. 주차 방향에 따라 색상이 다릅니다.


| 주차 유형     | 조건                                       | 색상             | 투명도       |
| --------- | ---------------------------------------- | -------------- | --------- |
| 평행 주차     | cell_h ≥ min_length & cell_w ≥ min_width | 초록 (0, 0.8, 0) | alpha 0.4 |
| 직각(T자) 주차 | cell_w ≥ min_length & cell_h ≥ min_width | 파랑 (0, 0, 0.8) | alpha 0.4 |


마커는 `lifetime.sec = 1`로 설정되어 맵 업데이트가 멈추면 자동 소멸합니다.


## ROS 2 파라미터


`~/spas_slam_params.yaml`로 런타임에 변경할 수 있습니다.


| 파라미터                 | 기본값  | 단위 | 설명                   |
| -------------------- | ---- | -- | -------------------- |
| `vehicle_length`     | 0.30 | m  | 차량 길이 (RC카 실측)       |
| `vehicle_width`      | 0.18 | m  | 차량 폭 (RC카 실측)        |
| `margin_lateral`     | 0.15 | m  | 좌우 여유 공간 (한쪽)        |
| `margin_forward`     | 0.20 | m  | 전후 여유 공간 (한쪽)        |
| `free_threshold`     | 30   | —  | 빈 공간 판별 상한 (0~100)   |
| `occupied_threshold` | 65   | —  | 점유 공간 판별 하한 (현재 참고용) |


```text
# ~/spas_slam_params.yaml 예시
parking_space_detector:
  ros__parameters:
    vehicle_length:    0.30
    vehicle_width:     0.18
    margin_lateral:    0.15
    margin_forward:    0.20
    free_threshold:    30
    occupied_threshold:65
```


## 주차 공간 기준 치수


**SRS SW-APA-002 기준 적용**
파라미터로 계산된 값과 스펙 하한값 중 더 큰 값이 사용됩니다. 파라미터 변경 시에도 0.50 m × 0.48 m 미만으로 내려가지 않습니다.


```text
# _load_params() 내부 로직
min_length = max(vehicle_length + 2 * margin_forward, 0.50)  # → 0.70 vs 0.50 → 0.70
min_width  = max(vehicle_width  + 2 * margin_lateral, 0.48)  # → 0.48 vs 0.48 → 0.48
```


## 노드 구조


| 메서드                | 역할                                              |
| ------------------ | ----------------------------------------------- |
| `__init__`         | 파라미터 선언, Publisher/Subscriber 생성, 맵 저장 디렉터리 초기화 |
| `_load_params`     | 파라미터 읽기 및 최소 주차 공간 크기 계산                        |
| `_map_callback`    | 메인 처리 파이프라인 (단계 1~7 전체 실행)                      |
| `_make_box_marker` | 단일 Marker 객체 생성 헬퍼                              |
| `_save_map_png`    | 자유 공간 마스크를 BGR 이미지로 변환 후 PNG 저장                 |
| `main`             | rclpy 초기화 및 노드 스핀 진입점                           |


```text
class ParkingSpaceDetectorNode(Node):
    def __init__(self):
        super().__init__('parking_space_detector')
        # 파라미터 선언 → _load_params() → Publisher / Subscriber 생성

    def _map_callback(self, msg: OccupancyGrid):
        # Step 1~7 파이프라인 → publish → save PNG
        ...

def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    rclpy.spin(node)   # Ctrl-C 로 종료
```


## 패키지 등록 (setup.py)


워크스페이스 패키지의 `setup.py` `entry_points`에 아래와 같이 등록하면 `ros2 run`으로 실행할 수 있습니다.


```text
entry_points={
    'console_scripts': [
        'parking_space_detector = parking_space_detector_node:main',
    ],
},
```


## 실행 방법


### 단독 실행


```text
# 1. 워크스페이스 빌드
cd ~/sample_th
colcon build --symlink-install
source install/setup.bash

# 2. 노드 실행 (기본 파라미터)
ros2 run <your_package> parking_space_detector

# 3. 파라미터 파일 지정
ros2 run <your_package> parking_space_detector \
  --ros-args --params-file ~/spas_slam_params.yaml
```


### Launch 파일 통합 예시


```text
from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='your_package',
            executable='parking_space_detector',
            parameters=['/home/ubuntu/spas_slam_params.yaml'],
            output='screen',
        )
    ])
```


### RViz2 토픽 설정


| Display Type | 토픽                       | 설명              |
| ------------ | ------------------------ | --------------- |
| PoseArray    | `/parking_spaces`        | 주차 공간 중심 방향 화살표 |
| MarkerArray  | `/parking_space_markers` | 반투명 박스 (초록/파랑)  |
| Map          | `/map`                   | SLAM 맵 배경       |


## 의존성 처리 — scipy 제거 이유


**NumPy 2.x / scipy ABI 충돌**
Raspberry Pi 4 Ubuntu 22.04 환경에서 `numpy==2.2.6`과 시스템 패키지 scipy(`numpy 1.x` 빌드)가 ABI 불일치를 일으켜 `ImportError: _ARRAY_API not found`가 발생합니다.


| 항목         | 원래 계획                                | 최종 선택                              |
| ---------- | ------------------------------------ | ---------------------------------- |
| 연결 영역 레이블링 | `scipy.ndimage.label`                | `cv2.connectedComponentsWithStats` |
| 추가 의존성     | scipy 설치 필요                          | OpenCV(이미 설치됨)만 사용                 |
| 결과 동등성     | 동일 — 바운딩 박스 stats 직접 제공으로 오히려 코드 단순화 |                                    |


필요한 의존성: `rclpy`, `numpy`, `opencv-python (cv2)`


## 맵 PNG 실시간 저장


맵 콜백이 호출될 때마다 자유 공간 마스크를 BGR 이미지로 변환하고 탐지된 영역을 초록 채널로 강조한 뒤 타임스탬프 파일명으로 저장합니다.


| 항목     | 값                         |
| ------ | ------------------------- |
| 저장 경로  | `~/sample_th/map/`        |
| 파일명 형식 | `map_YYYYMMDD_HHMMSS.png` |
| 이미지 내용 | 자유 공간(흰색) + 탐지 영역(초록 강조)  |
| 저장 주기  | /map 토픽 수신 시마다            |


```text
# _save_map_png() 핵심 로직
vis = cv2.cvtColor(free_mask, cv2.COLOR_GRAY2BGR)
norm_label = ((labeled > 0) * 180).astype(np.uint8)
vis[:, :, 1] = np.maximum(vis[:, :, 1], norm_label)  # G 채널 강조
cv2.imwrite(fname, vis)
```


**로그 출력**
모든 주요 동작(맵 수신, 영역 탐지 수, 각 공간의 좌표·크기·유형, PNG 저장 경로)에 `self.get_logger().info()`가 출력됩니다.


```html
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SPAS 주차 공간 탐지 노드 — 구현 문서</title>
  <style>
    :root {
      --bg:        #0f1117;
      --surface:   #1a1d27;
      --surface2:  #222636;
      --border:    #2e334a;
      --accent:    #4f8ef7;
      --accent2:   #34d399;
      --accent3:   #f59e0b;
      --text:      #e2e8f0;
      --text-muted:#8892a4;
      --code-bg:   #141720;
      --green:     #22c55e;
      --blue:      #3b82f6;
      --red:       #ef4444;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
      background: var(--bg);
      color: var(--text);
      line-height: 1.7;
      font-size: 15px;
    }

    /* ── Layout ── */
    .layout { display: flex; min-height: 100vh; }

    nav {
      width: 260px;
      flex-shrink: 0;
      background: var(--surface);
      border-right: 1px solid var(--border);
      position: sticky;
      top: 0;
      height: 100vh;
      overflow-y: auto;
      padding: 28px 0;
    }

    nav .nav-logo {
      padding: 0 24px 24px;
      border-bottom: 1px solid var(--border);
      margin-bottom: 16px;
    }
    nav .nav-logo .badge {
      display: inline-block;
      background: var(--accent);
      color: #fff;
      font-size: 10px;
      font-weight: 700;
      padding: 2px 7px;
      border-radius: 4px;
      letter-spacing: .05em;
      margin-bottom: 6px;
    }
    nav .nav-logo h2 {
      font-size: 14px;
      font-weight: 700;
      color: var(--text);
      line-height: 1.4;
    }

    nav ul { list-style: none; padding: 0 12px; }
    nav ul li a {
      display: block;
      padding: 7px 12px;
      border-radius: 6px;
      color: var(--text-muted);
      text-decoration: none;
      font-size: 13px;
      transition: background .15s, color .15s;
    }
    nav ul li a:hover,
    nav ul li a.active {
      background: var(--surface2);
      color: var(--accent);
    }
    nav ul .section-label {
      padding: 14px 12px 4px;
      font-size: 10px;
      font-weight: 700;
      letter-spacing: .1em;
      text-transform: uppercase;
      color: var(--text-muted);
    }

    main {
      flex: 1;
      max-width: 900px;
      padding: 52px 56px;
      overflow-x: hidden;
    }

    /* ── Typography ── */
    h1 { font-size: 2rem; font-weight: 800; color: var(--text); line-height: 1.2; margin-bottom: 8px; }
    h2 { font-size: 1.35rem; font-weight: 700; color: var(--text); margin: 52px 0 16px; padding-top: 8px; border-top: 1px solid var(--border); }
    h3 { font-size: 1.05rem; font-weight: 700; color: var(--accent); margin: 28px 0 10px; }
    p  { color: var(--text-muted); margin-bottom: 12px; }
    strong { color: var(--text); font-weight: 600; }

    /* ── Hero ── */
    .hero {
      background: linear-gradient(135deg, #1a1d27 0%, #1e2235 100%);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 36px 40px;
      margin-bottom: 40px;
    }
    .hero .meta {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      margin-top: 16px;
    }
    .hero .tag {
      background: var(--surface2);
      border: 1px solid var(--border);
      border-radius: 20px;
      padding: 4px 12px;
      font-size: 12px;
      color: var(--text-muted);
    }
    .hero .tag span { color: var(--accent2); font-weight: 600; }

    /* ── Info cards ── */
    .card-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 14px; margin: 20px 0; }
    .card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 20px;
    }
    .card .card-icon { font-size: 22px; margin-bottom: 10px; }
    .card .card-label { font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: .08em; color: var(--text-muted); margin-bottom: 4px; }
    .card .card-value { font-size: 14px; font-weight: 600; color: var(--text); }

    /* ── Pipeline steps ── */
    .pipeline { margin: 24px 0; }
    .step {
      display: flex;
      gap: 18px;
      align-items: flex-start;
      padding: 20px 0;
      border-bottom: 1px solid var(--border);
    }
    .step:last-child { border-bottom: none; }
    .step-num {
      flex-shrink: 0;
      width: 34px;
      height: 34px;
      border-radius: 50%;
      background: var(--accent);
      color: #fff;
      font-weight: 800;
      font-size: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .step-body h4 { font-size: 14px; font-weight: 700; color: var(--text); margin-bottom: 4px; }
    .step-body p  { font-size: 13px; margin: 0; }

    /* ── Code blocks ── */
    pre {
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 20px 24px;
      overflow-x: auto;
      font-family: 'JetBrains Mono', 'Fira Code', 'Consolas', monospace;
      font-size: 13px;
      line-height: 1.6;
      margin: 14px 0;
      color: #c9d1d9;
    }
    code {
      background: var(--code-bg);
      border: 1px solid var(--border);
      border-radius: 4px;
      padding: 1px 6px;
      font-family: 'JetBrains Mono', 'Fira Code', monospace;
      font-size: 12.5px;
      color: var(--accent2);
    }
    pre code { background: none; border: none; padding: 0; font-size: inherit; color: inherit; }

    .kw  { color: #f97583; }   /* keyword */
    .fn  { color: #b392f0; }   /* function */
    .st  { color: #9ecbff; }   /* string */
    .cm  { color: #6a737d; }   /* comment */
    .nm  { color: #ffdf5d; }   /* number */
    .tp  { color: #79b8ff; }   /* type */

    /* ── Tables ── */
    .tbl-wrap { overflow-x: auto; margin: 16px 0; }
    table { width: 100%; border-collapse: collapse; font-size: 13.5px; }
    thead th {
      background: var(--surface2);
      color: var(--text);
      font-weight: 700;
      padding: 10px 16px;
      text-align: left;
      border-bottom: 2px solid var(--border);
    }
    tbody td {
      padding: 10px 16px;
      border-bottom: 1px solid var(--border);
      color: var(--text-muted);
      vertical-align: top;
    }
    tbody tr:hover td { background: var(--surface); }

    /* ── Callout ── */
    .callout {
      border-left: 3px solid var(--accent);
      background: var(--surface);
      border-radius: 0 8px 8px 0;
      padding: 14px 18px;
      margin: 16px 0;
      font-size: 13.5px;
      color: var(--text-muted);
    }
    .callout.warn { border-color: var(--accent3); }
    .callout.ok   { border-color: var(--green); }
    .callout strong { color: var(--text); display: block; margin-bottom: 2px; }

    /* ── Pill labels ── */
    .pill {
      display: inline-block;
      border-radius: 4px;
      padding: 2px 8px;
      font-size: 11px;
      font-weight: 700;
      margin-left: 6px;
    }
    .pill.green  { background: rgba(34,197,94,.15);  color: var(--green); }
    .pill.blue   { background: rgba(59,130,246,.15); color: var(--blue); }
    .pill.yellow { background: rgba(245,158,11,.15); color: var(--accent3); }
    .pill.red    { background: rgba(239,68,68,.15);  color: var(--red); }

    /* ── IO diagram ── */
    .io-diagram {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0;
      margin: 28px 0;
      flex-wrap: wrap;
    }
    .io-box {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 10px;
      padding: 16px 22px;
      text-align: center;
      min-width: 140px;
    }
    .io-box .io-title { font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: .08em; color: var(--text-muted); margin-bottom: 6px; }
    .io-box .io-val   { font-size: 13px; font-weight: 600; color: var(--text); }
    .io-box .io-type  { font-size: 11px; color: var(--accent); margin-top: 3px; }
    .io-arrow {
      padding: 0 10px;
      color: var(--text-muted);
      font-size: 20px;
    }
    .io-center {
      background: linear-gradient(135deg, var(--accent) 0%, #6366f1 100%);
      border: none;
      color: #fff;
      min-width: 160px;
    }
    .io-center .io-title { color: rgba(255,255,255,.7); }
    .io-center .io-val   { color: #fff; }

    /* ── Footer ── */
    footer {
      border-top: 1px solid var(--border);
      padding: 28px 56px;
      color: var(--text-muted);
      font-size: 12px;
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 8px;
    }
    footer a { color: var(--accent); text-decoration: none; }

    /* ── Scrollbar ── */
    ::-webkit-scrollbar { width: 6px; height: 6px; }
    ::-webkit-scrollbar-track { background: var(--bg); }
    ::-webkit-scrollbar-thumb { background: var(--border); border-radius: 3px; }
  </style>
</head>
<body>

<div class="layout">

  <!-- ─── Sidebar ─── -->
  <nav>
    <div class="nav-logo">
      <div class="badge">SPAS</div>
      <h2>주차 공간 탐지<br>노드 문서</h2>
    </div>
    <ul>
      <li class="section-label">개요</li>
      <li><a href="#overview">프로젝트 컨텍스트</a></li>
      <li><a href="#io">입출력 구조</a></li>

      <li class="section-label">구현</li>
      <li><a href="#algorithm">탐지 알고리즘</a></li>
      <li><a href="#params">ROS 2 파라미터</a></li>
      <li><a href="#sizing">주차 공간 기준 치수</a></li>

      <li class="section-label">코드</li>
      <li><a href="#node-structure">노드 구조</a></li>
      <li><a href="#entry-points">패키지 등록</a></li>
      <li><a href="#launch">실행 방법</a></li>

      <li class="section-label">메모</li>
      <li><a href="#dep-note">의존성 처리</a></li>
      <li><a href="#mapfile">맵 PNG 저장</a></li>
    </ul>
  </nav>

  <!-- ─── Main ─── -->
  <div style="flex:1; display:flex; flex-direction:column;">
  <main>

    <!-- Hero -->
    <div class="hero">
      <h1>주차 공간 탐지 노드</h1>
      <p style="color:var(--text-muted); margin-top:10px; margin-bottom:0;">
        SLAM이 생성한 OccupancyGrid 맵을 실시간 분석해 주차 가능 공간을 자동 탐지하고 RViz2에 시각화하는 ROS 2 노드
      </p>
      <div class="meta">
        <div class="tag">플랫폼 <span>Raspberry Pi 4</span></div>
        <div class="tag">OS <span>Ubuntu 22.04</span></div>
        <div class="tag">ROS <span>Humble</span></div>
        <div class="tag">LiDAR <span>RPLiDAR A1</span></div>
        <div class="tag">워크스페이스 <span>~/sample_th</span></div>
        <div class="tag">파일 <span>parking_space_detector_node.py</span></div>
      </div>
    </div>

    <!-- ── 1. 프로젝트 컨텍스트 ── -->
    <h2 id="overview">프로젝트 컨텍스트</h2>
    <div class="card-grid">
      <div class="card">
        <div class="card-icon">🤖</div>
        <div class="card-label">대상 차량</div>
        <div class="card-value">RC카 (소형)</div>
      </div>
      <div class="card">
        <div class="card-icon">📡</div>
        <div class="card-label">센서</div>
        <div class="card-value">2D LiDAR RPLiDAR A1</div>
      </div>
      <div class="card">
        <div class="card-icon">🗺️</div>
        <div class="card-label">SLAM</div>
        <div class="card-value">slam_toolbox → /map</div>
      </div>
      <div class="card">
        <div class="card-icon">📐</div>
        <div class="card-label">차량 크기</div>
        <div class="card-value">0.30 m × 0.18 m</div>
      </div>
    </div>
    <p>RPLiDAR A1이 수집한 2D 스캔 데이터를 <code>slam_toolbox</code>가 실시간으로 OccupancyGrid 맵(<code>/map</code> 토픽)으로 변환하면, 이 노드가 맵을 구독해 빈 공간을 탐지하고 주차 가능 위치를 발행합니다.</p>

    <!-- ── 2. 입출력 구조 ── -->
    <h2 id="io">입출력 구조</h2>

    <div class="io-diagram">
      <div class="io-box">
        <div class="io-title">구독 (Input)</div>
        <div class="io-val">/map</div>
        <div class="io-type">nav_msgs/OccupancyGrid</div>
      </div>
      <div class="io-arrow">→</div>
      <div class="io-box io-center">
        <div class="io-title">노드</div>
        <div class="io-val">parking_space<br>_detector</div>
      </div>
      <div class="io-arrow">→</div>
      <div style="display:flex; flex-direction:column; gap:10px;">
        <div class="io-box">
          <div class="io-title">발행 (Output)</div>
          <div class="io-val">/parking_spaces</div>
          <div class="io-type">geometry_msgs/PoseArray</div>
        </div>
        <div class="io-box">
          <div class="io-title">발행 (Output)</div>
          <div class="io-val">/parking_space_markers</div>
          <div class="io-type">visualization_msgs/MarkerArray</div>
        </div>
      </div>
    </div>

    <div class="tbl-wrap">
      <table>
        <thead>
          <tr>
            <th>방향</th>
            <th>토픽</th>
            <th>메시지 타입</th>
            <th>설명</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><span class="pill blue">SUB</span></td>
            <td><code>/map</code></td>
            <td><code>nav_msgs/OccupancyGrid</code></td>
            <td>slam_toolbox가 생성한 점유 격자 맵</td>
          </tr>
          <tr>
            <td><span class="pill green">PUB</span></td>
            <td><code>/parking_spaces</code></td>
            <td><code>geometry_msgs/PoseArray</code></td>
            <td>탐지된 주차 공간 중심 좌표 배열 (map 프레임)</td>
          </tr>
          <tr>
            <td><span class="pill green">PUB</span></td>
            <td><code>/parking_space_markers</code></td>
            <td><code>visualization_msgs/MarkerArray</code></td>
            <td>RViz2 시각화용 반투명 박스 마커</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- ── 3. 알고리즘 ── -->
    <h2 id="algorithm">탐지 알고리즘</h2>
    <p>맵 콜백이 호출될 때마다 아래 7단계 파이프라인이 실행됩니다.</p>

    <div class="pipeline">

      <div class="step">
        <div class="step-num">1</div>
        <div class="step-body">
          <h4>OccupancyGrid → NumPy 2D 배열</h4>
          <p><code>msg.data</code>(1D 리스트)를 <code>np.int8</code>로 캐스팅한 뒤 <code>(height, width)</code> 형태로 reshape합니다. 셀 값은 0(빈 공간) ~ 100(완전 점유), −1(미탐색)입니다.</p>
        </div>
      </div>

      <div class="step">
        <div class="step-num">2</div>
        <div class="step-body">
          <h4>자유 공간 마스킹</h4>
          <p>값이 <code>[0, free_threshold]</code> 범위인 셀을 빈 공간(<code>255</code>)으로, 나머지(점유·미탐색)를 <code>0</code>으로 처리합니다. 기본 임계값은 <strong>30</strong>입니다.</p>
          <pre><code>free_mask = ((grid &gt;= 0) &amp; (grid &lt;= free_threshold)).astype(uint8) * 255</code></pre>
        </div>
      </div>

      <div class="step">
        <div class="step-num">3</div>
        <div class="step-body">
          <h4>형태학적 노이즈 제거</h4>
          <p>3×3 사각형 커널로 <strong>OPEN</strong>(작은 노이즈 제거) → <strong>CLOSE</strong>(작은 구멍 메우기) 순서로 처리해 LiDAR 반사 오차에 의한 단편 셀을 정리합니다.</p>
          <pre><code>kernel  = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
cleaned = cv2.morphologyEx(free_mask, cv2.MORPH_OPEN,  kernel)
cleaned = cv2.morphologyEx(cleaned,   cv2.MORPH_CLOSE, kernel)</code></pre>
        </div>
      </div>

      <div class="step">
        <div class="step-num">4</div>
        <div class="step-body">
          <h4>연결 영역 레이블링</h4>
          <p><code>cv2.connectedComponentsWithStats</code>(8-connectivity)로 연속된 빈 공간 영역에 레이블을 부여합니다. 각 영역의 LEFT, TOP, WIDTH, HEIGHT, AREA를 <code>stats</code> 배열에서 즉시 읽어 추가 탐색 없이 바운딩 박스를 얻습니다.</p>
          <div class="callout ok">
            <strong>scipy 대신 OpenCV 사용</strong>
            Raspberry Pi 4의 시스템 scipy가 NumPy 2.x와 ABI 충돌을 일으키므로 <code>scipy.ndimage.label</code> 대신 OpenCV 내장 함수를 채택했습니다. 결과는 동일하며 외부 의존성이 줄어듭니다.
          </div>
        </div>
      </div>

      <div class="step">
        <div class="step-num">5</div>
        <div class="step-body">
          <h4>크기 필터링</h4>
          <p>각 영역의 바운딩 박스를 <strong>가로·세로 양방향</strong>(평행/직각 주차 모두)으로 검사합니다. 최소 요구 공간은 아래 계산식에서 도출합니다.</p>
          <div class="tbl-wrap">
            <table>
              <thead>
                <tr><th>항목</th><th>값</th><th>출처</th></tr>
              </thead>
              <tbody>
                <tr><td>차량 길이</td><td>0.30 m</td><td>RC카 실측</td></tr>
                <tr><td>차량 폭</td><td>0.18 m</td><td>RC카 실측</td></tr>
                <tr><td>전후 여유 (×2)</td><td>+0.40 m</td><td>SRS SW-APA-002</td></tr>
                <tr><td>좌우 여유 (×2)</td><td>+0.30 m</td><td>SRS SW-APA-002</td></tr>
                <tr><td><strong>최소 길이</strong></td><td><strong>0.70 m → min 0.50 m</strong></td><td>스펙 하한 적용</td></tr>
                <tr><td><strong>최소 폭</strong></td><td><strong>0.48 m</strong></td><td>스펙 하한 적용</td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="step">
        <div class="step-num">6</div>
        <div class="step-body">
          <h4>맵 좌표 변환 및 발행</h4>
          <p>바운딩 박스 중심 셀 좌표를 <code>origin</code>과 <code>resolution</code>을 이용해 미터 단위 <strong>map 프레임</strong> 좌표로 변환한 뒤 <code>PoseArray</code>로 발행합니다.</p>
          <pre><code>map_x = origin.position.x + (cx_cell + 0.5) * resolution
map_y = origin.position.y + (cy_cell + 0.5) * resolution</code></pre>
        </div>
      </div>

      <div class="step">
        <div class="step-num">7</div>
        <div class="step-body">
          <h4>RViz2 마커 생성</h4>
          <p>탐지된 각 공간을 <code>Marker.CUBE</code>로 표현합니다. 주차 방향에 따라 색상이 다릅니다.</p>
          <div class="tbl-wrap">
            <table>
              <thead>
                <tr><th>주차 유형</th><th>조건</th><th>색상</th><th>투명도</th></tr>
              </thead>
              <tbody>
                <tr>
                  <td>평행 주차</td>
                  <td>cell_h ≥ min_length &amp; cell_w ≥ min_width</td>
                  <td><span class="pill green">초록 (0, 0.8, 0)</span></td>
                  <td>alpha 0.4</td>
                </tr>
                <tr>
                  <td>직각(T자) 주차</td>
                  <td>cell_w ≥ min_length &amp; cell_h ≥ min_width</td>
                  <td><span class="pill blue">파랑 (0, 0, 0.8)</span></td>
                  <td>alpha 0.4</td>
                </tr>
              </tbody>
            </table>
          </div>
          <p>마커는 <code>lifetime.sec = 1</code>로 설정되어 맵 업데이트가 멈추면 자동 소멸합니다.</p>
        </div>
      </div>

    </div>

    <!-- ── 4. 파라미터 ── -->
    <h2 id="params">ROS 2 파라미터</h2>
    <p><code>~/spas_slam_params.yaml</code>로 런타임에 변경할 수 있습니다.</p>

    <div class="tbl-wrap">
      <table>
        <thead>
          <tr><th>파라미터</th><th>기본값</th><th>단위</th><th>설명</th></tr>
        </thead>
        <tbody>
          <tr><td><code>vehicle_length</code></td><td>0.30</td><td>m</td><td>차량 길이 (RC카 실측)</td></tr>
          <tr><td><code>vehicle_width</code></td><td>0.18</td><td>m</td><td>차량 폭 (RC카 실측)</td></tr>
          <tr><td><code>margin_lateral</code></td><td>0.15</td><td>m</td><td>좌우 여유 공간 (한쪽)</td></tr>
          <tr><td><code>margin_forward</code></td><td>0.20</td><td>m</td><td>전후 여유 공간 (한쪽)</td></tr>
          <tr><td><code>free_threshold</code></td><td>30</td><td>—</td><td>빈 공간 판별 상한 (0~100)</td></tr>
          <tr><td><code>occupied_threshold</code></td><td>65</td><td>—</td><td>점유 공간 판별 하한 (현재 참고용)</td></tr>
        </tbody>
      </table>
    </div>

    <pre><code><span class="cm"># ~/spas_slam_params.yaml 예시</span>
parking_space_detector:
  ros__parameters:
    vehicle_length:    <span class="nm">0.30</span>
    vehicle_width:     <span class="nm">0.18</span>
    margin_lateral:    <span class="nm">0.15</span>
    margin_forward:    <span class="nm">0.20</span>
    free_threshold:    <span class="nm">30</span>
    occupied_threshold:<span class="nm">65</span></code></pre>

    <!-- ── 5. 주차 공간 기준 치수 ── -->
    <h2 id="sizing">주차 공간 기준 치수</h2>
    <div class="callout">
      <strong>SRS SW-APA-002 기준 적용</strong>
      파라미터로 계산된 값과 스펙 하한값 중 더 큰 값이 사용됩니다. 파라미터 변경 시에도 0.50 m × 0.48 m 미만으로 내려가지 않습니다.
    </div>
    <pre><code><span class="cm"># _load_params() 내부 로직</span>
min_length = max(vehicle_length + 2 * margin_forward, <span class="nm">0.50</span>)  <span class="cm"># → 0.70 vs 0.50 → 0.70</span>
min_width  = max(vehicle_width  + 2 * margin_lateral, <span class="nm">0.48</span>)  <span class="cm"># → 0.48 vs 0.48 → 0.48</span></code></pre>

    <!-- ── 6. 노드 구조 ── -->
    <h2 id="node-structure">노드 구조</h2>

    <div class="tbl-wrap">
      <table>
        <thead>
          <tr><th>메서드</th><th>역할</th></tr>
        </thead>
        <tbody>
          <tr><td><code>__init__</code></td><td>파라미터 선언, Publisher/Subscriber 생성, 맵 저장 디렉터리 초기화</td></tr>
          <tr><td><code>_load_params</code></td><td>파라미터 읽기 및 최소 주차 공간 크기 계산</td></tr>
          <tr><td><code>_map_callback</code></td><td>메인 처리 파이프라인 (단계 1~7 전체 실행)</td></tr>
          <tr><td><code>_make_box_marker</code></td><td>단일 Marker 객체 생성 헬퍼</td></tr>
          <tr><td><code>_save_map_png</code></td><td>자유 공간 마스크를 BGR 이미지로 변환 후 PNG 저장</td></tr>
          <tr><td><code>main</code></td><td>rclpy 초기화 및 노드 스핀 진입점</td></tr>
        </tbody>
      </table>
    </div>

    <pre><code><span class="kw">class</span> <span class="tp">ParkingSpaceDetectorNode</span>(<span class="tp">Node</span>):
    <span class="kw">def</span> <span class="fn">__init__</span>(self):
        <span class="fn">super()</span>.__init__(<span class="st">'parking_space_detector'</span>)
        <span class="cm"># 파라미터 선언 → _load_params() → Publisher / Subscriber 생성</span>

    <span class="kw">def</span> <span class="fn">_map_callback</span>(self, msg: <span class="tp">OccupancyGrid</span>):
        <span class="cm"># Step 1~7 파이프라인 → publish → save PNG</span>
        ...

<span class="kw">def</span> <span class="fn">main</span>(args=<span class="kw">None</span>):
    rclpy.<span class="fn">init</span>(args=args)
    node = <span class="tp">ParkingSpaceDetectorNode</span>()
    rclpy.<span class="fn">spin</span>(node)   <span class="cm"># Ctrl-C 로 종료</span></code></pre>

    <!-- ── 7. 패키지 등록 ── -->
    <h2 id="entry-points">패키지 등록 (setup.py)</h2>
    <p>워크스페이스 패키지의 <code>setup.py</code> <code>entry_points</code>에 아래와 같이 등록하면 <code>ros2 run</code>으로 실행할 수 있습니다.</p>

    <pre><code>entry_points={
    <span class="st">'console_scripts'</span>: [
        <span class="st">'parking_space_detector = parking_space_detector_node:main'</span>,
    ],
},</code></pre>

    <!-- ── 8. 실행 방법 ── -->
    <h2 id="launch">실행 방법</h2>

    <h3>단독 실행</h3>
    <pre><code><span class="cm"># 1. 워크스페이스 빌드</span>
cd ~/sample_th
colcon build --symlink-install
source install/setup.bash

<span class="cm"># 2. 노드 실행 (기본 파라미터)</span>
ros2 run &lt;your_package&gt; parking_space_detector

<span class="cm"># 3. 파라미터 파일 지정</span>
ros2 run &lt;your_package&gt; parking_space_detector \
  --ros-args --params-file ~/spas_slam_params.yaml</code></pre>

    <h3>Launch 파일 통합 예시</h3>
    <pre><code><span class="kw">from</span> launch <span class="kw">import</span> LaunchDescription
<span class="kw">from</span> launch_ros.actions <span class="kw">import</span> Node

<span class="kw">def</span> <span class="fn">generate_launch_description</span>():
    <span class="kw">return</span> <span class="tp">LaunchDescription</span>([
        <span class="tp">Node</span>(
            package=<span class="st">'your_package'</span>,
            executable=<span class="st">'parking_space_detector'</span>,
            parameters=[<span class="st">'/home/ubuntu/spas_slam_params.yaml'</span>],
            output=<span class="st">'screen'</span>,
        )
    ])</code></pre>

    <h3>RViz2 토픽 설정</h3>
    <div class="tbl-wrap">
      <table>
        <thead>
          <tr><th>Display Type</th><th>토픽</th><th>설명</th></tr>
        </thead>
        <tbody>
          <tr><td>PoseArray</td><td><code>/parking_spaces</code></td><td>주차 공간 중심 방향 화살표</td></tr>
          <tr><td>MarkerArray</td><td><code>/parking_space_markers</code></td><td>반투명 박스 (초록/파랑)</td></tr>
          <tr><td>Map</td><td><code>/map</code></td><td>SLAM 맵 배경</td></tr>
        </tbody>
      </table>
    </div>

    <!-- ── 9. 의존성 처리 ── -->
    <h2 id="dep-note">의존성 처리 — scipy 제거 이유</h2>
    <div class="callout warn">
      <strong>NumPy 2.x / scipy ABI 충돌</strong>
      Raspberry Pi 4 Ubuntu 22.04 환경에서 <code>numpy==2.2.6</code>과 시스템 패키지 scipy(<code>numpy 1.x</code> 빌드)가 ABI 불일치를 일으켜 <code>ImportError: _ARRAY_API not found</code>가 발생합니다.
    </div>

    <div class="tbl-wrap">
      <table>
        <thead>
          <tr><th>항목</th><th>원래 계획</th><th>최종 선택</th></tr>
        </thead>
        <tbody>
          <tr>
            <td>연결 영역 레이블링</td>
            <td><code>scipy.ndimage.label</code></td>
            <td><code>cv2.connectedComponentsWithStats</code></td>
          </tr>
          <tr>
            <td>추가 의존성</td>
            <td>scipy 설치 필요</td>
            <td>OpenCV(이미 설치됨)만 사용</td>
          </tr>
          <tr>
            <td>결과 동등성</td>
            <td colspan="2">동일 — 바운딩 박스 stats 직접 제공으로 오히려 코드 단순화</td>
          </tr>
        </tbody>
      </table>
    </div>

    <p>필요한 의존성: <code>rclpy</code>, <code>numpy</code>, <code>opencv-python (cv2)</code></p>

    <!-- ── 10. 맵 PNG 저장 ── -->
    <h2 id="mapfile">맵 PNG 실시간 저장</h2>
    <p>
      맵 콜백이 호출될 때마다 자유 공간 마스크를 BGR 이미지로 변환하고 탐지된 영역을 초록 채널로 강조한 뒤 타임스탬프 파일명으로 저장합니다.
    </p>

    <div class="tbl-wrap">
      <table>
        <thead>
          <tr><th>항목</th><th>값</th></tr>
        </thead>
        <tbody>
          <tr><td>저장 경로</td><td><code>~/sample_th/map/</code></td></tr>
          <tr><td>파일명 형식</td><td><code>map_YYYYMMDD_HHMMSS.png</code></td></tr>
          <tr><td>이미지 내용</td><td>자유 공간(흰색) + 탐지 영역(초록 강조)</td></tr>
          <tr><td>저장 주기</td><td>/map 토픽 수신 시마다</td></tr>
        </tbody>
      </table>
    </div>

    <pre><code><span class="cm"># _save_map_png() 핵심 로직</span>
vis = cv2.<span class="fn">cvtColor</span>(free_mask, cv2.COLOR_GRAY2BGR)
norm_label = ((labeled > <span class="nm">0</span>) * <span class="nm">180</span>).astype(np.uint8)
vis[:, :, <span class="nm">1</span>] = np.<span class="fn">maximum</span>(vis[:, :, <span class="nm">1</span>], norm_label)  <span class="cm"># G 채널 강조</span>
cv2.<span class="fn">imwrite</span>(fname, vis)</code></pre>

    <div class="callout ok">
      <strong>로그 출력</strong>
      모든 주요 동작(맵 수신, 영역 탐지 수, 각 공간의 좌표·크기·유형, PNG 저장 경로)에 <code>self.get_logger().info()</code>가 출력됩니다.
    </div>

  </main>

  <footer>
    <div>SPAS 주차 공간 탐지 노드 구현 문서 &mdash; ~/sample_th/parking_space_detector_node.py</div>
    <div>ROS 2 Humble · Raspberry Pi 4 · 작성일 2026-05-09</div>
  </footer>
  </div>
</div>

<script>
  // Active nav link on scroll
  const sections = document.querySelectorAll('h2[id], h3[id]');
  const navLinks = document.querySelectorAll('nav a');
  const obs = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        navLinks.forEach(l => l.classList.remove('active'));
        const link = document.querySelector(`nav a[href="#${e.target.id}"]`);
        if (link) link.classList.add('active');
      }
    });
  }, { rootMargin: '0px 0px -60% 0px' });
  sections.forEach(s => obs.observe(s));
</script>
</body>
</html>

```


## Parking_Space_Detector 코드

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


## 생성된 맵

map_20260509_191114


![map_20260509_191114.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b0e76840-b04d-4731-a75c-87ea5ef8b03e/map_20260509_191114.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=0140a619dd0e0c8b98ef71abb6e5af3d961957c9ba3f2be065dde0ba4d724bfa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_195645


![map_20260509_195645.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/30000d67-3077-4bc2-8e0c-c5493b494232/map_20260509_195645.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=c473737b8f1fb729757b708d1b105c75315240e3a6ee9509668f8c96d85c1ac8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_201359


![map_20260509_201359.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b6d94c48-d14c-440b-abe7-653d302a49e3/map_20260509_201359.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=7e767cbfe63734d199e672191807d4907f55148e3a64937fd0593544f4c9c986&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_204728


![map_20260509_204728.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a058f1c9-ab20-4e02-87ed-822569c7a541/map_20260509_204728.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=470a41bfd52928e55faf46900b9b5bf11f67652c7eadcd32f4f41241aa39fc40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_210716


![map_20260509_210716.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e66e48e9-5ab9-43ba-98fd-aec36dbcb0ea/map_20260509_210716.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=b1fec3c60b5b71da68b823a20e8fd3bb4ca13922b94822afbe9c4d90c15a5b55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_211122


![map_20260509_211122.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d25896c5-f71e-4d5d-8515-1a7b5038298b/map_20260509_211122.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=e0844d809d2613ad86b95528e618f4558e6a7daf9de065345fe1897fa5d3d0e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_214458


![map_20260509_214458.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d97d322a-3524-4fcd-b7d6-9bc9f5df399e/map_20260509_214458.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=3dbba3253ed8f6bdb77e0437906beb00f4ce31f8f5f65668242bfa1f94be0125&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_223044


![map_20260509_223044.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6a882f89-115b-4275-9473-e1f73f80d673/map_20260509_223044.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=bcecdbda9f1e70024ae3cd21edc3a57c3c2f1d5cfa455346ea4900cf0dc6ea26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_230442


![map_20260509_230442.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d642d5ac-2d94-4f62-9f28-84ac273a4f18/map_20260509_230442.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=e95989aef470f86fb06984b3eebbd88f0c97809818a0fc28f87bc36ad1c0d7a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_231912


![map_20260509_231912.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/54c1d2fb-906e-40fe-9b23-2280cc8d3b58/map_20260509_231912.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=ed5f2670d1f61578236ed878b383fa9dd4abe77c37dfcf7ee89c36c1838400d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232116


![map_20260509_232116.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e90594c3-771d-4371-b5de-646084bb88c5/map_20260509_232116.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=d23ebc02c6d88f04b33811ab37edbea71cd26dcbf6a449d1ad6d37fb5ff0fc89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232527


![map_20260509_232527.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8d2af31-fda8-4016-9fe2-94c839c8ec36/map_20260509_232527.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=1c156f707bf3b177e9a1d3d860c43f138f20f8a57c66e2ebcb9f430017d7895a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260510_152510


![map_20260510_152510.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/8901a9bb-1b81-4a91-ad67-5c5eb2e9125a/map_20260510_152510.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665SVS4OUJ%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222924Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJIMEYCIQCbGqusQCwvKOIlCG0Wj%2Fsi7OZSLw1e3h%2FGfSjOvatTbAIhAPuTza3XHG8k3GyBHxKQWpyfJOU%2FClF7op4dQXiH8JZnKogECNf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgyhQxyIECAHvdx0HkAq3AOnzyG6%2B1zFlMFAKu%2B5c%2F0mo0KAMT8025HM5nmpJiFXdWq94V7skAxCOCC4zD5v16bVUjoHIK8Hf0hUfWvHHi53mcAZ9ObmLtm2xKHwZSVcheQQH4C3C5F5MupGU2csNzlXKV5IZ3183iBeJeABTzblDHmZdICHw6bv8hX93nbuYZIz7AfG%2FLklgdEjo6MJ2i%2FrRsGTRJjG0Gy%2F1jFcUl%2FUTkihU6U%2BENwjpsPXQyjCGw%2FKgUMUNVSW%2BilO9CrXbQ4Ere5FUjtQW9gb8rPEhseDRbkQwSBfYEGNlvdP9v5Gk83uVu5v0crcKoMFzUT9l8IOuOhx5xLTT0FS9oVCf6G63L88arZ6hOjVZmG8Fq0aZBj%2FPm8oudmW6mfbyS7DMQKtg2T0ed9%2BwALHRiKQE50V5dmjBaepX%2FcNLWFpqHffjF37UQF00Jl8tq7giDF2LFMub3wEp0qBNSk4gkV1fWtFbT3%2Ffd2h7Dlp%2B%2BuOGRgscnjtw8e892seEfoqm0B1G5UT%2BSBMA0G7%2BNEDDiA59QQYzcZoQogJ7OAHQQcypR2TilsyPvyXpp2VstEIRoGfm0jmmJyb2kl79dKBPSgu9TPxm47CPwKG0nIz%2BJ9tBayOmgHTfm8F9KMCvwXpDTDuoqLRBjqkASKwNmJUp6Q%2FTn0LuSuNcGIkoL2yK%2B5tJKbGMGzEKl4HbgvwitsNDggN9rYjHr0XJF7e2rYpZY76QND5b%2B0gHW20X4bnxVn9P%2BYLgydIs%2FSA6g2ML6MWL2wbq1P1%2FwotoieMgL20rpqr95lLabx%2FLSMty%2Bm5yn7ETCIU6D12Tpw7vW62Z7cODEWi89e4SsHox0zy%2BtZ7H4oWxEw%2FZ6MQzv9PZDTB&X-Amz-Signature=ce31444eac73eea55f4c79b8ef37e901d26d760e7044949d0976f4ac26c2d14b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


---


# 다른 테스트 버전


```bash
source /opt/ros/humble/setup.bash
ros2 launch sllidar_ros2 sllidar_a1_launch.py
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher 0 0 0.1 0 0 0 base_link laser
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch rf2o_laser_odometry rf2o_laser_odometry.launch.py \
    laser_scan_topic:=/scan \
    odom_topic:=/odom \
    publish_tf:=true \
    base_frame_id:=base_link \
    odom_frame_id:=odom
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch slam_toolbox online_async_launch.py \
    slam_params_file:=$HOME/spas_slam_params.yaml \
    use_sim_time:=false
```

