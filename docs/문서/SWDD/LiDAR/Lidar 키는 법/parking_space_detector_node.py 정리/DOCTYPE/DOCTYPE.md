# DOCTYPE


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

