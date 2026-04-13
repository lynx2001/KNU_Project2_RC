# 센서 Datasheet


# **LiDAR : RPLiDAR A1 (A1M8)**


**동작 방식 및 물리적 스펙**

- **구동 원리**
	- 레이저 삼각측량
	- 정지 상태에서 360도 스캔을 통해 물리적 빈 공간(Free Space) 및 주변 지형을 정밀 스캔
- **핵심 성능 지표**
	- **감지 범위:** **0.15m ~ 12m** (초근접 긴급 제동은 STM32 초음파망에 전적으로 위임)
	- **스캔 주파수:** 5.5Hz (1초에 5.5바퀴 회전) / **샘플레이트:** 8,000 samples/sec
	- **해상도:** 각도 ≤ 1° (약 0.33° 간격으로 점 생성) / 거리 0.5mm 오차 수준

**출력 데이터 형식 및 ROS 2 메시지 매핑**

- **Raw 데이터 형식**

	[Angle(deg), Distance(mm), Quality] 기반 시리얼 데이터 스트림

- **표준 메시지 타입**

	**sensor_msgs/LaserScan**

- **기본 토픽 매핑**

	**/scan** (rplidar_ros 노드에서 자동 개설 및 발행)

- **데이터 흐름 및 ROS 2 파이프라인 상세 (자율 주차 맵핑)**

	**1. 포장 및 발행 (Driver)**


	라즈베리파이의 **rplidar_ros** 노드가 수신된 [각도, 거리] 데이터를 **sensor_msgs/LaserScan** 으로 포장하여 **/scan** 토픽 발행


	**2. 지도 및 코스트맵 생성**


	**slam_toolbox** 노드가 **/scan**을 받아서 벽, 장애물 유무를 2D 지도(**/map**)로 발행하고, 차량 부피(1:10 스케일)를 반영하여 벽을 부풀린 코스트맵(Costmap)을 생성


	**3. 주차 공간 인식 및 목적지 확정 (Space Recognition)**

	- **과정:** 완성된 **/map** 데이터를 분석합니다. 지도 상에서 장애물이 없는 깨끗한 직사각형 공간(Free Space)을 찾아냅니다.
	- **출력:** 찾아낸 빈 공간의 중앙 좌표와 차량이 정렬해야 할 각도를 계산하여 최종 목적지(Goal Pose)를 생성

	**4. 궤적 생성 (Hybrid A*)**


	주차 계획 노드가 코스트맵 위에서 목적지로 향하는 충돌 없는 평행주차 S자 최적 궤적을 연산하여 **nav_msgs/Path** 로 발행. 이후 컨트롤러 노드가 이를 추종하여 STM32로 조향/속도 명령 하달


**💡 레퍼런스 적용 (GitHub 벤치마킹)**


	**slam_toolbox & PythonRobotics**


	LiDAR 센서는 오직 지형 맵핑에만 집중하며, 복잡한 평행주차 궤적은 하이브리드 A* 알고리즘 노드가 전담하도록 설계하여 시스템 연산 효율 극대화


	![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/cb5df3d6-5097-4d01-b668-27d53bd33b05/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XMTU4DKS%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214643Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIB4fl0LBYi09I22g5eSK8Qpv08iNuneA018vrTWsfkdpAiEA5pqGb%2F7qYfXfhw0NXnYLsjK8WquCq7RikZ6DZv4ft3Qq%2FwMIfhAAGgw2Mzc0MjMxODM4MDUiDNZFKO0bab578XzbdyrcA0tFYxKPgIHJAPdgp5cV3bWnDl5e2HucV3ZfUjQCLww%2FUAd64y9TzgBy%2BsEND1xhPQrJUyEX79UN4%2FIPQTmEngJiBdTfZE3VvRnCvPDP%2F%2FV5pkZ9ONn3D3yQd3HpR2Hs8pMZ4hxOYfVYcI8bZ9R4TpdhodFmM5WVZnST%2B975Qbu0XCfFVAdEanUZ7MfPy3sI0uzrW54%2BFlDpvXgJzcX081ilUoPlg3PPg5sLNc6BMz3y3J74kyW5gZpSndiqBoTluaIqYsJFAr625bbwbH50YLXXqOuEw9W7W60yPxrege1oeF9uWlQIfsdc6%2BGGXTjIQJgcL05bNmG%2FsKvHsxyX7cYLDrq0hEmc2ALgcmAPcx5qWIrBxpQrRzCv5Eckz9Lr1pzTkWGpvi70%2FF2BCw3xFzYHbNYyGqUJlY5VWdp3Y4CSAwPct5gbiZA6ETrL%2FUAT8YVXZKIvMn7yXrNwe5ZdRC%2F8SRW5GgqHllSaz%2Fxqx4hkEBt%2B0iu0GmWgT7B%2FdpOHE%2BZvc3MxN8OvNB3mvP9B7vC0Ve8iEO7FQ2J6sVqpoaUxuPUthTpnBtYCVuJgHdhFxuMYdp34QAc6Z8CjwSFbaGK5MPkxhRVLod0137nK1oTW9vutLivMMxwCTVcZMO%2B09c4GOqUBKX75jun9DyTib5BqcSjUy7C8kULmsjXAyYGOrTjtBq63zjDkSbEBIQA1HuS9VtH4%2BjZ%2FNKg3Cwq5FK1As4oOsmm5pU%2Fsy6MsDfk%2BNHuLrv1QyHUwLQafZpS2czcBpa%2FyCRiFX4Rq1OuTJId6B3xe%2FsUgf%2FkrjuxTQQj9QW2jtuGmp6kXdR5rl2JNJbMA4OliBuQ2ZGcLCn30WIKuGyYiGpRe%2F08k&X-Amz-Signature=bbf285bc1380c81d5d4a8c1edd4423a111d15f5ec31fcce660dc133ab89fe6e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Pi Camera v2
- 초음파 센서

**동작 방식 및 물리적 스펙**

- **구동 원리**

	ToF 방식 — 아두이노가 10ms 간격으로 12개 센서를 순차 트리거링하여 수집하며 거리에 따른 **로컬 부저** 작동

- **핵심 성능 지표**

	감지 범위: 2cm ~ 400cm / 측정 각도: 약 15° 원뿔형 / 라이다 사각지대 및 후방 감시 전담


**출력 데이터 형식 및 ROS 2 메시지 매핑**

- **Raw 데이터 형식**

	12개 센서의 거리(cm) 데이터가 포함된 Float32 배열

- **표준 메시지 타입**

	**std_msgs/Float32MultiArray**

- **기본 토픽 매핑**

	**/filtered_distance** (arduino_bridge_node를 통해 발행)


**데이터 흐름 및 중앙 집중형 제동 파이프라인**


	**1. 수집 및 정제**


		아두이노 메가가 데이터를 수집하고 칼만 필터로 정제 후 USB 시리얼을 통해 라즈베리파이로 전송


	**2. 중앙 판단 (PCA)**


		라즈베리파이가 데이터를 수신하여 '주차 모드' 여부와 3cm 미만 거리를 확인, 긴급 상황 시 STM32로 정지 명령 패킷 송신


	**3. 제동 실행**


		STM32 보드가 라즈베리파이의 PCA 패킷을 수신하는 즉시 모터 전원(PWM)을 차단하여 차량 정지


**💡 레퍼런스 적용 (GitHub 벤치마킹)**


	**atsushisakai/PythonRobotics**


	칼만 필터 알고리즘을 아두이노 펌웨어에 이식하여 라즈베리파이 판단 전 선제적 노이즈 차단 및 데이터 신뢰성 확보

