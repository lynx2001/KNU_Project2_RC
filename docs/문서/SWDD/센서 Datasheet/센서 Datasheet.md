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


	![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/cb5df3d6-5097-4d01-b668-27d53bd33b05/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46645AWB53S%2F20260411%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260411T212943Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCou7mgpeWGNggmr%2FJ3ytd%2FvXgGce2EnXW7YmPque64uAIgHMqik7tskQuFpI9qMUePFJGpqcn5BAGB6tAV1iSny%2B8q%2FwMIThAAGgw2Mzc0MjMxODM4MDUiDKK0HR3C0Tk%2Fx8aomircA4Am6RfQP%2B5uu3tFuEr0EShyGkV2Ten40O%2FnQsGLpaKAo%2FxTnGtHRKY672VO3hDVJe%2Bg9G4lzYzfjm4W7oe762AFHvE3xAD952mxAnFQXNYEx7KgKoc1mr1%2BB22VF8f0gzMvk5wBS70rZCbMnrptjDmK30jiJ8nFL8E81KURoEd8eEkqkSD1IBceg7BWfzDVb5fRLQ7eD4ITdDJkhtAYVje3Mz%2BjXJ0gAEyLgwTKRxHxQwmpk5romfQ468kcoNDYyGcMQMCnRu3Ng7MB12AxXuFoWKeZWbp%2FJs%2BW8XCApYzulKlhDcLzkp3A%2BHRm9EtOip7OjWN5JSbzzaOD6Nu1mxlyAPU5fBPWKRUW0JaLAt2T3KwJNz32oY0YxokMjvWmhKz1mpnZYD47A16yfOT1GZJnarWdT0T1bGMpaz%2BWffi2uSFJVsUqDl5zG9aACsCEJ8sUGPufZN%2F5THYkLfHjEmfv7wKzKAQu0GDgIfjHVS9b4v%2FftElPSUa8oTHyq5du192TbOYEjDgavOL5xunwiYqDt8RA1R%2B8%2FqMF0zvMfSqGw1pAz0O7OG%2B44o35sGRueZQj05P6i2WwyCX%2FMhL7%2FURU1k67DcbgrAejJaY%2FCV%2BNvnnQGMITD4jldLtWMIvy6s4GOqUBY7gNBdAYbwp80kwD7%2B7qZv3x9okOTCeRJEYV%2F7OCd6khhSPfrRhp0KXTb3iUyXH%2FryYQ6nKD1QKsUqdLbeLgMNfbW%2BnVnsGIhwMkuPsNHkvD1AKzBBJt3SC2rY7yHpux3nhI91iCMgHQ9gVy%2BlZcJiBA9L8N%2FZW%2FSEMdvY8RN%2BOsXB1J9fNDmQhulxZratNfTm%2FUCgF%2B5Nvf6QwRYjQxQcMXfvwA&X-Amz-Signature=84de2a1b176319d50ac6b77f5a7647e79a7c1dc92fce6de97bece0a3fa46356c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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

