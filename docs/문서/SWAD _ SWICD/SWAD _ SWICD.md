# SWAD / SWICD


## SWAD/SWICD v.1.0

# 소프트웨어 아키텍처 설계서 (SWAD)


본 시스템은 ROS 2 기반의 분산 노드 아키텍처를 채택하며, 인지(Perception), 판단(Planning), 제어(Control)의 3계층(Layer)으로 설계한다.

• **1. 인지 레이어 (Perception Layer):**
    ◦ `lidar_node`: RPLIDAR A1과 통신하여 2D Point Cloud 데이터를 `/scan` 토픽으로 발행.

    ◦ `ultrasonic_filter_node`: 아두이노로부터 수신한 4채널 초음파 원시 데이터에 칼만 필터를 적용하여 노이즈를 제거한 뒤 `/filtered_distance` 토픽으로 발행.
• **2. 판단 레이어 (Planning Layer - Master Brain):**
    ◦ `parking_planner_node`: 수집된 센서 데이터를 바탕으로 빈 공간을 인식하고, 조향각을 고려한 최적 주차 궤적 산출.

    ◦ `safety_node`: 장애물 거리가 임계치 미만일 경우 최우선 순위로 긴급 제동 플래그(`emrgency_trigger`)를 활성화.
• **3. 제어 레이어 (Control Layer - Slave Control):**
    ◦ `arduino_bridge_node`: 라즈베리파이와 아두이노 간의 UART 통신 브리지 역할.

    ◦ **아두이노 내부 로직:** 수신된 목표 속도/조향각과 엔코더 기반 현재 속도를 비교하여 PID 제어를 수행하고, 모터 드라이버(L298N/BTS7960)에 PWM 신호를 출력.


# 소프트웨어 인터페이스 명세서 (SWICD)


시스템 내 주요 서브시스템(라즈베리파이 ↔ 아두이노) 간의 데이터 교환 규격을 정의한다.


| **송신처** | **수신처** | **인터페이스 방식**  | **데이터 명 (Topic / Packet)** | **데이터 타입 및 구성 요소**                          | **주기 / 비고** |
| ------- | ------- | ------------- | -------------------------- | ------------------------------------------- | ----------- |
| Arduino | Rasp_Pi | UART (Serial) | `ultrasonic_raw`           | `[Sensor1(int), Sensor2, Sensor3, Sensor4]` | 50ms        |
| Arduino | Rasp_Pi | UART (Serial) | `encoder_ticks`            | `[Left_Tick(long), Right_Tick(long)]`       | 50ms        |
| Rasp_Pi | Arduino | UART (Serial) | `cmd_vel_steer`            | `[Target_Speed(float), Steer_Angle(float)]` | 100ms       |
| Rasp_Pi | Arduino | UART (Serial) | `emergency_trigger`        | `[Emergency_Stop(bool)]`                    | 이벤트 발생 시 즉시 |


## 소프트웨어 아키텍처 설계서 (SWAD)


**작성자 (Accountable):** 권태허 (SW 설계 책임)


**참조자 (Informed):** 김명진 (SW 구현 실무), 정재웅 (PM)


### 1. 소프트웨어 아키텍처 개요 (Architecture Overview)


본 시스템은 **ROS 2 Humble (Ubuntu 22.04)** 환경을 기반으로 하는 '분산형 발행/구독(Publisher/Subscriber) 아키텍처'를 채택한다. 무거운 인지(Vision/LiDAR) 연산은 라즈베리파이가 전담하고, 실시간성이 중요한 하드웨어 제어(PWM/인터럽트)는 아두이노가 전담하여 컴퓨팅 부하를 완벽히 분리한다.


### 2. 논리적 계층 구조 (Logical Layers)

- **[Layer 4] Planning & Control (주행 판단 계층)**
	- **`autonomous_driving_node`****:** 카메라의 차선 정보와 라이다/초음파의 장애물 정보를 융합(Sensor Fusion)하여, 최종적으로 차량이 가야 할 선속도(Linear)와 조향각(Angular)을 계산한다.
