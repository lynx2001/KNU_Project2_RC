# SDS 설계 사양서 [하드웨어]


# System Design Specification


**[System Overview]**


본 시스템은 ROS 2 기반의 자율주행 알고리즘을 수행하고 LiDAR와 Vision camera를 융합하여 주행 환경을 인지 및 제어하는 1:10 스케일의 자율주행 RC카 하드웨어 플랫폼이다. 중앙 제어부[Raspberry Pi]와 하위 제어부[Arduino]로 역할을 분담하여 연산 효율과 제어 안정성을 극대화한다.


**[Hardware Components]**


| 메인 프로세서 | Raspberry Pi 4                  | ROS 2 구동, 자율주행 알고리즘 연산, 센서 데이터 융합                  |
| ------- | ------------------------------- | -------------------------------------------------- |
| 중위 프로세서 | STM32                           | 실시간 모터 PWM 제어                                      |
| 하위 컨트롤러 | Arduino Mega 2560               | 초음파 센서 I/O 처리, 하드웨어 인터럽트 처리                        |
| 인지 센서부  | RPLiDAR A1
Pi Camera V2
HC-SR04 | 360도 2D 맵핑(SLAM) 및 장애물 인지
주차선 및 차선 영상 인식
전/후/측방 인식 |
| 구동 / 조향 | JGB37-520
MG996R 서보모터           | 후륜 구동용 DC 기어드 모터 (엔코더 포함)
전륜 조향 제어 (조향각 제어)        |
| 모터 드라이버 | 4channel                        | 구동 모터의 정역회전 및 PWM 속도 제어                            |
| 메인 전원   | 11.1V Li-Po 배터리                 | 시스템 전체 전원 공급                                       |


**[Power Distribution Architecture]**


노이지 간섭과 전아 강하를 방지하기 위해 모터부(고전류)와 제어부(정전압)를 병렬로 분리

- 안전망 구축: 20A 차량용 퓨즈 + 30A 전원 스위치 직렬 배치
- 커넥터 표준화: XT60 단자 통일
- 전원 분기(Y cable)
	- 분기 A (구동부 직결): 11.1V 전압을 모터 드라이버(STM32)로 직접 인가
	- 분기 B (제어부 강하): 5V UBEC를 통해 11.1V → 5.0V 강하
		- Raspberry Pi / Arduino Mega 전원 공급

**[Communication Interface] 3Brain Layer**

- Raspberry Pi ↔ Sensor
	- LiDAR: USB 3.0
	- 카메라: 15pin CSI 포트
- Raspberry Pi ↔ Arduino
	- USB 2.0 시리얼 통신 (UART)
- Raspberry Pi ↔ STM32
	- DC 모터 제어
- STM ← Arduino ↔ Actuator/Sensor
	- 초음파 센서
	- 조향 모터 제어
	- 하드웨어 인터럽트
