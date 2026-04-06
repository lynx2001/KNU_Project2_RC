# untitled

- Ubuntu 22.04 설치 (Pi)
- ROS2 Humble 설치 shell 스크립트 작성 (명령어)
	- apt 의존성 + ros-humble-desktop-full + colcon 자동화
- ROS2 패키지 의존성 목록 확정 / install 명령어 작성
	- slam-toolbox, nav2, rplidar-ros, v4l2-camera, micro-ros-agent, rosbridge-suite, ackermann-msgs
- Python requirements.txt 작성
	- opencv-python, numpy, transforms3d

여기까지 내용은 아래 페이지에 작성했습니다. 한번 확인 부탁드립니다.

- VNC 서버(tigervnc) 자동 설정 스크립트 작성
- GitHub 레포 생성 및 패키지 디렉토리 구조 확정
- 전체 ROS2 노드 목록 및 토픽 인터페이스 정의
	- 노드명, 토픽명, 메시지 타입, 발행/구독 관계 표로 정리
- STM32 ↔ Arduino Mega 역할 분리 인터페이스 문서화
	- STM32: 모터·서보 PWM / Arduino: 센서·Pi 통신 프로토콜
- Arduino ↔ Pi micro-ROS 통신 프로토콜 설계
	- 토픽 목록, 메시지 타입, 시리얼 baudrate, 전송 주기
- 데이터 처리
	- 초음파 센서
	- LiDAR
	- Pi Camera
	- etc