- **[Layer 3] Perception (인지 계층)**
	- **`camera_vision_node`****:** OpenCV를 활용해 차선 및 정지선을 검출.
	- **`lidar_slam_node`****:** RPLiDAR A1 데이터를 바탕으로 2D 로컬 맵핑 및 장애물 탐지.
- **[Layer 2] Hardware Abstraction (하드웨어 추상화 계층)**
	- **`serial_bridge_node`****:** ROS 2 네트워크와 아두이노 사이의 번역기 역할. ROS 2의 표준 속도 명령(`/cmd_vel`)을 아두이노가 이해할 수 있는 시리얼 바이트 패킷으로 변환하여 전송.
- **[Layer 1] Firmware (펌웨어 계층 - Arduino Mega 2560)**
	- 수신된 패킷을 분석하여 JGB37-520R30-12 구동 모터(RPM 제어)와 LD-1501MG 조향 서보(각도 제어)를 직접 구동하고, 엔코더 틱(Tick)과 4방향 초음파(HC-SR04) 데이터를 라즈베리파이로 역송신.

---


## 소프트웨어 인터페이스 명세서 (SWICD)


### 1. ROS 2 내부 통신 인터페이스 (Topic 명세)


_라즈베리파이 내부의 노드들이 서로 데이터를 주고받는 규약입니다._


| **토픽명 (Topic)**   | **발행(Publisher) 노드**      | **구독(Subscriber) 노드**     | **메시지 타입 (Message Type)**  | **데이터 내용**                               | **주파수** |
| ----------------- | ------------------------- | ------------------------- | -------------------------- | ---------------------------------------- | ------- |
| **`/image_raw`**  | `usb_cam_node`            | `camera_vision_node`      | `sensor_msgs/Image`        | 원본 Pi Camera 영상 스트림                      | 30 Hz   |
| **`/scan`**       | `rplidar_node`            | `lidar_slam_node`         | `sensor_msgs/LaserScan`    | 360도 라이다 거리 및 각도 배열                      | 10 Hz   |
| **`/cmd_vel`**    | `autonomous_driving_node` | `serial_bridge_node`      | `geometry_msgs/Twist`      | **(제어 명령)** 목표 선속도(x) 및 조향각(z)           | 20 Hz   |
| **`/odom`**       | `serial_bridge_node`      | `autonomous_driving_node` | `nav_msgs/Odometry`        | _JGB37_-520R30-12 엔코더 기반 차량의 현재 누적 위치/속도 | 20 Hz   |
| **`/sonar_data`** | `serial_bridge_node`      | `autonomous_driving_node` | `std_msgs/Int32MultiArray` | 4방향 초음파 센서(HC-SR04) 거리 데이터 [전, 후, 좌, 우]  | 10 Hz   |


### 2. 상/하위 제어기 시리얼 통신 프로토콜 (Serial UART)


_라즈베리파이(__`serial_bridge_node`__)와 아두이노 메가 간의 USB 시리얼(115200bps) 패킷 규약입니다. 데이터 깨짐을 방지하기 위해 STX/ETX 구조를 사용합니다._


**[TX] 라즈베리파이 ➔ 아두이노 (제어 명령 전송)**

- **포맷:** `<STX>,[Target_Velocity],[Target_Steering_Angle],<ETX>`
- **예시:** `<,150,90,>` (의미: 구동 모터 PWM 150으로 전진, 조향 서보 LD-1501MG 90도 중앙 정렬)
- **사이클:** 50ms (20Hz)

**[RX] 아두이노 ➔ 라즈베리파이 (센서 데이터 보고)**

- **포맷:** `<STX>,[Left_Encoder],[Right_Encoder],[Sonar1],[Sonar2],[Sonar3],[Sonar4],<ETX>`
- **예시:** `<,1024,1030,45,120,50,55,>` (의미: 좌/우 엔코더 누적 틱수, 4방향 초음파 cm 거리)
- **사이클:** 50ms (20Hz)

---


## SWAD/SWICD v.2.0

