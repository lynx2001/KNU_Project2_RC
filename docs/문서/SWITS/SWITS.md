# SWITS


> SoftWare Integration Test Specification 소프트웨어 통합 테스트 명세서  
>   
> 각 유닛들을 연결했을 때 서로 정상적으로 통신하고 동작하는지 확인하는 테스트.  
> RPi ↔ Arduino 통신, ROS 2 토픽 흐름, 시나리오 기반 기능 연동을 검증.


---


## PDW (Parking Distance Warning)


| 통합 ID     | 테스트 항목               | 연결 구성                             | 테스트 내용                                         | 기대 결과                          | 실제 결과 |
| --------- | -------------------- | --------------------------------- | ---------------------------------------------- | ------------------------------ | ----- |
| IT-PDW-01 | Arduino ↔ RPi 시리얼 통신 | Arduino Mega → RPi 4 (USB UART)   | arduino_bridge_node 실행 후 /ultrasonic/raw 토픽 확인 | HC-SR04 거리 데이터 10Hz 이상 수신      |       |
| IT-PDW-02 | 초음파 → 필터 노드 연동       | Arduino → ultrasonic_filter_node  | 실제 장애물 30cm 배치 후 /filtered_distance 토픽 확인      | 필터링된 거리값 정상 수신, 이상치 없음         |       |
| IT-PDW-03 | 필터 노드 → PDW 경고 단계    | ultrasonic_filter_node → pas_node | 장애물 30cm → 20cm → 10cm → 5cm → 2cm 단계적 접근      | 각 거리에서 1~5단계 경고 단계 정확히 전환      |       |
| IT-PDW-04 | 경고 단계 → 부저 출력        | pas_node → Arduino (부저 PWM)       | 각 경고 단계 진입 시 부저 명령 전달                          | 단계별 경고음 패턴 실제 출력 (간헐/일반/빠름/연속) |       |
| IT-PDW-05 | 전체 PDW 체인            | HC-SR04 → Arduino → RPi → 부저      | 장애물을 서서히 접근시키며 전체 흐름 확인                        | 거리 감지부터 경고음 출력까지 지연 100ms 이내   |       |


---


## PCA (Parking Collision-Avoidance Assist)


| 통합 ID     | 테스트 항목             | 연결 구성                                  | 테스트 내용                      | 기대 결과                                   | 실제 결과 |
| --------- | ------------------ | -------------------------------------- | --------------------------- | --------------------------------------- | ----- |
| IT-PCA-01 | PDW 5단계 → PCA 트리거  | pas_node → pca_node                    | 장애물 2cm 이내 접근 (5단계 진입)      | pca_node 자동 활성화, /pca/state = TRIGGERED |       |
| IT-PCA-02 | PCA 트리거 → 모터 정지 명령 | pca_node → arduino_bridge_node → STM32 | PCA 활성화 후 모터 정지 명령 전달 확인    | 모터 정지 명령 전송 지연 20ms 이내                  |       |
| IT-PCA-03 | 모터 정지 → 완전 정지 확인   | STM32 → 구동 모터 → 엔코더 피드백                | 제동 명령 후 엔코더 속도 = 0 확인       | 완전 정지 확인 후 /pca/state = STANDBY         |       |
| IT-PCA-04 | 기어 복귀 → 제어권 해제     | pca_node → Cmd Vel Mux                 | STANDBY 상태에서 기어 D(전진) 신호 입력 | /pca/state = INACTIVE, 수동 제어 복귀         |       |
| IT-PCA-05 | PCA 우선순위 오버라이드     | pca_node vs. 수동 입력 (Cmd Vel Mux)       | PCA 활성화 중 수동 전진 명령 동시 입력    | PCA 제동 명령이 수동 명령보다 우선 실행                |       |


---


## APA (Autonomous Parking Assist)


| 통합 ID     | 테스트 항목          | 연결 구성                                   | 테스트 내용                         | 기대 결과                            | 실제 결과 |
| --------- | --------------- | --------------------------------------- | ------------------------------ | -------------------------------- | ----- |
| IT-APA-01 | 라이다 → 주차 공간 탐색  | RPLiDAR A1 → parking_planner_node       | 주차 공간 앞에서 서행 통과                | 주차 공간 크기 인식 및 가능/불가 판단 출력        |       |
| IT-APA-02 | 카메라 → 차선 인식     | Pi Camera V2 → usb_cam_node             | 흰 테이프 차선 위에서 카메라 노드 실행         | /image_raw 토픽으로 차선 영상 정상 수신      |       |
| IT-APA-03 | 엔코더 → 오도메트리 발행  | Arduino 엔코더 → /odom 토픽                  | 차량 100mm 이동 후 /odom 토픽 확인      | 이동 거리 100mm ±5mm 정확히 발행          |       |
| IT-APA-04 | 궤적 명령 → 서보 조향   | parking_planner_node → Arduino (서보 PWM) | 목표 조향각 명령 전송                   | 서보모터가 명령 각도로 정확히 이동 (±1°)        |       |
| IT-APA-05 | 궤적 명령 → 구동 모터   | parking_planner_node → STM32 → 구동 모터    | 전진/후진/속도 명령 전송                 | 명령에 맞게 모터 정상 동작                  |       |
| IT-APA-06 | 평행 주차 전체 시나리오   | 전체 소프트웨어 스택                             | 평행 주차 공간에서 APA 활성화 후 전체 4단계 수행 | 주차 완료, 위치 오차 ±10cm, 각도 오차 ±5° 이내 |       |
| IT-APA-07 | T자 주차 전체 시나리오   | 전체 소프트웨어 스택                             | T자 주차 공간에서 APA 활성화 후 전체 3단계 수행 | 주차 완료, 위치 오차 ±10cm, 각도 오차 ±5° 이내 |       |
| IT-APA-08 | APA 중 장애물 돌발 출현 | 전체 스택 + 초음파/라이다                         | APA 진행 중 경로 내 장애물 갑작스럽게 배치     | APA 즉시 중단, 차량 안전 정지              |       |

