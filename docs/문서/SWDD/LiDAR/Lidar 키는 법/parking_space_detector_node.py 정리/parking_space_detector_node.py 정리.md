# parking_space_detector_node.py 정리


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

