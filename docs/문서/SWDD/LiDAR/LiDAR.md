# LiDAR


## Lidar 키는 법

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


![map_20260509_191114.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b0e76840-b04d-4731-a75c-87ea5ef8b03e/map_20260509_191114.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=f9a114a3ff11783919659241f1fe0a99778a0319d33b8e9639918eb95719f34b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_195645


![map_20260509_195645.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/30000d67-3077-4bc2-8e0c-c5493b494232/map_20260509_195645.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=acb220eb5ca5a580362158071d28bb1ce32475951ba67f0cac188d5d205e9259&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_201359


![map_20260509_201359.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b6d94c48-d14c-440b-abe7-653d302a49e3/map_20260509_201359.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=69cafe3cafbe7e2a42d02d24b9b0929b3c3ea03e67c12f5c9ef03d61cb622a99&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_204728


![map_20260509_204728.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a058f1c9-ab20-4e02-87ed-822569c7a541/map_20260509_204728.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=c665208b76b717016f6b6d4606fa635c01526cc50d4fac24d1d13d4775db9153&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_210716


![map_20260509_210716.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e66e48e9-5ab9-43ba-98fd-aec36dbcb0ea/map_20260509_210716.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=343051afa51ea8e462225a8da2ace76adf7aef595b333c6b2d9f9814c3c1f98d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_211122


![map_20260509_211122.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d25896c5-f71e-4d5d-8515-1a7b5038298b/map_20260509_211122.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=2ef3e812864c7d7bf2fd74bb96e3549a7043f3f239c7a2adedad2efd76c7173f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_214458


![map_20260509_214458.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d97d322a-3524-4fcd-b7d6-9bc9f5df399e/map_20260509_214458.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=de80b37e665c78847670f1dc52565720d276d1331472e8e429020b0f78219efb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_223044


![map_20260509_223044.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6a882f89-115b-4275-9473-e1f73f80d673/map_20260509_223044.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=d4c6dfd0eeb11af602ca6753e194c2fec3140a7d2294c64cab396782d5d9c0a3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_230442


![map_20260509_230442.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d642d5ac-2d94-4f62-9f28-84ac273a4f18/map_20260509_230442.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=5cc32473c73e5a4d84999363198bdf8cb4fe987a1b6f6ad8b64657d57ccbb068&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_231912


![map_20260509_231912.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/54c1d2fb-906e-40fe-9b23-2280cc8d3b58/map_20260509_231912.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=45af65c26ea8d1388e4815a876ae02bc5763f6604eab34ff3f2d35444e9ecb4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232116


![map_20260509_232116.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e90594c3-771d-4371-b5de-646084bb88c5/map_20260509_232116.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=c1fb101865466b59e695d306e32ba482033fa0a9f116f90b86e94538ec554826&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232527


![map_20260509_232527.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8d2af31-fda8-4016-9fe2-94c839c8ec36/map_20260509_232527.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=4bab72ec0612754a42beeb7aef4a5e8017181a5bda0f744f93cba19759eb8d4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260510_152510


![map_20260510_152510.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/8901a9bb-1b81-4a91-ad67-5c5eb2e9125a/map_20260510_152510.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466W2KNNZTL%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIArkjFTPjBiHIIWC7c3HZp6e%2BKzg6Srl0XzJPGT3jeCQAiEApO5pg2RiNwdi2laFdxlPw1AHz0PY71qmpmY77NdOq%2BEqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDG8HjxnXiOOCNfF6LSrcAw5nCiroij%2Fz9zljdLmKreAcR83wwnm7KpRT9Egz6wd2TXhPNlVv4y9lni4tBuHMME5Npp39lGm6YhjC%2Bh1K%2F8Wdgn3Y8u%2BVlHeP0rPs8GxjcfmXFR4j%2BkdiJi5NY6r1tuEFiXEgofxR7CWJm2p6PCupZ1RKaLKNmgkI1gRuRY09IK1gz4iRisWTKGGQRoych9L4Jxn0iKLmVD56OqV%2FhPUIY6RK60X0ZeKXAzkpU62xM30RB7NaPl3%2Fjkiw8rAnOs9zLENlFjWoQL7zEbD3OYF%2FPdoXd7iNVy1Ravmrjm28A6di66%2F0x2EI9qhuBQLOuCpjCzBPdzoZamTpFhi6KpPQMQkpW4N5eMRZU6NJ%2B9LwoijuJYufYILFknJkRUlhalT61r0ZW7IeN98iYmafa%2Fr1wBKsfm25VPC2JWbg8qDEvakMbiDy7fl6tKpmJAJLijaoqYdX2TQvuwwzMYj5qseH%2F1l0BnI91iisezdP7JVI%2FBg1VwXKlnrqjNFmdW4INEYTtbtXNdfR5GJLYaxVqz7zH1A5e3qt96jy5aZS8Kb6gohJUOa0VKXttWCzZyG3VoRb0IsbBEqPuo5WljZSnbAJIHRSfP3h3HEvZpU5j0XklB0ZR95LklAF%2FLzZMKjFp9EGOqUBia%2FO3rG5p6Y53kWYCxNLMUq0M%2BAhYeD1hQCDCXY%2FDOwxoNc0zc0LghaEj2G5MbBHRLkJVurPan%2FHmW8M8ZosqMhrEKcZtNYhCT69QZRp8iisvQr%2FVKq%2FEMdYxsSBnXeh4SoE1FDWEWqU9ioTykq0ceB0hvr6s0ausB7Aas0x3W%2BtOJEcNekIWdJYp4GUQR7SsOBx7BmuONvlE9hyBLfjSv0Ty5Yh&X-Amz-Signature=dc0c3d840154a9933b94d68bc4de7999b874347974ed00f881e82e9c01f7e4fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


## 주차 경로 생성 코드(Hybrid A*)

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


![hybrid_astar_test_result.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f4488183-c564-4609-89eb-6a9114b2eadc/hybrid_astar_test_result.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XGKMLDCO%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIA81p4e%2FRrhpGdOcDfJC%2BX85qJDi1ZkVn6Qtos1N4VH6AiEA2evgQzxb7zmPTQPDeHcqpVjYktAHbOJn19FcDGVZmwAqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNrlOp917KU533V34yrcA9izweaQCTiUNt8mJd9CubiBpq0NXRqXdMRLBRSK0VezMVocuLgIZukAIT50XTKhylrkCvSiER3WttzAxdDk1qMliKPxTFimBmDmpfR2DYEJbkfH%2FThbIZL9J7myJBsD94JRb3Y2jTRiexR3z2XonNXpfrvNUrQiK7d1kiBnCV3bBSeY0Zyo3yi4kWuCsiJpI5mrKduW3skPn%2FDQwl22raq97jgORFy85IvsfaH8F0iy8CgFB53OJCcp9ovt%2FY4vSzUf287ayhFv7K8BAEJ27QZ36m1D9hDlOSBhnVmvIv0OqiTl53KToixrVfWOFvhYMPNr7RQ%2FWMjCxYIaN7SwOIGhmZ0ULHduN%2FFDJGTK%2B9mEw0%2B%2FBFc%2BgHzdNAGJEvTM%2FF1CFOFc76mg151JWyRUTIxAST3ShrkZKYwedUmRDwzX%2B4%2FlWG15BVdE8%2FA9TPmW31Jv6%2FZSO3%2FepMkAzDT6ll55Z8stvL04bjPq6Dp4d2JhMJHW4SGZkxJ41%2FDJxgeMtFDwA1a4Ad8TA4Kr%2BmTGvFVKMVGNHQRF7g%2BVv%2FwT5COrt8rbw4Uv0RgEoMbcBhemkXqikBBsFsjiBhJyjvudKK4uy01uCBs%2FaEN7QUzQiLmgJX9fn9kqtLkoFCIFMNfGp9EGOqUBLd1RCsorrIChKWm5bwMukmccGwGpkP%2F4uOEUWzvG4dkNBt2omGYZhdZsK%2FHiS9DNO7zutB22XPGsVajHTufcfuWUkWJT2VlOq6NsIKNgmv5LGzCMH9gHiABOBeFCkpGX8jf%2FVucH1siJgKsQG1WFvP1aCoHrTvUMc%2FjaL7OSX6x1YXTS5UyLEgGoIyYPiQ4ilhcHGUcsK64KN3H5INMcPR5z125%2F&X-Amz-Signature=70464ebbe17c54eb2047d62900aaf4895cde29e4d5222bedfaea02efacc2e368&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![hybrid_astar_test_result_T.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bca57554-2c9f-4ed7-b409-f7ba4c60899d/hybrid_astar_test_result_T.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XGKMLDCO%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJHMEUCIA81p4e%2FRrhpGdOcDfJC%2BX85qJDi1ZkVn6Qtos1N4VH6AiEA2evgQzxb7zmPTQPDeHcqpVjYktAHbOJn19FcDGVZmwAqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNrlOp917KU533V34yrcA9izweaQCTiUNt8mJd9CubiBpq0NXRqXdMRLBRSK0VezMVocuLgIZukAIT50XTKhylrkCvSiER3WttzAxdDk1qMliKPxTFimBmDmpfR2DYEJbkfH%2FThbIZL9J7myJBsD94JRb3Y2jTRiexR3z2XonNXpfrvNUrQiK7d1kiBnCV3bBSeY0Zyo3yi4kWuCsiJpI5mrKduW3skPn%2FDQwl22raq97jgORFy85IvsfaH8F0iy8CgFB53OJCcp9ovt%2FY4vSzUf287ayhFv7K8BAEJ27QZ36m1D9hDlOSBhnVmvIv0OqiTl53KToixrVfWOFvhYMPNr7RQ%2FWMjCxYIaN7SwOIGhmZ0ULHduN%2FFDJGTK%2B9mEw0%2B%2FBFc%2BgHzdNAGJEvTM%2FF1CFOFc76mg151JWyRUTIxAST3ShrkZKYwedUmRDwzX%2B4%2FlWG15BVdE8%2FA9TPmW31Jv6%2FZSO3%2FepMkAzDT6ll55Z8stvL04bjPq6Dp4d2JhMJHW4SGZkxJ41%2FDJxgeMtFDwA1a4Ad8TA4Kr%2BmTGvFVKMVGNHQRF7g%2BVv%2FwT5COrt8rbw4Uv0RgEoMbcBhemkXqikBBsFsjiBhJyjvudKK4uy01uCBs%2FaEN7QUzQiLmgJX9fn9kqtLkoFCIFMNfGp9EGOqUBLd1RCsorrIChKWm5bwMukmccGwGpkP%2F4uOEUWzvG4dkNBt2omGYZhdZsK%2FHiS9DNO7zutB22XPGsVajHTufcfuWUkWJT2VlOq6NsIKNgmv5LGzCMH9gHiABOBeFCkpGX8jf%2FVucH1siJgKsQG1WFvP1aCoHrTvUMc%2FjaL7OSX6x1YXTS5UyLEgGoIyYPiQ4ilhcHGUcsK64KN3H5INMcPR5z125%2F&X-Amz-Signature=abe5a6d510226bc6d5e5fd796b8e136ebd74111dfb74624c42a9e05414f623f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


라이다 물리적 연결확인 명령어


```json
lsusb
```


**기대하는 결과 :** 출력되는 목록 중에 **`Silicon Labs CP210x UART Bridge`** (또는 이와 비슷한 이름)가 나타나야 합니다. 이게 뜬다면 데이터 통신이 정상적으로 연결


라이다 포트번호 확인


```json
ls -l /dev/ttyUSB*
```


**기대하는 결과 :** `No such file or directory` 에러가 뜨지 않고, **`/dev/ttyUSB0`** 이라는 반가운 이름이 화면에 출력




라이다 실행 명령어


```json
ros2 launch sllidar_ros2 sllidar_a1_launch.py serial_port:=/dev/ttyUSB0
```


### 라이다 그리드 맵 확인


tigerVNC에서 쉘창에 `rviz2` 


**RViz2 세팅하기:**

- 왼쪽 Displays 패널의 **Fixed Frame**을 `map`에서 **`laser`** (또는 `laser_frame`)로 변경합니다.
- 왼쪽 하단의 **Add** 버튼을 누르고 **LaserScan**을 추가합니다.
- 추가된 LaserScan 메뉴의 삼각형을 눌러 확장한 뒤, **Topic**을 **`/scan`*으로 선택합니다.

### 참고


라이다 센서 점근권한 열어주기


```json
sudo chmod 666 /dev/ttyUSB0
```


---


## option1 : 라이다 그리드 맵 좌표 반환


```python
import rclpy
from rclpy.node import Node
from nav_msgs.msg import OccupancyGrid
from geometry_msgs.msg import PoseArray, Pose
import numpy as np
import cv2

class ParkingSpotDetector(Node):
    def __init__(self):
        super().__init__('parking_spot_detector')
        
        # 1. 구독 및 발행 설정
        self.subscription = self.create_subscription(
            OccupancyGrid,
            '/map',  # rviz2에서 확인한 맵 토픽명
            self.map_callback,
            10)
        
        # 주차 가능 공간 좌표를 발행 (Rviz2 시각화용)
        self.pose_pub = self.create_publisher(PoseArray, '/detected_parking_spots', 10)

        # 2. 주차 공간 파라미터 (단위: 미터)
        self.spot_width_m = 2.5   # 주차 칸 가로
        self.spot_height_m = 5.0  # 주차 칸 세로
        self.margin = 0.2         # 최소 여유 공간

    def map_callback(self, msg):
        # 맵 정보 추출
        res = msg.info.resolution
        width = msg.info.width
        height = msg.info.height
        origin = msg.info.origin.position

        # 1차원 데이터를 2차원 Numpy 배열로 변환
        # 0: Free, 100: Occupied, -1: Unknown
        raw_data = np.array(msg.data).reshape((height, width))

        # 데이터 전처리: 빈 공간(0)은 255로, 나머지는 0으로 이진화
        binary_map = np.where(raw_data == 0, 255, 0).astype(np.uint8)

        # 주차 공간 크기를 픽셀 단위로 변환
        pixel_w = int((self.spot_width_m + self.margin) / res)
        pixel_h = int((self.spot_height_m + self.margin) / res)

        # 3. 템플릿 매칭 (빈 직사각형 찾기)
        # 주차 공간 크기의 흰색(255) 사각형 생성
        template = np.full((pixel_h, pixel_w), 255, dtype=np.uint8)
        
        # 템플릿과 일치하는 영역 탐색
        result = cv2.matchTemplate(binary_map, template, cv2.TM_SQDIFF)
        
        # 차이값이 0에 가까운(빈 공간인) 지점 필터링
        threshold = 0.1
        loc = np.where(result <= threshold)

        # 4. 결과 처리 및 좌표 발행
        parking_poses = PoseArray()
        parking_poses.header.frame_id = "map"
        parking_poses.header.stamp = self.get_clock().now().to_msg()

        # 중복 검출 방지를 위해 일정 간격으로 샘플링
        detected_points = zip(*loc[::-1])
        last_added = None

        for pt in detected_points:
            # 월드 좌표계(m)로 변환
            world_x = origin.x + (pt[0] * res)
            world_y = origin.y + (pt[1] * res)

            # 너무 가까운 포인트들은 무시 (간단한 필터링)
            if last_added is None or (abs(world_x - last_added[0]) > 1.0 or abs(world_y - last_added[1]) > 1.0):
                pose = Pose()
                pose.position.x = world_x + (self.spot_width_m / 2)
                pose.position.y = world_y + (self.spot_height_m / 2)
                parking_poses.poses.append(pose)
                last_added = (world_x, world_y)

        self.pose_pub.publish(parking_poses)
        self.get_logger().info(f"검출된 주차 공간 개수: {len(parking_poses.poses)}")

def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpotDetector()
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


### 코드 사용 및 확인 방법

1. **파라미터 수정:** `self.spot_width_m`과 `self.spot_height_m`을 현재 사용 중인 시뮬레이션 환경이나 실제 주차장 규격에 맞춰 수정하세요.
2. **Rviz2 시각화:**
	- Rviz2를 실행합니다.
	- **Add** -> **By topic** -> `/detected_parking_spots` (**PoseArray**)를 추가합니다.
	- 맵 위에 화살표나 점으로 표시되는 지점이 주차 가능한 후보지입니다.
3. **성능 최적화:** 라즈베리파이 4에서 속도가 느리다면 `map_callback` 내에서 `cv2.resize()`를 이용해 맵 크기를 줄여 처리하거나, 차량 주변 5~10m 영역만 슬라이싱하여 연산하도록 코드를 보완할 수 있습니다.

이 코드는 "빈 공간"을 찾는 데 집중되어 있습니다. 이후에 **Hybrid A*** 알고리즘을 여기에 연결하면, 검출된 `PoseArray` 중 현재 차량 위치에서 가장 가까운 좌표를 목표물(Goal)로 설정하여 자동 주차 경로를 생성하게 됩니다.


---


### 라이다 출력 테스트


```python
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan

class LidarSubscriber(Node):
    def __init__(self):
        super().__init__('lidar_subscriber')
        # /scan 토픽을 구독하는 Subscriber 생성
        self.subscription = self.create_subscription(
            LaserScan,
            '/scan',
            self.scan_callback,
            10  # QoS 설정 (필요시 rclpy.qos.qos_profile_sensor_data 사용)
        )
        self.subscription  # prevent unused variable warning

    def scan_callback(self, msg):
        # 콜백 함수: /scan 데이터가 들어올 때마다 실행됨
        ranges = msg.ranges
        
        # 예시: 특정 각도(대략적인 전, 후, 좌, 우)의 데이터 추출
        # (실제 센서의 0도 방향이 어디인지 확인 후 인덱스를 조정해야 합니다)
        total_points = len(ranges)
        front_idx = 0                  # 0도 (가정)
        left_idx = total_points // 4     # 90도 (가정)
        back_idx = total_points // 2     # 180도 (가정)
        right_idx = total_points * 3 // 4 # 270도 (가정)

        front_dist = ranges[front_idx]
        left_dist = ranges[left_idx]
        back_dist = ranges[back_idx]
        right_dist = ranges[right_idx]

        self.get_logger().info(f'정면: {front_dist:.2f}m, 좌측: {left_dist:.2f}m, 후면: {back_dist:.2f}m, 우측: {right_dist:.2f}m')
        
        # ----------------------------------------------------
        # TODO 1: (프로젝트 목표) 장애물 인지 및 경고 (PDW)
        # 예: 전방 0.5m 이내에 장애물이 감지되면 경고 플래그 활성화
        # ----------------------------------------------------
        
        # ----------------------------------------------------
        # TODO 2: (프로젝트 목표) 긴급 제동 (PCA/AEB)
        # 예: 전방 0.15m 이내에 장애물이 감지되면 긴급 제동 플래그 활성화
        # ----------------------------------------------------

def main(args=None):
    rclpy.init(args=args)
    lidar_subscriber = LidarSubscriber()
    rclpy.spin(lidar_subscriber)
    lidar_subscriber.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```


### 실패


```python
ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 map laser
```

