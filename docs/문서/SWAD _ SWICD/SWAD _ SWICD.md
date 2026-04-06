# SWAD / SWICD


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


---


---


---


---


---


---


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