본 시스템은 ROS 2 기반의 분산 노드 아키텍처를 채택하며, 인지(Perception), 판단(Planning), 제어(Control)의 3계층(Layer)으로 설계한다. 라즈베리파이(High-level)와 STM32(Low-level) 간의 명확한 역할 분담을 통해 시스템의 안정성을 극대화한다.


### 1. 인지 레이어 (Perception Layer)

- **`lidar_node`**: RPLIDAR A1과 통신하여 2D Point Cloud 데이터를 `/scan` 토픽으로 발행.
- **`sensor_filter_node`** (기존 ultrasonic_filter_node 변경): 아두이노로부터 직렬 통신(UART)을 통해 수신한 하위 센서 원시 데이터(초음파 거리)에 칼만 필터 및 노이즈 제거 알고리즘을 적용한 뒤, `/filtered_distance` 토픽으로 Rasp_Pi와 통신.

## 2. 판단 레이어 (Planning Layer - Master Brain)

- **`parking_space_detector`** : 수집된 센서 및 맵 데이터를 바탕으로 빈 공간을 인식. `/map` (OccupancyGrid)을 구독하여 슬라이딩 윈도우 알고리즘으로 주차 공간 후보를 탐지하고, `/parking_spaces` (PoseArray), `/parking_spaces_info` (String/JSON), `/parking_space_markers` (MarkerArray)로 발행.
- **`hybrid_A_star_node`** : 차량의 조향각 한계를 고려한 최적의 하이브리드 주차 궤적 산출. Reeds-Shepp 확장, 이중 휴리스틱, Analytic Expansion을 포함하며, 결과를 `/parking_path` (Path) 및 `/parking_path_markers` (MarkerArray)로 발행.
- **`vehicle_control_node`** : 산출된 주차 궤적을 토대로 구동 명령(`/cmd_vel`)을 생성하여 `stm32_bridge_node`로 전송.
- **`safety_node`** : `/pdw_status` 및 `/filtered_distance` 를 구독하여 전/후방 장애물 거리를 모니터링한다. 장애물 거리가 임계치 미만일 경우 최우선 순위로 개입하여 `emergency_trigger` 플래그를 활성화하고, 주행 명령을 강제 차단(속도 0).

### 3. 제어 레이어 (Control Layer - Slave Control)

- **`stm32_bridge_node`** : 라즈베리파이와 STM32 보드 간의 USB-to-Serial(CH9102F) 브리지 역할. ROS 2의 `/cmd_vel`(목표 선속도 및 조향각) 메시지를 헥사(Hex) 패킷으로 변환하여 STM32로 송신하고, STM32의 센서 데이터를 ROS 2 메시지로 역변환.
- **STM32 내부 로직 (Firmware)**:
	- **통신 파트:** 라즈베리파이로부터 패킷을 수신하고 체크섬(Checksum) 무결성 검사 수행.
	- **제어 파트:** 수신된 목표 속도/조향각과 하드웨어 타이머로 읽어들인 엔코더 기반 현재 속도를 비교하여 **1ms 주기의 고속 PID 제어**를 수행. 계산된 값을 바탕으로 모터 드라이버에 PWM 신호 인가.
	- **수집 파트:** 초음파 센서 및 엔코더 값을 읽어 라즈베리파이로 10~50Hz 주기로 전송.

### 🔌 통신 인터페이스 명세서 (Raspberry Pi ↔ STM32)


하드웨어 제어기가 STM32로 변경됨에 따라, 노이즈와 데이터 손실에 강한 **바이트 패킷(Byte Packet) 통신 프로토콜**을 적용합니다.


### 1. 통신 물리 규격

- **인터페이스:** USB to UART (보드 내장 CH9102F 칩 사용)
- **Baudrate:** 115200 bps (또는 500000 bps 권장)
- **Data Bit:** 8 bit / **Parity:** None / **Stop Bit:** 1 bit

### 1. 노드 명세


