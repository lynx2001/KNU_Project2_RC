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


	![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/cb5df3d6-5097-4d01-b668-27d53bd33b05/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665ULFQKBF%2F20260408%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260408T214133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDwaCXVzLXdlc3QtMiJIMEYCIQCv7MITGJSRpURjmv6QZ8UJsWdGBkPJV%2Bues6WgrhsWmgIhAIyiablV%2FF7J5cMuTdVmmgbtiZTDPlJCqm3787hD3CO7Kv8DCAUQABoMNjM3NDIzMTgzODA1Igw6sMoAOv24KvUGAucq3AMwrAkyMklZV5fAQc9B3YB0%2FjKK3mjR00iNBeQqg%2F0zICWZwbv9GlvZy3w%2F6o7KSo2FiO7IsM5jyRsGWgyljDkDPbfrUhXijWvZtxpD7qUCxS9Ckc5rZbz4yTICpO%2BlACnwJT9qyPbjzLzF905PAK6KaLm%2FRICFb8e0MzE6An2%2BY24Rvo%2By%2FisjaXOC9lMkJbsCLpr%2BczbDz91suHQkFObT0rfrsf6eI5p38Ev58lXAsnGXUZwABIO3jFR%2F9Yd%2FO3a7R%2Bp7I0tZ3soC9%2FzO%2BTFjeHoRkGcaGDQJWlR%2F7HAYcOaCpWhucyXH%2FuY0OvI27vNFaqlZrKY%2BYpIfvXHkU5fKlTfFbMcFOxEvYlPTaQXt312717eFbGYP0d5WTurPbPiVJVvPBe00h6uNu1%2FAg8ElY6xoc5FO7RJSAokB5HpKEiSkr273mB9mY1TZ7o9M22X9ni7jtZ0jkPM5lyy8hMGCrEvSz0SDriBV0XFnjLlo769dkO4HJNrx%2BSHL0JkRsdgSyu%2FXOY%2FtIzjumHD0cK%2FdYypiBhWKO5iXwjykNinpHQHuLzxHmqRrzE9rrK6gPVphu4hkWSeiutTaICrYUNkFaCQcVNsryrmoV3%2Bn0%2FLodL8pSo4xbveyn6gHEzCH6NrOBjqkAXTzsrIrZOYaKlh%2BK%2FdH6oXPk1kJwMJZ6vmJmOAFUhkPGQ%2FEmfZRQqbfGX1zHsMnNFlTMNBMtIkSVQ1h1ozfPcFMOusf34Gq2kTzE0iSQ4oYhYXSi8hwULy%2BGEia6FYJB1KqVs5%2Fz9SV4qoSA%2F6QoywCkmSMP%2Br2EeBFezTNq1czz0S6RXV3JkAO3K0w240WHXSDXqdsy6cALu5QFquM0ekMpIJE&X-Amz-Signature=923cdd7c728c2affcebe390ed58966395b94827dcfaf959154387a395466772c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