| 레이어                 | 노드이름                         | 주요역할                                        |
| ------------------- | ---------------------------- | ------------------------------------------- |
|   1. 인지(Perceprion) | **`lidar_node`**             | 라이다 센서 구동 및 2D 점군 데이터 발행                    |
|                     | **`sensor_filter_node`**     | 아두이노 UART 통신 수신, 노이즈 필터링 후 데이터 발행           |
| 2. 판단(Planning)     | **`parking_space_detector`** | 맵 데이터를 기반으로 슬라이딩 윈도우 알고리즘을 통한 빈 주차 공간 탐지    |
|                     | **`hybrid_A_star_node`**     | 차량 제원을 고려한 최적의 주차 궤적 수학적 산출                 |
|                     | **`vehicle_control_node`**   | 산출된 주차 궤적을 따라가기 위한 실질적 모터 제어 명령 생성          |
|                     | **`safety_node`**            | 장애물 접근 시 긴급 제동을 판단하는 최우선 순위 안전 관리자          |
| 3. 제어(Control)      | **`stm32_bridge_node`**      | 라즈베리파이와 STM32 간의 명령/피드백(Hex 패킷) 변환 및 양방향 통신 |


### 2. 토픽 명세 


| 토픽명 (Topic)              | 발행(Publisher) 노드         | 구독(Subscriber) 노드                                          | 메시지 타입                           | 데이터 내용                                                               | 주파수   |
| ------------------------ | ------------------------ | ---------------------------------------------------------- | -------------------------------- | -------------------------------------------------------------------- | ----- |
| `/scan`                  | `lidar_node`             | `slam_toolbox`                                             | `sensor_msgs/LaserScan`          | RPLIDAR A1 360° 거리 및 각도 배열                                           | 10 Hz |
| `/map`                   | `lidar_node`             | `parking_space_detector`, `hybrid_A_star_node`             | `nav_msgs/OccupancyGrid`         | LiDAR 기반 2D 점유 격자 지도                                                 | 1 Hz  |
| `/parking_spaces`        | `parking_space_detector` | `hybrid_A_star_node`                                       | `geometry_msgs/PoseArray`        | 탐지된 주차 공간 중심 좌표                                                      | 이벤트   |
| `/parking_spaces_info`   | `parking_space_detector` | `hybrid_A_star_node`                                       | `std_msgs/String` (JSON)         | 주차 공간 상세 정보: `{index, mx, my, pw, ph, type, goal_yaw, score, walls}` | 이벤트   |
| `/parking_space_markers` | `parking_space_detector` | (RViz2)                                                    | `visualization_msgs/MarkerArray` | RViz2 시각화용 주차 공간 박스 마커                                               | 이벤트   |
| `/parking_path`          | `hybrid_A_star_node`     | `vehicle_control_node`                                     | `nav_msgs/Path`                  | Hybrid A* 산출 주차 궤적 웨이포인트                                             | 이벤트   |
| `/parking_path_markers`  | `hybrid_A_star_node`     | (RViz2)                                                    | `visualization_msgs/MarkerArray` | RViz2 시각화용 경로 마커                                                     | 이벤트   |
| `/cmd_vel_raw`           | `vehicle_control_node`   | `safety_node`                                              | `geometry_msgs/Twist`            | `/cmd_vel`을 보내기 전,  최종 목표 선속도(x) 및 조향각(z)을 얻기위함                      | 20 Hz |
| `/odom`                  | `stm32_bridge_node`      | `hybrid_A_star_node`, `vehicle_control_node,
slam_toolbox` | `nav_msgs/Odometry`              | STM32 엔코더 기반 차량 현재 누적 위치/속도                                          | 20 Hz |
| `/filtered_distance`     | `sensor_filter_node`     | `safety_node`                                              | `std_msgs/Float32MultiArray`     | 칼만 필터 처리된 4방향 초음파 거리 [전, 후, 좌, 우] (cm)                               | 20 Hz |
| `/cmd_vel`               | `safety_node`            | `stm32_bridge_node`                                        | `geometry_msgs/Twist`            | 최종 목표 선속도(x) 및 조향각(z) 전달                                             | 10 Hz |
| `/emergency_trigger`     | `safety_node`            | `vehicle_control_node`                                     | `std_msgs/Bool`                  | 위험단계 초과시 활성화 전달                                                      |       |

