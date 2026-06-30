# SWDD


# Software Detailed Design


## PAS/PDW
- PAS( Parking Assist System) : 주차 과정 중 시/청각으로 운전자를 보조해주는 시스템
- PDW( Parking Distance Warning) : 거리에 따라 경고음을 발생

**1. PAS(PDW) 시스템 기능 정의**


	본 시스템은 차량 주변의 장애물을 감지하여 단계별 경고를 제공하고, 충돌 위험 시 강제로 정지합니다.
	


	• **거리 감지:** 초음파 센서(HC-SR04)를 통해 전/후방 장애물과의 거리를 실시간으로 측정합니다.
	
	• **신호 처리:** 수집된 거리 데이터의 노이즈를 제거하기 위해 필터링 알고리즘을 적용합니다.
	
	• **단계별 경고(PDW):** 장애물과의 거리에 따라 부저음의 주기를 변화시켜 운전자에게 위험 정도를 알립니다.
	
	• **긴급 제동(PCA):** 충돌 임계치에 도달하면 모터를 즉시 정지시켜 사고를 방지합니다.


**2. 데이터 흐름 및 로직 설계**


**2.1 거리 데이터 필터링 (Software Logic)**


	초음파 센서의 특성상 발생하는 튀는 값(Outlier)을 제어하기 위해 아두이노에서 다음과 같은 처리를 수행합니다.
	• **Median Filter:** 최근 3~5개의 데이터 중 중간값을 선택하여 급격한 노이즈를 차단합니다.
	
	• **Low Pass Filter:** 이전 데이터와 현재 데이터에 가중치를 두어 부드러운 거리 변화를 산출합니다.


	**2.1.1 이동 평균 필터**


	초음파 센서는 측정 시 주변 소음이나 반사각에 의해 값이 갑자기 튀는 '노이즈'가 자주 발생합니다.  이동 평균 필터는 다음과 같은 방식으로 이를 해결합니다.
	
	• **데이터 윈도우 생성**: 가장 최근에 측정된 n개의 데이터(예: 5개 또는 10개)를 저장하는 배열(큐)을 만듭니다.
	• **평균 계산**: 새로운 데이터가 들어올 때마다 가장 오래된 데이터를 버리고, 현재 배열에 있는 데이터들의 평균값을 최종 거리값으로 사용합니다.
	• 
	**결과**: 값이 급격하게 변하더라도 평균값이 적용되어 전체적인 데이터 흐름이 부드러워집니다. 

	1. 초음파 센서로부터 현재거리 d 읽음.
	2. 배열 업데이트 [d1 , d2, d3, d4, d5] 형태 배열에서 오래된 값 빼고 새 d를 넣음
	3. 평균 도출 d_avg = (d1 + d2 + d3 + d4 + d5)/5
	4. d_avg로 PCA 작동여부 결졍

**2.2 경고 및 제동 알고리즘 (State Machine)**
후진기어를 넣거나 pas기능을 활성화 했을 때, 거리(d)에 따른 시스템의 상태 변화는 다음과 같이 설계합니다.


| 상태        | 거리 조건(d)   | 동작               | 비고                   |
| --------- | ---------- | ---------------- | -------------------- |
| Safe      | d > 11cm   | 부저음 x            | PAS 버튼 활성화 or R기어 상태 |
| Warning 1 | 8 < d ≤ 11 | 삐—삐—             |                      |
| Warning 2 | 5 < d ≤ 8  | 삐-삐-삐-삐          |                      |
| Warning 3 | 2 < d ≤ 5  | 삐———-            |                      |
| Warning 4 | d ≤ 2      | 삐——— + 긴급제동(PCA) | PCA 참고               |


## PCA(Parking Collision-Avoidance Assist)

```javascript
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
import serial

class PCASafetyNode(Node):
    def __init__(self):
        super().__init__('pca_safety_node')
        
        # --- 파라미터 (원할 때 외부에서 쉽게 값 변경 가능) ---
        self.declare_parameter('safe_distance_cm', 3.0)
        self.min_safe_dist = self.get_parameter('safe_distance_cm').value
        
        self.current_min_dist = 999.0
        self.latest_nav_cmd = Twist()
        self.pca_active = False

        # --- 아두이노 연결 ---
        try:
            self.arduino = serial.Serial('/dev/ttyACM0', 115200, timeout=0.05)
            self.get_logger().info('✅ PDW(아두이노) 연결 성공!')
        except serial.SerialException:
            self.get_logger().error('🚨 아두이노 시리얼 포트 에러!')
            self.arduino = None

        # --- 토픽 연결 ---
        # (중요) 주행 제어기(Pure Pursuit 등)가 출력하는 토픽을 구독합니다.
        self.sub_nav = self.create_subscription(Twist, '/nav_cmd_vel', self.nav_callback, 10)
        self.pub_cmd = self.create_publisher(Twist, '/cmd_vel', 10)

        self.timer = self.create_timer(0.02, self.control_loop)

    def nav_callback(self, msg):
        # 운전기사 노드가 내린 주행 명령 저장
        self.latest_nav_cmd = msg

    def control_loop(self):
        # 1. 초음파 데이터 파싱 (안전한 에러 처리)
        if self.arduino and self.arduino.in_waiting > 0:
            try:
                line = self.arduino.readline().decode('utf-8').strip()
                if line.startswith('S,') and line.endswith(',E'):
                    parts = line.split(',')
                    if len(parts) == 6:
                        # 4개 센서 중 최솟값 찾기
                        dists = [float(p) for p in parts[1:5]]
                        self.current_min_dist = min(dists)
            except (ValueError, UnicodeDecodeError):
                pass # 쓰레기값이 들어와도 무시 (안 뻗음)

        # 2. PCA 제동 판단 로직
        out_cmd = Twist()
        if self.current_min_dist < self.min_safe_dist:
            out_cmd.linear.x = 0.0
            out_cmd.angular.z = 0.0
            if not self.pca_active:
                self.get_logger().error(f'🛑 [PCA 발동] 장애물 감지: {self.current_min_dist}cm! 긴급 제동!')
                self.pca_active = True
        else:
            out_cmd = self.latest_nav_cmd
            if self.pca_active:
                self.get_logger().info('✅ [PCA 해제] 경로 클리어. 정상 주행 재개.')
                self.pca_active = False

        # 3. STM32(하드웨어)로 전달
        self.pub_cmd.publish(out_cmd)

def main(args=None):
    rclpy.init(args=args)
    node = PCASafetyNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        if node.arduino and node.arduino.is_open:
            node.arduino.close()
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## **1. 개요 (Overview)**



**주차 충돌방지 보조(PCA, Parking Collision-Avoidance Assist)**는 저속 주행 중 주변 장애물과의 충돌 위험을 감지하여 운전자에게 경고를 알리고, 충돌 직전 시스템이 모터를 능동적으로 제어하여 차량을 강제로 정지시키는 안전 기능입니다.


**💡 핵심 가치**
저속 주행(주차/출차) 시 부주의로 인한 사고를 미연에 방지하고, 물리적 제동을 통해 피해를 최소화함.



## **2. 작동 프로세스 (Operational Flow)**



시스템은 충돌을 방지하기 위해 아래의 4단계 과정을 실시간으로 반복 수행합니다.
1. **거리 감지 (Sensing)**: 센서를 통한 장애물과의 거리 측정
2. **위험 단계 판별 (Assessment)**: 충돌 가능성 및 위험 수위 판단
3. **제어권 오버라이드 (Override)**: 운전자 조작보다 시스템 제어 우선순위 상향
4. **긴급 제동 (Emergency Braking)**: 모터 인터럽트를 통한 강제 정지


## **3. 활성화 조건 (Activation Criteria)**



PCA 시스템은 다음 조건 중 하나를 충족할 때 활성화됩니다.
• **PAS(Parking Assist System) 연동**: PAS 시스템 활성화 중 **5단계(최근접)** 진입 시
• **저속 주행 상태**: 차량 속도가 **5km/h 미만**인 경우


## **4. PCA 제어 알고리즘 (Logic & Control)구분 상세 내용**


**제동 트리거:** PAS 시스템이 5단계(최단 거리) 진입 시 즉시 발생


**제어 우선순위:** 사용자의 가속/제동 페달 입력보다 **시스템의 제동 신호를 최우선**으로 설정 (Override)


**모터 제어:** 모터 드라이버의 입력 값을 직접 변경하여 **전자식 브레이크(E-Brake)** 구현


**제어권 회복:** 차량의 **완전 정지** 확인 후, 기어가 **D(전진) 또는 N(중립)**으로 변경될 때 해제



## **5. 확인 및 해제 (Termination)**


긴급 제동 이후 운전자가 다시 차량의 주도권을 갖기 위한 조건입니다.
• **완전 정지 확인**: 시스템에 의해 차량 속도가 0km/h에 도달했는지 판단.
• **기어 변속**: 사고 위험 구역에서 벗어나기 위해 기어를 변경(P→D 또는 R→N 등)하면 시스템 제어가 종료되고 운전자의 조작 신호를 다시 정상적으로 수용합니다.


## APA(Autonomous Parking Assist)

**APA(Automated Parking Assist, 자동 주차 보조)**는 단순한 경고를 넘어 차량이 스스로 주차 궤적을 생성하고 조향과 구동을 제어하는 고도화된 시스템입니다.


**1. 인지 및 공간 탐색 (Perception & Detection)**
차량이 주차 가능 구역을 스스로 찾아내는 단계입니다.


	
• **LiDAR 맵핑**: 360도 회전하는 RPLiDAR A1을 사용하여 주변 환경의 2D 점유 지도(Occupancy Grid Map)를 생성하고 빈 공간을 탐색합니다.


	
• **카메라 영상 인식**: Pi Camera V2를 통해 바닥의 주차선과 'AUTOMATED PARKING ZONE' 표시를 인식하여 목표 좌표를 설정합니다.


	
• **센서 데이터 퓨전**: LiDAR의 장거리 정밀도와 초음파 센서(HC-SR04)의 근거리 신뢰도를 결합하여 사각지대 없는 장애물 인지를 수행합니다.


**2. 경로 계획 및 생성 (Path Planning)**


목표 지점까지의 최적 궤적을 수학적으로 계산하는 단계입니다.


	• **기하학적 궤적 산출**: 차량의 조향 각도와 이동 거리를 계산하여 평행 주차 또는 T자 주차를 위한 곡선 경로를 생성합니다.
	
	• **Ackermann Steering 모델 적용**: 전륜 조향 서보 모터(MG996R)의 특성을 고려하여 최소 회전 반경 내에서 진입 가능한 경로를 도출합니다.


	
• **상태 머신(FSM) 설계**: '공간 탐색 -> 정지 -> 후진 진입 -> 정렬 -> 주차 완료'로 이어지는 일련의 시퀀스를 관리합니다.


**3. 하위 제어 및 추종 (Control & Following)**
계산된 경로를 물리적인 움직임으로 변환하는 단계입니다.


	• **상위-하위 통신**: Raspberry Pi(ROS 2)에서 계산된 목표 조향각과 속도를 USB 시리얼 통신을 통해 Arduino Mega로 전송합니다.


	
• **정밀 액추에이터 제어**: Arduino는 수신된 명령에 따라 서보 모터의 각도를 조절하고, DC 모터의 PWM을 제어합니다.


	
• **엔코더 피드백 루프**: JGB37-520 모터의 엔코더 데이터를 실시간으로 읽어 실제 이동 거리가 계획된 경로와 일치하는지 모니터링하고 보정합니다.


**4. 안전 보장 (Safety System)**
자동 주차 중 발생할 수 있는 돌발 상황에 대비하는 단계입니다.


	• **중첩된 안전 로직**: APA 알고리즘이 동작하는 중에도 초음파 센서 기반의 **PCA/AEB 로직**은 항상 백그라운드에서 실행되어야 합니다.
	
	• **긴급 제동 개입**: 자동 주차 경로상에 갑작스러운 장애물이 나타나 충돌 임계치(예: 15~20cm) 이하로 떨어지면, 즉시 모든 모터 구동을 중단하고 정지합니다.
	


# 구현 알고리즘


**1. 공통 전제 조건 (Pre-requisites)**


	• **공간 인식**: LiDAR와 초음파 센서를 통해 주차 공간의 폭(W)과 깊이(D)가 차량 크기 대비 충분한지 먼저 확인합니다.


	
• **기준점 설정**: 주차 시작 지점(Start Point)에서 차량의 뒤축 중심을 원점으로 설정하고 궤적을 계산합니다.
	
	• **제어 방식**: 아두이노는 엔코더 값을 읽어 이동 거리(L)를 측정하고, 서보 모터 각도(\delta)를 조절하여 궤적을 추종합니다.


**2. 평행 주차(Parallel Parking) 알고리즘 설계**
평행 주차는 두 개의 원호(Arc)를 연결하는 'S자 궤적'이 핵심입니다.


	**[단계별 시퀀스]**
	1. **진입 대기**: 주차 공간의 앞차와 나란히 정지합니다.
	
	2. **1차 후진 회전 (Phase A)**: 핸들을 오른쪽 끝(\delta_{max})으로 꺾고, 차량 중심축이 주차 공간과 약 45°가 될 때까지 후진합니다.
	
	3. **2차 역회전 (Phase B)**: 핸들을 왼쪽 끝(-\delta_{max})으로 반대 교정하고, 차체가 주차선과 평행이 될 때까지 후진합니다.
	
	4. **정렬 및 종료**: 전/후방 초음파 센서(PAS) 데이터를 확인하며 앞뒤 간격을 맞춘 후 정지합니다.


**3. T자 주차(Perpendicular Parking) 알고리즘 설계**
T자 주차는 회전 반경을 고려하여 차량을 수직으로 밀어 넣는 'L자 궤적'입니다.


	**[단계별 시퀀스]**
	1. **위치 확보**: 주차 칸과 수직 방향으로 약 1~1.5m 떨어진 지점에서 서행하며 주차 구역을 통과합니다.
	
	2. **회전각 계산**: 주차 칸의 중심선과 차량의 회전 반경이 만나는 변곡점을 계산합니다.
	
	3. **후진 진입**: 핸들을 오른쪽 끝(\delta_{max})으로 고정하고 후진하여 주차 칸 안으로 진입합니다.
	
	4. **직진 교정**: 차체가 주차선과 수평이 되면 핸들을 중앙(0)으로 정렬하고 엔코더 거리만큼 후진하여 마무리합니다.


| **구분**    | **평행 주차 (S-Curve)**        | **T자 주차 (L-Curve)**    |
| --------- | -------------------------- | ---------------------- |
| **핵심 변수** | 조향 전환 지점(Switching Point)  | 진입 시작 지점(Entry Point)  |
| **조향 특성** | 최대 조향 → 역방향 최대 조향          | 최대 조향 → 정중앙 정렬         |
| **센서 역할** | 측방 초음파(장애물 이격 거리 유지)       | 후방 초음파(벽면 충돌 방지/AEB)   |


## SPAS_환경구축

# SPAS 개발 환경 구축 가이드


> 초보자를 위한 가이드입니다.  
> 라즈베리파이 용 환경 구축 가이드이며 개발 PC의 환경 구축은 다음 페이지를 참고해주시기 바랍니다.   
> 명령어를 왜 치는지, 무슨 의미인지까지 전부 설명합니다.  
> Ubuntu에서는 `Ctrl + Alt + T` 를 누르면 터미널이 열립니다.


## SPAS_개발PC_환경구축

# SPAS 개발 PC 환경 구축 가이드


> 이 문서는 **개발 노트북(Windows / macOS)** 기준으로 작성된 환경 구축 가이드입니다.  
> 라즈베리 파이 환경 구축은 별도 문서를 참고하세요.


---


> **왜 개발 PC에도 ROS 2를 설치해야 하나요?**  
> 라즈베리 파이에서만 작업하면 RC카에 모니터와 키보드를 매번 연결해야 해요.  
> 개발 PC에 ROS 2를 설치하면 아래가 가능해집니다.

	- 노트북에서 코드를 작성하고 SSH로 라즈베리 파이에서 실행
	- 라즈베리 파이의 센서 데이터를 노트북 RViz2로 실시간 시각화
	- 노트북 터미널에서 `ros2 topic list` 로 전체 시스템 모니터링

	한 마디로, **라즈베리 파이는 실행 담당, 노트북은 개발 및 모니터링 담당**으로 역할을 나누는 겁니다.


---


## 운영체제별 설치 경로


| 운영체제                          | 방법                          | 난이도 |
| ----------------------------- | --------------------------- | --- |
| Windows 10 / 11               | WSL2 (Windows 안에 Ubuntu 설치) | 중간  |
| macOS (Intel / Apple Silicon) | Homebrew + ROS 2 네이티브 설치    | 중간  |
| Ubuntu (Linux 네이티브)           | 라즈베리 파이 가이드와 동일             | 쉬움  |


노트북이 Ubuntu라면 라즈베리 파이 환경 구축 문서의 2~5번 섹션을 그대로 따라 하면 됩니다.
아래는 Windows와 macOS 기준으로 설명합니다.


---


## Windows 환경 구축 (WSL2 + Ubuntu 22.04)


### WSL2가 뭔가요?


WSL2(Windows Subsystem for Linux 2)는 **Windows 안에서 Linux를 돌릴 수 있게 해주는 기능**입니다. 듀얼부팅처럼 재부팅할 필요 없이, Windows를 쓰면서 동시에 Linux 터미널을 열 수 있어요.


ROS 2는 Linux 환경에서 가장 안정적으로 동작하기 때문에, Windows에서는 WSL2 안에 Ubuntu 22.04를 설치하고 그 안에 ROS 2를 설치하는 방식을 씁니다.


전체 구조를 그림으로 보면 이렇습니다:


```text
Windows 10 / 11
└── WSL2
    └── Ubuntu 22.04
        └── ROS 2 Humble
            └── 우리가 짜는 ROS 2 노드들
```


---


### Step W-1. WSL2 활성화


PowerShell을 **관리자 권한**으로 실행합니다.
(시작 메뉴에서 PowerShell 검색 → 우클릭 → 관리자 권한으로 실행)


```powershell
wsl --install
```


이 명령어 하나로 WSL2 활성화와 Ubuntu 설치가 자동으로 진행됩니다.
설치가 끝나면 **PC를 재부팅**합니다.


> **명령어가 안 먹힌다면?**  
> Windows 버전이 너무 낮은 경우입니다. Windows 10 버전 2004(빌드 19041) 이상이어야 해요.  
> `winver` 명령어로 버전을 확인하고, Windows Update로 최신 버전으로 업데이트한 뒤 다시 시도하세요.


---


### Step W-2. Ubuntu 22.04 설치


재부팅 후 PowerShell에서 아래 명령어를 실행합니다.


```powershell
wsl --install -d Ubuntu-22.04
```


설치가 완료되면 Ubuntu 터미널이 자동으로 열리고, 사용자명과 비밀번호를 설정하라고 합니다.
원하는 사용자명과 비밀번호를 입력하세요.


> **비밀번호 입력 시 화면에 아무것도 안 보이는 게 정상입니다.**  
> Linux에서는 보안상 비밀번호를 입력해도 화면에 표시가 안 돼요. 그냥 입력하고 엔터를 누르면 됩니다.


설치 확인:


```powershell
wsl --list --verbose
```


아래처럼 Ubuntu-22.04가 Running 상태이면 정상입니다.


```text
  NAME            STATE           VERSION
* Ubuntu-22.04    Running         2
```


---


### Step W-3. Windows Terminal 설치 (권장)


기본 Ubuntu 터미널보다 Windows Terminal이 훨씬 편합니다.
Microsoft Store에서 **Windows Terminal** 을 검색해서 설치하세요. 무료입니다.


설치 후 Windows Terminal을 열면 상단 탭에서 Ubuntu-22.04를 선택해서 바로 WSL2 터미널을 열 수 있어요.


---


### Step W-4. WSL2 안에서 시스템 업데이트


Ubuntu 터미널을 열고 아래 명령어를 실행합니다.


```bash
sudo apt update && sudo apt upgrade -y
```


이 이후 과정은 라즈베리 파이 가이드의 **2번(ROS 2 Humble 설치) ~ 5번(워크스페이스 구성)** 과 완전히 동일합니다. 그 문서를 참고해서 동일하게 진행하세요.


---


### Step W-5. VS Code + WSL 연동


Windows에서 코딩할 때는 VS Code에서 WSL2 안의 파일을 직접 편집하는 방식이 가장 편합니다.


**설치 순서:**

1. VS Code 설치 (https://code.visualstudio.com)
2. VS Code 실행 → 확장(Extensions) 탭에서 `WSL` 검색 후 설치 (Microsoft 공식 확장)
3. Ubuntu 터미널에서 작업할 폴더로 이동 후 아래 명령어 실행:

```bash
cd ~/spas_ws
code .
```


이 명령어를 치면 VS Code가 자동으로 열리면서 WSL2 안의 `spas_ws` 폴더를 바로 편집할 수 있는 상태가 됩니다.


> **`code .`** **이 안 된다면?**  
> VS Code가 설치되어 있지 않거나, PATH에 등록이 안 된 경우입니다.  
> VS Code를 열고 `Ctrl+Shift+P` → `Shell Command: Install 'code' command in PATH` 를 실행한 뒤 터미널을 다시 열어보세요.


---


### Step W-6. RViz2 화면 출력 설정 (GUI)


WSL2에서 RViz2 같은 GUI 프로그램을 띄우려면 추가 설정이 필요합니다.


**Windows 11 / Windows 10 최신 버전** 은 WSLg라는 기능이 내장되어 있어서 별도 설정 없이 GUI가 바로 됩니다. 아래 명령어로 확인해보세요.


```bash
ros2 run rviz2 rviz2
```


RViz2 창이 바로 뜨면 추가 설정이 필요 없습니다.


창이 안 뜨거나 오류가 나면 아래를 확인하세요.


```bash
# WSL2 버전 확인
wsl --version
```


WSLg가 지원되지 않는 구버전이라면 **VcXsrv** 같은 X서버 프로그램을 설치해야 합니다.
이 경우 별도로 팀 내 공유하겠습니다.


---


### Step W-7. ROS_DOMAIN_ID 설정


라즈베리 파이와 같은 번호로 맞춥니다.


```bash
echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
source ~/.bashrc
```


---


### Step W-8. SSH 접속 확인


WSL2 터미널에서 라즈베리 파이에 SSH 접속이 되는지 확인합니다.


```bash
ssh ubuntu@192.168.236.18
```


접속이 되면 Windows 개발 환경 구축이 완료된 겁니다.


---


### Step W-9. VS Code Remote SSH 연동


SSH 접속을 VS Code에서 GUI로 편하게 할 수 있습니다.

1. VS Code 실행
2. 확장(Extensions) 탭에서 `Remote - SSH` 검색 후 설치 (Microsoft 공식)
3. `Ctrl+Shift+P` → `Remote-SSH: Connect to Host` 선택
4. `ubuntu@192.168.0.15` 입력 (라즈베리 파이 IP로 교체)
5. 비밀번호 입력하면 VS Code가 라즈베리 파이에 연결됩니다
6. `File > Open Folder` → `~/spas_ws` 선택

이제 노트북 VS Code에서 라즈베리 파이 파일을 직접 편집하고, 터미널도 라즈베리 파이 터미널로 쓸 수 있습니다.


---


## macOS 환경 구축


### 주의사항


macOS는 ROS 2 공식 지원이 Windows보다 제한적입니다. 특히 Apple Silicon(M1/M2/M3) 맥은 일부 패키지가 불안정하거나 설치가 안 될 수 있어요. 가능하면 팀 내에서 Linux 또는 WSL2 환경으로 통일하는 것을 권장합니다.


macOS에서 개발 PC 역할(코드 작성 + SSH + RViz2 시각화)만 한다면 ROS 2를 macOS에 직접 설치하지 않고, VS Code Remote SSH만으로도 충분히 작업할 수 있어요. 이 경우 아래 설치 과정은 건너뛰고 SSH + VS Code Remote SSH 설정만 진행하면 됩니다.


그래도 macOS에서 ROS 2를 직접 쓰고 싶다면 아래를 따라 하세요.


---


### Step M-1. Homebrew 설치


Homebrew는 macOS의 패키지 관리자입니다. Ubuntu의 `apt` 와 같은 역할을 해요.


```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


설치 후 터미널을 재시작하고 확인합니다.


```bash
brew --version
```


---


### Step M-2. ROS 2 Humble 설치


macOS에서는 RoboStack을 이용하는 방식이 가장 안정적입니다.


**conda(miniforge) 설치:**


```bash
brew install miniforge
conda init zsh   # zsh 사용 시 / bash 사용하면 conda init bash
```


터미널을 재시작한 후:


```bash
# RoboStack 채널로 ROS 2 Humble 설치
conda create -n ros_env python=3.10 -y
conda activate ros_env

conda config --env --add channels conda-forge
conda config --env --add channels robostack-staging
conda install ros-humble-desktop -y
```


> **RoboStack이 뭔가요?**  
> conda 패키지 관리자를 통해 ROS 2를 macOS와 Windows에 설치할 수 있게 해주는 프로젝트입니다.  
> 공식 apt 방식이 macOS를 지원하지 않기 때문에 이 방식을 씁니다.


---


### Step M-3. 환경 활성화


RoboStack으로 설치한 ROS 2는 사용할 때마다 conda 환경을 활성화해야 합니다.


```bash
conda activate ros_env
```


매번 치기 번거롭다면 `.zshrc` 또는 `.bashrc` 에 추가해두세요.


```bash
echo "conda activate ros_env" >> ~/.zshrc
source ~/.zshrc
```


---


### Step M-4. 설치 확인


```bash
ros2 --version
ros2 run demo_nodes_cpp talker
```


---


### Step M-5. ROS_DOMAIN_ID 및 SSH 설정


Windows와 동일하게 진행합니다.


```bash
# ROS_DOMAIN_ID 설정
echo "export ROS_DOMAIN_ID=1" >> ~/.zshrc
source ~/.zshrc

# SSH 접속 확인
ssh ubuntu@192.168.0.15
```


VS Code Remote SSH 설정도 Windows 가이드(Step W-9)와 동일합니다.


---


## 설치 완료 체크리스트


### Windows (WSL2)

- [ ] WSL2 활성화 및 Ubuntu-22.04 설치 완료
- [ ] Ubuntu 안에서 `ros2 --version` 정상 출력
- [ ] `ROS_DOMAIN_ID` 설정 완료 (라즈베리 파이와 동일한 번호)
- [ ] 라즈베리 파이 SSH 접속 확인
- [ ] VS Code + WSL 확장 설치 완료
- [ ] VS Code Remote SSH 설치 완료
- [ ] RViz2 GUI 출력 확인 (`ros2 run rviz2 rviz2`)
- [ ] 라즈베리 파이 토픽 수신 확인 (`ros2 topic list`)

### macOS

- [ ] Homebrew 설치 완료
- [ ] miniforge + RoboStack으로 ROS 2 Humble 설치 완료
- [ ] `ros2 --version` 정상 출력
- [ ] `ROS_DOMAIN_ID` 설정 완료 (라즈베리 파이와 동일한 번호)
- [ ] 라즈베리 파이 SSH 접속 확인
- [ ] VS Code Remote SSH 설치 완료
- [ ] 라즈베리 파이 토픽 수신 확인 (`ros2 topic list`)

---


## 자주 발생하는 오류 모음


### WSL2 설치 후 Ubuntu가 실행이 안 됨


가상화(Virtualization)가 비활성화되어 있는 경우입니다.
PC를 재부팅하고 BIOS/UEFI 설정에서 `Intel VT-x` 또는 `AMD-V` 항목을 활성화하세요.
BIOS 진입 방법은 제조사마다 다릅니다 (보통 부팅 시 F2, F10, Del 키).


### WSL2에서 ros2 명령어가 안 됨


`.bashrc` 에 환경변수가 등록되지 않은 경우입니다.


```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### RViz2 실행 시 “cannot open display” 오류


WSLg가 지원되지 않는 환경입니다. Windows 업데이트를 최신으로 유지하거나, VcXsrv 설치가 필요합니다.


### 라즈베리 파이 토픽이 노트북에서 안 보임


두 가지를 확인합니다.


첫 번째, 같은 Wi-Fi에 연결되어 있는지 확인합니다.


```bash
# 각 기기에서 실행해서 같은 대역(예: 192.168.0.x)인지 확인
hostname -I
```


두 번째, `ROS_DOMAIN_ID` 가 양쪽 모두 같은지 확인합니다.


```bash
echo $ROS_DOMAIN_ID
```


### macOS에서 일부 ROS 2 패키지가 설치 안 됨


RoboStack이 지원하지 않는 패키지일 수 있습니다. 이 경우 해당 기능은 라즈베리 파이에서만 실행하고, 노트북은 SSH + RViz2 시각화 용도로만 쓰는 방식으로 역할을 분리하는 것을 권장합니다.


---


## 개발 작업 흐름 요약


환경 구축이 완료되면 실제 개발은 아래 흐름으로 진행합니다.


```text
[노트북 - VS Code]
  1. VS Code Remote SSH로 라즈베리 파이 접속
  2. ~/spas_ws/src/ 안에서 코드 작성 및 수정
  3. VS Code 내장 터미널에서 colcon build 실행
  4. ros2 run 또는 ros2 launch 로 노드 실행

[노트북 - 별도 터미널]
  5. ros2 topic list / ros2 topic echo 로 데이터 확인
  6. rviz2 실행으로 센서 데이터 시각화

[라즈베리 파이]
  7. 노드 실행 중 (SSH 세션 유지)
  8. micro-ROS Agent 실행 (Arduino 연결 시)
```


> **SSH 세션이 끊기면 실행 중인 노드도 꺼지나요?**  
> 네, 기본적으로는 그렇습니다. 장시간 실행이 필요할 때는 `tmux` 또는 `screen` 을 쓰면 SSH가 끊겨도 노드가 계속 실행됩니다.


	```bash
	# tmux 설치
	sudo apt install -y tmux
	
	# tmux 세션 시작
	tmux new -s spas
	
	# 세션 분리 (노드는 계속 실행됨)
	Ctrl + B, 이후 D
	
	# 세션 다시 붙기
	tmux attach -t spas
	```


---


## 전체 개발 환경 구성 요약


| 항목             | 내용                                   |
| -------------- | ------------------------------------ |
| **Windows 방법** | WSL2 + Ubuntu 22.04 + ROS 2 Humble   |
| **macOS 방법**   | miniforge + RoboStack + ROS 2 Humble |
| **에디터**        | VS Code + WSL 확장 또는 Remote SSH 확장    |
| **원격 접속**      | SSH (`ssh ubuntu@라즈베리파이IP`)          |
| **네트워크 설정**    | ROS_DOMAIN_ID=1 (라즈베리 파이와 동일하게)      |
| **시각화**        | RViz2 (노트북에서 실행, 라즈베리 파이 데이터 수신)     |
| **세션 유지**      | tmux (SSH 끊겨도 노드 유지)                 |


---


## 1. Ubuntu 22.04 설치 (Raspberry Pi 4)


우리가 설치할 버전은 **Ubuntu 22.04 LTS (64-bit)** 입니다.
- **22.04** = 2022년 4월에 출시된 버전
- **LTS** = Long Term Support, 장기 지원 버전. 5년간 안정적으로 업데이트를 지원해줘요. 안정성이 중요한 프로젝트에서는 무조건 LTS를 씁니다.
- **64-bit** = 라즈베리 파이 4의 CPU 아키텍처에 맞는 버전


### 준비물

- Micro SD 카드 (64GB 권장)
- SD 카드 리더기 (노트북이나 PC에 꽂을 수 있는 것)
- 인터넷이 되는 PC 또는 노트북

### 설치 순서


**Step 1. Raspberry Pi Imager 다운로드**


PC에서 아래 주소로 가서 Raspberry Pi Imager를 설치합니다.
https://www.raspberrypi.com/software/


이 프로그램은 Ubuntu 이미지를 SD 카드에 구워주는 도구예요. USB에 윈도우 설치 파일 굽는 것과 똑같은 개념입니다.


**Step 2. Imager 실행 후 설정**

1. `CHOOSE OS` → `Other general-purpose OS` → `Ubuntu` → **Ubuntu Server 22.04 LTS (64-bit)** 선택
2. `CHOOSE STORAGE` → SD 카드 선택
3. 설정 버튼(고급 옵션)에서 아래를 미리 설정해두면 편합니다:
	- 호스트명 설정 (예: `spas`)
	- Wi-Fi SSID / 비밀번호 입력
	- SSH 활성화 체크
	- 사용자명 / 비밀번호 설정 (예: `ubuntu` / 원하는 비밀번호)
4. `WRITE` 클릭 → SD 카드에 굽기 시작

**Step 3. 라즈베리 파이에 SD 카드 삽입 후 부팅**


SD 카드를 라즈베리 파이에 꽂고 전원을 연결하면 자동으로 부팅됩니다.
처음에는 1~2분 정도 기다려야 해요.


**Step 4. 시스템 업데이트**


부팅 후 터미널에서 아래 명령어를 실행합니다.


```bash
sudo apt update && sudo apt upgrade -y
```


> **`apt`**  
> Ubuntu에서 프로그램을 설치/관리하는 도구입니다. 마치 스마트폰의 앱스토어처럼, `apt`로 프로그램을 설치하고 업데이트할 수 있어요.


> **`apt update`****와** **`apt upgrade`****의 차이는?**  
> - `update` = 설치 가능한 프로그램 목록을 최신으로 갱신 (실제로 설치하진 않음)  
> - `upgrade` = 갱신된 목록 기준으로 설치된 프로그램들을 실제로 업그레이드  
> - `-y` = “진행할까요?” 물어볼 때 자동으로 “Yes” 대답


---


## 2. ROS 2 Humble 설치


### ROS 2


**ROS 2 (Robot Operating System 2)** 는 로봇 소프트웨어를 개발하기 위한 **프레임워크**입니다.


프레임워크란 “개발에 필요한 도구, 규칙, 라이브러리를 미리 묶어놓은 틀”이에요.


예를 들어, 우리 프로젝트에서는:
- 라이다 센서에서 데이터를 읽고
- 카메라로 차선을 인식하고
- 아두이노에 모터 제어 명령을 보내야 합니다


이런 복잡한 것들을 각자 따로 짜면 엄청 힘들겠죠? ROS 2는 이걸 **토픽(Topic)** 이라는 메시지 채널로 쉽게 주고받을 수 있게 해줍니다. 각 기능을 **노드(Node)** 라는 독립 프로그램으로 만들어서 서로 통신하게 하는 구조예요.


우리가 설치할 버전은 **ROS 2 Humble Hawksbill** 입니다. Ubuntu 22.04와 공식적으로 호환되는 버전이에요.


---


### Step 2-1. Locale 설정


```bash
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
```


> **Locale**  
> 컴퓨터가 사용할 **언어와 문자 인코딩 방식**을 설정하는 겁니다.  
> ROS 2는 영어(UTF-8) 환경에서 설치해야 오류가 안 납니다.  
> 한국어 환경에서 설치하면 간혹 문자 깨짐이나 오류가 발생할 수 있어요.


---


### Step 2-2. ROS 2 저장소(Repository) 등록


```bash
sudo apt install -y software-properties-common curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
```


> **저장소(Repository)**  
> `apt`는 기본적으로 Ubuntu 공식 앱스토어에서만 프로그램을 찾아요.  
> ROS 2는 Ubuntu 공식 앱스토어에 없고 **ROS 전용 앱스토어**에 있습니다.  
> 그래서 “이 주소도 앱스토어로 인식해줘” 라고 등록해주는 작업이에요.


> **`.gpg`** **키 파일**  
> “이 저장소는 믿을 수 있는 공식 출처야”를 증명하는 **디지털 서명**입니다.  
> 이 키가 있어야 Ubuntu가 해당 저장소에서 패키지를 안전하게 받아올 수 있어요.


---


### Step 2-3. ROS 2 Humble 설치


```bash
sudo apt install -y ros-humble-desktop-full
```


> **이 명령어는 시간이 오래 걸립니다 (10~30분)**  
> 수백 개의 패키지를 인터넷에서 다운받는 과정이에요. 인터넷 속도에 따라 다릅니다.  
> 진행 중에 터미널을 닫거나 전원을 끄면 안 됩니다.


> **`desktop-full`**  
> ROS 2를 설치할 때 여러 버전이 있어요:  
> - `ros-base` = 최소한의 핵심 기능만  
> - `desktop` = 기본 + 시각화 도구  
> - `desktop-full` = 모든 기능 포함 (시뮬레이션, 시각화, 센서 드라이버 등)  
> 우리는 센서, 시각화 등 다 쓸 거라서 `desktop-full`을 설치합니다.


---


### Step 2-4. colcon 설치


```bash
sudo apt install -y python3-colcon-common-extensions
```


> **colcon이 뭔가요?**  
> 우리가 작성한 ROS 2 코드(패키지)를 **빌드(컴파일)하는 도구**입니다.  
> 코드를 컴퓨터가 실행할 수 있는 형태로 변환해주는 과정을 빌드라고 해요.  
> ROS 2 프로젝트에서는 `colcon build` 명령어로 빌드합니다.


---


### Step 2-5. 환경변수 등록 (.bashrc)


```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


> **환경변수**  
> ROS 2 명령어(`ros2`, `colcon` 등)를 터미널 어디서든 쓸 수 있게 **경로를 등록**하는 작업입니다.  
> Windows에서 PATH 환경변수에 프로그램 경로 추가하는 것과 같은 개념이에요.


> **`.bashrc`**  
> 터미널을 열 때마다 **자동으로 실행되는 설정 파일**입니다.  
> 여기에 `source /opt/ros/humble/setup.bash`를 추가해두면,  
> 터미널을 새로 열 때마다 ROS 2 환경이 자동으로 준비됩니다.  
> 안 하면 터미널 새로 열 때마다 수동으로 source 명령을 쳐야 해서 매우 불편해요.


> **`>>`**  
> 파일 맨 뒤에 내용을 추가(append)하는 기호입니다.  
> `>`는 파일 내용을 덮어쓰고, `>>`는 기존 내용을 유지하면서 뒤에 추가해요.


---


## 3. ROS 2 패키지 의존성 설치


### 패키지(Package)


패키지는 특정 기능을 담은 **프로그램 묶음**입니다. 예를 들어 `rplidar-ros`는 RPLiDAR 센서를 ROS 2에서 사용할 수 있게 해주는 드라이버 패키지예요. 이런 패키지들이 모여서 우리 시스템이 동작합니다.


### 확정 패키지 설치


현재 시스템 구성상 반드시 필요한 패키지들입니다.


```bash
sudo apt install -y \
  ros-humble-slam-toolbox \
  ros-humble-nav2-bringup \
  ros-humble-rplidar-ros \
  ros-humble-v4l2-camera \
  ros-humble-micro-ros-agent \
  ros-humble-rosbridge-suite \
  ros-humble-ackermann-msgs \
  ros-humble-robot-localization \
  ros-humble-image-transport \
  ros-humble-cv-bridge \
  ros-humble-rviz2 \
  ros-humble-rqt
```


> **`\`** **(백슬래시) 사용 이유**  
> 명령어가 너무 길어서 **여러 줄로 나눠 쓸 때** 쓰는 기호입니다.  
> 실제로는 한 줄짜리 명령어예요. 가독성을 위해 나눠 쓴 것입니다.


### 확정 패키지 설명


| 패키지 이름            | 한 줄 설명                             | 우리 프로젝트에서의 역할               |
| ----------------- | ---------------------------------- | --------------------------- |
| `slam-toolbox`    | 지도를 만들면서 동시에 자기 위치를 파악하는 SLAM 알고리즘 | LiDAR로 주차 공간 지도 생성          |
| `nav2-bringup`    | 자율주행 내비게이션 스택 (경로 계획, 장애물 회피)      | APA 자율주차 경로 계획              |
| `rplidar-ros`     | RPLiDAR A1 센서 드라이버                 | LiDAR 데이터를 ROS 2 토픽으로 발행    |
| `v4l2-camera`     | USB/CSI 카메라 드라이버                   | Pi Camera 영상을 ROS 2로 전달     |
| `micro-ros-agent` | 아두이노(MCU)와 라즈베리 파이 사이의 통신 다리       | Arduino Mega ↔︎ RPi UART 연결 |
| `rosbridge-suite` | 웹브라우저나 외부 기기와 ROS 2를 연결하는 브릿지      | 원격 모니터링/제어                  |
| `ackermann-msgs`  | 자동차형(앞바퀴 조향) 이동 명령 메시지 타입          | 애커먼 조향 명령 전달                |
| `cv-bridge`       | OpenCV 이미지 ↔︎ ROS 2 이미지 변환 도구      | 카메라 영상을 OpenCV로 처리          |
| `rviz2`           | ROS 2 데이터 시각화 도구 (3D 뷰어)           | 센서 데이터, 경로 등 시각적 확인         |
| `rqt`             | ROS 2 GUI 디버깅/모니터링 툴               | 토픽, 노드 상태 실시간 확인            |


### 미정 패키지 (개발 진행에 따라 추가 예정)


아래 패키지들은 현재 확정되지 않았으나, 기능 구현 단계에서 필요할 가능성이 높습니다.
필요한 시점에 `sudo apt install ros-humble-패키지명` 으로 개별 추가하면 됩니다.


| 패키지 이름                        | 한 줄 설명                      | 필요한 상황                  |
| ----------------------------- | --------------------------- | ----------------------- |
| `ros-humble-joy`              | 조이스틱 입력을 ROS 2 토픽으로 변환      | 수동 제어(Override) 기능 구현 시 |
| `ros-humble-teleop-twist-joy` | 조이스틱 입력을 `/cmd_vel` 명령으로 변환 | 조이패드로 RC카 직접 조종 시       |
| `ros-humble-rqt-graph`        | 노드 연결 구조를 그래프로 시각화          | 노드 간 통신 흐름 디버깅 시        |
| `ros-humble-rqt-plot`         | 토픽 데이터를 실시간 그래프로 출력         | 센서값 변화 추이 확인 시          |
| `ros-humble-ros2bag`          | 주행 중 토픽 데이터를 녹화 및 재생        | 버그 재현, 알고리즘 오프라인 검증 시   |


---


## 4. Python 의존성 설치 (requirements.txt)


### requirements.txt


Python 프로젝트에서 필요한 **라이브러리 목록을 적어둔 파일**입니다.
이 파일 하나로 필요한 모든 Python 라이브러리를 한 번에 설치할 수 있어요.


### requirements.txt 파일 생성


터미널에서 아래 명령어로 파일을 만듭니다:


```bash
cat > ~/requirements.txt << EOF
opencv-python
numpy
transforms3d
pyserial
EOF
```


> **`cat > 파일명 << EOF ... EOF`**   
> 터미널에서 텍스트 파일을 직접 만드는 방법입니다.  
> `EOF`(End Of File) 사이에 적힌 내용이 파일에 저장돼요.  
> 물론 VS Code나 nano 같은 편집기로 직접 파일을 만들어도 됩니다.


### 설치


```bash
pip3 install -r ~/requirements.txt
```


> **`pip3`**  
> Python 패키지를 설치하는 도구입니다. `apt`가 Ubuntu용 앱스토어라면, `pip3`는 **Python 전용 앱스토어**예요.  
> `pip3 install 패키지명` 형식으로 씁니다.  
> `-r 파일명` = 파일에 적힌 목록을 읽어서 모두 설치해줘


### 확정 라이브러리 설명


| 라이브러리           | 설명                                                   | 우리 프로젝트에서의 역할                        |
| --------------- | ---------------------------------------------------- | ------------------------------------ |
| `opencv-python` | 이미지/영상 처리 라이브러리. 카메라 영상에서 물체, 선, 색상 등을 인식할 수 있게 해줍니다 | 차선 인식, 주차 공간 인식 (PAS, APA)           |
| `numpy`         | 수학 연산 라이브러리. 행렬 계산, 통계, 벡터 연산 등을 빠르게 처리합니다           | 칼만 필터 계산, 센서 데이터 수치 처리               |
| `transforms3d`  | 3D 공간에서 좌표 변환(회전, 이동 등)을 처리하는 라이브러리                  | 쿼터니언 ↔︎ 오일러 각도 변환, 로봇 자세 계산          |
| `pyserial`      | Python에서 시리얼(UART) 통신을 할 수 있게 해주는 라이브러리              | Raspberry Pi ↔︎ Arduino UART 데이터 송수신 |


### 미정 라이브러리 (개발 진행에 따라 추가 예정)


아래 라이브러리들은 현재 확정되지 않았으나, 기능 구현 단계에서 필요할 가능성이 높습니다.
필요한 시점에 `pip3 install 패키지명` 으로 개별 추가하면 됩니다.


| 라이브러리        | 설명                                                            | 필요한 상황                 |
| ------------ | ------------------------------------------------------------- | ---------------------- |
| `filterpy`   | 칼만 필터를 쉽게 구현할 수 있게 도와주는 라이브러리. numpy로 직접 짜는 것보다 코드가 훨씬 간결해집니다 | 칼만 필터 구현을 직접 짜기 어려울 경우 |
| `scipy`      | 수치 계산, 신호 처리, 통계 등 과학 계산 전반을 다루는 라이브러리                        | 이동 평균 필터 등 신호 처리 구현 시  |
| `matplotlib` | Python에서 그래프를 그리는 라이브러리                                       | 센서값 변화를 오프라인으로 시각화할 때  |
| `shapely`    | 2D 도형 연산(면적, 교차, 포함 여부 등)을 처리하는 라이브러리                         | 주차 공간 경계 계산 등 기하학 연산 시 |


---


## 5. ROS 2 워크스페이스 구성


### 워크스페이스(Workspace)


워크스페이스는 우리가 개발할 **ROS 2 프로젝트의 작업 폴더**입니다.
모든 코드, 설정 파일, 빌드 결과물이 이 폴더 안에 모입니다.


```text
spas_ws/          ← 워크스페이스 루트
├── src/          ← 우리가 짜는 소스 코드 폴더
├── build/        ← 빌드 중간 결과물 (자동 생성)
├── install/      ← 최종 설치 결과물 (자동 생성)
└── log/          ← 빌드 로그 (자동 생성)
```


### Step 5-1. 워크스페이스 생성


```bash
# 워크스페이스 폴더와 src 폴더 생성
mkdir -p ~/spas_ws/src

# 워크스페이스 폴더로 이동
cd ~/spas_ws
```


> **`mkdir -p`**  
> 폴더(디렉토리)를 만드는 명령어입니다.  
> `-p` 옵션은 중간 폴더가 없어도 한 번에 만들어줘요.  
> 예: `spas_ws` 폴더가 없어도 `spas_ws/src`까지 한 번에 생성.


### Step 5-2. rosdep 설정


`rosdep`은 ROS 2 패키지들의 의존성을 자동으로 해결해주는 도구입니다.
`src/` 안에 패키지를 넣고 빌드하기 전에 반드시 실행해야 해요.
안 하면 “이 패키지가 없어서 빌드 실패”처럼 어디서 막혔는지 모르는 오류가 자주 납니다.


```bash
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -r -y
```


> **각 명령어가 하는 일은?**  
> - `sudo rosdep init` = rosdep 시스템을 처음 초기화. 최초 1회만 실행하면 됩니다.  
> - `rosdep update` = rosdep이 참조하는 의존성 목록을 최신으로 갱신.  
> - `rosdep install --from-paths src --ignore-src -r -y` = `src/` 폴더 안의 모든 패키지를 훑어보고, 각 패키지가 필요로 하는 의존성을 자동으로 설치.  
> - `--ignore-src` = `src/` 안에 있는 패키지는 이미 있는 거니까 건너뜀  
> - `-r` = 오류가 생겨도 멈추지 말고 계속 진행  
> - `-y` = 설치 여부 물어보면 자동으로 Yes


### Step 5-3. 첫 번째 빌드


```bash
cd ~/spas_ws
colcon build --symlink-install
```


> **`--symlink-install`**  
> 빌드할 때 파일을 **복사하지 않고 링크(바로가기)를 만드는 옵션**입니다.  
> 이 옵션을 쓰면 `src/` 안의 Python 파일을 수정했을 때 다시 빌드하지 않아도 바로 반영됩니다.  
> 개발할 때 매우 편리해서 항상 이 옵션을 씁니다.


처음 빌드할 때는 `src/` 가 비어있어서 특별히 빌드할 것이 없지만, 워크스페이스 구조를 초기화하는 역할을 합니다. `build/`, `install/`, `log/` 폴더가 자동으로 생성됩니다.


### Step 5-4. 워크스페이스 환경 자동 적용


```bash
echo "source ~/spas_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


> **왜 또** **`.bashrc`****에 등록하는지**  
> ROS 2 기본 설치(Step 2-5)와 우리 워크스페이스는 별개입니다.  
> 우리 워크스페이스에서 만든 노드를 `ros2 run` 명령으로 실행하려면,  
> 워크스페이스의 `install/setup.bash`도 함께 소싱(source)해줘야 해요.  
> 안 하면 “패키지를 찾을 수 없습니다” 오류가 납니다.


### Step 5-5. ROS 2 패키지 생성 (코딩 시작 시)


워크스페이스 안에 실제 코드를 담을 패키지를 만들 때 쓰는 명령어입니다.
환경 구축 단계에서 바로 실행할 필요는 없고, 본격적으로 노드를 작성하기 시작할 때 사용합니다.


```bash
cd ~/spas_ws/src

# Python 기반 패키지 생성
ros2 pkg create --build-type ament_python 패키지이름
```


예를 들어 PAS 기능을 담을 패키지를 만들 때는 이렇게 씁니다:


```bash
ros2 pkg create --build-type ament_python spas_pas
```


> **`ament_python`**  
> ROS 2에서 패키지를 만들 때 빌드 방식을 지정하는 옵션입니다.  
> 우리 프로젝트는 Python으로 노드를 작성하므로 `ament_python`을 씁니다.  
> C++로 짤 때는 `ament_cmake`를 씁니다.


패키지를 만들고 나면 아래와 같은 구조가 생깁니다:


```text
src/
└── spas_pas/
    ├── package.xml        ← 패키지 정보 및 의존성 목록
    ├── setup.py           ← Python 빌드 설정
    ├── setup.cfg
    └── spas_pas/
        └── __init__.py    ← 실제 Python 코드를 여기 추가
```


패키지를 추가하거나 코드를 수정한 뒤에는 항상 다시 빌드해야 합니다:


```bash
cd ~/spas_ws
colcon build --symlink-install
```


---


## 6. micro-ROS Agent 실행 (Arduino 연결)


### micro-ROS


ROS 2는 원래 Raspberry Pi처럼 리눅스가 돌아가는 보드에서 씁니다.
그런데 Arduino는 리눅스가 없는 **초소형 마이크로컨트롤러**라서 ROS 2를 직접 돌릴 수 없어요.


**micro-ROS**는 Arduino 같은 초소형 장치에서도 ROS 2 통신을 할 수 있게 해주는 경량 버전입니다.


통신 구조는 이렇습니다:


```text
Arduino (micro-ROS 펌웨어)
    ↕ UART 시리얼 통신 (115200 bps)
Raspberry Pi (micro-ROS Agent)
    ↕ ROS 2 내부 통신
다른 ROS 2 노드들
```


**micro-ROS Agent**는 라즈베리 파이에서 실행되는 중간 다리 역할을 합니다.
Arduino가 보내는 데이터를 받아서 ROS 2 토픽으로 변환해줘요.


### 시리얼 포트 권한 설정


```bash
sudo usermod -aG dialout $USER
```


> **왜 권한 설정이 필요한지**  
> 리눅스에서 시리얼 포트(`/dev/ttyACM0` 등)는 보안상 아무나 접근하지 못하게 되어 있어요.  
> `dialout` 그룹에 현재 사용자를 추가하면 시리얼 포트를 `sudo` 없이 쓸 수 있습니다.  
> **이 명령 후에는 로그아웃 → 다시 로그인을 해야 적용됩니다.**


> **`$USER`**  
> 현재 로그인된 사용자 이름이 자동으로 들어가는 **변수**입니다.  
> 예: 사용자명이 `ubuntu`라면 `usermod -aG dialout ubuntu`와 같은 명령이에요.


### micro-ROS Agent 실행


```bash
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0 -b 115200
```


> **`/dev/ttyACM0`**  
> Arduino를 USB로 연결했을 때 리눅스가 자동으로 부여하는 **장치 파일 경로**입니다.  
> 리눅스에서는 모든 장치를 파일처럼 취급해요.  
> Arduino가 처음 연결되면 보통 `/dev/ttyACM0` 또는 `/dev/ttyUSB0`이 됩니다.  
> 어떤 포트인지 확인하려면: `ls /dev/tty*` 명령어로 확인하세요.


> **`115200 bps`**  
> 시리얼 통신 속도(Baud Rate)입니다. 초당 115,200비트를 전송한다는 의미예요.  
> Arduino 펌웨어에서 설정한 속도와 Agent에서 설정한 속도가 반드시 일치해야 통신이 됩니다.  
> 우리 프로젝트는 115200 bps로 통일합니다.


---


## 7. 설치 확인


### ROS 2 설치 확인


```bash
ros2 --version
```


정상 출력 예시:


```text
ros2 humble
```


### 통신 테스트 (talker / listener)


터미널을 **2개** 열어서 각각 실행합니다.


**터미널 1:**


```bash
ros2 run demo_nodes_cpp talker
```


**터미널 2:**


```bash
ros2 run demo_nodes_cpp listener
```


> ROS 2의 기본 예제입니다.  
> - `talker` = “Hello World: 1”, “Hello World: 2” … 메시지를 계속 발행(publish)하는 노드  
> - `listener` = talker가 보낸 메시지를 구독(subscribe)해서 화면에 출력하는 노드


	터미널 2에서 “Hello World” 메시지가 출력되면 ROS 2가 정상적으로 작동하는 겁니다.


### LiDAR 연결 테스트


RPLiDAR A1을 USB로 연결한 후:


```bash
ros2 launch rplidar_ros rplidar_a1_launch.py
```


> **`launch`**  
> 여러 개의 노드를 한 번에 실행하는 명령입니다.  
> `launch 파일`에 “이 노드들을 이 설정으로 실행해줘”를 미리 정의해두면,  
> 명령어 하나로 전체 시스템을 시작할 수 있어요.


---


## 8. ROS 2 네트워크 설정 (ROS_DOMAIN_ID)


### ROS_DOMAIN_ID


ROS 2는 같은 Wi-Fi 네트워크 안에 있는 모든 기기에서 토픽을 주고받을 수 있습니다. 그런데 팀원 5명이 각자 라즈베리 파이와 노트북을 연결해서 작업하면, 내 라즈베리 파이 데이터가 옆 사람 노트북에도 보이는 혼선이 생겨요.


`ROS_DOMAIN_ID`는 ROS 2 통신을 특정 그룹 안에서만 주고받도록 구분하는 **채널 번호**입니다. 같은 번호끼리만 통신하고, 다른 번호끼리는 서로 보이지 않아요.


우리 팀은 라즈베리 파이와 노트북 모두 **같은 번호**로 맞춰야 합니다. 번호는 0~232 사이에서 자유롭게 정하면 되는데, 팀 내에서 하나로 통일하면 돼요.


```bash
# .bashrc에 추가 (라즈베리 파이와 개발 노트북 모두 동일하게 설정)
echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
source ~/.bashrc
```


> **설정 후 확인 방법**  
> 라즈베리 파이와 노트북이 같은 Wi-Fi에 연결된 상태에서, 라즈베리 파이에서 talker를 실행하고 노트북에서 아래 명령어를 치면 토픽이 보여야 합니다.


	```bash
	ros2 topic list
	```


	토픽이 보이면 네트워크 연결이 정상입니다.


---


## 9. SSH 원격 접속 설정


### SSH


SSH(Secure Shell)는 **네트워크를 통해 다른 컴퓨터의 터미널을 원격으로 제어하는 방법**입니다. 라즈베리 파이에 모니터와 키보드를 매번 연결하지 않고, 노트북에서 바로 라즈베리 파이 터미널을 열 수 있어요.


실제 개발에서는 라즈베리 파이를 RC카에 올려두고, 노트북에서 SSH로 접속해서 코드를 실행하는 방식으로 작업합니다.


### Step 9-1. 라즈베리 파이 IP 주소 확인


라즈베리 파이 터미널에서 아래 명령어로 IP 주소를 확인합니다.


```bash
hostname -I
```


출력 예시:


```text
192.168.0.15
```


앞에 나오는 숫자가 라즈베리 파이의 IP 주소입니다. 이 주소는 Wi-Fi 환경에 따라 달라지고, 재부팅하면 바뀔 수 있어요.


### Step 9-2. 노트북에서 SSH 접속


노트북 터미널(또는 PowerShell)에서 아래 명령어를 실행합니다.


```bash
ssh ubuntu@192.168.0.15
```


형식은 `ssh 사용자명@IP주소` 입니다. 처음 접속할 때 “정말 연결할 거야?” 라는 질문이 나오면 `yes`를 입력하고, 라즈베리 파이에 설정한 비밀번호를 입력하면 접속됩니다.


> **접속 후 터미널 → 라즈베리 파이 터미널**  
> 접속에 성공하면 프롬프트가 `ubuntu@spas:~$` 처럼 라즈베리 파이 호스트명으로 바뀝니다. 이 상태에서 입력하는 모든 명령어는 라즈베리 파이에서 실행돼요.  
> SSH 접속을 종료하려면 `exit`를 입력하면 됩니다.


### Step 9-3. VS Code Remote SSH 설정 (권장)


터미널 SSH만으로도 개발할 수 있지만, VS Code의 Remote SSH 확장을 쓰면 노트북에서 VS Code를 열고 라즈베리 파이 파일을 직접 편집할 수 있어서 훨씬 편합니다.


**설치 순서:**

1. VS Code 실행 → 왼쪽 확장(Extensions) 탭 클릭
2. `Remote - SSH` 검색 후 설치 (Microsoft 공식 확장)
3. 왼쪽 하단 파란 버튼(또는 `Ctrl+Shift+P`) → `Remote-SSH: Connect to Host` 선택
4. `ubuntu@192.168.0.15` 입력 후 엔터
5. 비밀번호 입력하면 VS Code가 라즈베리 파이에 연결됩니다
6. `File > Open Folder` 에서 `~/spas_ws` 를 열면 라즈베리 파이 파일을 VS Code에서 바로 편집 가능

> **매번 IP 주소가 바뀌는 문제**  
> 공유기 설정에서 라즈베리 파이의 MAC 주소에 고정 IP를 할당(DHCP 고정 임대)하면 재부팅해도 같은 IP가 유지됩니다. 공유기 브랜드마다 설정 방법이 다르니 검색해서 확인하세요.


---


## 10. GitHub 연동 및 코드 관리


### Step 10-1. Git 설치 및 초기 설정


```bash
# Git 설치
sudo apt install -y git

# 사용자 정보 등록 (GitHub 계정 정보와 맞춰서 입력)
git config --global user.name "이름"
git config --global user.email "이메일@example.com"
```


### Step 10-2. .gitignore 설정


ROS 2 워크스페이스에서 `build/`, `install/`, `log/` 폴더는 빌드할 때마다 자동으로 생성되는 폴더라서 GitHub에 올릴 필요가 없어요. 오히려 올리면 용량만 커지고 충돌이 자주 납니다.


`.gitignore` 파일에 이 폴더들을 등록하면 Git이 자동으로 무시합니다.


```bash
cd ~/spas_ws

cat > .gitignore << EOF
build/
install/
log/
*.pyc
__pycache__/
.vscode/
EOF
```


> **.gitignore가 뭔가요?**  
> Git에게 “이 파일/폴더는 추적하지 말고 무시해줘”라고 알려주는 설정 파일입니다.  
> 여기에 등록된 항목은 `git add` 해도 포함되지 않아요.


### Step 10-3. 원격 저장소 연결


GitHub에서 팀 레포지토리를 미리 만들어둔 상태에서 진행합니다.


```bash
cd ~/spas_ws

# Git 저장소 초기화
git init

# 원격 저장소 연결 (팀 GitHub 레포 주소로 교체)
git remote add origin https://github.com/팀계정/spas_ws.git

# 현재 상태 확인
git status
```


### Step 10-4. 기본 Git 작업 흐름


코드를 수정하고 GitHub에 올리는 기본 순서입니다.


```bash
# 1. 변경된 파일 확인
git status

# 2. 변경 사항을 스테이징 (올릴 파일 선택)
git add src/

# 3. 커밋 (변경 이력 저장)
git commit -m "feat: PAS 초음파 센서 노드 추가"

# 4. GitHub에 업로드
git push origin main
```


> **커밋 메시지 규칙**  
> 규칙 을 정해두면 나중에 이력을 보기 편합니다. 간단한 규칙 예시:  
> - `feat:` 새 기능 추가  
> - `fix:` 버그 수정  
> - `docs:` 문서 수정  
> - `refactor:` 코드 구조 개선 (기능 변화 없음)


> **다른 팀원 코드 받아오기**


	```bash
	git pull origin main
	```


	작업 시작 전에 항상 pull을 먼저 하는 습관을 들이세요. 안 하면 충돌(conflict)이 발생할 확률이 높아집니다.


---


## 11. Arduino IDE 및 micro-ROS 펌웨어 설치


> **이 섹션은 하드웨어(Arduino Mega 2560) 도착 후 진행합니다.**  
> 지금 당장 설치할 필요는 없고, 보드가 오면 그때 따라 하세요.


### 전체 흐름 이해


Arduino 쪽 설정은 크게 두 단계로 나뉩니다.


```text
[노트북]
  Arduino IDE 설치
      ↓
  micro-ROS 라이브러리 추가
      ↓
  Arduino 코드 작성 및 업로드 (USB)
      ↓
[Arduino Mega 2560]
  micro-ROS 펌웨어 실행
      ↕ UART (115200 bps)
[Raspberry Pi]
  micro-ROS Agent 실행  →  ROS 2 토픽 발행/구독
```


### Step 11-1. Arduino IDE 설치


노트북(Windows / macOS / Linux 모두 가능)에서 아래 주소로 가서 Arduino IDE 2.x 버전을 설치합니다.


https://www.arduino.cc/en/software


### Step 11-2. Arduino Mega 2560 보드 등록


Arduino IDE를 처음 설치하면 Mega 2560이 목록에 없을 수 있습니다.

1. Arduino IDE 실행
2. `Tools > Board > Boards Manager` 클릭
3. `Arduino AVR Boards` 검색 후 설치

설치 후 `Tools > Board > Arduino AVR Boards > Arduino Mega or Mega 2560` 을 선택합니다.


### Step 11-3. micro-ROS 라이브러리 추가

1. Arduino IDE에서 `Sketch > Include Library > Manage Libraries` 클릭
2. `micro_ros_arduino` 검색 후 설치

> **버전 주의**  
> micro-ROS 라이브러리 버전이 라즈베리 파이에 설치된 ROS 2 버전과 맞아야 합니다.  
> 우리는 ROS 2 Humble을 쓰므로, `micro_ros_arduino` 에서 **Humble** 버전을 선택해서 설치하세요.


### Step 11-4. 펌웨어 업로드


Arduino 코드를 작성한 뒤, Arduino를 노트북 USB에 연결하고 업로드합니다.

1. `Tools > Port` 에서 Arduino가 연결된 포트 선택 (Windows: `COM3` 같은 형태, Linux: `/dev/ttyACM0`)
2. 업로드 버튼(오른쪽 화살표) 클릭

업로드가 완료되면 Arduino를 라즈베리 파이 USB에 연결하고, 라즈베리 파이에서 micro-ROS Agent를 실행하면 통신이 시작됩니다.


```bash
# 라즈베리 파이에서 실행
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0 -b 115200
```


Agent 실행 후 Arduino에서 발행하는 토픽이 보이면 연결 성공입니다.


```bash
# 새 터미널에서 토픽 확인
ros2 topic list
```


---


## 설치 완료 체크리스트


### 라즈베리 파이

- [ ] Ubuntu 22.04 부팅 및 `apt update/upgrade` 완료
- [ ] `ros2 --version` 명령어 정상 출력
- [ ] talker / listener 통신 테스트 성공
- [ ] `colcon build` 명령어 오류 없이 실행
- [ ] `pip3 install -r requirements.txt` 완료
- [ ] `ROS_DOMAIN_ID` 설정 완료
- [ ] SSH 접속 가능 확인
- [ ] GitHub 원격 저장소 연결 완료
- [ ] Arduino 연결 후 `/dev/ttyACM0` 포트 확인 (하드웨어 도착 후)
- [ ] micro-ROS Agent 실행 성공 (하드웨어 도착 후)

### 개발 노트북

- [ ] ROS 2 Humble 설치 완료 (개발 PC 환경 구축 문서 참고)
- [ ] `ROS_DOMAIN_ID` 동일하게 설정
- [ ] SSH 원격 접속 확인
- [ ] VS Code Remote SSH 연결 확인
- [ ] `ros2 topic list` 로 라즈베리 파이 토픽 수신 확인
- [ ] Arduino IDE 및 micro-ROS 라이브러리 설치 (하드웨어 도착 후)

---


## 자주 발생하는 오류 모음


### “ros2: command not found”


`.bashrc`에 환경변수가 제대로 등록되지 않은 경우입니다.


```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### “package ‘xxx’ not found”


워크스페이스 환경이 소싱되지 않은 경우입니다.


```bash
source ~/spas_ws/install/setup.bash
```


### “/dev/ttyACM0: Permission denied”


시리얼 포트 권한 설정이 적용되지 않은 경우입니다.


```bash
sudo usermod -aG dialout $USER
# 로그아웃 후 다시 로그인
```


### colcon build 중 오류


의존성 패키지가 없는 경우가 많습니다.


```bash
rosdep update
rosdep install --from-paths src --ignore-src -r -y
```


### 노트북에서 ros2 topic list를 쳐도 라즈베리 파이 토픽이 안 보임


`ROS_DOMAIN_ID`가 다르거나, 같은 Wi-Fi에 연결되지 않은 경우입니다.


```bash
# 라즈베리 파이와 노트북 양쪽에서 확인
echo $ROS_DOMAIN_ID
```


두 값이 다르면 `.bashrc`에서 같은 번호로 맞추고 `source ~/.bashrc`를 다시 실행하세요.


### SSH 접속이 안 됨


라즈베리 파이와 노트북이 같은 Wi-Fi에 연결되어 있는지 확인하고, IP 주소가 바뀌지 않았는지 확인합니다.


```bash
# 라즈베리 파이에서 현재 IP 확인
hostname -I
```


---


## 전체 설치 구성 요약


| 항목                  | 내용                                                                                                                                                         |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **운영체제 (RPi)**      | Ubuntu 22.04 LTS (64-bit)                                                                                                                                  |
| **플랫폼**             | Raspberry Pi 4 (8GB)                                                                                                                                       |
| **ROS 버전**          | ROS 2 Humble Hawksbill                                                                                                                                     |
| **빌드 도구**           | colcon                                                                                                                                                     |
| **확정 ROS 패키지**      | slam-toolbox, nav2, rplidar-ros, v4l2-camera, micro-ros-agent, rosbridge-suite, ackermann-msgs, robot-localization, image-transport, cv-bridge, rviz2, rqt |
| **미정 ROS 패키지**      | joy, teleop-twist-joy, rqt-graph, rqt-plot, ros2bag                                                                                                        |
| **확정 Python 라이브러리** | opencv-python, numpy, transforms3d, pyserial                                                                                                               |
| **미정 Python 라이브러리** | filterpy, scipy, matplotlib, shapely                                                                                                                       |
| **MCU 통신**          | micro-ROS (UART, 115200 bps)                                                                                                                               |
| **저장 매체**           | Micro SD 64GB                                                                                                                                              |
| **네트워크 설정**         | ROS_DOMAIN_ID=1 (팀 전체 통일)                                                                                                                                  |
| **원격 접속**           | SSH + VS Code Remote SSH                                                                                                                                   |
| **버전 관리**           | Git / GitHub                                                                                                                                               |
| **개발 PC 환경**        | 별도 문서 참고                                                                                                                                                   |


# SPAS 개발 환경 구축 가이드


> 초보자를 위한 가이드입니다.  
> 명령어를 왜 치는지, 무슨 의미인지까지 전부 설명합니다.  
> Ubuntu에서는 `Ctrl + Alt + T` 를 누르면 터미널이 열립니다.


---


## 1. Ubuntu 22.04 설치 (Raspberry Pi 4)


우리가 설치할 버전은 **Ubuntu 22.04 LTS (64-bit)** 입니다.
- **22.04** = 2022년 4월에 출시된 버전
- **LTS** = Long Term Support, 장기 지원 버전. 5년간 안정적으로 업데이트를 지원해줘요. 안정성이 중요한 프로젝트에서는 무조건 LTS를 씁니다.
- **64-bit** = 라즈베리 파이 4의 CPU 아키텍처에 맞는 버전


### 준비물

- Micro SD 카드 (64GB 권장)
- SD 카드 리더기 (노트북이나 PC에 꽂을 수 있는 것)
- 인터넷이 되는 PC 또는 노트북

### 설치 순서


**Step 1. Raspberry Pi Imager 다운로드**


PC에서 아래 주소로 가서 Raspberry Pi Imager를 설치합니다.
https://www.raspberrypi.com/software/


이 프로그램은 Ubuntu 이미지를 SD 카드에 구워주는 도구예요. USB에 윈도우 설치 파일 굽는 것과 똑같은 개념입니다.


**Step 2. Imager 실행 후 설정**

1. `CHOOSE OS` → `Other general-purpose OS` → `Ubuntu` → **Ubuntu Server 22.04 LTS (64-bit)** 선택
2. `CHOOSE STORAGE` → SD 카드 선택
3. 설정 버튼(고급 옵션)에서 아래를 미리 설정해두면 편합니다:
	- 호스트명 설정 (예: `spas`)
	- Wi-Fi SSID / 비밀번호 입력
	- SSH 활성화 체크
	- 사용자명 / 비밀번호 설정 (예: `ubuntu` / 원하는 비밀번호)
4. `WRITE` 클릭 → SD 카드에 굽기 시작

**Step 3. 라즈베리 파이에 SD 카드 삽입 후 부팅**


SD 카드를 라즈베리 파이에 꽂고 전원을 연결하면 자동으로 부팅됩니다.
처음에는 1~2분 정도 기다려야 해요.


**Step 4. 시스템 업데이트**


부팅 후 터미널에서 아래 명령어를 실행합니다.


```bash
sudo apt update && sudo apt upgrade -y
```


> **`apt`**  
> Ubuntu에서 프로그램을 설치/관리하는 도구입니다. 마치 스마트폰의 앱스토어처럼, `apt`로 프로그램을 설치하고 업데이트할 수 있어요.


> **`apt update`****와** **`apt upgrade`****의 차이는?**  
> - `update` = 설치 가능한 프로그램 목록을 최신으로 갱신 (실제로 설치하진 않음)  
> - `upgrade` = 갱신된 목록 기준으로 설치된 프로그램들을 실제로 업그레이드  
> - `-y` = “진행할까요?” 물어볼 때 자동으로 “Yes” 대답


---


## 2. ROS 2 Humble 설치


### ROS 2


**ROS 2 (Robot Operating System 2)** 는 로봇 소프트웨어를 개발하기 위한 **프레임워크**입니다.


프레임워크란 “개발에 필요한 도구, 규칙, 라이브러리를 미리 묶어놓은 틀”이에요.


예를 들어, 우리 프로젝트에서는:
- 라이다 센서에서 데이터를 읽고
- 카메라로 차선을 인식하고
- 아두이노에 모터 제어 명령을 보내야 합니다


이런 복잡한 것들을 각자 따로 짜면 엄청 힘들겠죠? ROS 2는 이걸 **토픽(Topic)** 이라는 메시지 채널로 쉽게 주고받을 수 있게 해줍니다. 각 기능을 **노드(Node)** 라는 독립 프로그램으로 만들어서 서로 통신하게 하는 구조예요.


우리가 설치할 버전은 **ROS 2 Humble Hawksbill** 입니다. Ubuntu 22.04와 공식적으로 호환되는 버전이에요.


---


### Step 2-1. Locale 설정


```bash
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
```


> **Locale**  
> 컴퓨터가 사용할 **언어와 문자 인코딩 방식**을 설정하는 겁니다.  
> ROS 2는 영어(UTF-8) 환경에서 설치해야 오류가 안 납니다.  
> 한국어 환경에서 설치하면 간혹 문자 깨짐이나 오류가 발생할 수 있어요.


---


### Step 2-2. ROS 2 저장소(Repository) 등록


```bash
sudo apt install -y software-properties-common curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
  -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture)\
  signed-by=/usr/share/keyrings/ros-archive-keyring.gpg]\
  http://packages.ros.org/ros2/ubuntu\
$(. /etc/os-release && echo $UBUNTU_CODENAME) main" \
  | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
```


> **저장소(Repository)**  
> `apt`는 기본적으로 Ubuntu 공식 앱스토어에서만 프로그램을 찾아요.  
> ROS 2는 Ubuntu 공식 앱스토어에 없고 **ROS 전용 앱스토어**에 있습니다.  
> 그래서 “이 주소도 앱스토어로 인식해줘” 라고 등록해주는 작업이에요.


> **`.gpg`** **키 파일**  
> “이 저장소는 믿을 수 있는 공식 출처야”를 증명하는 **디지털 서명**입니다.  
> 이 키가 있어야 Ubuntu가 해당 저장소에서 패키지를 안전하게 받아올 수 있어요.


---


### Step 2-3. ROS 2 Humble 설치


```bash
sudo apt install -y ros-humble-desktop-full
```


> **이 명령어는 시간이 오래 걸립니다 (10~30분)**  
> 수백 개의 패키지를 인터넷에서 다운받는 과정이에요. 인터넷 속도에 따라 다릅니다.  
> 진행 중에 터미널을 닫거나 전원을 끄면 안 됩니다.


> **`desktop-full`**  
> ROS 2를 설치할 때 여러 버전이 있어요:  
> - `ros-base` = 최소한의 핵심 기능만  
> - `desktop` = 기본 + 시각화 도구  
> - `desktop-full` = 모든 기능 포함 (시뮬레이션, 시각화, 센서 드라이버 등)  
> 우리는 센서, 시각화 등 다 쓸 거라서 `desktop-full`을 설치합니다.


---


### Step 2-4. colcon 설치


```bash
sudo apt install -y python3-colcon-common-extensions
```


> **colcon이 뭔가요?**  
> 우리가 작성한 ROS 2 코드(패키지)를 **빌드(컴파일)하는 도구**입니다.  
> 코드를 컴퓨터가 실행할 수 있는 형태로 변환해주는 과정을 빌드라고 해요.  
> ROS 2 프로젝트에서는 `colcon build` 명령어로 빌드합니다.


---


### Step 2-5. 환경변수 등록 (.bashrc)


```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


> **환경변수**  
> ROS 2 명령어(`ros2`, `colcon` 등)를 터미널 어디서든 쓸 수 있게 **경로를 등록**하는 작업입니다.  
> Windows에서 PATH 환경변수에 프로그램 경로 추가하는 것과 같은 개념이에요.


> **`.bashrc`**  
> 터미널을 열 때마다 **자동으로 실행되는 설정 파일**입니다.  
> 여기에 `source /opt/ros/humble/setup.bash`를 추가해두면,  
> 터미널을 새로 열 때마다 ROS 2 환경이 자동으로 준비됩니다.  
> 안 하면 터미널 새로 열 때마다 수동으로 source 명령을 쳐야 해서 매우 불편해요.


> **`>>`**  
> 파일 맨 뒤에 내용을 추가(append)하는 기호입니다.  
> `>`는 파일 내용을 덮어쓰고, `>>`는 기존 내용을 유지하면서 뒤에 추가해요.


---


## 3. ROS 2 패키지 의존성 설치


### 패키지(Package)


패키지는 특정 기능을 담은 **프로그램 묶음**입니다. 예를 들어 `rplidar-ros`는 RPLiDAR 센서를 ROS 2에서 사용할 수 있게 해주는 드라이버 패키지예요. 이런 패키지들이 모여서 우리 시스템이 동작합니다.


### 확정 패키지 설치


현재 시스템 구성상 반드시 필요한 패키지들입니다.


```bash
sudo apt install -y \
  ros-humble-slam-toolbox \
  ros-humble-nav2-bringup \
  ros-humble-rplidar-ros \
  ros-humble-v4l2-camera \
  ros-humble-micro-ros-agent \
  ros-humble-rosbridge-suite \
  ros-humble-ackermann-msgs \
  ros-humble-robot-localization \
  ros-humble-image-transport \
  ros-humble-cv-bridge \
  ros-humble-rviz2 \
  ros-humble-rqt
```


> **`\`** **(백슬래시) 사용 이유**  
> 명령어가 너무 길어서 **여러 줄로 나눠 쓸 때** 쓰는 기호입니다.  
> 실제로는 한 줄짜리 명령어예요. 가독성을 위해 나눠 쓴 것입니다.


### 확정 패키지 설명


| 패키지 이름            | 한 줄 설명                             | 우리 프로젝트에서의 역할               |
| ----------------- | ---------------------------------- | --------------------------- |
| `slam-toolbox`    | 지도를 만들면서 동시에 자기 위치를 파악하는 SLAM 알고리즘 | LiDAR로 주차 공간 지도 생성          |
| `nav2-bringup`    | 자율주행 내비게이션 스택 (경로 계획, 장애물 회피)      | APA 자율주차 경로 계획              |
| `rplidar-ros`     | RPLiDAR A1 센서 드라이버                 | LiDAR 데이터를 ROS 2 토픽으로 발행    |
| `v4l2-camera`     | USB/CSI 카메라 드라이버                   | Pi Camera 영상을 ROS 2로 전달     |
| `micro-ros-agent` | 아두이노(MCU)와 라즈베리 파이 사이의 통신 다리       | Arduino Mega ↔︎ RPi UART 연결 |
| `rosbridge-suite` | 웹브라우저나 외부 기기와 ROS 2를 연결하는 브릿지      | 원격 모니터링/제어                  |
| `ackermann-msgs`  | 자동차형(앞바퀴 조향) 이동 명령 메시지 타입          | 애커먼 조향 명령 전달                |
| `cv-bridge`       | OpenCV 이미지 ↔︎ ROS 2 이미지 변환 도구      | 카메라 영상을 OpenCV로 처리          |
| `rviz2`           | ROS 2 데이터 시각화 도구 (3D 뷰어)           | 센서 데이터, 경로 등 시각적 확인         |
| `rqt`             | ROS 2 GUI 디버깅/모니터링 툴               | 토픽, 노드 상태 실시간 확인            |


### 미정 패키지 (개발 진행에 따라 추가 예정)


아래 패키지들은 현재 확정되지 않았으나, 기능 구현 단계에서 필요할 가능성이 높습니다.
필요한 시점에 `sudo apt install ros-humble-패키지명` 으로 개별 추가하면 됩니다.


| 패키지 이름                        | 한 줄 설명                      | 필요한 상황                  |
| ----------------------------- | --------------------------- | ----------------------- |
| `ros-humble-joy`              | 조이스틱 입력을 ROS 2 토픽으로 변환      | 수동 제어(Override) 기능 구현 시 |
| `ros-humble-teleop-twist-joy` | 조이스틱 입력을 `/cmd_vel` 명령으로 변환 | 조이패드로 RC카 직접 조종 시       |
| `ros-humble-rqt-graph`        | 노드 연결 구조를 그래프로 시각화          | 노드 간 통신 흐름 디버깅 시        |
| `ros-humble-rqt-plot`         | 토픽 데이터를 실시간 그래프로 출력         | 센서값 변화 추이 확인 시          |
| `ros-humble-ros2bag`          | 주행 중 토픽 데이터를 녹화 및 재생        | 버그 재현, 알고리즘 오프라인 검증 시   |


---


## 4. Python 의존성 설치 (requirements.txt)


### requirements.txt


Python 프로젝트에서 필요한 **라이브러리 목록을 적어둔 파일**입니다.
이 파일 하나로 필요한 모든 Python 라이브러리를 한 번에 설치할 수 있어요.


### requirements.txt 파일 생성


터미널에서 아래 명령어로 파일을 만듭니다:


```bash
cat > ~/requirements.txt << EOF
opencv-python
numpy
transforms3d
pyserial
EOF
```


> **`cat > 파일명 << EOF ... EOF`**   
> 터미널에서 텍스트 파일을 직접 만드는 방법입니다.  
> `EOF`(End Of File) 사이에 적힌 내용이 파일에 저장돼요.  
> 물론 VS Code나 nano 같은 편집기로 직접 파일을 만들어도 됩니다.


### 설치


```bash
pip3 install -r ~/requirements.txt
```


> **`pip3`**  
> Python 패키지를 설치하는 도구입니다. `apt`가 Ubuntu용 앱스토어라면, `pip3`는 **Python 전용 앱스토어**예요.  
> `pip3 install 패키지명` 형식으로 씁니다.  
> `-r 파일명` = 파일에 적힌 목록을 읽어서 모두 설치해줘


### 확정 라이브러리 설명


| 라이브러리           | 설명                                                   | 우리 프로젝트에서의 역할                        |
| --------------- | ---------------------------------------------------- | ------------------------------------ |
| `opencv-python` | 이미지/영상 처리 라이브러리. 카메라 영상에서 물체, 선, 색상 등을 인식할 수 있게 해줍니다 | 차선 인식, 주차 공간 인식 (PAS, APA)           |
| `numpy`         | 수학 연산 라이브러리. 행렬 계산, 통계, 벡터 연산 등을 빠르게 처리합니다           | 칼만 필터 계산, 센서 데이터 수치 처리               |
| `transforms3d`  | 3D 공간에서 좌표 변환(회전, 이동 등)을 처리하는 라이브러리                  | 쿼터니언 ↔︎ 오일러 각도 변환, 로봇 자세 계산          |
| `pyserial`      | Python에서 시리얼(UART) 통신을 할 수 있게 해주는 라이브러리              | Raspberry Pi ↔︎ Arduino UART 데이터 송수신 |


### 미정 라이브러리 (개발 진행에 따라 추가 예정)


아래 라이브러리들은 현재 확정되지 않았으나, 기능 구현 단계에서 필요할 가능성이 높습니다.
필요한 시점에 `pip3 install 패키지명` 으로 개별 추가하면 됩니다.


| 라이브러리        | 설명                                                            | 필요한 상황                 |
| ------------ | ------------------------------------------------------------- | ---------------------- |
| `filterpy`   | 칼만 필터를 쉽게 구현할 수 있게 도와주는 라이브러리. numpy로 직접 짜는 것보다 코드가 훨씬 간결해집니다 | 칼만 필터 구현을 직접 짜기 어려울 경우 |
| `scipy`      | 수치 계산, 신호 처리, 통계 등 과학 계산 전반을 다루는 라이브러리                        | 이동 평균 필터 등 신호 처리 구현 시  |
| `matplotlib` | Python에서 그래프를 그리는 라이브러리                                       | 센서값 변화를 오프라인으로 시각화할 때  |
| `shapely`    | 2D 도형 연산(면적, 교차, 포함 여부 등)을 처리하는 라이브러리                         | 주차 공간 경계 계산 등 기하학 연산 시 |


---


## 5. ROS 2 워크스페이스 구성


### 워크스페이스(Workspace)


워크스페이스는 우리가 개발할 **ROS 2 프로젝트의 작업 폴더**입니다.
모든 코드, 설정 파일, 빌드 결과물이 이 폴더 안에 모입니다.


```text
spas_ws/          ← 워크스페이스 루트
├── src/          ← 우리가 짜는 소스 코드 폴더
├── build/        ← 빌드 중간 결과물 (자동 생성)
├── install/      ← 최종 설치 결과물 (자동 생성)
└── log/          ← 빌드 로그 (자동 생성)
```


### Step 5-1. 워크스페이스 생성


```bash
# 워크스페이스 폴더와 src 폴더 생성
mkdir -p ~/spas_ws/src

# 워크스페이스 폴더로 이동
cd ~/spas_ws
```


> **`mkdir -p`**  
> 폴더(디렉토리)를 만드는 명령어입니다.  
> `-p` 옵션은 중간 폴더가 없어도 한 번에 만들어줘요.  
> 예: `spas_ws` 폴더가 없어도 `spas_ws/src`까지 한 번에 생성.


### Step 5-2. rosdep 설정


`rosdep`은 ROS 2 패키지들의 의존성을 자동으로 해결해주는 도구입니다.
`src/` 안에 패키지를 넣고 빌드하기 전에 반드시 실행해야 해요.
안 하면 “이 패키지가 없어서 빌드 실패”처럼 어디서 막혔는지 모르는 오류가 자주 납니다.


```bash
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src -r -y
```


> **각 명령어가 하는 일은?**  
> - `sudo rosdep init` = rosdep 시스템을 처음 초기화. 최초 1회만 실행하면 됩니다.  
> - `rosdep update` = rosdep이 참조하는 의존성 목록을 최신으로 갱신.  
> - `rosdep install --from-paths src --ignore-src -r -y` = `src/` 폴더 안의 모든 패키지를 훑어보고, 각 패키지가 필요로 하는 의존성을 자동으로 설치.  
> - `--ignore-src` = `src/` 안에 있는 패키지는 이미 있는 거니까 건너뜀  
> - `-r` = 오류가 생겨도 멈추지 말고 계속 진행  
> - `-y` = 설치 여부 물어보면 자동으로 Yes


### Step 5-3. 첫 번째 빌드


```bash
cd ~/spas_ws
colcon build --symlink-install
```


> **`--symlink-install`**  
> 빌드할 때 파일을 **복사하지 않고 링크(바로가기)를 만드는 옵션**입니다.  
> 이 옵션을 쓰면 `src/` 안의 Python 파일을 수정했을 때 다시 빌드하지 않아도 바로 반영됩니다.  
> 개발할 때 매우 편리해서 항상 이 옵션을 씁니다.


처음 빌드할 때는 `src/` 가 비어있어서 특별히 빌드할 것이 없지만, 워크스페이스 구조를 초기화하는 역할을 합니다. `build/`, `install/`, `log/` 폴더가 자동으로 생성됩니다.


### Step 5-4. 워크스페이스 환경 자동 적용


```bash
echo "source ~/spas_ws/install/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


> **왜 또** **`.bashrc`****에 등록하는지**  
> ROS 2 기본 설치(Step 2-5)와 우리 워크스페이스는 별개입니다.  
> 우리 워크스페이스에서 만든 노드를 `ros2 run` 명령으로 실행하려면,  
> 워크스페이스의 `install/setup.bash`도 함께 소싱(source)해줘야 해요.  
> 안 하면 “패키지를 찾을 수 없습니다” 오류가 납니다.


### Step 5-5. ROS 2 패키지 생성 (코딩 시작 시)


워크스페이스 안에 실제 코드를 담을 패키지를 만들 때 쓰는 명령어입니다.
환경 구축 단계에서 바로 실행할 필요는 없고, 본격적으로 노드를 작성하기 시작할 때 사용합니다.


```bash
cd ~/spas_ws/src

# Python 기반 패키지 생성
ros2 pkg create --build-type ament_python 패키지이름
```


예를 들어 PAS 기능을 담을 패키지를 만들 때는 이렇게 씁니다:


```bash
ros2 pkg create --build-type ament_python spas_pas
```


> **`ament_python`**  
> ROS 2에서 패키지를 만들 때 빌드 방식을 지정하는 옵션입니다.  
> 우리 프로젝트는 Python으로 노드를 작성하므로 `ament_python`을 씁니다.  
> C++로 짤 때는 `ament_cmake`를 씁니다.


패키지를 만들고 나면 아래와 같은 구조가 생깁니다:


```text
src/
└── spas_pas/
    ├── package.xml        ← 패키지 정보 및 의존성 목록
    ├── setup.py           ← Python 빌드 설정
    ├── setup.cfg
    └── spas_pas/
        └── __init__.py    ← 실제 Python 코드를 여기 추가
```


패키지를 추가하거나 코드를 수정한 뒤에는 항상 다시 빌드해야 합니다:


```bash
cd ~/spas_ws
colcon build --symlink-install
```


---


## 6. micro-ROS Agent 실행 (Arduino 연결)


### micro-ROS


ROS 2는 원래 Raspberry Pi처럼 리눅스가 돌아가는 보드에서 씁니다.
그런데 Arduino는 리눅스가 없는 **초소형 마이크로컨트롤러**라서 ROS 2를 직접 돌릴 수 없어요.


**micro-ROS**는 Arduino 같은 초소형 장치에서도 ROS 2 통신을 할 수 있게 해주는 경량 버전입니다.


통신 구조는 이렇습니다:


```text
Arduino (micro-ROS 펌웨어)
    ↕ UART 시리얼 통신 (115200 bps)
Raspberry Pi (micro-ROS Agent)
    ↕ ROS 2 내부 통신
다른 ROS 2 노드들
```


**micro-ROS Agent**는 라즈베리 파이에서 실행되는 중간 다리 역할을 합니다.
Arduino가 보내는 데이터를 받아서 ROS 2 토픽으로 변환해줘요.


### 시리얼 포트 권한 설정


```bash
sudo usermod -aG dialout $USER
```


> **왜 권한 설정이 필요한지**  
> 리눅스에서 시리얼 포트(`/dev/ttyACM0` 등)는 보안상 아무나 접근하지 못하게 되어 있어요.  
> `dialout` 그룹에 현재 사용자를 추가하면 시리얼 포트를 `sudo` 없이 쓸 수 있습니다.  
> **이 명령 후에는 로그아웃 → 다시 로그인을 해야 적용됩니다.**


> **`$USER`**  
> 현재 로그인된 사용자 이름이 자동으로 들어가는 **변수**입니다.  
> 예: 사용자명이 `ubuntu`라면 `usermod -aG dialout ubuntu`와 같은 명령이에요.


### micro-ROS Agent 실행


```bash
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0 -b 115200
```


> **`/dev/ttyACM0`**  
> Arduino를 USB로 연결했을 때 리눅스가 자동으로 부여하는 **장치 파일 경로**입니다.  
> 리눅스에서는 모든 장치를 파일처럼 취급해요.  
> Arduino가 처음 연결되면 보통 `/dev/ttyACM0` 또는 `/dev/ttyUSB0`이 됩니다.  
> 어떤 포트인지 확인하려면: `ls /dev/tty*` 명령어로 확인하세요.


> **`115200 bps`**  
> 시리얼 통신 속도(Baud Rate)입니다. 초당 115,200비트를 전송한다는 의미예요.  
> Arduino 펌웨어에서 설정한 속도와 Agent에서 설정한 속도가 반드시 일치해야 통신이 됩니다.  
> 우리 프로젝트는 115200 bps로 통일합니다.


---


## 7. 설치 확인


### ROS 2 설치 확인


```bash
ros2 --version
```


정상 출력 예시:


```text
ros2 humble
```


### 통신 테스트 (talker / listener)


터미널을 **2개** 열어서 각각 실행합니다.


**터미널 1:**


```bash
ros2 run demo_nodes_cpp talker
```


**터미널 2:**


```bash
ros2 run demo_nodes_cpp listener
```


> ROS 2의 기본 예제입니다.  
> - `talker` = “Hello World: 1”, “Hello World: 2” … 메시지를 계속 발행(publish)하는 노드  
> - `listener` = talker가 보낸 메시지를 구독(subscribe)해서 화면에 출력하는 노드


	터미널 2에서 “Hello World” 메시지가 출력되면 ROS 2가 정상적으로 작동하는 겁니다.


### LiDAR 연결 테스트


RPLiDAR A1을 USB로 연결한 후:


```bash
ros2 launch rplidar_ros rplidar_a1_launch.py
```


> **`launch`**  
> 여러 개의 노드를 한 번에 실행하는 명령입니다.  
> `launch 파일`에 “이 노드들을 이 설정으로 실행해줘”를 미리 정의해두면,  
> 명령어 하나로 전체 시스템을 시작할 수 있어요.


---


## 8. ROS 2 네트워크 설정 (ROS_DOMAIN_ID)


### ROS_DOMAIN_ID


ROS 2는 같은 Wi-Fi 네트워크 안에 있는 모든 기기에서 토픽을 주고받을 수 있습니다. 그런데 팀원 5명이 각자 라즈베리 파이와 노트북을 연결해서 작업하면, 내 라즈베리 파이 데이터가 옆 사람 노트북에도 보이는 혼선이 생겨요.


`ROS_DOMAIN_ID`는 ROS 2 통신을 특정 그룹 안에서만 주고받도록 구분하는 **채널 번호**입니다. 같은 번호끼리만 통신하고, 다른 번호끼리는 서로 보이지 않아요.


우리 팀은 라즈베리 파이와 노트북 모두 **같은 번호**로 맞춰야 합니다. 번호는 0~232 사이에서 자유롭게 정하면 되는데, 팀 내에서 하나로 통일하면 돼요.


```bash
# .bashrc에 추가 (라즈베리 파이와 개발 노트북 모두 동일하게 설정)
echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
source ~/.bashrc
```


> **설정 후 확인 방법**  
> 라즈베리 파이와 노트북이 같은 Wi-Fi에 연결된 상태에서, 라즈베리 파이에서 talker를 실행하고 노트북에서 아래 명령어를 치면 토픽이 보여야 합니다.


	```bash
	ros2 topic list
	```


	토픽이 보이면 네트워크 연결이 정상입니다.


---


## 9. SSH 원격 접속 설정


### SSH


SSH(Secure Shell)는 **네트워크를 통해 다른 컴퓨터의 터미널을 원격으로 제어하는 방법**입니다. 라즈베리 파이에 모니터와 키보드를 매번 연결하지 않고, 노트북에서 바로 라즈베리 파이 터미널을 열 수 있어요.


실제 개발에서는 라즈베리 파이를 RC카에 올려두고, 노트북에서 SSH로 접속해서 코드를 실행하는 방식으로 작업합니다.


### Step 9-1. 라즈베리 파이 IP 주소 확인


라즈베리 파이 터미널에서 아래 명령어로 IP 주소를 확인합니다.


```bash
hostname -I
```


출력 예시:


```text
192.168.0.15
```


앞에 나오는 숫자가 라즈베리 파이의 IP 주소입니다. 이 주소는 Wi-Fi 환경에 따라 달라지고, 재부팅하면 바뀔 수 있어요.


### Step 9-2. 노트북에서 SSH 접속


노트북 터미널(또는 PowerShell)에서 아래 명령어를 실행합니다.


```bash
ssh ubuntu@192.168.0.15
```


형식은 `ssh 사용자명@IP주소` 입니다. 처음 접속할 때 “정말 연결할 거야?” 라는 질문이 나오면 `yes`를 입력하고, 라즈베리 파이에 설정한 비밀번호를 입력하면 접속됩니다.


> **접속 후 터미널 → 라즈베리 파이 터미널**  
> 접속에 성공하면 프롬프트가 `ubuntu@spas:~$` 처럼 라즈베리 파이 호스트명으로 바뀝니다. 이 상태에서 입력하는 모든 명령어는 라즈베리 파이에서 실행돼요.  
> SSH 접속을 종료하려면 `exit`를 입력하면 됩니다.


### Step 9-3. VS Code Remote SSH 설정 (권장)


터미널 SSH만으로도 개발할 수 있지만, VS Code의 Remote SSH 확장을 쓰면 노트북에서 VS Code를 열고 라즈베리 파이 파일을 직접 편집할 수 있어서 훨씬 편합니다.


**설치 순서:**

1. VS Code 실행 → 왼쪽 확장(Extensions) 탭 클릭
2. `Remote - SSH` 검색 후 설치 (Microsoft 공식 확장)
3. 왼쪽 하단 파란 버튼(또는 `Ctrl+Shift+P`) → `Remote-SSH: Connect to Host` 선택
4. `ubuntu@192.168.0.15` 입력 후 엔터
5. 비밀번호 입력하면 VS Code가 라즈베리 파이에 연결됩니다
6. `File > Open Folder` 에서 `~/spas_ws` 를 열면 라즈베리 파이 파일을 VS Code에서 바로 편집 가능

> **매번 IP 주소가 바뀌는 문제**  
> 공유기 설정에서 라즈베리 파이의 MAC 주소에 고정 IP를 할당(DHCP 고정 임대)하면 재부팅해도 같은 IP가 유지됩니다. 공유기 브랜드마다 설정 방법이 다르니 검색해서 확인하세요.


---


## 10. GitHub 연동 및 코드 관리


### Step 10-1. Git 설치 및 초기 설정


```bash
# Git 설치
sudo apt install -y git

# 사용자 정보 등록 (GitHub 계정 정보와 맞춰서 입력)
git config --global user.name "이름"
git config --global user.email "이메일@example.com"
```


### Step 10-2. .gitignore 설정


ROS 2 워크스페이스에서 `build/`, `install/`, `log/` 폴더는 빌드할 때마다 자동으로 생성되는 폴더라서 GitHub에 올릴 필요가 없어요. 오히려 올리면 용량만 커지고 충돌이 자주 납니다.


`.gitignore` 파일에 이 폴더들을 등록하면 Git이 자동으로 무시합니다.


```bash
cd ~/spas_ws

cat > .gitignore << EOF
build/
install/
log/
*.pyc
__pycache__/
.vscode/
EOF
```


> **.gitignore가 뭔가요?**  
> Git에게 “이 파일/폴더는 추적하지 말고 무시해줘”라고 알려주는 설정 파일입니다.  
> 여기에 등록된 항목은 `git add` 해도 포함되지 않아요.


### Step 10-3. 원격 저장소 연결


GitHub에서 팀 레포지토리를 미리 만들어둔 상태에서 진행합니다.


```bash
cd ~/spas_ws

# Git 저장소 초기화
git init

# 원격 저장소 연결 (팀 GitHub 레포 주소로 교체)
git remote add origin https://github.com/팀계정/spas_ws.git

# 현재 상태 확인
git status
```


### Step 10-4. 기본 Git 작업 흐름


코드를 수정하고 GitHub에 올리는 기본 순서입니다.


```bash
# 1. 변경된 파일 확인
git status

# 2. 변경 사항을 스테이징 (올릴 파일 선택)
git add src/

# 3. 커밋 (변경 이력 저장)
git commit -m "feat: PAS 초음파 센서 노드 추가"

# 4. GitHub에 업로드
git push origin main
```


> **커밋 메시지 규칙**  
> 규칙 을 정해두면 나중에 이력을 보기 편합니다. 간단한 규칙 예시:  
> - `feat:` 새 기능 추가  
> - `fix:` 버그 수정  
> - `docs:` 문서 수정  
> - `refactor:` 코드 구조 개선 (기능 변화 없음)


> **다른 팀원 코드 받아오기**


	```bash
	git pull origin main
	```


	작업 시작 전에 항상 pull을 먼저 하는 습관을 들이세요. 안 하면 충돌(conflict)이 발생할 확률이 높아집니다.


---


## 11. Arduino IDE 및 micro-ROS 펌웨어 설치


> **이 섹션은 하드웨어(Arduino Mega 2560) 도착 후 진행합니다.**  
> 지금 당장 설치할 필요는 없고, 보드가 오면 그때 따라 하세요.


### 전체 흐름 이해


Arduino 쪽 설정은 크게 두 단계로 나뉩니다.


```text
[노트북]
  Arduino IDE 설치
      ↓
  micro-ROS 라이브러리 추가
      ↓
  Arduino 코드 작성 및 업로드 (USB)
      ↓
[Arduino Mega 2560]
  micro-ROS 펌웨어 실행
      ↕ UART (115200 bps)
[Raspberry Pi]
  micro-ROS Agent 실행  →  ROS 2 토픽 발행/구독
```


### Step 11-1. Arduino IDE 설치


노트북(Windows / macOS / Linux 모두 가능)에서 아래 주소로 가서 Arduino IDE 2.x 버전을 설치합니다.


https://www.arduino.cc/en/software


### Step 11-2. Arduino Mega 2560 보드 등록


Arduino IDE를 처음 설치하면 Mega 2560이 목록에 없을 수 있습니다.

1. Arduino IDE 실행
2. `Tools > Board > Boards Manager` 클릭
3. `Arduino AVR Boards` 검색 후 설치

설치 후 `Tools > Board > Arduino AVR Boards > Arduino Mega or Mega 2560` 을 선택합니다.


### Step 11-3. micro-ROS 라이브러리 추가

1. Arduino IDE에서 `Sketch > Include Library > Manage Libraries` 클릭
2. `micro_ros_arduino` 검색 후 설치

> **버전 주의**  
> micro-ROS 라이브러리 버전이 라즈베리 파이에 설치된 ROS 2 버전과 맞아야 합니다.  
> 우리는 ROS 2 Humble을 쓰므로, `micro_ros_arduino` 에서 **Humble** 버전을 선택해서 설치하세요.


### Step 11-4. 펌웨어 업로드


Arduino 코드를 작성한 뒤, Arduino를 노트북 USB에 연결하고 업로드합니다.

1. `Tools > Port` 에서 Arduino가 연결된 포트 선택 (Windows: `COM3` 같은 형태, Linux: `/dev/ttyACM0`)
2. 업로드 버튼(오른쪽 화살표) 클릭

업로드가 완료되면 Arduino를 라즈베리 파이 USB에 연결하고, 라즈베리 파이에서 micro-ROS Agent를 실행하면 통신이 시작됩니다.


```bash
# 라즈베리 파이에서 실행
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0 -b 115200
```


Agent 실행 후 Arduino에서 발행하는 토픽이 보이면 연결 성공입니다.


```bash
# 새 터미널에서 토픽 확인
ros2 topic list
```


---


## 설치 완료 체크리스트


### 라즈베리 파이

- [ ] Ubuntu 22.04 부팅 및 `apt update/upgrade` 완료
- [ ] `ros2 --version` 명령어 정상 출력
- [ ] talker / listener 통신 테스트 성공
- [ ] `colcon build` 명령어 오류 없이 실행
- [ ] `pip3 install -r requirements.txt` 완료
- [ ] `ROS_DOMAIN_ID` 설정 완료
- [ ] SSH 접속 가능 확인
- [ ] GitHub 원격 저장소 연결 완료
- [ ] Arduino 연결 후 `/dev/ttyACM0` 포트 확인 (하드웨어 도착 후)
- [ ] micro-ROS Agent 실행 성공 (하드웨어 도착 후)

### 개발 노트북

- [ ] ROS 2 Humble 설치 완료 (개발 PC 환경 구축 문서 참고)
- [ ] `ROS_DOMAIN_ID` 동일하게 설정
- [ ] SSH 원격 접속 확인
- [ ] VS Code Remote SSH 연결 확인
- [ ] `ros2 topic list` 로 라즈베리 파이 토픽 수신 확인
- [ ] Arduino IDE 및 micro-ROS 라이브러리 설치 (하드웨어 도착 후)

---


## 자주 발생하는 오류 모음


### “ros2: command not found”


`.bashrc`에 환경변수가 제대로 등록되지 않은 경우입니다.


```bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
```


### “package ‘xxx’ not found”


워크스페이스 환경이 소싱되지 않은 경우입니다.


```bash
source ~/spas_ws/install/setup.bash
```


### “/dev/ttyACM0: Permission denied”


시리얼 포트 권한 설정이 적용되지 않은 경우입니다.


```bash
sudo usermod -aG dialout $USER
# 로그아웃 후 다시 로그인
```


### colcon build 중 오류


의존성 패키지가 없는 경우가 많습니다.


```bash
rosdep update
rosdep install --from-paths src --ignore-src -r -y
```


### 노트북에서 ros2 topic list를 쳐도 라즈베리 파이 토픽이 안 보임


`ROS_DOMAIN_ID`가 다르거나, 같은 Wi-Fi에 연결되지 않은 경우입니다.


```bash
# 라즈베리 파이와 노트북 양쪽에서 확인
echo $ROS_DOMAIN_ID
```


두 값이 다르면 `.bashrc`에서 같은 번호로 맞추고 `source ~/.bashrc`를 다시 실행하세요.


### SSH 접속이 안 됨


라즈베리 파이와 노트북이 같은 Wi-Fi에 연결되어 있는지 확인하고, IP 주소가 바뀌지 않았는지 확인합니다.


```bash
# 라즈베리 파이에서 현재 IP 확인
hostname -I
```


---


## 전체 설치 구성 요약


| 항목                  | 내용                                                                                                                                                         |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **운영체제 (RPi)**      | Ubuntu 22.04 LTS (64-bit)                                                                                                                                  |
| **플랫폼**             | Raspberry Pi 4 (8GB)                                                                                                                                       |
| **ROS 버전**          | ROS 2 Humble Hawksbill                                                                                                                                     |
| **빌드 도구**           | colcon                                                                                                                                                     |
| **확정 ROS 패키지**      | slam-toolbox, nav2, rplidar-ros, v4l2-camera, micro-ros-agent, rosbridge-suite, ackermann-msgs, robot-localization, image-transport, cv-bridge, rviz2, rqt |
| **미정 ROS 패키지**      | joy, teleop-twist-joy, rqt-graph, rqt-plot, ros2bag                                                                                                        |
| **확정 Python 라이브러리** | opencv-python, numpy, transforms3d, pyserial                                                                                                               |
| **미정 Python 라이브러리** | filterpy, scipy, matplotlib, shapely                                                                                                                       |
| **MCU 통신**          | micro-ROS (UART, 115200 bps)                                                                                                                               |
| **저장 매체**           | Micro SD 64GB                                                                                                                                              |
| **네트워크 설정**         | ROS_DOMAIN_ID=1 (팀 전체 통일)                                                                                                                                  |
| **원격 접속**           | SSH + VS Code Remote SSH                                                                                                                                   |
| **버전 관리**           | Git / GitHub                                                                                                                                               |
| **개발 PC 환경**        | 별도 문서 참고                                                                                                                                                   |


## 센서 Datasheet

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


	![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/cb5df3d6-5097-4d01-b668-27d53bd33b05/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664L7QDKCE%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222157Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIBjP86gv595FUvKx1IDRaWTHMAdkf%2FPjY4H96MhibZXhAiBO6s7QGlF5ANGWeMjGWHC%2Bp6EFneZn%2BrX73laIsgUV2iqIBAjP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM97676uSNE46yLauBKtwDlH1EwTVGZTkbrOutPBA3J5lCc5rN%2Favy6MKQjAJUI7NVTpCEc%2FTR7NHyAVyiwnmS9rq%2BK%2F5KiR%2F%2FsssvXqIhbVLwW9n55EdlHvu20CiI41tRLtnxP0AclXmi1gVYSkWTAyk31%2B3QoVuf%2FHfXuuyju0H6009pNW9an8Si5ObZww82LOWBm17HjshcAUyj8XOPSeW0SXMPKYIi3aGA4Od%2FtLXgV%2BNj%2BnzDNKfujo4rm%2BDlCuvQ0eAsTpz%2Bahh8avPbxPfrWxYAx3Q8xgBNcgLFVQQLlcAgDVc%2Bl6M8CU4vzUSnx5fJT89pJvk8JzywK2MehNCFRGCMPgAyMZ5vAFzKcerrjk97t7qeTsk6zVGWf32rxbzHnpFRjG4OpEj0kHHsue%2FCpu9ES23c6otzKo2O4IydxmrqMbEkYeg40Hph1WizshmEooGc%2Fmk%2BWo8CA6uBkR5Q12me%2FBa66aZD6osoENP5jOud7VcLkb3%2BmzWWONqOWRjzjLl0oH5C%2B8wmyYVi9NKgcpSm7hZZXNv%2BUznnd0xhxYEpIIFLMlRcb3zHKAdQuZDFws8jAxpHju0aJKZCv409kX80flvW%2B6ltM0qgEGFOnEwn%2BGmFu7fjABm2u9zJQCMJi4UX6qUGSKgwzuiQ0gY6pgFfiMYp8yiGqwnmNifl1PG0%2BdyEBe%2B1LhvfHvfwbj1EptQ6O3HpsQ6OkvQsWFFS6m59CzS%2By2VTWYdSTLpqK4apu3eriLSu%2FeFQEvdGIpu5utAtEgfNugqqT4wTNtl8NAseiu%2FDtN6WDx9wmQmLVEU8amSI2f3YI9gM01mBdBgfWvhGpMENjmBIL%2FykW7AX%2FNucD9w6Il73m2%2BuGdM5DyT%2BpkIJQg54&X-Amz-Signature=55c5a718bb0651fe82dd15e6ff5cbac9132a8c94f43a366081ac9d1e42144b18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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


# Test Code


## HC-SR04 [초음파 센서]

**칼만 필터 적용  (Arduino Mega 2560) → PDW 기능 구현**


```arduino
//PDW
#include <SimpleKalmanFilter.h>

// ─── 핀 설정 ─────────────────────────────────────────────────
const int trigPins[4]  = {22, 24, 26, 28};  // 전, 후, 좌, 우
const int echoPins[4]  = {23, 25, 27, 29};
const int BUZZER_PIN   = 11;

// ─── SimpleKalmanFilter(e_mea, e_est, q) ─────────────────────
// e_mea : 측정 노이즈 공분산
// e_est : 추정 오차 초기값
// q     : 프로세스 노이즈 (낮을수록 부드러움)
SimpleKalmanFilter filters[4] = {
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01)
};

// ─── 경계 및 채터링 방지 마진 ────────────────────────────────
const float MARGIN     = 0.3;   // 히스테리시스 마진 (cm)
const float BOUNDARY_1 = 2.0;  
const float BOUNDARY_2 = 5.0;  
const float BOUNDARY_3 = 8.0;  
const float BOUNDARY_4 = 11.0;

// 현재 PDW 단계 (0=안전, 1=주의, 2=경고, 3=위험)
int pdwState = 0;

// ─── 초음파 거리 측정 ────────────────────────────────────────
float getDistance(int id) {
  digitalWrite(trigPins[id], LOW);
  delayMicroseconds(2);
  digitalWrite(trigPins[id], HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPins[id], LOW);

  long duration = pulseIn(echoPins[id], HIGH, 20000);
  if (duration == 0) return 400.0;
  return duration * 0.0343 / 2.0;
}

// ─── 히스테리시스 적용 PDW 상태 전환 ────────────────────────
// 현재 단계에서 벗어나려면 경계 ± MARGIN을 완전히 넘어야 전환
// 예) 단계2(경고)→단계1(주의) 전환 조건: minDist > BOUNDARY_2 + MARGIN
//     단계1(주의)→단계2(경고) 전환 조건: minDist < BOUNDARY_2 - MARGIN
int getNextState(float minDist, int currentState) {
  switch (currentState) {

    case 0:  // 안전 → 주의 전환 조건
      if (minDist < BOUNDARY_4) return 1;
      return 0;

    case 1:  // 주의
      if (minDist < BOUNDARY_3) return 2;  // 주의 → 경고
      if (minDist > BOUNDARY_4 + MARGIN) return 0;  // 주의 → 안전
      return 1;

    case 2:  // 경고
      if (minDist < BOUNDARY_2) return 3;  // 경고 → 위험
      if (minDist > BOUNDARY_3 + MARGIN) return 1;  // 경고 → 주의
      return 2;
    
    case 3:  // 위험
      if (minDist < BOUNDARY_1) return 4;  // 경고 → 위험
      if (minDist > BOUNDARY_2 + MARGIN) return 2;  // 경고 → 주의
      return 3;

    case 4:  // 제동
      if (minDist > BOUNDARY_1 + MARGIN) return 3;  // 위험 → 경고
      return 4;
      

    default:
      return 0;
  }
}

// ─── PDW 부저 출력 ───────────────────────────────────────────
void updatePDW(float minDist) {
  pdwState = getNextState(minDist, pdwState);

  switch (pdwState) {
    case 4:  // 제동 (2cm 미만): 지속음
      digitalWrite(BUZZER_PIN, HIGH);
      break;
    case 3:  // 위험 (5cm 미만): 빠른 단속음 200ms 주기
      digitalWrite(BUZZER_PIN, HIGH);
      break;
    case 2:  // 경고 (8cm 미만)
      digitalWrite(BUZZER_PIN, (millis() % 200 < 100));
      break;
    case 1:  // 주의 (11cm 미만): 느린 단속음 600ms 주기
      digitalWrite(BUZZER_PIN, (millis() % 600 < 100));
      break;
    case 0:  // 안전: 무음
    default:
      digitalWrite(BUZZER_PIN, LOW);
      break;
  }
}

// ─── Setup ───────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  for (int i = 0; i < 4; i++) {
    pinMode(trigPins[i], OUTPUT);
    pinMode(echoPins[i], INPUT);
  }
  pinMode(BUZZER_PIN, OUTPUT);
}

// ─── Loop ────────────────────────────────────────────────────
void loop() {
  float minD = 400.0;

  Serial.print("S");
  for (int i = 0; i < 4; i++) {
    float raw = getDistance(i);
    float filtered = filters[i].updateEstimate(raw);

    if (filtered < minD) minD = filtered;

    Serial.print(",");
    Serial.print(filtered, 1);
  }
  Serial.println(",E");

  updatePDW(minD);
  delay(50);
}
```


```arduino
// ============================================================
//  정적 초음파 센서 노이즈 측정 + 칼만 필터 비교
//  SimpleKalmanFilter 라이브러리 사용
//  20초간 연속 측정 후 통계 출력 및 정지
// ============================================================

#include <SimpleKalmanFilter.h>

// ─── 핀 설정 ────────────────────────────────────────────────
const int TRIG_PIN   = 24;
const int ECHO_PIN   = 25;
const int BUZZER_PIN = 11;

// ─── 실험 파라미터 ──────────────────────────────────────────
const float REAL_DISTANCE   = 30.0;   // 실제 측정 거리 (cm)
const unsigned long MEASURE_DURATION = 20000; // 측정 시간 (ms) = 20초
const int   DELAY_MS        = 50;     // 샘플링 간격 (ms) ≈ 20Hz

// ─── SimpleKalmanFilter(e_mea, e_est, q) ────────────────────
// e_mea : 측정 노이즈 공분산 (클수록 측정값을 덜 신뢰)
// e_est : 추정 오차 초기값
// q     : 프로세스 노이즈 (클수록 변화에 빠르게 반응)
SimpleKalmanFilter kalman(1.0, 1.0, 0.01);

// ─── 통계 누적 변수 ─────────────────────────────────────────
int   sampleIndex    = 0;
float rawSum         = 0, rawSumSq    = 0;
float rawMin         = 9999, rawMax   = -9999;
float rawErrSum      = 0, rawErrSqSum = 0;
float kalSum         = 0, kalSumSq    = 0;
float kalMin         = 9999, kalMax   = -9999;
float kalErrSum      = 0, kalErrSqSum = 0;

bool done = false;

// ─── 초음파 거리 측정 함수 ───────────────────────────────────
float measureDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return -1.0;
  return (float)duration * 0.01715;
}

// ─── 통계 출력 함수 ──────────────────────────────────────────
void printStats() {
  float n = (float)sampleIndex;

  float rawMean  = rawSum / n;
  float rawVar   = (rawSumSq / n) - (rawMean * rawMean);
  float rawStd   = sqrt(rawVar);
  float rawRMSE  = sqrt(rawErrSqSum / n);
  float rawMAE   = rawErrSum / n;
  float rawRange = rawMax - rawMin;
  float rawSNR   = (rawStd > 0) ? 20.0 * log10(REAL_DISTANCE / rawStd) : 99.0;

  float kalMean  = kalSum / n;
  float kalVar   = (kalSumSq / n) - (kalMean * kalMean);
  float kalStd   = sqrt(kalVar);
  float kalRMSE  = sqrt(kalErrSqSum / n);
  float kalMAE   = kalErrSum / n;
  float kalRange = kalMax - kalMin;
  float kalSNR   = (kalStd > 0) ? 20.0 * log10(REAL_DISTANCE / kalStd) : 99.0;

  float stdReduction  = (rawStd  > 0) ? (1.0 - kalStd  / rawStd)  * 100.0 : 0;
  float rmseReduction = (rawRMSE > 0) ? (1.0 - kalRMSE / rawRMSE) * 100.0 : 0;

  Serial.println(F("\n===================================================="));
  Serial.print(F("  측정 완료 — 총 ")); Serial.print(sampleIndex);
  Serial.print(F("샘플 / 목표 ")); Serial.print(REAL_DISTANCE);
  Serial.println(F("cm"));
  Serial.println(F("===================================================="));
  Serial.println(F("  지표            Raw          Kalman       감소율"));
  Serial.println(F("  ─────────────────────────────────────────────────"));

  Serial.print(F("  표준편차(σ)  "));
  Serial.print(rawStd, 4); Serial.print(F(" cm    "));
  Serial.print(kalStd, 4); Serial.print(F(" cm   "));
  Serial.print(stdReduction, 1); Serial.println(F("%"));

  Serial.print(F("  RMSE         "));
  Serial.print(rawRMSE, 4); Serial.print(F(" cm    "));
  Serial.print(kalRMSE, 4); Serial.print(F(" cm   "));
  Serial.print(rmseReduction, 1); Serial.println(F("%"));

  Serial.print(F("  MAE          "));
  Serial.print(rawMAE, 4); Serial.print(F(" cm    "));
  Serial.print(kalMAE, 4); Serial.println(F(" cm"));

  Serial.print(F("  평균          "));
  Serial.print(rawMean, 4); Serial.print(F(" cm    "));
  Serial.print(kalMean, 4); Serial.println(F(" cm"));

  Serial.print(F("  범위(max-min) "));
  Serial.print(rawRange, 4); Serial.print(F(" cm    "));
  Serial.print(kalRange, 4); Serial.println(F(" cm"));

  Serial.print(F("  SNR           "));
  Serial.print(rawSNR, 2); Serial.print(F(" dB     "));
  Serial.print(kalSNR, 2); Serial.println(F(" dB"));

  Serial.println(F("===================================================="));
  Serial.println(F("  ** 측정 종료 — 리셋 버튼을 눌러 재시작 **"));
  Serial.println(F("====================================================\n"));
}

// ─── Setup ───────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  Serial.println(F("===================================================="));
  Serial.println(F("  초음파 센서 노이즈 측정 (20초 연속)"));
  Serial.println(F("  SimpleKalmanFilter 라이브러리 사용"));
  Serial.println(F("===================================================="));
  Serial.print(F("  샘플링 간격: ")); Serial.print(DELAY_MS);
  Serial.print(F("ms / 목표거리: ")); Serial.print(REAL_DISTANCE);
  Serial.println(F("cm"));
  Serial.println(F("----------------------------------------------------"));
  Serial.println(F("sample,raw_cm,kalman_cm,raw_err,kalman_err"));
}

// ─── Loop ────────────────────────────────────────────────────
void loop() {
  if (done) return;

  // 20초 경과 시 통계 출력 후 정지
  if (millis() >= MEASURE_DURATION) {
    printStats();
    done = true;
    return;
  }

  float rawDist = measureDistance();
  if (rawDist < 0) {
    Serial.println(F("# 측정 실패 (타임아웃)"));
    delay(DELAY_MS);
    return;
  }

  float noise = random(-30, 30) / 10.0; 

  // 가끔씩 (약 10% 확률) 아주 크게 튀는 노이즈(Spike) 발생
  if (random(0, 100) < 10) {
      noise = random(100, 200) / 10.0; // 10 ~ 20cm 튀는 값
  }

  // 3. 노이즈가 섞인 원본 값 (센서의 퀄리티가 안 좋다고 가정)
  float noisyDist = rawDist + noise;
  rawDist = noisyDist;

  float kalDist = kalman.updateEstimate(noisyDist);  // SimpleKalmanFilter 적용

  float rawErr = rawDist - REAL_DISTANCE;
  float kalErr = kalDist - REAL_DISTANCE;

  // CSV 출력
  Serial.print(sampleIndex + 1); Serial.print(F(","));
  Serial.print(rawDist,  4);     Serial.print(F(","));
  Serial.print(kalDist,  4);     Serial.print(F(","));
  Serial.print(rawErr,   4);     Serial.print(F(","));
  Serial.println(kalErr, 4);

  // 통계 누적
  rawSum      += rawDist;
  rawSumSq    += rawDist * rawDist;
  rawErrSum   += fabs(rawErr);
  rawErrSqSum += rawErr * rawErr;
  if (rawDist < rawMin) rawMin = rawDist;
  if (rawDist > rawMax) rawMax = rawDist;

  kalSum      += kalDist;
  kalSumSq    += kalDist * kalDist;
  kalErrSum   += fabs(kalErr);
  kalErrSqSum += kalErr * kalErr;
  if (kalDist < kalMin) kalMin = kalDist;
  if (kalDist > kalMax) kalMax = kalDist;

  sampleIndex++;

  delay(DELAY_MS);
}
```


```arduino
// ============================================================
//  동적 초음파 센서 노이즈 측정 + 칼만 필터 비교
//  SimpleKalmanFilter 라이브러리 사용
//  60초간 연속 측정 후 통계 출력 및 정지
// ============================================================

#include <SimpleKalmanFilter.h>

// ─── 핀 설정 ────────────────────────────────────────────────
const int TRIG_PIN   = 24;
const int ECHO_PIN   = 25;
const int BUZZER_PIN = 11;

// ─── 실험 파라미터 ──────────────────────────────────────────
const unsigned long MEASURE_DURATION = 60000; // 측정 시간 20초
const int   DELAY_MS     = 20;    // 샘플링 간격 20ms = 50Hz
                                  // (동적 환경: 빠른 움직임 포착용)
const float DIST_MIN     = 2.0;   // 유효 측정 범위 최소 (cm)
const float DIST_MAX     = 400.0; // 유효 측정 범위 최대 (cm)

// ─── SimpleKalmanFilter(e_mea, e_est, q) ────────────────────
// 동적 환경에서는 q값을 정적보다 높여야 빠른 움직임에 추적 가능
// q가 너무 낮으면 → 필터가 움직임을 따라오지 못하고 lag 발생
// q가 너무 높으면 → 노이즈 제거 효과가 줄어듦
// 아래 값은 손으로 천천히 움직이는 환경 기준 권장값
SimpleKalmanFilter kalman(1.0, 1.0, 0.1);  // q: 0.01→0.1로 증가

// ─── 통계 누적 변수 ─────────────────────────────────────────
int   sampleIndex   = 0;
int   failCount     = 0;  // 측정 실패 횟수

// Raw 통계
float rawSum        = 0, rawSumSq  = 0;
float rawMin        = 9999, rawMax = -9999;

// Kalman 통계
float kalSum        = 0, kalSumSq  = 0;
float kalMin        = 9999, kalMax = -9999;

// Raw-Kalman 차이 통계 (동적 환경 핵심 지표)
float diffSum       = 0, diffSumSq = 0;
float diffMax       = -9999;

// 연속 샘플 간 변화량 (움직임 추적 성능 지표)
float prevRaw       = -1;
float prevKal       = -1;
float rawDeltaSum   = 0, rawDeltaSqSum  = 0;
float kalDeltaSum   = 0, kalDeltaSqSum  = 0;

bool done = false;

// ─── 초음파 거리 측정 함수 ───────────────────────────────────
float measureDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return -1.0;

  float dist = (float)duration * 0.01715;

  // 유효 범위 벗어난 값 필터링
  if (dist < DIST_MIN || dist > DIST_MAX) return -1.0;

  return dist;
}

// ─── 통계 출력 함수 ──────────────────────────────────────────
void printStats() {
  float n = (float)sampleIndex;
  if (n < 2) {
    Serial.println(F("# 샘플 수 부족 — 통계 계산 불가"));
    return;
  }

  // Raw 통계
  float rawMean  = rawSum / n;
  float rawVar   = (rawSumSq / n) - (rawMean * rawMean);
  float rawStd   = sqrt(rawVar);
  float rawRange = rawMax - rawMin;

  // Kalman 통계
  float kalMean  = kalSum / n;
  float kalVar   = (kalSumSq / n) - (kalMean * kalMean);
  float kalStd   = sqrt(kalVar);
  float kalRange = kalMax - kalMin;

  // Raw-Kalman 평균 차이 및 표준편차 (스무딩 효과)
  float diffMean = diffSum / n;
  float diffVar  = (diffSumSq / n) - (diffMean * diffMean);
  float diffStd  = sqrt(diffVar);

  // 연속 샘플 간 변화량 (n-1개)
  float nm1 = n - 1.0;
  float rawDeltaMean = rawDeltaSum / nm1;
  float rawDeltaRMS  = sqrt(rawDeltaSqSum / nm1);
  float kalDeltaMean = kalDeltaSum / nm1;
  float kalDeltaRMS  = sqrt(kalDeltaSqSum / nm1);

  // 노이즈 감소율 (σ 기준)
  float stdReduction = (rawStd > 0) ? (1.0 - kalStd / rawStd) * 100.0 : 0;

  // SNR (동적: 신호=전체 범위, 노이즈=σ)
  float rawSNR = (rawStd > 0) ? 20.0 * log10(rawRange / rawStd) : 99.0;
  float kalSNR = (kalStd > 0) ? 20.0 * log10(kalRange / kalStd) : 99.0;

  Serial.println(F("\n===================================================="));
  Serial.print(F("  측정 완료 — 총 ")); Serial.print(sampleIndex);
  Serial.print(F("샘플 (실패: ")); Serial.print(failCount);
  Serial.println(F("회)"));
  Serial.println(F("===================================================="));
  Serial.println(F("  [ 기본 통계 ]"));
  Serial.println(F("  지표            Raw          Kalman       비고"));
  Serial.println(F("  ─────────────────────────────────────────────────"));

  Serial.print(F("  표준편차(σ)  "));
  Serial.print(rawStd, 4); Serial.print(F(" cm    "));
  Serial.print(kalStd, 4); Serial.print(F(" cm   "));
  Serial.print(stdReduction, 1); Serial.println(F("% 감소"));

  Serial.print(F("  평균          "));
  Serial.print(rawMean, 4); Serial.print(F(" cm    "));
  Serial.print(kalMean, 4); Serial.println(F(" cm"));

  Serial.print(F("  범위(max-min) "));
  Serial.print(rawRange, 4); Serial.print(F(" cm    "));
  Serial.print(kalRange, 4); Serial.println(F(" cm"));

  Serial.print(F("  SNR           "));
  Serial.print(rawSNR, 2); Serial.print(F(" dB     "));
  Serial.print(kalSNR, 2); Serial.println(F(" dB"));

  Serial.println(F("\n  [ 동적 환경 전용 지표 ]"));
  Serial.println(F("  ─────────────────────────────────────────────────"));

  Serial.print(F("  Raw-Kal 평균차이  "));
  Serial.print(diffMean, 4); Serial.println(F(" cm  (스무딩 크기)"));

  Serial.print(F("  Raw-Kal 차이 σ    "));
  Serial.print(diffStd, 4); Serial.println(F(" cm  (스무딩 일관성)"));

  Serial.print(F("  Raw-Kal 최대차이  "));
  Serial.print(diffMax, 4); Serial.println(F(" cm  (스파이크 최대 억제량)"));

  Serial.println(F("  ─────────────────────────────────────────────────"));
  Serial.println(F("  샘플간 변화량 (움직임 추적 반응성)"));

  Serial.print(F("  Raw  평균변화  ")); Serial.print(rawDeltaMean, 4);
  Serial.print(F(" cm  /  RMS  ")); Serial.print(rawDeltaRMS, 4); Serial.println(F(" cm"));

  Serial.print(F("  Kal  평균변화  ")); Serial.print(kalDeltaMean, 4);
  Serial.print(F(" cm  /  RMS  ")); Serial.print(kalDeltaRMS, 4); Serial.println(F(" cm"));

  Serial.print(F("  추적 lag 지표    "));
  float lagRatio = (rawDeltaRMS > 0) ? (kalDeltaRMS / rawDeltaRMS) * 100.0 : 0;
  Serial.print(lagRatio, 1);
  Serial.println(F("%  (100%=완벽 추적, 낮을수록 lag 큼)"));

  Serial.println(F("===================================================="));
  Serial.println(F("  ** 측정 종료 — 리셋 버튼을 눌러 재시작 **"));
  Serial.println(F("====================================================\n"));
}

// ─── Setup ───────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  Serial.println(F("===================================================="));
  Serial.println(F("  초음파 센서 노이즈 측정 — 동적 환경"));
  Serial.println(F("  SimpleKalmanFilter 라이브러리 사용"));
  Serial.println(F("===================================================="));
  Serial.print(F("  샘플링: ")); Serial.print(DELAY_MS);
  Serial.print(F("ms 간격 / 측정시간: "));
  Serial.print(MEASURE_DURATION / 1000); Serial.println(F("초"));
  Serial.println(F("  측정 시작 전 물체를 센서 앞에서 천천히 움직여주세요."));
  Serial.println(F("----------------------------------------------------"));
  Serial.println(F("timestamp_ms,sample,raw_cm,kalman_cm,diff_cm"));
}

// ─── Loop ────────────────────────────────────────────────────
void loop() {
  if (done) return;

  unsigned long now = millis();

  if (now >= MEASURE_DURATION) {
    printStats();
    done = true;
    return;
  }

  float rawDist = measureDistance();
  if (rawDist < 0) {
    failCount++;
    delay(DELAY_MS);
    return;
  }

  float kalDist = kalman.updateEstimate(rawDist);
  float diff    = fabs(rawDist - kalDist);

  // CSV 출력 (타임스탬프 포함)
  Serial.print(now);            Serial.print(F(","));
  Serial.print(sampleIndex + 1);Serial.print(F(","));
  Serial.print(rawDist, 4);     Serial.print(F(","));
  Serial.print(kalDist, 4);     Serial.print(F(","));
  Serial.println(diff, 4);

  // 기본 통계 누적
  rawSum   += rawDist; rawSumSq += rawDist * rawDist;
  if (rawDist < rawMin) rawMin = rawDist;
  if (rawDist > rawMax) rawMax = rawDist;

  kalSum   += kalDist; kalSumSq += kalDist * kalDist;
  if (kalDist < kalMin) kalMin = kalDist;
  if (kalDist > kalMax) kalMax = kalDist;

  // 차이 통계 누적
  diffSum   += diff;
  diffSumSq += diff * diff;
  if (diff > diffMax) diffMax = diff;

  // 연속 샘플 간 변화량 누적
  if (prevRaw >= 0) {
    float dRaw = fabs(rawDist - prevRaw);
    float dKal = fabs(kalDist - prevKal);
    rawDeltaSum   += dRaw; rawDeltaSqSum += dRaw * dRaw;
    kalDeltaSum   += dKal; kalDeltaSqSum += dKal * dKal;
  }
  prevRaw = rawDist;
  prevKal = kalDist;

  sampleIndex++;
  delay(DELAY_MS);
}

```


### 
거리별 경고 패턴 요약


```javascript
// ---------------- 핀 설정 ----------------
const int BUZZER_PIN = 11; // 부저 핀 번호
// -----------------------------------------

void setup() {
  // 부저 핀을 출력 모드로 설정
  pinMode(BUZZER_PIN, OUTPUT);
}

void loop() {
  // 방법 1: 패시브 부저용 (주파수를 주어 계속 울리게 함)
  // 1000Hz의 삐- 소리가 무한히 지속됩니다.
  tone(BUZZER_PIN, 1000); 

  /* 
  // 만약 위 코드로 소리가 안 나고 '띡' 소리만 난다면, 
  // 가지고 계신 부저가 '액티브 부저'일 수 있습니다.
  // 그럴 때는 위의 tone(BUZZER_PIN, 1000); 줄을 지우고 
  // 아래 두 줄의 슬래시(//)를 지워서 사용해 보세요.
  
  digitalWrite(BUZZER_PIN, HIGH);
  delay(100); // 딜레이를 주어 안정적으로 전원 공급
  */
}
```


| 거리      | 패턴                                |
| ------- | --------------------------------- |
| 10cm 미만 | **연속음** (삐----)                   |
| 25cm 미만 | **빠른 단속음** (삐.삐.삐.삐 / 200ms 주기)   |
| 40cm 미만 | **느린 단속음** (삐--- 삐--- / 600ms 주기) |
| 40cm 이하 | **소리 끔** (안전 거리)                  |


### Q / R 튜닝 가이드


| 상황            | Q (프로세스 노이즈)   | R (측정 노이즈)     |
| ------------- | -------------- | -------------- |
| 센서 노이즈 많을 때   | 작게             | 크게 (센서값을 덜 믿음) |
| 반응속도 빠르게      | 크게 (변화에 즉각 반응) | 작게             |
| 안정성 중시 (부드럽게) | 작게             | 크게             |
| **실내 기본값**    | 0.01           | 0.1            |


**[초음파 센서 거리 테스트] 논문**


```arduino
// ============================================================
//  자동차 장애물 거리별 경고음 정확도 테스트
//  기반: 동적 초음파 센서 노이즈 측정 + 칼만 필터
//  6개 거리(1~6cm) × 1000샘플 → 오류율 측정
// ============================================================

#include <SimpleKalmanFilter.h>

// ─── 핀 설정 ────────────────────────────────────────────────
const int TRIG_PIN   = 22;
const int ECHO_PIN   = 23;
const int BUZZER_PIN = 11;

// ─── 경고 단계 정의 ─────────────────────────────────────────
// 단계  | 이름 | 조건        | 버저 간격(ms) | 비고
//   1   | 안전 | d > 11      | 없음
//   2   | 주의 | 8 < d ≤ 11  | 1000ms
//   3   | 경고 | 5 < d ≤ 8   | 500ms
//   4   | 위험 | 2 < d ≤ 5   | 연속(∞)
//   5   | 제동 | d ≤ 2       | 연속(∞) + PCA 신호

// ─── 실험 파라미터 ──────────────────────────────────────────
const int   SAMPLES_PER_DIST = 1000;   // 거리당 샘플 수
const int   DELAY_MS         = 20;     // 샘플링 간격 (ms)
const float DIST_MIN         = 0.5;    // 유효 범위 최소 (cm) - 1cm 측정 위해 완화
const float DIST_MAX         = 400.0;  // 유효 범위 최대 (cm)

// 테스트할 거리 목록 (cm) — 실제 물체를 이 거리에 고정 후 측정
const float TEST_DISTANCES[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0};
const int   NUM_DISTANCES    = 6;

// ─── 칼만 필터 ──────────────────────────────────────────────
SimpleKalmanFilter kalman(1.0, 1.0, 0.1);

// ─── 경고 단계 열거형 ────────────────────────────────────────
enum WarningLevel {
  SAFE    = 1,  // d > 11
  CAUTION = 2,  // 8 < d ≤ 11
  WARNING = 3,  // 5 < d ≤ 8
  DANGER  = 4,  // 2 < d ≤ 5
  BRAKE   = 5   // d ≤ 2
};

// ─── 거리 → 경고 단계 판정 함수 ─────────────────────────────
WarningLevel classify(float d) {
  if (d <= 2.0)       return BRAKE;
  else if (d <= 5.0)  return DANGER;
  else if (d <= 8.0)  return WARNING;
  else if (d <= 11.0) return CAUTION;
  else                return SAFE;
}

// 테스트 거리(cm)에서 기대되는 올바른 단계
// 1cm → BRAKE, 2cm → BRAKE/DANGER 경계 → DANGER로 처리
// ※ 2cm는 경계값: d ≤ 2 → BRAKE, 2 < d → DANGER
//   실제 물체가 정확히 2cm일 때 BRAKE 또는 DANGER 둘 다 허용
WarningLevel expectedLevel(float targetDist) {
  if (targetDist <= 2.0)  return BRAKE;   // 1cm, 2cm
  else if (targetDist <= 5.0) return DANGER;  // 3cm, 4cm, 5cm
  else                        return WARNING; // 6cm
}

// ─── 버저 출력 함수 ──────────────────────────────────────────
void buzzerBeep(int durationMs) {
  digitalWrite(BUZZER_PIN, HIGH);
  delay(durationMs / 2);
  digitalWrite(BUZZER_PIN, LOW);
  delay(durationMs / 2);
}

void buzzerContinuous() {
  digitalWrite(BUZZER_PIN, HIGH);
}

void buzzerOff() {
  digitalWrite(BUZZER_PIN, LOW);
}

// ─── 초음파 거리 측정 함수 ───────────────────────────────────
float measureDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return -1.0;

  float dist = (float)duration * 0.01715;

  if (dist < DIST_MIN || dist > DIST_MAX) return -1.0;
  return dist;
}

// ─── 단일 거리 테스트 함수 ───────────────────────────────────
// targetDist: 현재 고정 거리(cm), 표시용
void runDistanceTest(float targetDist) {

  // 칼만 필터 리셋 (새 거리마다 초기화)
  kalman = SimpleKalmanFilter(1.0, 1.0, 0.1);

  WarningLevel expected = expectedLevel(targetDist);

  int sampleCount  = 0;   // 유효 샘플 수
  int failCount    = 0;   // 측정 실패 (센서 오류)
  int errorCount   = 0;   // 분류 오류 (잘못된 단계 판정)

  int   levelCount[6] = {0, 0, 0, 0, 0, 0};
  float levelSum[6]   = {0, 0, 0, 0, 0, 0};
  float kalTotalSum   = 0;

  // 경계 허용: 2cm는 BRAKE or DANGER 모두 정답
  bool isBoundary = (targetDist == 2.0);

  Serial.println(F("----------------------------------------------------"));
  Serial.print(F("  [테스트] 목표 거리: "));
  Serial.print(targetDist, 1);
  Serial.print(F("cm  |  기대 단계: "));
  switch (expected) {
    case BRAKE:   Serial.println(F("5-제동")); break;
    case DANGER:  Serial.println(F("4-위험")); break;
    case WARNING: Serial.println(F("3-경고")); break;
    default:      Serial.println(F("?")); break;
  }
  Serial.println(F("  timestamp_ms,sample,raw_cm,kalman_cm,expected,actual,error"));

  while (sampleCount < SAMPLES_PER_DIST) {

    float rawDist = measureDistance();
    if (rawDist < 0) {
      failCount++;
      delay(DELAY_MS);
      continue;
    }

    float kalDist = kalman.updateEstimate(rawDist);
    WarningLevel actual = classify(kalDist);

    // 오류 판정
    bool isError = false;
    if (isBoundary) {
      // 2cm 경계: BRAKE 또는 DANGER면 정답
      isError = (actual != BRAKE && actual != DANGER);
    } else {
      isError = (actual != expected);
    }

    if (isError) errorCount++;

    levelCount[actual] += 1;
    levelSum[actual]   += kalDist;
    kalTotalSum        += kalDist;

    // 위험/제동 단계 → 버저 연속음
    if (actual == DANGER || actual == BRAKE) {
      buzzerContinuous();
    } else {
      buzzerOff();
    }

    // CSV 출력
    Serial.print(millis());           Serial.print(F(","));
    Serial.print(sampleCount + 1);    Serial.print(F(","));
    Serial.print(rawDist, 4);         Serial.print(F(","));
    Serial.print(kalDist, 4);         Serial.print(F(","));
    Serial.print(expected);           Serial.print(F(","));
    Serial.print(actual);             Serial.print(F(","));
    Serial.println(isError ? 1 : 0);

    sampleCount++;
    delay(DELAY_MS);
  }

  buzzerOff();

  // ─── 해당 거리 결과 출력 ─────────────────────────────────
  float errorRate = (float)errorCount / (float)SAMPLES_PER_DIST * 100.0;

  Serial.println(F("  ┌─────────────────────────────────────────────┐"));
  Serial.print(F("  │ 목표 거리        : "));
  Serial.print(targetDist, 1); Serial.println(F(" cm                    │"));

  Serial.print(F("  │ 유효 샘플       : "));
  Serial.print(sampleCount); Serial.println(F(" / 1000               │"));

  Serial.print(F("  │ 측정 실패       : "));
  Serial.print(failCount); Serial.println(F(" 회                      │"));

  Serial.print(F("  │ 분류 오류       : "));
  Serial.print(errorCount); Serial.println(F(" 회                      │"));

  Serial.print(F("  │ 오류율          : "));
  Serial.print(errorCount); Serial.print(F(" / 1000 = "));
  Serial.print(errorRate, 2); Serial.println(F("%          │"));


  Serial.println(F("  ├─────────────────────────────────────────────┤"));
  Serial.print(F("  │ Kalman 전체 평균: "));
  Serial.print(kalTotalSum / sampleCount, 4);
  Serial.println(F(" cm"));
  Serial.println(F("  │ 단계별 판정 횟수 & 평균 거리"));
  const char* levelNames[] = {"", "1-안전", "2-주의", "3-경고", "4-위험", "5-제동"};
  for (int lv = 1; lv <= 5; lv++) {
    if (levelCount[lv] > 0) {
      Serial.print(F("  │   "));
      Serial.print(levelNames[lv]);
      Serial.print(F(" : "));
      Serial.print(levelCount[lv]);
      Serial.print(F("회  평균 "));
      Serial.print(levelSum[lv] / levelCount[lv], 4);
      Serial.println(F(" cm"));
    }
  }
  // ↓ 기존 └ 줄은 삭제하고 이걸로 교체
  Serial.println(F("  └─────────────────────────────────────────────┘"));

  // 다음 거리 준비 대기
  Serial.println(F("  >> 다음 거리로 물체를 이동 후 5초 대기..."));
  buzzerOff();
  delay(5000);
}

// ─── Setup ───────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  Serial.println(F("===================================================="));
  Serial.println(F("  자동차 장애물 거리별 경고음 정확도 테스트"));
  Serial.println(F("  SimpleKalmanFilter 적용 | 거리당 1000샘플"));
  Serial.println(F("===================================================="));
  Serial.println(F("  단계 | 이름 | 조건        | 버저"));
  Serial.println(F("   1   | 안전 | d > 11cm    | 없음"));
  Serial.println(F("   2   | 주의 | 8 < d ≤ 11  | 1000ms"));
  Serial.println(F("   3   | 경고 | 5 < d ≤ 8   | 500ms"));
  Serial.println(F("   4   | 위험 | 2 < d ≤ 5   | 연속"));
  Serial.println(F("   5   | 제동 | d ≤ 2       | 연속+PCA"));
  Serial.println(F("===================================================="));
  Serial.println(F("  테스트 거리: 1, 2, 3, 4, 5, 6 cm"));
  Serial.println(F("  각 거리에 물체 고정 후 자동 진행됩니다."));
  Serial.println(F("  시작 전 5초 대기..."));
  delay(5000);
}

// ─── Loop ────────────────────────────────────────────────────
void loop() {
  // 6개 거리 순차 테스트
  for (int i = 0; i < NUM_DISTANCES; i++) {
    runDistanceTest(TEST_DISTANCES[i]);
  }

  // 전체 완료
  Serial.println(F("\n===================================================="));
  Serial.println(F("  ★ 모든 거리 테스트 완료 ★"));
  Serial.println(F("  리셋 버튼을 눌러 재시작하세요."));
  Serial.println(F("===================================================="));

  // 완료 버저 3회
  for (int i = 0; i < 3; i++) {
    buzzerBeep(200);
    delay(100);
  }

  while (true); // 정지
}
```


## 라즈베리파이 아두이노 초음파값 받기


```python
import serial
import time

# 포트 설정 (아두이노 연결 경로, 보드레이트)
# 포트 확인 명령어: ls /dev/tty*
ser = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
ser.flush() # 시리얼 버퍼 초기화

print("데이터 수신 시작...")

try:
    while True:
        if ser.in_waiting > 0:
            # 한 줄 단위로 읽어오기
            line = ser.readline().decode('utf-8').rstrip()
            print(f"측정 거리: {line} cm")
        time.sleep(0.1)
except KeyboardInterrupt:
    print("프로그램 종료")
    ser.close()
```


## Pi Camera V2

```bash
# camera 확인
# CSI 케이블 연결됐는지 커널에서 인식하는지 확인
dmesg | grep -i camera
dmesg | grep -i imx219

cat /boot/firmware/config.txt | grep camera

sudo nano /boot/firmware/config.txt
camera_auto_detect=1

cam --list
v4l2-ctl --list-devices

# 의존성 설치
sudo apt install -y cmake ninja-build pkg-config \
  libyaml-dev python3-yaml python3-ply \
  libgnutls28-dev libtiff-dev \
  libboost-dev libglib2.0-dev \
  libdrm-dev libevent-dev \
  meson git
  
  
# 기존 구버전 제거
sudo apt remove -y libcamera-dev libcamera-tools
sudo apt autoremove -y

# 소스 클론
cd ~/Desktop
git clone https://git.libcamera.org/libcamera/libcamera.git
cd libcamera


# meson 최신 버전 PIP 설치
sudo apt remove -y meson
sudo pip3 install meson

meson --version

cd ~/Desktop/libcamera
rm -rf build
meson setup build

# meson 설정
cd ~/Desktop/libcamera
rm -rf build
meson setup build


which meson
# 또는
pip3 show meson | grep Location

export PATH=$PATH:/usr/local/bin
meson setup build

ninja -C build

sudo ninja -C build install
sudo ldconfig

# PATH 영구 등록
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
libcamera-hello --list-cameras

# libcamera-apps 빌드
cd ~/Desktop
sudo apt install -y libboost-program-options-dev \
  libexif-dev libjpeg-dev libpng-dev

git clone https://github.com/raspberrypi/libcamera-apps.git
cd libcamera-apps
mkdir build && cd build
cmake -DENABLE_DRM=1 -DENABLE_X11=1 -DENABLE_QT=0 -DENABLE_OPENCV=0 \
  -DENABLE_TFLITE=0 ..
make -j4
sudo make install

# libav 인코더, Qt 프리뷰 비활성화 후 빌드
cd ~/Desktop/libcamera-apps
meson setup build --wipe \
  -Denable_libav=disabled \
  -Denable_drm=enabled \
  -Denable_egl=disabled \
  -Denable_qt=disabled \
  -Denable_opencv=disabled \
  -Denable_tflite=disabled
ninja -C build
sudo ninja -C build install



# 이전 빌드 디렉토리 권한 문제 : 강제로 지우고 다시
sudo rm -rf ~/Desktop/libcamera-apps/build
cd ~/Desktop/libcamera-apps
meson setup build \
  -Denable_libav=disabled \
  -Denable_drm=enabled \
  -Denable_egl=disabled \
  -Denable_qt=disabled \
  -Denable_opencv=disabled \
  -Denable_tflite=disabled
ninja -C build
sudo ninja -C build install


# 사진 찍기
sudo ldconfig
rpicam-jpeg --output test.jpg

# 해상도 낮춰 사진 찍기
rpicam-jpeg --output test1.jpg --width 1640 --height 1232
```


```bash
# 터미널 1
rpicam-vid -t 0 --inline --listen -o tcp://0.0.0.0:8888 --width 640 --height 480 --nopreview

# 터미널 2
python3 *.py
```


## STM32 [구동부]

# Arudino 기반 STM32


```c
// 조향 서보 (PC9)
const int steer_servo = PC9;

// 모터 드라이버 핀 설정 (회로도 기반)
const int M1_BI = PE13; const int M1_FI = PE14;
const int M2_BI = PE9;  const int M2_FI = PE11;
//const int M3_BI = PE6;  const int M3_FI = PE5;
//const int M4_BI = PB8;  const int M4_FI = PB9;

void setup() {
  // 모든 핀 출력 설정
  pinMode(steer_servo, OUTPUT);
  pinMode(M1_BI, OUTPUT); pinMode(M1_FI, OUTPUT);
  pinMode(M2_BI, OUTPUT); pinMode(M2_FI, OUTPUT);
  
  delay(2000); // 안전 대기

  moveForward(150); // 속도 150으로 전진
  delay(1000);

  stopMotors();
}

void loop() {}

void moveForward(int speed) {
  // 1. 조향: 중앙 정렬 (서보 모터 각도, 값은 테스트 후 조정)
  analogWrite(steer_servo, 128); 

  // 2. 주행 모터 4개 모두 전진 (FI에 PWM, BI는 LOW)
  analogWrite(M1_FI, speed); digitalWrite(M1_BI, LOW);
  analogWrite(M2_FI, speed); digitalWrite(M2_BI, LOW);
}

void stopMotors() {
  // 모든 핀을 LOW로 만들어 정지
  digitalWrite(M1_FI, LOW); digitalWrite(M1_BI, LOW);
  digitalWrite(M2_FI, LOW); digitalWrite(M2_BI, LOW);
}



// 회로도 기반 모터 핀 설정 

const int motor_servo = PC9;
// 모터 1 (왼쪽 바퀴 예시)
const int motorL_IN1 = PE11; 
const int motorL_IN2 = PE9;


// 모터 2 (오른쪽 바퀴 예시)
const int motorR_IN1 = PE14;
const int motorR_IN2 = PE13;

void setup() {
  // 모터 핀 출력 설정
  pinMode(motorL_IN1, OUTPUT);
  pinMode(motorL_IN2, OUTPUT);
  pinMode(motorR_IN1, OUTPUT);
  pinMode(motorR_IN2, OUTPUT);
  pinMode(motor_servo, OUTPUT);

  // 전원 켜고 2초 대기
  delay(2000);

  // 1. 1초간 전진
  moveForward(150); 
  delay(1000);

  // 2. 정지
  stopMotors();
}

void loop() {
  // 한 번 실행 후 대기
}

void moveForward(int speed) {
  digitalWrite(motor_servo, speed);
  digitalWrite(motorL_IN1, HIGH);
  digitalWrite(motorL_IN2, LOW);

  digitalWrite(motorR_IN1, HIGH);
  digitalWrite(motorR_IN2, LOW);
}

void stopMotors() {
  analogWrite(motor_servo, 0);
  digitalWrite(motorL_IN1, LOW);
  digitalWrite(motorL_IN2, LOW);


  digitalWrite(motorR_IN1, LOW);
  digitalWrite(motorR_IN2, LOW);
}



// 회로도 기반 모터 핀 설정 
// 모터 1 (왼쪽 바퀴 예시)
const int motorL_IN1 = PE5; 
const int motorL_IN2 = PE6;
const int motorL_PWM = PB8; 

// 모터 2 (오른쪽 바퀴 예시)
const int motorR_IN1 = PE13;
const int motorR_IN2 = PE14;
const int motorR_PWM = PB9; 

void setup() {
  // 모터 핀 출력 설정
  pinMode(motorL_IN1, OUTPUT);
  pinMode(motorL_IN2, OUTPUT);
  pinMode(motorL_PWM, OUTPUT);
  pinMode(motorR_IN1, OUTPUT);
  pinMode(motorR_IN2, OUTPUT);
  pinMode(motorR_PWM, OUTPUT);

  // 전원 켜고 2초 대기
  delay(2000);

  // 1. 1초간 전진
  moveForward(150); 
  delay(1000);

  // 2. 정지
  stopMotors();
}

void loop() {
  // 한 번 실행 후 대기
}

void moveForward(int speed) {
  digitalWrite(motorL_IN1, HIGH);
  digitalWrite(motorL_IN2, LOW);
  analogWrite(motorL_PWM, speed);

  digitalWrite(motorR_IN1, HIGH);
  digitalWrite(motorR_IN2, LOW);
  analogWrite(motorR_PWM, speed);
}

void stopMotors() {
  digitalWrite(motorL_IN1, LOW);
  digitalWrite(motorL_IN2, LOW);
  analogWrite(motorL_PWM, 0);

  digitalWrite(motorR_IN1, LOW);
  digitalWrite(motorR_IN2, LOW);
  analogWrite(motorR_PWM, 0);
}

```


# STM32 [No ROS 2]


STM32CubeMX 설정


STM32F407VET6 + LD-1501MG + JGB37-520


---


1. 클럭 (RCC)

- HSE : Crystal/Ceramic Resonator
- SYSCLK : **168MHz** (PLL)
	- USB는 48MHz 정확히 필요 → PLL48CLK 자동 설정됨
- APB1 Timer : 84MHz
- APB2 Timer : 168MHz

---


2. USB_OTG_FS

- Mode : **Device_Only**
- 나머지 기본값 유지

핀 (자동 배정):
PA11 → USB_OTG_FS_DM (D-)
PA12 → USB_OTG_FS_DP (D+)


---


3. Middleware → USB_DEVICE

- Class for FS IP : **Communication Device Class (CDC)**

---


4. usbd_cdc_if.c 수정 (딱 한 줄)


CubeMX가 생성한 USB/App/usbd_cdc_if.c 파일에서
CDC_Receive_FS 함수를 찾아 한 줄 추가:


```c
extern void USB_OnReceive(uint8_t *buf, uint8_t len);  // 파일 상단에 추가

static int8_t CDC_Receive_FS(uint8_t *Buf, uint32_t *Len)
{
    USB_OnReceive(Buf, (uint8_t)*Len);   // ← 이 줄만 추가
    USBD_CDC_SetRxBuffer(&hUsbDeviceFS, &Buf[0]);
    USBD_CDC_ReceivePacket(&hUsbDeviceFS);
    return (USBD_OK);
}
```


---


5. TIM3 — 서보 PWM (50Hz)


| 항목           | 값              |
| ------------ | -------------- |
| Clock Source | Internal Clock |
| PSC          | 167            |
| ARR          | 19999          |
| CH1          | PWM Generation |
| CCR1 초기값     | 1500           |


핀: **PA6** → LD-1501MG 신호선


---


6. TIM4 — DC모터 PWM (20kHz)


| 항목       | 값              |
| -------- | -------------- |
| PSC      | 3              |
| ARR      | 1049           |
| CH1      | PWM Generation |
| CCR1 초기값 | 0              |


핀: **PD12** → L298N ENA


---


7. TIM1 — 엔코더


| 항목                | 값            |
| ----------------- | ------------ |
| Combined Channels | Encoder Mode |
| Encoder Mode      | TI1 and TI2  |
| ARR               | 65535        |


핀: **PA8** (CH_A), **PA9** (CH_B) → JGB37-520 Yellow/Green


---


8. GPIO 출력 (모터 방향)


| 핀    | 기능        |
| ---- | --------- |
| PD13 | MOTOR_IN1 |
| PD14 | MOTOR_IN2 |


---


9. main.c 통합


```c
/* main.c 상단 USER CODE BEGIN Includes */
#include "usbd_cdc_if.h"
extern void App_Init(void);
extern void App_Loop(void);

/* MX_Init 함수들 호출 후 USER CODE BEGIN 2 */
App_Init();

/* while(1) 안 USER CODE BEGIN WHILE */
App_Loop();
```


---


10. 라즈베리파이 연결


```bash
# STM32 USB 연결 후 포트 확인
ls /dev/ttyACM*        # → /dev/ttyACM0

# 권한 설정 (한 번만)
sudo usermod -a -G dialout $USER
# 로그아웃 후 재로그인 필요

pip install pyserial
python3 stm32_driver.py
```


STM32 VID(0x0483) 자동 감지 → 포트 지정 불필요


---


11. 감속비 확인


main.c 의 GEAR_RATIO를 모터 라벨 감속비로 수정:


```c
#define GEAR_RATIO  19u   // 예: 19, 30, 45, 50
```


```c
/* ============================================================
 *  STM32F407VET6
 *  조향: LD-1501MG 서보   (500~2500µs, 180°)
 *  구동: JGB37-520 DC모터 + 엔코더 (AB 2채널, 11PPR × 감속비)
 *  통신: USB CDC (가상 시리얼) ← 라즈베리파이4
 *
 *  [USB 연결]
 *    STM32 PA11(D-), PA12(D+) → USB 케이블 → 라즈베리파이
 *    라즈베리파이에서 /dev/ttyACM0 으로 인식
 *
 *  [패킷 프로토콜] 4바이트
 *    Byte0: 0xAA          헤더
 *    Byte1: steering      0~180  (90=직진)
 *    Byte2: throttle      0~200  (100=정지, >100 전진, <100 후진)
 *    Byte3: XOR checksum  Byte0^Byte1^Byte2
 *
 *  [핀 배정]
 *    PA11 / PA12   USB D- / D+    (USB_OTG_FS)
 *    TIM3_CH1 PA6  서보 PWM       50Hz
 *    TIM4_CH1 PD12 DC모터 PWM     20kHz
 *    PD13          DC모터 IN1     방향
 *    PD14          DC모터 IN2     방향
 *    TIM1_CH1 PA8  엔코더 A채널
 *    TIM1_CH2 PA9  엔코더 B채널
 *
 *  [CubeMX 필수 설정]
 *    USB_OTG_FS : Device_Only
 *    Middleware → USB_DEVICE → Class : CDC
 *    TIM3: PSC=167, ARR=19999  (1MHz → 50Hz)
 *    TIM4: PSC=3,   ARR=1049   (20kHz)
 *    TIM1: Encoder Mode TI1 and TI2, ARR=65535
 * ============================================================ */

#include "main.h"
#include "usbd_cdc_if.h"   /* CubeMX USB CDC 미들웨어 헤더 */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/* ── 외부 핸들 (CubeMX 생성) ── */
extern TIM_HandleTypeDef htim1;   /* 엔코더 */
extern TIM_HandleTypeDef htim3;   /* 서보 PWM  50Hz  */
extern TIM_HandleTypeDef htim4;   /* DC모터 PWM 20kHz */

/* ================================================================
 *  LD-1501MG 서보 상수 (데이터시트 기준)
 *    500µs = 0°, 1500µs = 90°(직진), 2500µs = 180°
 *    TIM3 1MHz 기준 → CCR = µs 값
 * ================================================================ */
#define SERVO_MIN_US     500u
#define SERVO_MAX_US     2500u

/* ================================================================
 *  JGB37-520 상수
 *    GEAR_RATIO: 모터 라벨 확인 후 수정 (19, 30, 45, 50...)
 *    ENC_CPR = 11 PPR × 감속비 × 4 (x4 quadrature)
 * ================================================================ */
#define ENC_PPR          11u
#define GEAR_RATIO       19u
#define ENC_CPR          (ENC_PPR * GEAR_RATIO * 4u)   /* 836 */
#define MAX_RPM          280

/* TIM4 ARR=1049 → duty 0~1049 */
#define MOTOR_PWM_MAX    1049u

/* ================================================================
 *  속도 PID
 * ================================================================ */
#define PID_KP           2.5f
#define PID_KI           0.8f
#define PID_KD           0.05f
#define PID_DT_MS        20u
#define PID_INTEG_MAX    500.0f

/* ================================================================
 *  USB CDC 수신 버퍼
 *  usbd_cdc_if.c 의 CDC_Receive_FS() 에서 채움
 * ================================================================ */
#define USB_RX_BUF_SIZE  64

static volatile uint8_t usb_rx_buf[USB_RX_BUF_SIZE];
static volatile uint8_t usb_rx_len = 0;
static volatile uint8_t usb_rx_flag = 0;   /* 새 데이터 수신 플래그 */

/* ── 패킷 파서 내부 상태 ── */
#define PACKET_SIZE      4
#define PACKET_HEADER    0xAA

static uint8_t  pkt_buf[PACKET_SIZE];
static uint8_t  pkt_idx = 0;

/* ================================================================
 *  공유 명령값
 * ================================================================ */
static volatile uint8_t g_steering = 90;    /* 0~180 */
static volatile uint8_t g_throttle = 100;   /* 0~200 */

/* ================================================================
 *  PID / 엔코더 상태
 * ================================================================ */
typedef struct { float integral; float prev_error; } PID_t;
static PID_t    pid_speed  = {0.0f, 0.0f};
static int32_t  enc_prev   = 0;

/* ── 내부 함수 프로토타입 ── */
static void  Servo_SetAngle(uint8_t angle);
static void  Motor_Drive(int32_t pwm, uint8_t fwd);
static void  Motor_Stop(void);
static float Encoder_GetRPM(void);
static float PID_Run(PID_t *p, float sp, float pv);
static void  USB_ProcessBytes(const uint8_t *data, uint8_t len);
static void  Packet_Apply(uint8_t *buf);

/* ================================================================
 *  CDC_Receive_FS 콜백 재정의
 *  usbd_cdc_if.c 의 CDC_Receive_FS() 안에서 아래를 호출하도록 수정:
 *
 *  static int8_t CDC_Receive_FS(uint8_t *Buf, uint32_t *Len)
 *  {
 *      USB_OnReceive(Buf, (uint8_t)*Len);   // ← 이 한 줄 추가
 *      USBD_CDC_SetRxBuffer(&hUsbDeviceFS, &Buf[0]);
 *      USBD_CDC_ReceivePacket(&hUsbDeviceFS);
 *      return USBD_OK;
 *  }
 * ================================================================ */
void USB_OnReceive(uint8_t *buf, uint8_t len)
{
    /* 인터럽트 컨텍스트에서 호출됨 → 복사만 하고 플래그 세팅 */
    if (len > USB_RX_BUF_SIZE) len = USB_RX_BUF_SIZE;
    memcpy((uint8_t *)usb_rx_buf, buf, len);
    usb_rx_len  = len;
    usb_rx_flag = 1;
}

/* ================================================================
 *  App_Init — main() USER CODE BEGIN 2 에 호출
 * ================================================================ */
void App_Init(void)
{
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
    Servo_SetAngle(90);

    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_1);
    Motor_Stop();

    HAL_TIM_Encoder_Start(&htim1, TIM_CHANNEL_ALL);
    enc_prev = (int32_t)__HAL_TIM_GET_COUNTER(&htim1);
}

/* ================================================================
 *  App_Loop — while(1) 안에 호출
 * ================================================================ */
void App_Loop(void)
{
    /* ── USB 수신 데이터 처리 ── */
    if (usb_rx_flag) {
        usb_rx_flag = 0;
        USB_ProcessBytes((uint8_t *)usb_rx_buf, usb_rx_len);
    }

    /* ── PID 주기 제어 ── */
    static uint32_t last_ms = 0;
    uint32_t now = HAL_GetTick();
    if (now - last_ms < PID_DT_MS) return;
    last_ms = now;

    Servo_SetAngle(g_steering);

    uint8_t thr = g_throttle;
    if (thr == 100) {
        Motor_Stop();
        pid_speed.integral = pid_speed.prev_error = 0.0f;
        return;
    }

    int32_t target_rpm;
    uint8_t fwd;
    if (thr > 100) { fwd = 1; target_rpm = (thr - 100) * MAX_RPM / 100; }
    else           { fwd = 0; target_rpm = (100 - thr) * MAX_RPM / 100; }

    float cur_rpm = Encoder_GetRPM();
    if (cur_rpm < 0.0f) cur_rpm = -cur_rpm;

    float out = PID_Run(&pid_speed, (float)target_rpm, cur_rpm);
    int32_t pwm = (int32_t)out;
    if (pwm > (int32_t)MOTOR_PWM_MAX) pwm = (int32_t)MOTOR_PWM_MAX;
    if (pwm < 0) pwm = 0;

    Motor_Drive(pwm, fwd);
}

/* ================================================================
 *  USB 바이트 스트림 → 패킷 파서
 *  USB는 한 번에 여러 바이트가 올 수 있으므로 루프로 처리
 * ================================================================ */
static void USB_ProcessBytes(const uint8_t *data, uint8_t len)
{
    for (uint8_t i = 0; i < len; i++) {
        uint8_t b = data[i];
        if (pkt_idx == 0 && b != PACKET_HEADER) continue;  /* 동기화 */
        pkt_buf[pkt_idx++] = b;
        if (pkt_idx >= PACKET_SIZE) {
            Packet_Apply(pkt_buf);
            pkt_idx = 0;
        }
    }
}

static void Packet_Apply(uint8_t *buf)
{
    if ((uint8_t)(buf[0] ^ buf[1] ^ buf[2]) != buf[3]) return;
    uint8_t s = buf[1]; uint8_t t = buf[2];
    if (s > 180) s = 180;
    if (t > 200) t = 200;
    g_steering = s;
    g_throttle = t;
}

/* ================================================================
 *  서보 / 모터 / 엔코더 / PID
 * ================================================================ */
static void Servo_SetAngle(uint8_t angle)
{
    uint32_t ccr = SERVO_MIN_US
                 + ((uint32_t)angle * (SERVO_MAX_US - SERVO_MIN_US)) / 180u;
    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, ccr);
}

static void Motor_Drive(int32_t pwm, uint8_t fwd)
{
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, fwd ? GPIO_PIN_SET   : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, fwd ? GPIO_PIN_RESET : GPIO_PIN_SET);
    __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_1, (uint32_t)pwm);
}

static void Motor_Stop(void)
{
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, GPIO_PIN_RESET);
    __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_1, 0);
}

static float Encoder_GetRPM(void)
{
    int32_t cur   = (int32_t)__HAL_TIM_GET_COUNTER(&htim1);
    int32_t delta = cur - enc_prev;
    enc_prev      = cur;
    if (delta >  32767) delta -= 65536;
    if (delta < -32768) delta += 65536;
    return ((float)delta / (float)ENC_CPR) / (PID_DT_MS / 1000.0f) * 60.0f;
}

static float PID_Run(PID_t *p, float sp, float pv)
{
    float dt  = PID_DT_MS / 1000.0f;
    float err = sp - pv;
    p->integral += err * dt;
    if (p->integral >  PID_INTEG_MAX) p->integral =  PID_INTEG_MAX;
    if (p->integral < -PID_INTEG_MAX) p->integral = -PID_INTEG_MAX;
    float deriv   = (err - p->prev_error) / dt;
    p->prev_error = err;
    float out = PID_KP * err + PID_KI * p->integral + PID_KD * deriv;
    if (out > (float)MOTOR_PWM_MAX) out = (float)MOTOR_PWM_MAX;
    if (out < 0.0f)                 out = 0.0f;
    return out;
}
```


```python
#!/usr/bin/env python3
"""
라즈베리파이 4 → STM32F407 USB CDC 조향/구동 명령 송신기
STM32를 USB로 연결하면 /dev/ttyACM0 으로 자동 인식됩니다.

설치:
  pip install pyserial

사용 예:
  drv = STM32Driver()          # /dev/ttyACM0 자동 사용
  drv.send(steering=90, throttle=150)
  drv.close()
"""

import serial
import serial.tools.list_ports
import struct
import time


class STM32Driver:
    HEADER    = 0xAA
    SEND_HZ   = 50
    _INTERVAL = 1.0 / SEND_HZ

    def __init__(self, port: str = None):
        if port is None:
            port = self._auto_detect()
        # USB CDC는 baudrate 설정이 무의미하지만 pyserial 필수값이라 기재
        self.ser = serial.Serial(port=port, baudrate=115200, timeout=1)
        self._last_tx = 0.0
        print(f"[STM32] 연결: {port}")

    # ── 포트 자동 탐색 ──────────────────────────────────────
    @staticmethod
    def _auto_detect() -> str:
        """STM32 USB CDC 포트 자동 탐색 (VID=0483 STMicroelectronics)"""
        for p in serial.tools.list_ports.comports():
            if p.vid == 0x0483:   # STMicroelectronics VID
                print(f"[STM32] 자동 감지: {p.device} ({p.description})")
                return p.device
        # 감지 실패 시 기본값
        print("[STM32] 자동 감지 실패 → /dev/ttyACM0 사용")
        return '/dev/ttyACM0'

    # ── 핵심 송신 ────────────────────────────────────────────
    def send(self, steering: int = 90, throttle: int = 100) -> bool:
        """
        steering : 0~180  (90=직진, 0=최대좌, 180=최대우)
        throttle : 0~200  (100=정지, 150=전진50%, 50=후진50%)
        """
        steering = max(0, min(180, int(steering)))
        throttle = max(0, min(200, int(throttle)))

        now = time.monotonic()
        if now - self._last_tx < self._INTERVAL:
            return False
        self._last_tx = now

        chk    = self.HEADER ^ steering ^ throttle
        packet = struct.pack('BBBB', self.HEADER, steering, throttle, chk)
        try:
            self.ser.write(packet)
            return True
        except serial.SerialException as e:
            print(f"[STM32] 오류: {e}")
            return False

    def stop(self):
        for _ in range(3):
            self.send(steering=90, throttle=100)
            time.sleep(self._INTERVAL)

    def close(self):
        self.stop()
        self.ser.close()
        print("[STM32] 연결 종료")

    # ── 변환 헬퍼 ────────────────────────────────────────────
    @staticmethod
    def angle_to_steering(deg: float, max_deg: float = 45.0) -> int:
        """deg: -45(좌) ~ +45(우) → 0~180"""
        return max(0, min(180, int(90.0 + (deg / max_deg) * 90.0)))

    @staticmethod
    def speed_to_throttle(pct: float) -> int:
        """pct: -100(후진) ~ +100(전진) → 0~200"""
        return max(0, min(200, int(100.0 + pct)))


# ── 테스트 ───────────────────────────────────────────────────
if __name__ == '__main__':
    drv = STM32Driver()   # 포트 자동 감지

    try:
        print("▶ 직진 전진 60% (3초)")
        end = time.monotonic() + 3.0
        while time.monotonic() < end:
            drv.send(steering=90, throttle=160)
            time.sleep(0.02)

        print("▶ 좌조향 30° + 전진 40% (2초)")
        end = time.monotonic() + 2.0
        while time.monotonic() < end:
            drv.send(
                steering=STM32Driver.angle_to_steering(-30),
                throttle=STM32Driver.speed_to_throttle(40)
            )
            time.sleep(0.02)

        print("■ 정지")
        drv.stop()

    except KeyboardInterrupt:
        print("\n중단")
    finally:
        drv.close()
```


```python
#!/usr/bin/env python3
"""
ROS2 Humble — STM32F407 USB CDC 드라이버 노드
패키지: stm32_driver
노드명: stm32_driver_node

Subscribe:
  /cmd_vel  geometry_msgs/Twist
    linear.x  : -1.0 ~ +1.0  (후진 ~ 전진)
    angular.z : -1.0 ~ +1.0  (우회전 ~ 좌회전)  ※ ROS 표준 방향

Publish:
  /stm32/steering  std_msgs/Int32   (0~180, 현재 서보 명령값)
  /stm32/throttle  std_msgs/Int32   (0~200, 현재 스로틀 명령값)
  /stm32/connected std_msgs/Bool    (USB 연결 상태)

STM32 패킷 (4바이트):
  [0xAA] [steering 0~180] [throttle 0~200] [XOR checksum]
"""

import struct
import threading
import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, ReliabilityPolicy
from geometry_msgs.msg import Twist
from std_msgs.msg import Int32, Bool

import serial
import serial.tools.list_ports


# ──────────────────────────────────────────────────────────────
#  STM32 USB CDC 통신 클래스
# ──────────────────────────────────────────────────────────────
class STM32Serial:
    HEADER    = 0xAA
    STM32_VID = 0x0483   # STMicroelectronics

    def __init__(self, port: str = None, baud: int = 115200):
        self._port = port or self._auto_detect()
        self._baud = baud
        self._ser  = None
        self._lock = threading.Lock()

    def _auto_detect(self) -> str:
        for p in serial.tools.list_ports.comports():
            if p.vid == self.STM32_VID:
                return p.device
        return '/dev/ttyACM0'

    def connect(self) -> bool:
        try:
            self._ser = serial.Serial(
                port=self._port, baudrate=self._baud, timeout=1)
            return True
        except serial.SerialException:
            self._ser = None
            return False

    def is_connected(self) -> bool:
        return self._ser is not None and self._ser.is_open

    def send(self, steering: int, throttle: int) -> bool:
        if not self.is_connected():
            return False
        steering = max(0, min(180, steering))
        throttle = max(0, min(200, throttle))
        chk      = self.HEADER ^ steering ^ throttle
        packet   = struct.pack('BBBB', self.HEADER, steering, throttle, chk)
        try:
            with self._lock:
                self._ser.write(packet)
            return True
        except serial.SerialException:
            self._ser = None
            return False

    def close(self):
        if self._ser and self._ser.is_open:
            self._ser.close()


# ──────────────────────────────────────────────────────────────
#  ROS2 노드
# ──────────────────────────────────────────────────────────────
class STM32DriverNode(Node):

    # Twist → STM32 변환 파라미터
    MAX_STEERING_DEG = 45.0   # linear.x=±1.0 → 서보 ±45° (90±45)
    MAX_RPM_PCT      = 100.0  # angular.z=±1.0 → throttle ±100

    def __init__(self):
        super().__init__('stm32_driver_node')

        # ── 파라미터 선언 ──────────────────────────────────
        self.declare_parameter('port',              '')
        self.declare_parameter('baud',              115200)
        self.declare_parameter('cmd_vel_topic',     '/cmd_vel')
        self.declare_parameter('publish_hz',        50.0)
        self.declare_parameter('reconnect_sec',     3.0)
        self.declare_parameter('max_steering_deg',  self.MAX_STEERING_DEG)
        self.declare_parameter('max_speed_pct',     self.MAX_RPM_PCT)
        self.declare_parameter('steering_reversed', False)

        port     = self.get_parameter('port').value or None
        baud     = self.get_parameter('baud').value
        topic    = self.get_parameter('cmd_vel_topic').value
        pub_hz   = self.get_parameter('publish_hz').value
        recon    = self.get_parameter('reconnect_sec').value
        self.MAX_STEERING_DEG = self.get_parameter('max_steering_deg').value
        self.MAX_RPM_PCT      = self.get_parameter('max_speed_pct').value
        self._steer_rev       = self.get_parameter('steering_reversed').value

        # ── 현재 명령값 ────────────────────────────────────
        self._steering = 90    # 직진
        self._throttle = 100   # 정지

        # ── STM32 시리얼 ───────────────────────────────────
        self._stm = STM32Serial(port, baud)
        self._try_connect()

        # ── Subscriber ─────────────────────────────────────
        qos = QoSProfile(
            depth=10,
            reliability=ReliabilityPolicy.BEST_EFFORT)
        self._sub_cmd = self.create_subscription(
            Twist, topic, self._cmd_vel_cb, qos)

        # ── Publisher ──────────────────────────────────────
        self._pub_steer = self.create_publisher(Int32, '/stm32/steering',  10)
        self._pub_thr   = self.create_publisher(Int32, '/stm32/throttle',  10)
        self._pub_conn  = self.create_publisher(Bool,  '/stm32/connected', 10)

        # ── 타이머: 송신 + 상태 publish ────────────────────
        self._send_timer  = self.create_timer(1.0 / pub_hz, self._send_cb)
        self._recon_timer = self.create_timer(recon,        self._reconnect_cb)

        self.get_logger().info(
            f'stm32_driver_node 시작 | 포트: {self._stm._port} | '
            f'토픽: {topic} | 송신: {pub_hz}Hz')

    # ── /cmd_vel 콜백 ──────────────────────────────────────
    def _cmd_vel_cb(self, msg: Twist):
        """
        linear.x  : -1.0(최대후진) ~ +1.0(최대전진)
        angular.z : -1.0(우) ~ +1.0(좌)  ← ROS 표준 (반시계=양수)
        """
        # 스로틀 변환: linear.x → 0~200
        lx = max(-1.0, min(1.0, msg.linear.x))
        self._throttle = int(100.0 + lx * self.MAX_RPM_PCT)
        self._throttle = max(0, min(200, self._throttle))

        # 조향 변환: angular.z → 0~180
        # ROS: 좌=양수(반시계) → 서보: 좌=작은값(0쪽)
        az = max(-1.0, min(1.0, msg.angular.z))
        if self._steer_rev:
            az = -az
        # angular.z +1(좌) → steering 작아짐 (0 방향)
        # angular.z -1(우) → steering 커짐  (180 방향)
        steer_deg = -az * self.MAX_STEERING_DEG   # 부호 반전
        self._steering = int(90.0 + steer_deg / 45.0 * 90.0)
        self._steering = max(0, min(180, self._steering))

    # ── 주기 송신 콜백 ─────────────────────────────────────
    def _send_cb(self):
        ok = self._stm.send(self._steering, self._throttle)

        # 상태 토픽 publish
        msg_s = Int32(); msg_s.data = self._steering
        msg_t = Int32(); msg_t.data = self._throttle
        msg_c = Bool();  msg_c.data = ok or self._stm.is_connected()

        self._pub_steer.publish(msg_s)
        self._pub_thr.publish(msg_t)
        self._pub_conn.publish(msg_c)

    # ── 재연결 콜백 ────────────────────────────────────────
    def _reconnect_cb(self):
        if not self._stm.is_connected():
            self.get_logger().warn('STM32 연결 끊김 → 재연결 시도...')
            self._try_connect()

    def _try_connect(self):
        if self._stm.connect():
            self.get_logger().info(
                f'STM32 연결 성공: {self._stm._port}')
        else:
            self.get_logger().warn(
                f'STM32 연결 실패: {self._stm._port}')

    # ── 종료 ───────────────────────────────────────────────
    def destroy_node(self):
        self._stm.send(90, 100)   # 정지 명령
        self._stm.close()
        super().destroy_node()


# ──────────────────────────────────────────────────────────────
def main(args=None):
    rclpy.init(args=args)
    node = STM32DriverNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


```python
## =====================================================
##  파일 1: setup.py
## =====================================================
## 아래 내용을 stm32_driver/setup.py 로 저장

from setuptools import setup

package_name = 'stm32_driver'

setup(
    name=package_name,
    version='0.1.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name + '/launch', ['launch/stm32_driver.launch.py']),
    ],
    install_requires=['setuptools', 'pyserial'],
    zip_safe=True,
    maintainer='user',
    maintainer_email='user@example.com',
    description='STM32F407 USB CDC driver for ROS2 Humble',
    license='MIT',
    entry_points={
        'console_scripts': [
            'stm32_driver_node = stm32_driver.stm32_driver_node:main',
        ],
    },
)


## =====================================================
##  파일 2: package.xml
## =====================================================
## 아래 내용을 stm32_driver/package.xml 로 저장
##
## <?xml version="1.0"?>
## <?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
## <package format="3">
##   <name>stm32_driver</name>
##   <version>0.1.0</version>
##   <description>STM32F407 USB CDC driver node</description>
##   <maintainer email="user@example.com">user</maintainer>
##   <license>MIT</license>
##   <exec_depend>rclpy</exec_depend>
##   <exec_depend>geometry_msgs</exec_depend>
##   <exec_depend>std_msgs</exec_depend>
##   <buildtool_depend>ament_python</buildtool_depend>
##   <export>
##     <build_type>ament_python</build_type>
##   </export>
## </package>


## =====================================================
##  파일 3: launch/stm32_driver.launch.py
## =====================================================
## 아래 내용을 stm32_driver/launch/stm32_driver.launch.py 로 저장

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='stm32_driver',
            executable='stm32_driver_node',
            name='stm32_driver_node',
            output='screen',
            parameters=[{
                'port':              '',          # 비워두면 자동 감지
                'baud':              115200,
                'cmd_vel_topic':     '/cmd_vel',
                'publish_hz':        50.0,
                'reconnect_sec':     3.0,
                'max_steering_deg':  45.0,        # angular.z=1.0 → 45° 조향
                'max_speed_pct':     100.0,       # linear.x=1.0 → 전진 100%
                'steering_reversed': False,       # 서보 방향 반전 필요시 True
            }]
        )
    ])


## =====================================================
##  빌드 & 실행 방법
## =====================================================
##
## # 패키지 구조 생성
## cd ~/ros2_ws/src
## ros2 pkg create --build-type ament_python stm32_driver
##
## # stm32_driver_node.py 를 stm32_driver/stm32_driver/ 폴더에 복사
## # setup.py, package.xml, launch 파일 위 내용으로 교체
##
## # 빌드
## cd ~/ros2_ws
## colcon build --packages-select stm32_driver
## source install/setup.bash
##
## # 실행
## ros2 launch stm32_driver stm32_driver.launch.py
##
## # 또는 직접 실행
## ros2 run stm32_driver stm32_driver_node
##
## # 토픽 확인
## ros2 topic list
## ros2 topic echo /stm32/connected
##
## # 테스트 (직진 전진)
## ros2 topic pub /cmd_vel geometry_msgs/Twist \
##   "{linear: {x: 0.5}, angular: {z: 0.0}}" --once
##
## # 좌회전 + 전진
## ros2 topic pub /cmd_vel geometry_msgs/Twist \
##   "{linear: {x: 0.3}, angular: {z: 0.5}}" --once
```


### 정우버전❤️


아두이노기반


```c
#include <Servo.h>

// 핀 할당 (설계서 기준)
const int motorForwardPin = 2;   // 구동 모터 전진 PWM
const int motorBackwardPin = 3;  // 구동 모터 후진 PWM
const int servoPin = 9;          // 조향 서보 모터 PWM 핀 (STM32 가용 핀으로 설정)

Servo steeringServo;
int currentSpeed = 0;

void setup() {
  // 상위/중위 제어기 간 UART 시리얼 통신 시작 (115200 bps)
  Serial.begin(115200);

  // 구동 모터 핀 설정
  pinMode(motorForwardPin, OUTPUT);
  pinMode(motorBackwardPin, OUTPUT);

  // 조향 서보 모터 초기화 및 중앙(90도) 정렬
  steeringServo.attach(servoPin);
  steeringServo.write(90);

  // 초기 구동 정지
  stopMotor();
}

void loop() {
  // 시리얼 명령 수신 대기
  if (Serial.available() > 0) {
    String command = Serial.readStringUntil('\n');
    command.trim(); // 공백 제거

    // 1. 최우선 순위: 긴급 제동 (PCA/AEB)
    if (command == "EMERGENCY_STOP") {
      stopMotor();
      Serial.println("ACK:STOP_EXECUTED");
    } 
    // 2. 구동 모터 속도 제어
    else if (command.startsWith("SPEED:")) {
      int targetSpeed = command.substring(6).toInt();
      setMotorSpeed(targetSpeed);
    }
    // 3. 조향 서보 모터 각도 제어
    else if (command.startsWith("STEER:")) {
      int angle = command.substring(6).toInt();
      setSteeringAngle(angle);
    }
  }
}

// 구동 모터 속도 제어 함수 (-255 ~ 255)[cite: 2]
void setMotorSpeed(int speed) {
  speed = constrain(speed, -255, 255);
  currentSpeed = speed;

  if (speed > 0) {
    analogWrite(motorBackwardPin, 0);
    analogWrite(motorForwardPin, speed);
  } else if (speed < 0) {
    analogWrite(motorForwardPin, 0);
    analogWrite(motorBackwardPin, abs(speed));
  } else {
    stopMotor();
  }
}

// 구동 모터 즉시 정지 함수[cite: 2]
void stopMotor() {
  currentSpeed = 0;
  analogWrite(motorForwardPin, 0);
  analogWrite(motorBackwardPin, 0);
}

// 조향 서보 모터 각도 제어 함수 (0 ~ 180도)[cite: 2]
void setSteeringAngle(int angle) {
  angle = constrain(angle, 0, 180);
  steeringServo.write(angle);
}
```


ros2기반


```python
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from std_msgs.msg import Float32, Bool

class AEBSafetyNode(Node):
    def __init__(self):
        super().__init__('safety_node') # [SWE.2] 아키텍처 명세에 따른 노드명

        # 1. Subscriber: 아두이노(Bridge)로부터 초음파 거리 데이터 수신
        self.distance_sub = self.create_subscription(
            Float32,
            '/filtered_distance',
            self.distance_callback,
            10)

        # 2. Publisher: 긴급 제동 플래그 및 구동 모터(STM32) 제어 명령 발행
        self.cmd_vel_pub = self.create_publisher(Twist, '/cmd_vel', 10)
        self.emergency_pub = self.create_publisher(Bool, '/emergency_trigger', 10)

        # 3. 거리 임계치 설정 (단위: cm) [SWE.3 기준]
        self.danger_threshold = 3.0   # 5단계: 즉각 제동 (PCA)
        self.warning_threshold = 21.0 # 2~4단계: PDW 경고 구간

        self.is_emergency = False
        self.get_logger().info("형님, ROS 2 AEB Safety Node가 정상 가동되었습니다. 주변 감시를 시작합니다.")

    def distance_callback(self, msg):
        distance = msg.data

        # 충돌 임계치 도달 시 (3cm 이하)
        if distance <= self.danger_threshold and not self.is_emergency:
            self.get_logger().error(f"긴급 상황! 전방 장애물 {distance}cm. 즉시 제동(PCA) 개입!")
            self.trigger_aeb()
        
        # 경고 구간 진입 시 (21cm 이하)
        elif self.danger_threshold < distance <= self.warning_threshold:
            self.get_logger().warn(f"장애물 접근 중: {distance}cm (PDW 경고)")
            self.is_emergency = False # 안전 거리 확보 시 제동 해제 준비

    def trigger_aeb(self):
        self.is_emergency = True
        
        # 1. 긴급 제동 플래그 활성화 (Planner 노드 등에서 확인용)[cite: 2]
        trigger_msg = Bool()
        trigger_msg.data = True
        self.emergency_pub.publish(trigger_msg)

        # 2. Twist 메시지를 통해 선속도(x)와 각속도(z)를 0으로 강제 발행 (모터 정지)[cite: 2]
        stop_msg = Twist()
        stop_msg.linear.x = 0.0
        stop_msg.angular.z = 0.0
        self.cmd_vel_pub.publish(stop_msg)

def main(args=None):
    rclpy.init(args=args)
    aeb_safety_node = AEBSafetyNode()
    
    try:
        rclpy.spin(aeb_safety_node)
    except KeyboardInterrupt:
        aeb_safety_node.get_logger().info("시스템을 안전하게 종료합니다.")
    finally:
        aeb_safety_node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


# STM32 [Yes ROS 2]


micro-ROS STM32F407 설정 가이드


ROS2 Humble + USB CDC transport


---


## 전체 구조


```text
[라즈베리파이]
  ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0
       ↕ USB
[STM32F407]
  /cmd_vel  subscribe  → 서보 + DC모터 제어
  /encoder_rpm publish → 현재 RPM 전송
```


라즈베리파이에서 cmd_vel을 publish하면 STM32가 직접 받아서 모터 제어.
Python 드라이버 노드 필요 없음.


---


## Step 1. CubeMX 설정


### 클럭

- HSE: Crystal
- SYSCLK: 168MHz
- **SYS → Timebase Source: TIM6** ← 반드시 TIM6으로 변경 (SysTick은 micro-ROS 사용)

### USB

- USB_OTG_FS: Device_Only
- Middleware → USB_DEVICE → CDC

### FreeRTOS

- Middleware → FREERTOS → Interface: **CMSIS_V2**
- Tasks and Queues → defaultTask
	- Stack Size: **3000** words 이상 (= 12000 bytes)
- Config → TOTAL_HEAP_SIZE: **51200** bytes 이상

### 타이머 (기존 동일)

- TIM3: PSC=167, ARR=19999 (서보 50Hz)
- TIM4: PSC=3, ARR=1049 (모터 20kHz)
- TIM1: Encoder Mode TI1&TI2, ARR=65535

### GPIO

- PD13, PD14: GPIO_Output (모터 방향)

---


## Step 2. micro-ROS 라이브러리 빌드


STM32CubeIDE 프로젝트 폴더 안에서:


```bash
# 1) 유틸 클론
git clone --branch humble \
  https://github.com/micro-ROS/micro_ros_stm32cubemx_utils.git

# 2) Docker로 static library 빌드 (한 줄)
docker pull microros/micro_ros_static_library_builder:humble

docker run --rm \
  -v $(pwd):/project \
  --env MICROROS_LIBRARY_FOLDER=micro_ros_stm32cubemx_utils/microros_static_library_ide \
  microros/micro_ros_static_library_builder:humble
```


---


## Step 3. STM32CubeIDE 프로젝트 설정


### Include path 추가


Project → Settings → C/C++ Build → MCU GCC Compiler → Include paths:


```text
../micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include
```


### Library 추가


MCU GCC Linker → Libraries:

- Library search path (-L):

	```text
	../micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros
	```

- Libraries (-l):

	```text
	microros
	```


### 소스 파일 추가 (C_SOURCES)


Makefile 또는 IDE 소스 목록에 추가:


```text
micro_ros_stm32cubemx_utils/extra_sources/custom_memory_manager.c
micro_ros_stm32cubemx_utils/extra_sources/microros_allocators.c
micro_ros_stm32cubemx_utils/extra_sources/microros_time.c
micro_ros_stm32cubemx_utils/extra_sources/microros_transports/usb_cdc_transport.c
```


---


## Step 4. main.c에 태스크 연결


```c
/* main.c 상단 */
extern void MicroROS_Task(void *argument);

/* FreeRTOS 태스크 생성 (CubeMX defaultTask 대체 또는 추가) */
/* USER CODE BEGIN RTOS_THREADS */
osThreadDef(microROSTask, MicroROS_Task, osPriorityNormal, 0, 3000);
osThreadCreate(osThread(microROSTask), NULL);
/* USER CODE END RTOS_THREADS */
```


또는 CubeMX defaultTask의 StartDefaultTask()에서 직접 호출:


```c
void StartDefaultTask(void *argument)
{
    MicroROS_Task(argument);
}
```


---


## Step 5. 라즈베리파이 — Agent 실행


```bash
# micro-ROS Agent 설치 (한 번만)
pip install micro-ros-agent  # 또는 소스 빌드

# 또는 Docker로 실행
docker run -it --rm \
  -v /dev:/dev --privileged \
  microros/micro-ros-agent:humble \
  serial --dev /dev/ttyACM0 -b 115200

# 소스 빌드 설치한 경우
ros2 run micro_ros_agent micro_ros_agent serial --dev /dev/ttyACM0
```


---


## Step 6. 동작 확인


```bash
# 토픽 목록 확인 (STM32 연결되면 자동 등록)
ros2 topic list
# /cmd_vel
# /encoder_rpm

# STM32 RPM 수신 확인
ros2 topic echo /encoder_rpm

# 전진 명령 전송
ros2 topic pub /cmd_vel geometry_msgs/Twist \
  "{linear: {x: 0.5}, angular: {z: 0.0}}" --once

# 좌회전 + 전진
ros2 topic pub /cmd_vel geometry_msgs/Twist \
  "{linear: {x: 0.3}, angular: {z: 0.5}}" --once

# 정지
ros2 topic pub /cmd_vel geometry_msgs/Twist \
  "{linear: {x: 0.0}, angular: {z: 0.0}}" --once
```


---


## STM32 연결 흐름


```text
전원 ON
  → FreeRTOS 시작
  → MicroROS_Task 실행
  → USB CDC transport 초기화
  → Agent ping 대기 (Agent 없으면 여기서 대기)
  → Agent 연결되면 node / subscriber / publisher 생성
  → /cmd_vel 수신 → 모터 제어
  → /encoder_rpm 20ms마다 publish
```


Agent가 꺼져도 STM32는 재연결 시도 → Agent 다시 켜면 자동 복구


---


## 감속비 수정


microros_motor.c 상단:


```c
#define GEAR_RATIO  19u   // 실제 감속비로 수정
```


```python
/* ============================================================
 *  STM32F407VET6 — micro-ROS 펌웨어
 *
 *  Subscribe: /cmd_vel  (geometry_msgs/Twist)
 *    linear.x  : -1.0 ~ +1.0  → 후진 ~ 전진
 *    angular.z : -1.0 ~ +1.0  → 우 ~ 좌
 *
 *  Publish:   /encoder_rpm  (std_msgs/Float32)
 *    출력축 RPM (20ms 주기)
 *
 *  Transport: USB CDC (PA11/PA12)
 *  RTOS:      FreeRTOS CMSIS_V2
 *
 *  [핀 배정]
 *    PA11/PA12   USB D-/D+
 *    TIM3_CH1 PA6   서보 PWM  50Hz   (LD-1501MG)
 *    TIM4_CH1 PD12  DC모터 PWM 20kHz (JGB37-520)
 *    PD13           DC모터 IN1
 *    PD14           DC모터 IN2
 *    TIM1_CH1 PA8   엔코더 A
 *    TIM1_CH2 PA9   엔코더 B
 *
 *  [CubeMX 설정]
 *    USB_OTG_FS: Device_Only
 *    Middleware → USB_DEVICE → CDC
 *    Middleware → FreeRTOS → CMSIS_V2
 *      defaultTask stack: 3000 words 이상
 *      Heap: 10240 bytes 이상
 *    SYS → Timebase Source: TIM6  (SysTick은 micro-ROS가 사용)
 *    TIM3: PSC=167, ARR=19999
 *    TIM4: PSC=3,   ARR=1049
 *    TIM1: Encoder Mode TI1&TI2, ARR=65535
 *
 *  [micro-ROS 라이브러리 추가]
 *    git clone --branch humble \
 *      https://github.com/micro-ROS/micro_ros_stm32cubemx_utils.git
 *    → README 따라 static library 빌드 (Docker 한 줄)
 * ============================================================ */

#include "main.h"
#include "cmsis_os.h"

/* micro-ROS 헤더 */
#include <rcl/rcl.h>
#include <rcl/error_handling.h>
#include <rclc/rclc.h>
#include <rclc/executor.h>
#include <rmw_microros/rmw_microros.h>

/* 메시지 타입 */
#include <geometry_msgs/msg/twist.h>
#include <std_msgs/msg/float32.h>

/* micro-ROS USB CDC transport (micro_ros_stm32cubemx_utils 제공) */
#include "microros_transports.h"

/* ── 외부 핸들 ── */
extern TIM_HandleTypeDef htim1;
extern TIM_HandleTypeDef htim3;
extern TIM_HandleTypeDef htim4;

/* ================================================================
 *  모터 / 서보 상수
 * ================================================================ */
#define SERVO_MIN_US     500u
#define SERVO_MAX_US     2500u
#define MOTOR_PWM_MAX    1049u
#define ENC_PPR          11u
#define GEAR_RATIO       19u       /* ← 실제 감속비로 수정 */
#define ENC_CPR          (ENC_PPR * GEAR_RATIO * 4u)
#define MAX_RPM          280
#define PID_DT_MS        20u

/* ================================================================
 *  PID
 * ================================================================ */
#define PID_KP           2.5f
#define PID_KI           0.8f
#define PID_KD           0.05f
#define PID_INTEG_MAX    500.0f

typedef struct { float integ; float prev_err; } PID_t;
static PID_t pid = {0};

/* ================================================================
 *  공유 명령값 (micro-ROS 콜백 → 제어 루프)
 * ================================================================ */
static volatile float g_linear_x  = 0.0f;   /* -1.0 ~ +1.0 */
static volatile float g_angular_z = 0.0f;   /* -1.0 ~ +1.0 */

/* ================================================================
 *  엔코더
 * ================================================================ */
static int32_t enc_prev = 0;

/* ================================================================
 *  micro-ROS 객체
 * ================================================================ */
static rcl_subscription_t   sub_cmdvel;
static rcl_publisher_t      pub_rpm;
static geometry_msgs__msg__Twist   msg_cmdvel;
static std_msgs__msg__Float32      msg_rpm;
static rclc_executor_t      executor;
static rclc_support_t       support;
static rcl_allocator_t      allocator;
static rcl_node_t           node;
static rcl_timer_t          timer_pub;

/* ── 편의 매크로 ── */
#define RCCHECK(fn) { rcl_ret_t _rc = (fn); \
    if (_rc != RCL_RET_OK) { Error_Handler(); } }
#define RCSOFTCHECK(fn) { (void)(fn); }

/* ── 내부 함수 프로토타입 ── */
static void Servo_SetAngle(uint8_t angle);
static void Motor_Drive(int32_t pwm, uint8_t fwd);
static void Motor_Stop(void);
static float Encoder_GetRPM(void);
static float PID_Run(PID_t *p, float sp, float pv);
static uint8_t Twist_ToSteering(float angular_z);
static void    Twist_ToThrottle(float linear_x,
                                int32_t *out_rpm, uint8_t *out_fwd);

/* ================================================================
 *  /cmd_vel 수신 콜백
 * ================================================================ */
static void cmdvel_callback(const void *msg_in)
{
    const geometry_msgs__msg__Twist *twist =
        (const geometry_msgs__msg__Twist *)msg_in;
    g_linear_x  = (float)twist->linear.x;
    g_angular_z = (float)twist->angular.z;
}

/* ================================================================
 *  /encoder_rpm publish 타이머 콜백 (PID_DT_MS 주기)
 * ================================================================ */
static void timer_callback(rcl_timer_t *timer, int64_t last_call_time)
{
    (void)last_call_time;
    if (timer == NULL) return;

    float lx = g_linear_x;
    float az = g_angular_z;

    /* ─ 서보 조향 ─ */
    Servo_SetAngle(Twist_ToSteering(az));

    /* ─ 모터 속도 PID ─ */
    int32_t target_rpm;
    uint8_t fwd;
    Twist_ToThrottle(lx, &target_rpm, &fwd);

    if (target_rpm == 0) {
        Motor_Stop();
        pid.integ = pid.prev_err = 0.0f;
    } else {
        float cur = Encoder_GetRPM();
        if (cur < 0.0f) cur = -cur;
        float out = PID_Run(&pid, (float)target_rpm, cur);
        int32_t pwm = (int32_t)out;
        if (pwm > (int32_t)MOTOR_PWM_MAX) pwm = (int32_t)MOTOR_PWM_MAX;
        if (pwm < 0) pwm = 0;
        Motor_Drive(pwm, fwd);
    }

    /* ─ RPM publish ─ */
    msg_rpm.data = Encoder_GetRPM();
    RCSOFTCHECK(rcl_publish(&pub_rpm, &msg_rpm, NULL));
}

/* ================================================================
 *  micro-ROS FreeRTOS 태스크
 *  CubeMX defaultTask 의 StartDefaultTask() 안에서 호출
 * ================================================================ */
void MicroROS_Task(void *argument)
{
    (void)argument;

    /* ─ 하드웨어 초기화 ─ */
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
    Servo_SetAngle(90);
    HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_1);
    Motor_Stop();
    HAL_TIM_Encoder_Start(&htim1, TIM_CHANNEL_ALL);
    enc_prev = (int32_t)__HAL_TIM_GET_COUNTER(&htim1);

    /* ─ USB CDC transport 설정 ─ */
    rmw_uros_set_custom_transport(
        true,
        NULL,
        usb_cdc_transport_open,
        usb_cdc_transport_close,
        usb_cdc_transport_write,
        usb_cdc_transport_read
    );

    /* ─ Agent 연결 대기 (연결될 때까지 무한 재시도) ─ */
    while (rmw_uros_ping_agent(100, 1) != RCL_RET_OK) {
        osDelay(500);
    }

    /* ─ micro-ROS 초기화 ─ */
    allocator = rcl_get_default_allocator();
    RCCHECK(rclc_support_init(&support, 0, NULL, &allocator));

    RCCHECK(rclc_node_init_default(&node, "stm32_motor_node", "", &support));

    /* Subscriber: /cmd_vel */
    RCCHECK(rclc_subscription_init_default(
        &sub_cmdvel, &node,
        ROSIDL_GET_MSG_TYPE_SUPPORT(geometry_msgs, msg, Twist),
        "/cmd_vel"));

    /* Publisher: /encoder_rpm */
    RCCHECK(rclc_publisher_init_default(
        &pub_rpm, &node,
        ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, Float32),
        "/encoder_rpm"));

    /* Timer: PID_DT_MS 주기로 publish + 제어 */
    RCCHECK(rclc_timer_init_default(
        &timer_pub, &support,
        RCL_MS_TO_NS(PID_DT_MS),
        timer_callback));

    /* Executor: subscriber 1 + timer 1 */
    RCCHECK(rclc_executor_init(&executor, &support.context, 2, &allocator));
    RCCHECK(rclc_executor_add_subscription(
        &executor, &sub_cmdvel, &msg_cmdvel,
        &cmdvel_callback, ON_NEW_DATA));
    RCCHECK(rclc_executor_add_timer(&executor, &timer_pub));

    /* ─ 메인 스핀 루프 ─ */
    while (1) {
        rclc_executor_spin_some(&executor, RCL_MS_TO_NS(10));
        osDelay(1);
    }
}

/* ================================================================
 *  Twist → 서보 각도
 *  angular.z: +1(좌/반시계) ~ -1(우/시계) → steering 0~180
 * ================================================================ */
static uint8_t Twist_ToSteering(float az)
{
    az = az < -1.0f ? -1.0f : (az > 1.0f ? 1.0f : az);
    /* ROS 표준: +z = 반시계 = 좌 → 서보는 좌가 작은 값 */
    int val = (int)(90.0f - az * 90.0f);
    if (val < 0)   val = 0;
    if (val > 180) val = 180;
    return (uint8_t)val;
}

/* ================================================================
 *  Twist → 목표 RPM + 방향
 * ================================================================ */
static void Twist_ToThrottle(float lx, int32_t *rpm, uint8_t *fwd)
{
    lx = lx < -1.0f ? -1.0f : (lx > 1.0f ? 1.0f : lx);
    if (lx >= 0.0f) {
        *fwd = 1;
        *rpm = (int32_t)(lx * MAX_RPM);
    } else {
        *fwd = 0;
        *rpm = (int32_t)(-lx * MAX_RPM);
    }
}

/* ================================================================
 *  서보 / 모터 / 엔코더 / PID
 * ================================================================ */
static void Servo_SetAngle(uint8_t angle)
{
    uint32_t ccr = SERVO_MIN_US +
        ((uint32_t)angle * (SERVO_MAX_US - SERVO_MIN_US)) / 180u;
    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, ccr);
}

static void Motor_Drive(int32_t pwm, uint8_t fwd)
{
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, fwd ? GPIO_PIN_SET   : GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, fwd ? GPIO_PIN_RESET : GPIO_PIN_SET);
    __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_1, (uint32_t)pwm);
}

static void Motor_Stop(void)
{
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(GPIOD, GPIO_PIN_14, GPIO_PIN_RESET);
    __HAL_TIM_SET_COMPARE(&htim4, TIM_CHANNEL_1, 0);
}

static float Encoder_GetRPM(void)
{
    int32_t cur   = (int32_t)__HAL_TIM_GET_COUNTER(&htim1);
    int32_t delta = cur - enc_prev;
    enc_prev      = cur;
    if (delta >  32767) delta -= 65536;
    if (delta < -32768) delta += 65536;
    return ((float)delta / (float)ENC_CPR) / (PID_DT_MS / 1000.0f) * 60.0f;
}

static float PID_Run(PID_t *p, float sp, float pv)
{
    float dt  = PID_DT_MS / 1000.0f;
    float err = sp - pv;
    p->integ += err * dt;
    if (p->integ >  PID_INTEG_MAX) p->integ =  PID_INTEG_MAX;
    if (p->integ < -PID_INTEG_MAX) p->integ = -PID_INTEG_MAX;
    float deriv  = (err - p->prev_err) / dt;
    p->prev_err  = err;
    float out = PID_KP * err + PID_KI * p->integ + PID_KD * deriv;
    if (out > (float)MOTOR_PWM_MAX) out = (float)MOTOR_PWM_MAX;
    if (out < 0.0f)                 out = 0.0f;
    return out;
}
```


## LiDAR

## Lidar 키는 법

```bash
source /opt/ros/humble/setup.bash
ros2 launch sllidar_ros2 sllidar_a1_launch.py
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher --x 0 --y 0 --z 0.1 --frame-id base_link --child-frame-id laser
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher --x 0 --y 0 --z 0 --frame-id odom --child-frame-id base_link
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch slam_toolbox online_async_launch.py slam_params_file:=$HOME/spas_slam_params.yaml use_sim_time:=false
```


```bash
nano ~/spas_slam_params.yaml #설정 변경
```


이렇게 하면 발행되어야 하는 토픽들


/map
/map_metadata
/map_updates
/scan
/slam_toolbox/feedback
/slam_toolbox/graph_visualization
/slam_toolbox/scan_visualization
/slam_toolbox/update
/tf
/tf_static


~/sample_th/parking_space_detector_node.py 에 현재 주차 공간 탐색 코드 작성
관련 문서 


## parking_space_detector_node.py 정리

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


## Parking_Space_Detector 코드

```python
#!/usr/bin/env python3
"""
SPAS Parking Space Detector Node  ―  슬라이딩 윈도우 알고리즘
=============================================================

【전체 동작 흐름】
  /map (OccupancyGrid)
    │
    ├─① 맵 이진화
    │    OccupancyGrid의 각 셀 값(0~100, -1=미탐색)을
    │    free_map(빈 공간=1.0)과 occ_map(점유=1.0)으로 분리
    │
    ├─② 탐색 반경 마스크
    │    TF로 로봇 현재 위치를 읽어 search_radius(기본 2m) 원 안만 탐색
    │
    ├─③ 슬라이딩 윈도우 탐지
    │    목표 주차 공간 크기(space_length × space_width)의 직사각형 창을
    │    탐색 반경 안에서 1셀씩 이동하며 두 가지를 확인:
    │      (a) 창 내부: 자유 공간 비율 ≥ min_free_ratio
    │      (b) 창 외곽 4면: 각 면마다 점유 셀 비율 확인 →
    │          wall_occ_ratio 이상이면 '벽 있음'으로 판정
    │          벽 있는 면 수 ≥ min_wall_sides 이면 후보 등록
    │
    ├─④ NMS(비최대 억제)
    │    동일 공간에 겹치는 중복 후보를 스코어 기준으로 한 개만 남김
    │
    └─⑤ 발행 & 저장
         /parking_spaces      (PoseArray)    ← 중심 좌표
         /parking_space_markers (MarkerArray) ← RViz2 박스
         ~/sample_th/map/*.png               ← 디버그 이미지

【평행주차 vs 직각주차 판별 기준 — travel_direction 파라미터】

  핵심 원칙:
    공간의 '긴 변'이 차의 이동 방향(맵 좌표계 기준)과 평행하면 → 평행주차
    공간의 '긴 변'이 차의 이동 방향과 수직이면          → 직각주차

  travel_direction = 'x'  (차가 맵 X축 방향으로 이동)
  ┌────────────────────────────────────────────────────────────┐
  │  가로 창 (긴변=X방향, ww=sl, wh=sw)                        │
  │  긴변이 X축 = 차 이동 방향과 평행  →  평행주차              │
  └────────────────────────────────────────────────────────────┘
  ┌──────────┐
  │세로 창   │ (긴변=Y방향, wh=sl, ww=sw)
  │긴변이 Y축│ = 차 이동 방향과 수직  →  직각주차
  └──────────┘

  travel_direction = 'y'  (차가 맵 Y축 방향으로 이동)
    → 위 분류가 반전됨:
      세로 창(긴변=Y) = 차 방향과 평행 → 평행주차
      가로 창(긴변=X) = 차 방향과 수직 → 직각주차

  ★ SLAM 맵은 로봇이 처음 켜진 방향 기준으로 좌표계가 정해집니다.
    물리적으로 수평인 공간이 맵 Y축 방향으로 표현될 수 있습니다.
    차가 물리적으로 수평 이동 → 맵에서 Y축 이동 → travel_direction='y' 로 설정.

【파라미터 요약】
  space_length      : 주차 공간 긴 변 (m)
  space_width       : 주차 공간 짧은 변 (m)
  travel_direction  : 차의 맵 좌표계 이동 방향 ('x' 또는 'y')
  search_radius     : 로봇 중심 탐색 반경 (m)
  wall_border       : 창 바깥쪽 벽 검사 띠 두께 (m)
  min_wall_sides    : 벽으로 인정할 최소 면 수 (2~4), 높일수록 엄격
  min_free_ratio    : 창 내부 자유 셀 비율 하한 (0~1)
  wall_occ_ratio    : 검사 띠에서 점유 셀 비율 하한 (0~1), 낮추면 민감
"""

import os
import time

import cv2
import numpy as np
import rclpy
import tf2_ros
from geometry_msgs.msg import Pose, PoseArray, Quaternion
from nav_msgs.msg import OccupancyGrid
from rclpy.node import Node
from std_msgs.msg import ColorRGBA
from visualization_msgs.msg import Marker, MarkerArray


class ParkingSpaceDetectorNode(Node):
    """
    OccupancyGrid 맵을 구독하고 슬라이딩 윈도우로 주차 공간을 탐지해 발행하는 노드.
    """

    def __init__(self):
        super().__init__('parking_space_detector')

        # ── 파라미터 선언 ───────────────────────────────────────────────
        # ROS 2 파라미터: 실행 시 --params-file 로 YAML 파일로 덮어쓸 수 있음
        self.declare_parameter('space_length',       0.40)  # 주차 공간 긴 변 (m)
        self.declare_parameter('space_width',        0.30)  # 주차 공간 짧은 변 (m)
        self.declare_parameter('free_threshold',     30)    # 이 값 이하 셀 = 빈 공간
        self.declare_parameter('occupied_threshold', 65)    # 이 값 이상 셀 = 벽/장애물
        self.declare_parameter('search_radius',      2.0)   # 로봇 중심 탐색 반경 (m)
        self.declare_parameter('wall_border',        0.05)  # 벽 검사 띠 두께 (m)
        self.declare_parameter('min_wall_sides',     3)     # 벽 있는 면 최소 수
        self.declare_parameter('min_free_ratio',     0.70)  # 내부 자유 셀 비율 하한
        self.declare_parameter('wall_occ_ratio',     0.20)  # 벽 판정 점유 비율 하한
        self.declare_parameter('base_frame',         'base_link')  # 로봇 TF 프레임
        # 차의 맵 좌표계 이동 방향: 'x' 또는 'y'
        # SLAM 맵 좌표계는 로봇이 처음 켜진 방향 기준으로 정해짐.
        # 물리적으로 수평(좌우) 이동하더라도 맵에서 Y축 방향으로 표현될 수 있음.
        # → 검출된 공간이 세로(portrait)인데 실제로는 평행주차라면 'y'로 변경
        self.declare_parameter('travel_direction',   'x')
        # PNG 저장 시 업스케일 배율 (1셀 → scale×scale 픽셀)
        # 기본 4배: 0.05m/셀 → 1픽셀=0.0125m, 400×400셀 맵이면 1600×1600px 저장
        self.declare_parameter('map_save_scale',     4)

        self._load_params()

        # 맵 PNG 저장 디렉토리 생성
        self._map_dir = os.path.expanduser('~/sample_th/maps')
        os.makedirs(self._map_dir, exist_ok=True)

        # ── TF2: 맵 안에서 로봇의 현재 위치를 읽기 위해 사용 ───────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── ROS 2 퍼블리셔 ─────────────────────────────────────────────
        # /parking_spaces     : 탐지된 주차 공간 중심 좌표 배열
        # /parking_space_markers: RViz2 시각화용 박스 마커
        self._pub_spaces  = self.create_publisher(PoseArray,   '/parking_spaces',        10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_space_markers', 10)

        # ── ROS 2 서브스크라이버 ───────────────────────────────────────
        # slam_toolbox 가 발행하는 /map 토픽을 수신
        self._sub_map = self.create_subscription(
            OccupancyGrid, '/map', self._map_callback, 10
        )

        self.get_logger().info(
            f'ParkingSpaceDetector started [sliding-window]. '
            f'space={self._space_length:.2f}x{self._space_width:.2f}m  '
            f'radius={self._search_radius:.1f}m  '
            f'travel_dir={self._travel_direction}  '
            f'wall_sides≥{self._min_wall_sides}  '
            f'free_thresh={self._free_threshold}  '
            f'png_scale={self._map_save_scale}x'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────
    def _load_params(self):
        """선언된 ROS 2 파라미터를 인스턴스 변수에 저장."""
        self._space_length   = self.get_parameter('space_length').value
        self._space_width    = self.get_parameter('space_width').value
        self._free_threshold = self.get_parameter('free_threshold').value
        self._occ_threshold  = self.get_parameter('occupied_threshold').value
        self._search_radius  = self.get_parameter('search_radius').value
        self._wall_border    = self.get_parameter('wall_border').value
        self._min_wall_sides = self.get_parameter('min_wall_sides').value
        self._min_free_ratio = self.get_parameter('min_free_ratio').value
        self._wall_occ_ratio    = self.get_parameter('wall_occ_ratio').value
        self._base_frame        = self.get_parameter('base_frame').value
        self._travel_direction  = self.get_parameter('travel_direction').value  # 'x' 또는 'y'
        self._map_save_scale    = max(1, int(self.get_parameter('map_save_scale').value))

    # ── TF 로봇 위치 조회 ─────────────────────────────────────────────
    def _get_robot_map_pos(self):
        """
        TF 트리에서 map → base_link 변환을 읽어 로봇의 맵 좌표 (x, y)를 반환.
        TF가 아직 없거나 타임아웃이면 map 원점 (0, 0)으로 폴백.
        """
        try:
            tf = self._tf_buffer.lookup_transform(
                'map',           # 목표 프레임
                self._base_frame,  # 원본 프레임 (로봇 기준)
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.1)
            )
            return tf.transform.translation.x, tf.transform.translation.y
        except tf2_ros.TransformException:
            self.get_logger().warn(
                f'TF map→{self._base_frame} 없음; 원점(0,0) 사용',
                throttle_duration_sec=5.0
            )
            return 0.0, 0.0

    # ── 메인 콜백 ─────────────────────────────────────────────────────
    def _map_callback(self, msg: OccupancyGrid):
        """
        /map 토픽 수신 시 호출. 맵 처리 → 탐지 → 발행 전체 파이프라인 실행.
        """
        self.get_logger().info('Map received — sliding-window detection 시작.')

        # OccupancyGrid 메타데이터 추출
        resolution = msg.info.resolution   # 1셀 = resolution 미터 (예: 0.05m)
        origin     = msg.info.origin       # 맵 원점의 월드 좌표 (Pose)
        width      = msg.info.width        # 맵 가로 셀 수
        height     = msg.info.height       # 맵 세로 셀 수

        # ── ① 맵 이진화 ─────────────────────────────────────────────
        # OccupancyGrid.data 는 1D 리스트(길이 = width×height)
        # 값: 0~100 (점유 확률), -1 (미탐색)
        # reshape 으로 2D 배열로 변환 (행=세로, 열=가로)
        grid = np.array(msg.data, dtype=np.int8).reshape((height, width))

        # 빈 공간 맵: 값이 [0, free_threshold] 범위인 셀만 1.0
        # → 미탐색(-1), 점유(값 큰 셀)는 0.0 으로 처리
        free_map = ((grid >= 0) & (grid <= self._free_threshold)).astype(np.float32)

        # 점유(벽) 맵: 값이 occupied_threshold 이상인 셀만 1.0
        occ_map  = (grid >= self._occ_threshold).astype(np.float32)

        # ── ② 탐색 반경 계산 ────────────────────────────────────────
        # 로봇의 맵 좌표 (미터) 를 셀 좌표로 변환
        robot_x, robot_y = self._get_robot_map_pos()
        rx_cell = (robot_x - origin.position.x) / resolution  # 로봇 열 위치
        ry_cell = (robot_y - origin.position.y) / resolution  # 로봇 행 위치

        self.get_logger().info(
            f'탐색 중심: ({robot_x:.2f}, {robot_y:.2f}) m  '
            f'반경: {self._search_radius:.1f} m'
        )

        # ── ③ 슬라이딩 윈도우 탐지 ──────────────────────────────────
        candidates = self._sliding_window_detect(
            free_map, occ_map, rx_cell, ry_cell, origin, resolution, height, width
        )

        self.get_logger().info(f'탐지된 주차 공간 수: {len(candidates)}')

        # ── ④ 발행 데이터 구성 ───────────────────────────────────────
        pose_array              = PoseArray()
        pose_array.header.stamp    = self.get_clock().now().to_msg()
        pose_array.header.frame_id = 'map'
        marker_array = MarkerArray()

        # BEST 후보: score 내림차순 정렬된 candidates 중 0번이 최고 스코어
        best_idx = 0

        for i, c in enumerate(candidates):
            # ── Pose: 주차 공간 중심 좌표 ──────────────────────────
            pose = Pose()
            pose.position.x  = c['mx']
            pose.position.y  = c['my']
            pose.position.z  = 0.0
            pose.orientation = Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)
            pose_array.poses.append(pose)

            # ── 마커 색상 결정 ──────────────────────────────────────
            # ★ BEST : 빨간색(진함)  평행주차: 초록  직각주차: 파랑
            is_best = (i == best_idx)
            if is_best:
                color = ColorRGBA(r=1.0, g=0.0, b=0.0, a=0.85)  # 빨강
            elif c['type'] == '평행주차':
                color = ColorRGBA(r=0.0, g=0.8, b=0.0, a=0.30)  # 초록 반투명
            else:
                color = ColorRGBA(r=0.0, g=0.0, b=0.8, a=0.30)  # 파랑 반투명

            marker_array.markers.append(
                self._make_box_marker(
                    i, pose_array.header,
                    c['mx'], c['my'], c['pw'], c['ph'], color
                )
            )

            best_tag = ' ★ BEST' if is_best else ''
            self.get_logger().info(
                f'Space #{i} [{c["type"]}]{best_tag} '
                f'at ({c["mx"]:.3f}, {c["my"]:.3f}) m  '
                f'size={c["pw"]:.2f}x{c["ph"]:.2f}m  '
                f'walls={c["walls"]}  score={c["score"]:.3f}'
            )

        self._pub_spaces.publish(pose_array)
        self._pub_markers.publish(marker_array)
        self._save_map_png(free_map, occ_map, rx_cell, ry_cell,
                           candidates, best_idx, resolution, height, width)

    # ── 슬라이딩 윈도우 탐지 ──────────────────────────────────────────
    def _sliding_window_detect(self, free_map, occ_map,
                                rx_cell, ry_cell,
                                origin, resolution, height, width):
        """
        목표 크기의 직사각형 창을 탐색 반경 내에서 슬라이딩하며
        '내부 자유 + 외곽 벽' 조건을 만족하는 위치를 탐지.

        Returns: score 내림차순 정렬된 후보 딕셔너리 리스트
        """

        # ── 셀 단위 변환 ────────────────────────────────────────────
        # space_length(긴 변)와 space_width(짧은 변)을 셀 수로 변환
        # round 후 max(1, ...) 로 0셀이 되는 것을 방지
        sl = max(1, int(round(self._space_length / resolution)))  # 긴 변 셀 수
        sw = max(1, int(round(self._space_width  / resolution)))  # 짧은 변 셀 수
        b  = max(1, int(round(self._wall_border  / resolution)))  # 벽 검사 띠 셀 수

        radius_cells = self._search_radius / resolution  # 탐색 반경(셀 단위)

        # ── 탐색 범위 한정 ───────────────────────────────────────────
        # 반경 바깥은 순회하지 않아 대형 맵에서도 빠르게 동작
        r_lo = max(0,      int(ry_cell - radius_cells) - b)
        r_hi = min(height, int(ry_cell + radius_cells) + b + 1)
        c_lo = max(0,      int(rx_cell - radius_cells) - b)
        c_hi = min(width,  int(rx_cell + radius_cells) + b + 1)

        # ── 적분 이미지(Integral Image) 생성 ─────────────────────────
        # 적분 이미지는 임의 직사각형 영역의 합을 O(1)에 계산 가능하게 해줌.
        # 일반 합산은 O(area)이지만 적분 이미지를 쓰면 4번의 참조로 해결.
        # cv2.integral(M)[r2,c2] - [r1,c2] - [r2,c1] + [r1,c1]
        #   = M[r1:r2, c1:c2] 의 합
        fi = cv2.integral(free_map)  # 자유 공간 적분 이미지
        oi = cv2.integral(occ_map)   # 점유 공간 적분 이미지

        def box_sum(intg, r1, c1, r2, c2):
            """
            적분 이미지를 이용해 (r1,c1)~(r2,c2) 사각형 영역의 합을 반환.
            경계 클램핑 포함.
            """
            r1, c1 = max(0, r1), max(0, c1)
            r2, c2 = min(height, r2), min(width, c2)
            if r2 <= r1 or c2 <= c1:
                return 0.0
            return float(intg[r2, c2] - intg[r1, c2]
                         - intg[r2, c1] + intg[r1, c1])

        raw = []  # 조건을 만족한 모든 후보 (NMS 전)

        # ── 두 가지 창 방향을 모두 시도 ─────────────────────────────
        # travel_direction 파라미터로 차의 맵 좌표계 이동 방향을 지정.
        #
        # 판별 원칙:
        #   공간의 긴 변이 차 이동 방향과 평행 → 평행주차
        #   공간의 긴 변이 차 이동 방향과 수직 → 직각주차
        #
        # travel_direction='x' 일 때 (차가 맵 X축 방향 이동):
        #   가로 창 (ww=sl: 긴변=X방향) → 긴변이 X와 평행 → 평행주차
        #   세로 창 (wh=sl: 긴변=Y방향) → 긴변이 X와 수직 → 직각주차
        #
        # travel_direction='y' 일 때 (차가 맵 Y축 방향 이동):
        #   세로 창 (wh=sl: 긴변=Y방향) → 긴변이 Y와 평행 → 평행주차
        #   가로 창 (ww=sl: 긴변=X방향) → 긴변이 Y와 수직 → 직각주차
        #
        # ★ SLAM 맵 좌표계는 로봇이 매핑 시작 시 바라보던 방향에 따라 결정됨.
        #   물리적으로 수평 이동하더라도 맵에서 Y축으로 나타날 수 있으므로
        #   실측 결과를 보고 'x'/'y' 를 선택.

        if self._travel_direction == 'y':
            # 차가 맵 Y축 방향 이동: 세로 창=평행, 가로 창=직각
            orientations = [('평행주차', sl, sw)]   # wh=sl(긴변=세로=Y방향)
            if sl != sw:
                orientations.append(('직각주차', sw, sl))  # wh=sw(짧은변=세로), ww=sl(긴변=X방향)
        else:
            # 차가 맵 X축 방향 이동(기본): 가로 창=평행, 세로 창=직각
            orientations = [('평행주차', sw, sl)]   # wh=sw(짧은변=세로), ww=sl(긴변=X방향)
            if sl != sw:
                orientations.append(('직각주차', sl, sw))  # wh=sl(긴변=세로=Y방향)

        for mtype, wh, ww in orientations:
            # wh: 창의 세로(행) 셀 수,  ww: 창의 가로(열) 셀 수

            for r in range(r_lo, min(r_hi, height - wh + 1)):
                for c in range(c_lo, min(c_hi, width - ww + 1)):

                    # ── 탐색 반경 체크 ──────────────────────────────
                    # 창 중심이 로봇 반경 내에 있어야 함
                    dr = (r + wh / 2.0) - ry_cell  # 행 방향 거리
                    dc = (c + ww / 2.0) - rx_cell  # 열 방향 거리
                    if dr * dr + dc * dc > radius_cells ** 2:
                        continue

                    # ── 조건 (a): 창 내부 자유 공간 비율 확인 ────────
                    # 창 안의 전체 셀 수 대비 자유 셀 수의 비율을 계산
                    # 예: 8×6 창(48셀) 중 자유셀이 34개 → 34/48 ≈ 0.71
                    area = float(wh * ww)
                    interior_free = box_sum(fi, r, c, r + wh, c + ww)
                    free_ratio = interior_free / area
                    if free_ratio < self._min_free_ratio:
                        continue  # 내부가 충분히 비어있지 않으면 건너뜀

                    # ── 조건 (b): 창 외곽 4면 벽 검사 ───────────────
                    # 창 바깥 b셀 두께의 띠 영역에서 점유 셀 비율을 계산
                    # 각 면의 전체 셀 수 = 띠 두께(b) × 면 길이(ww 또는 wh)

                    top_area = float(b * ww)  # 위쪽 띠 셀 수
                    lr_area  = float(wh * b)  # 좌우 띠 셀 수

                    # 각 면의 점유 셀 합산
                    top_occ = box_sum(oi, r - b,     c,      r,          c + ww)
                    bot_occ = box_sum(oi, r + wh,    c,      r + wh + b, c + ww)
                    lft_occ = box_sum(oi, r,         c - b,  r + wh,     c     )
                    rgt_occ = box_sum(oi, r,         c + ww, r + wh,     c + ww + b)

                    # 각 면별로 점유 비율 ≥ wall_occ_ratio 이면 '벽 있음'(+1)
                    walls = 0
                    if top_area > 0 and top_occ / top_area >= self._wall_occ_ratio: walls += 1
                    if top_area > 0 and bot_occ / top_area >= self._wall_occ_ratio: walls += 1
                    if lr_area  > 0 and lft_occ / lr_area  >= self._wall_occ_ratio: walls += 1
                    if lr_area  > 0 and rgt_occ / lr_area  >= self._wall_occ_ratio: walls += 1

                    if walls < self._min_wall_sides:
                        continue  # 벽이 부족하면 건너뜀

                    # ── 스코어 계산 ──────────────────────────────────
                    # 자유 공간 비율(클수록 좋음) + 벽 수 보너스
                    # free_ratio 는 0~1 범위, walls 는 0~4
                    score = free_ratio + 0.05 * walls

                    # ── 창 중심을 맵 좌표(미터)로 변환 ─────────────
                    # 셀 좌표 → 맵 원점 기준 미터 좌표
                    # +0.5 는 셀 중심 보정 (셀 좌표는 왼쪽 모서리 기준이므로)
                    cx_cell = c + ww / 2.0
                    cy_cell = r + wh / 2.0
                    mx = origin.position.x + (cx_cell + 0.5) * resolution
                    my = origin.position.y + (cy_cell + 0.5) * resolution

                    raw.append({
                        'mx':    mx,               # 맵 X 좌표 (m)
                        'my':    my,               # 맵 Y 좌표 (m)
                        'pw':    ww * resolution,  # 공간 폭 (m)
                        'ph':    wh * resolution,  # 공간 높이 (m)
                        'score': score,
                        'walls': walls,
                        'type':  mtype,
                        'r': r, 'c': c, 'wh': wh, 'ww': ww,  # PNG 그리기용 셀 좌표
                    })

        self.get_logger().info(f'윈도우 후보 수 (NMS 전): {len(raw)}')

        # ── NMS (Non-Maximum Suppression) ────────────────────────────
        # 같은 실제 공간에서 수십 개의 창이 겹쳐 후보로 등록됨.
        # 거리 기준으로 가장 스코어 높은 것만 남기고 나머지 억제.
        #
        # 억제 거리 기준: space_length 이내에 있는 후보는 중복으로 간주
        # → 예: 0.40m 이내에 다른 후보가 있으면 스코어가 낮은 쪽 제거
        raw.sort(key=lambda x: -x['score'])  # 스코어 내림차순 정렬
        nms_dist_sq = self._space_length ** 2
        kept = []
        for cand in raw:
            # 이미 채택된 후보들과의 거리 확인
            too_close = any(
                (cand['mx'] - k['mx']) ** 2 + (cand['my'] - k['my']) ** 2 < nms_dist_sq
                for k in kept
            )
            if not too_close:
                kept.append(cand)  # 충분히 멀면 채택

        return kept  # 최종 후보 리스트 (score 내림차순)

    # ── RViz2 마커 생성 ───────────────────────────────────────────────
    def _make_box_marker(self, mid, header, x, y, sx, sy, color):
        """
        RViz2에 표시할 반투명 박스 마커를 생성.
          mid  : 마커 고유 ID (같은 namespace 내 중복 불가)
          sx/sy: 박스 가로/세로 크기 (m)
          color: RGBA (0~1 범위)
        """
        m = Marker()
        m.header  = header
        m.ns      = 'parking_spaces'
        m.id      = mid
        m.type    = Marker.CUBE          # 박스 형태
        m.action  = Marker.ADD
        m.pose.position.x    = x
        m.pose.position.y    = y
        m.pose.position.z    = 0.1       # 맵 평면 위 0.1m 에 표시
        m.pose.orientation.w = 1.0       # 회전 없음
        m.scale.x = sx                   # 가로 크기 = 공간 폭
        m.scale.y = sy                   # 세로 크기 = 공간 깊이
        m.scale.z = 0.05                 # 박스 두께 (시각적으로 납작하게)
        m.color   = color
        m.lifetime.sec = 1               # 1초 후 자동 소멸 (맵 업데이트 멈추면 사라짐)
        return m

    # ── PNG 디버그 이미지 저장 ────────────────────────────────────────
    def _save_map_png(self, free_map, occ_map, rx_cell, ry_cell,
                      candidates, best_idx, resolution, height, width):
        """
        탐지 결과를 시각화한 PNG를 ~/sample_th/map/ 에 저장.
          흰색: 빈 공간  회색: 점유(벽)  검정: 미탐색
          파란 원: 탐색 반경
          빨간 굵은 사각형: ★ BEST 후보
          초록 사각형: 나머지 후보

        map_save_scale(기본 4)배 업스케일 후 저장.
        원본 맵이 1셀=1픽셀이라 0.05m 해상도에서 픽셀이 크게 보이는 문제를
        해소하기 위해 INTER_NEAREST 로 확대. 선·원 두께도 scale에 맞게 조정.
        """
        s = self._map_save_scale  # 업스케일 배율

        # ── 배경 이미지 생성 (원본 셀 해상도) ──────────────────────
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)  # 빈 공간 = 흰색
        vis[occ_map  > 0] = (100, 100, 100)  # 점유   = 회색

        # ── 업스케일 ─────────────────────────────────────────────
        # INTER_NEAREST: 셀 경계를 흐리지 않고 픽셀 단위로 확대
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        # 업스케일 후 모든 좌표·크기에 s 를 곱해서 그림
        def sc(v):
            """셀 좌표 → 스케일된 픽셀 좌표 변환"""
            return int(round(v * s))

        # 탐색 반경 경계선 (파란 원)
        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)  # 선 두께: 배율에 비례
        cv2.circle(vis,
                   (sc(rx_cell), sc(ry_cell)),
                   sc(radius_cells),
                   (255, 0, 0),   # BGR: 파랑
                   line_w)

        # 탐지된 주차 공간 사각형 그리기
        for idx, c in enumerate(candidates):
            r0, c0 = sc(c['r']), sc(c['c'])
            r1 = sc(c['r'] + c['wh'])
            c1 = sc(c['c'] + c['ww'])

            if idx == best_idx:
                # ★ BEST: 빨간색 두꺼운 사각형 + 중심 십자 표시
                rect_w  = max(2, s)
                cross_s = max(6, s * 3)  # 십자 크기도 배율 반영
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 0, 255), rect_w)
                cx = (c0 + c1) // 2
                cy = (r0 + r1) // 2
                cv2.drawMarker(vis, (cx, cy), (0, 0, 255),
                               cv2.MARKER_CROSS, cross_s, max(1, s // 2))
            else:
                # 나머지: 초록 얇은 사각형
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 200, 0),
                              max(1, s // 2))

        # 타임스탬프 파일명으로 저장
        timestamp = time.strftime('%Y%m%d_%H%M%S')
        fname = os.path.join(self._map_dir, f'map_{timestamp}.png')
        cv2.imwrite(fname, vis)
        self.get_logger().info(
            f'Map 저장 → {fname}  ({width*s}×{height*s}px, {s}x scale)'
        )


# ── 진입점 ────────────────────────────────────────────────────────────
def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    try:
        rclpy.spin(node)  # 노드 이벤트 루프 실행 (콜백 대기)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```


개선 버전


```python
#!/usr/bin/env python3
"""
SPAS Parking Space Detector Node  ―  슬라이딩 윈도우 알고리즘
=============================================================

【동작 흐름】
  /map (OccupancyGrid)
    │
    ├─① 맵 이진화
    │    OccupancyGrid 셀 값을 free_map / occ_map 으로 분리
    │
    ├─② 탐색 반경 마스크
    │    TF 로 로봇 위치를 읽어 search_radius 원 안만 탐색
    │
    ├─③ 슬라이딩 윈도우 탐지
    │    space_length × space_width 창을 두 방향(가로/세로)으로 모두 탐색
    │      (a) 창 내부 자유 공간 비율 ≥ min_free_ratio
    │      (b) 창 외곽 4면 벽 검사: 각 면 점유 비율 ≥ wall_occ_ratio 인 면 수 ≥ min_wall_sides
    │    후보마다 뚫린 면 방향(open_yaw) 계산
    │
    ├─④ NMS
    │    동일 공간 중복 후보 제거 (score 기준)
    │
    ├─⑤ 주차 유형 판별 (travel_direction 무관)
    │    탐지 창의 깊이(depth) vs 입구 폭(opening) 비교:
    │      depth > opening  →  직각주차
    │      depth ≤ opening  →  평행주차
    │    여기서 depth = 뚫린 면에 수직인 변의 길이
    │
    ├─⑥ goal_yaw 계산
    │    TF 에서 차체 현재 yaw 읽기
    │    직각주차: 뚫린 면의 법선 방향 (open_yaw) → 차 앞쪽이 입구를 향함
    │    평행주차: 뚫린 면과 평행한 방향 (open_yaw ± π/2)
    │    최종 부호(±)는 플래너가 접근 방향 보고 선택
    │
    └─⑦ 발행 & 저장
         /parking_spaces        (PoseArray)   ← 중심 좌표
         /parking_spaces_info   (String/JSON) ← type, goal_yaw, open_yaw 포함
         /parking_space_markers (MarkerArray) ← RViz2 박스
         ~/sample_th/maps/*.png              ← 디버그 이미지

【주차 유형 판별 상세】
  슬라이딩 윈도우는 항상 가로창(ww=sl, wh=sw) / 세로창(ww=sw, wh=sl) 두 방향 탐색.
  벽 검사 결과에서 점유 비율이 낮은 면 = 뚫린 면(입구).
  뚫린 면에 수직인 변 = depth, 뚫린 면과 평행한 변 = opening.
    depth > opening  →  공간이 진입 방향으로 깊게 파여있음  →  직각주차
    depth ≤ opening  →  공간이 옆으로 넓게 열려있음         →  평행주차

【goal_yaw 상세】
  open_yaw: 뚫린 면의 법선 방향 (맵 좌표계 기준, rad)
    뚫린 면이 top (row 방향 위) → 차가 위쪽으로 진입 → open_yaw = -π/2
    뚫린 면이 bot               → open_yaw = +π/2
    뚫린 면이 lft (col 방향 왼) → open_yaw = π
    뚫린 면이 rgt               → open_yaw = 0.0

  직각주차 goal_yaw = open_yaw
    (차 앞쪽이 입구 방향을 향한 채로 주차 완료)

  평행주차 goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 선택)
    (차가 공간과 나란히 정렬되어 주차 완료)

【파라미터】
  space_length      : 주차 공간 긴 변 (m)
  space_width       : 주차 공간 짧은 변 (m)
  free_threshold    : 이 값 이하 셀 = 빈 공간
  occupied_threshold: 이 값 이상 셀 = 벽/장애물
  search_radius     : 로봇 중심 탐색 반경 (m)
  wall_border       : 창 외곽 벽 검사 띠 두께 (m)
  min_wall_sides    : 벽으로 인정할 최소 면 수 (2~4)
  min_free_ratio    : 창 내부 자유 셀 비율 하한 (0~1)
  wall_occ_ratio    : 벽 판정 점유 비율 하한 (0~1)
  base_frame        : 로봇 TF 프레임
  map_save_scale    : PNG 저장 업스케일 배율
"""

import json
import math
import os
import time

import cv2
import numpy as np
import rclpy
import tf2_ros
from geometry_msgs.msg import Pose, PoseArray, Quaternion
from nav_msgs.msg import OccupancyGrid
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from tf_transformations import euler_from_quaternion
from visualization_msgs.msg import Marker, MarkerArray


class ParkingSpaceDetectorNode(Node):
    def __init__(self):
        super().__init__('parking_space_detector')

        # ── 파라미터 선언 ───────────────────────────────────────────────
        self.declare_parameter('space_length',       0.40)
        self.declare_parameter('space_width',        0.30)
        self.declare_parameter('free_threshold',     30)
        self.declare_parameter('occupied_threshold', 65)
        self.declare_parameter('search_radius',      2.0)
        self.declare_parameter('wall_border',        0.05)
        self.declare_parameter('min_wall_sides',     3)
        self.declare_parameter('min_free_ratio',     0.70)
        self.declare_parameter('wall_occ_ratio',     0.20)
        self.declare_parameter('base_frame',         'base_link')
        self.declare_parameter('map_save_scale',     4)

        self._load_params()

        self._map_dir = os.path.expanduser('~/sample_th/maps')
        os.makedirs(self._map_dir, exist_ok=True)

        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ───────────────────────────────────────────────────
        self._pub_spaces  = self.create_publisher(PoseArray,   '/parking_spaces',        10)
        self._pub_info    = self.create_publisher(String,      '/parking_spaces_info',   10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_space_markers', 10)

        self._sub_map = self.create_subscription(
            OccupancyGrid, '/map', self._map_callback, 10
        )

        self.get_logger().info(
            f'ParkingSpaceDetector 시작. '
            f'space={self._space_length:.2f}x{self._space_width:.2f}m  '
            f'search_radius={self._search_radius:.1f}m'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────
    def _load_params(self):
        self._space_length   = self.get_parameter('space_length').value
        self._space_width    = self.get_parameter('space_width').value
        self._free_threshold = self.get_parameter('free_threshold').value
        self._occ_threshold  = self.get_parameter('occupied_threshold').value
        self._search_radius  = self.get_parameter('search_radius').value
        self._wall_border    = self.get_parameter('wall_border').value
        self._min_wall_sides = self.get_parameter('min_wall_sides').value
        self._min_free_ratio = self.get_parameter('min_free_ratio').value
        self._wall_occ_ratio = self.get_parameter('wall_occ_ratio').value
        self._base_frame     = self.get_parameter('base_frame').value
        self._map_save_scale = max(1, int(self.get_parameter('map_save_scale').value))

    # ── TF: 로봇 위치 + 차체 yaw ──────────────────────────────────────
    def _get_robot_pose(self):
        """
        TF 에서 map → base_frame 변환을 읽어
        로봇 위치 (x, y) 와 차체 yaw (rad) 를 반환.
        TF 실패 시 (0.0, 0.0, 0.0) 폴백.
        """
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.1)
            )
            t = tf.transform.translation
            q = tf.transform.rotation
            _, _, yaw = euler_from_quaternion([q.x, q.y, q.z, q.w])
            return t.x, t.y, yaw
        except tf2_ros.TransformException:
            self.get_logger().warn(
                f'TF map→{self._base_frame} 없음; 원점(0,0) yaw=0 사용',
                throttle_duration_sec=5.0
            )
            return 0.0, 0.0, 0.0

    # ── 주차 유형 판별 ────────────────────────────────────────────────
    def _classify_parking_type(self, open_face: str, pw: float, ph: float) -> str:
        """
        뚫린 면(open_face)을 기준으로 depth / opening 을 결정한 뒤
        주차 유형을 판별한다.

        open_face 가 'top' 또는 'bot' (행 방향으로 뚫림):
          depth   = ph  (세로 변, 뚫린 면에 수직)
          opening = pw  (가로 변, 뚫린 면에 평행)

        open_face 가 'lft' 또는 'rgt' (열 방향으로 뚫림):
          depth   = pw  (가로 변, 뚫린 면에 수직)
          opening = ph  (세로 변, 뚫린 면에 평행)

        depth > opening  →  직각주차  (그림의 오른쪽 케이스)
        depth ≤ opening  →  평행주차  (그림의 왼쪽 케이스)
        """
        if open_face in ('top', 'bot'):
            depth, opening = ph, pw
        else:  # 'lft', 'rgt'
            depth, opening = pw, ph

        return '직각주차' if depth > opening else '평행주차'

    # ── 뚫린 면의 법선 방향 계산 ─────────────────────────────────────
    def _open_face_yaw(self, open_face: str) -> float:
        """
        뚫린 면의 법선이 맵 좌표계에서 향하는 방향각 (rad) 반환.
        차가 이 방향을 정면으로 향한 채 진입하면 공간 안으로 들어간다.

          top  → 공간 위쪽이 열림 → 차는 위(-Y) 방향으로 들어감 → -π/2
          bot  → 공간 아래쪽이 열림 → 차는 아래(+Y) 방향        → +π/2
          lft  → 공간 왼쪽이 열림  → 차는 왼쪽(-X) 방향         → π
          rgt  → 공간 오른쪽이 열림 → 차는 오른쪽(+X) 방향      → 0.0
        """
        return {
            'top': -math.pi / 2.0,
            'bot':  math.pi / 2.0,
            'lft':  math.pi,
            'rgt':  0.0,
        }[open_face]

    # ── goal_yaw 계산 ─────────────────────────────────────────────────
    def _compute_goal_yaw(self, parking_type: str, open_yaw: float) -> float:
        """
        주차 완료 시 차체가 향할 방향각 (기준각, rad).

        직각주차:
          차 앞쪽이 입구(open_yaw)를 향한 채 주차 완료.
          goal_yaw = open_yaw

        평행주차:
          차가 공간과 나란히 정렬된 채 주차 완료.
          goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 접근 방향 보고 선택)

        반환값은 기준각이며 플래너가 실제 접근 방향을 보고
        goal_yaw vs goal_yaw + π 중 가까운 쪽을 선택한다.
        """
        if parking_type == '직각주차':
            return open_yaw
        else:  # 평행주차
            return open_yaw + math.pi / 2.0

    # ── 메인 콜백 ─────────────────────────────────────────────────────
    def _map_callback(self, msg: OccupancyGrid):
        self.get_logger().info('Map received — sliding-window detection 시작.')

        resolution = msg.info.resolution
        origin     = msg.info.origin
        width      = msg.info.width
        height     = msg.info.height

        grid     = np.array(msg.data, dtype=np.int8).reshape((height, width))
        free_map = ((grid >= 0) & (grid <= self._free_threshold)).astype(np.float32)
        occ_map  = (grid >= self._occ_threshold).astype(np.float32)

        robot_x, robot_y, robot_yaw = self._get_robot_pose()
        rx_cell = (robot_x - origin.position.x) / resolution
        ry_cell = (robot_y - origin.position.y) / resolution

        candidates = self._sliding_window_detect(
            free_map, occ_map, rx_cell, ry_cell, origin, resolution, height, width
        )

        self.get_logger().info(f'탐지된 주차 공간 수: {len(candidates)}')

        pose_array = PoseArray()
        pose_array.header.stamp    = self.get_clock().now().to_msg()
        pose_array.header.frame_id = 'map'
        marker_array = MarkerArray()
        info_list    = []

        best_idx = 0
        for i, c in enumerate(candidates):
            # ── Pose ──────────────────────────────────────────────────
            pose = Pose()
            pose.position.x  = c['mx']
            pose.position.y  = c['my']
            pose.position.z  = 0.0
            pose.orientation = Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)
            pose_array.poses.append(pose)

            # ── 주차 유형 판별 & goal_yaw 계산 ──────────────────────
            open_face    = c['open_face']
            open_yaw     = self._open_face_yaw(open_face)
            parking_type = self._classify_parking_type(open_face, c['pw'], c['ph'])
            goal_yaw     = self._compute_goal_yaw(parking_type, open_yaw)

            info_list.append({
                'index':      i,
                'is_best':    (i == best_idx),
                'mx':         round(c['mx'],   4),
                'my':         round(c['my'],   4),
                'pw':         round(c['pw'],   4),
                'ph':         round(c['ph'],   4),
                'type':       parking_type,
                'open_face':  open_face,
                'open_yaw':   round(open_yaw,  6),
                'goal_yaw':   round(goal_yaw,  6),
                'score':      round(c['score'], 4),
                'walls':      c['walls'],
            })

            # ── 마커 색상 ───────────────────────────────────────────
            is_best = (i == best_idx)
            if is_best:
                color = ColorRGBA(r=1.0, g=0.0, b=0.0, a=0.85)
            elif parking_type == '평행주차':
                color = ColorRGBA(r=0.0, g=0.8, b=0.0, a=0.30)
            else:
                color = ColorRGBA(r=0.0, g=0.0, b=0.8, a=0.30)

            marker_array.markers.append(
                self._make_box_marker(
                    i, pose_array.header,
                    c['mx'], c['my'], c['pw'], c['ph'],
                    color, parking_type
                )
            )

            best_tag = ' ★ BEST' if is_best else ''
            self.get_logger().info(
                f'Space #{i} [{parking_type}]{best_tag} '
                f'at ({c["mx"]:.3f}, {c["my"]:.3f}) m  '
                f'open={open_face}  open_yaw={open_yaw:.3f}rad  '
                f'goal_yaw={goal_yaw:.3f}rad  score={c["score"]:.3f}'
            )

        self._pub_spaces.publish(pose_array)

        info_msg      = String()
        info_msg.data = json.dumps(info_list, ensure_ascii=False)
        self._pub_info.publish(info_msg)

        self._pub_markers.publish(marker_array)
        self._save_map_png(free_map, occ_map, rx_cell, ry_cell,
                           candidates, best_idx, resolution, height, width)

    # ── 슬라이딩 윈도우 탐지 ──────────────────────────────────────────
    def _sliding_window_detect(self, free_map, occ_map,
                                rx_cell, ry_cell,
                                origin, resolution, height, width):
        sl = max(1, int(round(self._space_length / resolution)))
        sw = max(1, int(round(self._space_width  / resolution)))
        b  = max(1, int(round(self._wall_border  / resolution)))

        radius_cells = self._search_radius / resolution

        r_lo = max(0,      int(ry_cell - radius_cells) - b)
        r_hi = min(height, int(ry_cell + radius_cells) + b + 1)
        c_lo = max(0,      int(rx_cell - radius_cells) - b)
        c_hi = min(width,  int(rx_cell + radius_cells) + b + 1)

        fi = cv2.integral(free_map)
        oi = cv2.integral(occ_map)

        def box_sum(intg, r1, c1, r2, c2):
            r1, c1 = max(0, r1), max(0, c1)
            r2, c2 = min(height, r2), min(width, c2)
            if r2 <= r1 or c2 <= c1:
                return 0.0
            return float(intg[r2, c2] - intg[r1, c2]
                         - intg[r2, c1] + intg[r1, c1])

        raw = []

        # 두 방향 모두 탐색 (travel_direction 무관)
        orientations = [(sw, sl), (sl, sw)] if sl != sw else [(sw, sl)]

        for wh, ww in orientations:
            for r in range(r_lo, min(r_hi, height - wh + 1)):
                for c in range(c_lo, min(c_hi, width - ww + 1)):

                    dr = (r + wh / 2.0) - ry_cell
                    dc = (c + ww / 2.0) - rx_cell
                    if dr * dr + dc * dc > radius_cells ** 2:
                        continue

                    area = float(wh * ww)
                    interior_free = box_sum(fi, r, c, r + wh, c + ww)
                    free_ratio = interior_free / area
                    if free_ratio < self._min_free_ratio:
                        continue

                    top_area = float(b * ww)
                    lr_area  = float(wh * b)

                    top_occ = box_sum(oi, r - b,     c,      r,          c + ww)
                    bot_occ = box_sum(oi, r + wh,    c,      r + wh + b, c + ww)
                    lft_occ = box_sum(oi, r,         c - b,  r + wh,     c     )
                    rgt_occ = box_sum(oi, r,         c + ww, r + wh,     c + ww + b)

                    top_hit = top_area > 0 and top_occ / top_area >= self._wall_occ_ratio
                    bot_hit = top_area > 0 and bot_occ / top_area >= self._wall_occ_ratio
                    lft_hit = lr_area  > 0 and lft_occ / lr_area  >= self._wall_occ_ratio
                    rgt_hit = lr_area  > 0 and rgt_occ / lr_area  >= self._wall_occ_ratio

                    walls = sum([top_hit, bot_hit, lft_hit, rgt_hit])
                    if walls < self._min_wall_sides:
                        continue

                    # ── 뚫린 면 결정 ──────────────────────────────
                    # 벽이 없는(점유 비율이 낮은) 면 = 입구
                    # 여러 면이 뚫려있으면 점유 비율이 가장 낮은 면을 입구로 선택
                    face_occ = {
                        'top': top_occ / top_area if top_area > 0 else 1.0,
                        'bot': bot_occ / top_area if top_area > 0 else 1.0,
                        'lft': lft_occ / lr_area  if lr_area  > 0 else 1.0,
                        'rgt': rgt_occ / lr_area  if lr_area  > 0 else 1.0,
                    }
                    open_face = min(face_occ, key=face_occ.get)

                    score = free_ratio + 0.05 * walls

                    cx_cell = c + ww / 2.0
                    cy_cell = r + wh / 2.0
                    mx = origin.position.x + (cx_cell + 0.5) * resolution
                    my = origin.position.y + (cy_cell + 0.5) * resolution

                    raw.append({
                        'mx': mx, 'my': my,
                        'pw': ww * resolution,
                        'ph': wh * resolution,
                        'score': score,
                        'walls': walls,
                        'open_face': open_face,
                        'r': r, 'c': c, 'wh': wh, 'ww': ww,
                    })

        self.get_logger().info(f'윈도우 후보 수 (NMS 전): {len(raw)}')

        raw.sort(key=lambda x: -x['score'])
        nms_dist_sq = self._space_length ** 2
        kept = []
        for cand in raw:
            too_close = any(
                (cand['mx'] - k['mx']) ** 2 + (cand['my'] - k['my']) ** 2 < nms_dist_sq
                for k in kept
            )
            if not too_close:
                kept.append(cand)

        return kept

    # ── RViz2 마커 생성 ───────────────────────────────────────────────
    def _make_box_marker(self, mid, header, x, y, sx, sy, color, parking_type=''):
        m = Marker()
        m.header  = header
        m.ns      = 'parking_spaces'
        m.id      = mid
        m.type    = Marker.CUBE
        m.action  = Marker.ADD
        m.pose.position.x    = x
        m.pose.position.y    = y
        m.pose.position.z    = 0.1
        m.pose.orientation.w = 1.0
        m.scale.x = sx
        m.scale.y = sy
        m.scale.z = 0.05
        m.color   = color
        m.text    = parking_type
        m.lifetime.sec = 1
        return m

    # ── PNG 디버그 이미지 저장 ────────────────────────────────────────
    def _save_map_png(self, free_map, occ_map, rx_cell, ry_cell,
                      candidates, best_idx, resolution, height, width):
        s = self._map_save_scale
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)
        vis[occ_map  > 0] = (100, 100, 100)
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        def sc(v):
            return int(round(v * s))

        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)
        cv2.circle(vis, (sc(rx_cell), sc(ry_cell)), sc(radius_cells),
                   (255, 0, 0), line_w)

        for idx, c in enumerate(candidates):
            r0, c0 = sc(c['r']), sc(c['c'])
            r1 = sc(c['r'] + c['wh'])
            c1 = sc(c['c'] + c['ww'])
            if idx == best_idx:
                rect_w  = max(2, s)
                cross_s = max(6, s * 3)
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 0, 255), rect_w)
                cx = (c0 + c1) // 2
                cy = (r0 + r1) // 2
                cv2.drawMarker(vis, (cx, cy), (0, 0, 255),
                               cv2.MARKER_CROSS, cross_s, max(1, s // 2))
            else:
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 200, 0),
                              max(1, s // 2))

        timestamp = time.strftime('%Y%m%d_%H%M%S')
        fname = os.path.join(self._map_dir, f'map_{timestamp}.png')
        cv2.imwrite(fname, vis)
        self.get_logger().info(f'Map 저장 → {fname}  ({width*s}×{height*s}px)')


def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


## 생성된 맵

map_20260509_191114


![map_20260509_191114.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b0e76840-b04d-4731-a75c-87ea5ef8b03e/map_20260509_191114.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=b90f064a31fc3a1e9f23dd7903b12b1bfe0261310c6818a81f513897b49c729a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_195645


![map_20260509_195645.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/30000d67-3077-4bc2-8e0c-c5493b494232/map_20260509_195645.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=9723eb5f1f6d01f3fc1d828d0d5aaeeb96c5098788517ae5d664bfb2a34ef345&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_201359


![map_20260509_201359.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b6d94c48-d14c-440b-abe7-653d302a49e3/map_20260509_201359.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=c64978c3293ca27b73b798033e1ee64d2b20f6789fff0fae7b5972a7fc6a3c2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_204728


![map_20260509_204728.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a058f1c9-ab20-4e02-87ed-822569c7a541/map_20260509_204728.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=0ba458bb231011d3021a528845814b776ad0260eafae9e57d65e3e16ddfee3a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_210716


![map_20260509_210716.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e66e48e9-5ab9-43ba-98fd-aec36dbcb0ea/map_20260509_210716.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=46d49c49edfe74c69b24872f1f4f3937c21e42573afce2182ccc884deaec78e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_211122


![map_20260509_211122.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d25896c5-f71e-4d5d-8515-1a7b5038298b/map_20260509_211122.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=a60f7f3e138e84fdecfd19dac66f4f9081dd1d1dee58e3c91fc29f6ef516c325&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_214458


![map_20260509_214458.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d97d322a-3524-4fcd-b7d6-9bc9f5df399e/map_20260509_214458.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=54f5db2588381309daca43f58c100867a1d8966a2d4d6a013359d633762a5ed4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_223044


![map_20260509_223044.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6a882f89-115b-4275-9473-e1f73f80d673/map_20260509_223044.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=5cd39252f2ce9ce6598c850edc5b80ebb3785efbbab7eba4ce70d78c41d3ed8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_230442


![map_20260509_230442.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d642d5ac-2d94-4f62-9f28-84ac273a4f18/map_20260509_230442.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=89dafa218bb3731377f87b49bc9d21f928e0a43ab5a009380c8f2643e2e078e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_231912


![map_20260509_231912.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/54c1d2fb-906e-40fe-9b23-2280cc8d3b58/map_20260509_231912.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=d224dd7515d3731d818bf9b8fd1f76f2a29f9ef47847053b463775c97be301b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232116


![map_20260509_232116.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e90594c3-771d-4371-b5de-646084bb88c5/map_20260509_232116.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=b4e25da9c6913016a32b574c6524b2d45ceb1f1aeada6fac88a8e3238fbadffc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260509_232527


![map_20260509_232527.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8d2af31-fda8-4016-9fe2-94c839c8ec36/map_20260509_232527.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=0c79cfcb7a94ff9628448e150af5a47834ff9d71f3cd4063a1e3d0764986b48d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


map_20260510_152510


![map_20260510_152510.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/8901a9bb-1b81-4a91-ad67-5c5eb2e9125a/map_20260510_152510.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662XBYB6KA%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222208Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCy0daCPtyci5qOvWMPL%2FTpsLyHsTfFxlp%2B220v0uMLqgIhAMqFTsMQ4jvemHrunFANTJVEkQ9t4SBnYkhj745%2FkA3uKogECM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1Igy2nPCiXabD%2BE1lsOsq3AMvW4ctRC52Hl7%2BZnqEi%2FMsgeiQDQyJTQl%2F%2Fuf7NJrgiB74CxNwmdX%2BTugfhpUDpHQEtRJvYu1XB8jSA082j3M5ApAZNw1y1fXmOkiD4Ln4o3lCv7O6N8FM7TT0Xl%2BInqsFgHEbt4pJmD5elFLstH%2Fa%2F2XApkjQv42HwRgOT1cYGNSeJM5UEw3X07CI12Hx7yiBce2%2Bifa7WEZOzV8Pi5QCaqsWJFyRZYQ7LHnMTQ25e54JbOFsnGQLbzLKJH28pweu0TQ52r0a%2F8vnwiDlfEpJtWa4%2BoEeqyM9HN0%2BllOtwA2pCqosBC1BPEZRqhVZv5yIMOywd1vuJwlWniW394l%2BExb0LctTt%2FN6I2J1laAx644Q3tPGUmnzX5ya%2FMAOGbhDjywjEsc%2FIVor9sNZRggAZ8IkIuKLgm4fKAjy2sW%2FxDbR740Ngy224pqXwNQY7MHeYWx86CxN1%2FE0eGYwtNurXtBRk7HphsbN1nZLop63E%2BjkIY%2F%2BtjxsV0BoCd0kl2agXG80bAVfPU1YOXMjssple9z%2B1mFMzRvu9Brbnn46Hw1ahHDc%2B7hQRXK%2BshNo3rPc12y9V6c46B4KNmm2jqUCxHoOWpPNp4C3s5lPjyLvXV62O3AD%2B7t5QZdCaDDt55DSBjqkAWpWoGY0ctO1ZdJk5dCvRlcCTPluIAVY7HMnLjneB%2FcNzQKrnsL7a4iEx5f4wQoE4NXXc7vrh6CysL9cOp7AKEPNLr4jm%2FrM6ZFVDGGbuFlgMFuegf1SvC%2FN%2FfgLYvc5pCk3tsn7XqZiJ5U3oR8gTqtK6TACm2MnszxBw4p058juxTf3T6iNbT5b9wY006hIfARMAklwekQtHTTomNtiqAzHNJP7&X-Amz-Signature=413ce1750277bc55de1447517e81e65ee9110916d0af57cb7f2210069064548a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


---


# 다른 테스트 버전


```bash
source /opt/ros/humble/setup.bash
ros2 launch sllidar_ros2 sllidar_a1_launch.py
```


```bash
source /opt/ros/humble/setup.bash
ros2 run tf2_ros static_transform_publisher 0 0 0.1 0 0 0 base_link laser
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch rf2o_laser_odometry rf2o_laser_odometry.launch.py \
    laser_scan_topic:=/scan \
    odom_topic:=/odom \
    publish_tf:=true \
    base_frame_id:=base_link \
    odom_frame_id:=odom
```


```bash
source /opt/ros/humble/setup.bash
ros2 launch slam_toolbox online_async_launch.py \
    slam_params_file:=$HOME/spas_slam_params.yaml \
    use_sim_time:=false
```


## 주차 경로 생성 코드(Hybrid A*)

```python
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node  (v3 — Nav2 핵심 기능 추가)
=======================================================================

【v3 추가 사항】 (v2 버그 수정 위에 추가)

  1. Analytic Expansion  (Nav2: analytic_expansion_ratio)
       탐색 도중 일정 주기마다 현재 노드 → 목표까지
       Reeds-Shepp 경로가 충돌 없이 연결되면 즉시 탐색 종료.
       직각주차 탐색 속도 약 10배 향상.
       의존 패키지: pip install rsplan
       미설치 시 자동으로 비활성화되어 v2 동작과 동일.

  2. 이중 휴리스틱  (Nav2: cache_obstacle_heuristic)
       기존: max(euclidean, r_min × |Δyaw|)
       추가: Dijkstra 로 목표→전체 셀 실제 이동비용 사전 계산
       조합: max(기존, obstacle_heuristic[iy, ix])
       장애물 환경에서 탐색 방향을 더 효율적으로 유도.

  3. Motion primitive 자동 계산  (Nav2: motion primitive sizing)
       auto_step_size=True 시 step = max(res, r_min × yaw_res) 자동 결정.
       기본값 False → step_size 파라미터 직접 지정 방식 유지.

【v2 버그 수정 사항】
  1. goal_yaw 결정 오류 수정 (markers[0] 가정 제거)
  2. _extract_path 체인 끊김 버그 수정
  3. _key() 해시 충돌 수정
  4. 후륜 차축 오프셋 적용
  5. 목표 충돌 사전 검사 추가

【Nav2 연동】
  use_nav2=False (기본): 자체 구현 Hybrid A* (v3 기능 포함)
  use_nav2=True        : Nav2 ComputePathToPose Action 호출

【구독 토픽】
  /parking_spaces        (PoseArray)
  /parking_spaces_info   (String/JSON)  goal_yaw·type 포함
  /parking_space_markers (MarkerArray)
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)
"""

import json
import math
import heapq
import sys
import threading
import time
from enum import Enum
from typing import Dict, List, Optional, Tuple

import numpy as np
import rclpy
import rclpy.action
import tf2_ros
from geometry_msgs.msg import Point, PoseArray, PoseStamped
from nav_msgs.msg import OccupancyGrid, Path
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from visualization_msgs.msg import Marker, MarkerArray

# Nav2 Action (use_nav2=True 일 때만 실제 사용)
try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False

# Reeds-Shepp (Analytic Expansion 용)
# pip install rsplan
try:
    from rsplan import path as _rs_path
    _RSPLAN_AVAILABLE = True
except ImportError:
    _RSPLAN_AVAILABLE = False


# ─────────────────────────────────────────────────────────────────────────────
# 상태 머신
# ─────────────────────────────────────────────────────────────────────────────

class State(Enum):
    SEARCHING = 1
    WAITING   = 2
    PARKING   = 3


# ─────────────────────────────────────────────────────────────────────────────
# 차량 파라미터
# ─────────────────────────────────────────────────────────────────────────────

class VehicleConfig:
    def __init__(self, wheelbase=0.25, max_steer_deg=35.0,
                 length=0.35, width=0.22,
                 front_overhang=0.05, rear_overhang=0.05):
        self.wheelbase      = wheelbase
        self.max_steer      = math.radians(max_steer_deg)
        self.length         = length
        self.width          = width
        self.front_overhang = front_overhang
        self.rear_overhang  = rear_overhang
        self.lf = wheelbase + front_overhang   # 후축 → 차량 전면
        self.lb = rear_overhang                # 후축 → 차량 후면


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 탐색 노드
# ─────────────────────────────────────────────────────────────────────────────

class HANode:
    __slots__ = ('x', 'y', 'yaw', 'ix', 'iy', 'iyaw',
                 'g', 'h', 'steer', 'direction', 'parent_key')

    def __init__(self, x, y, yaw, ix, iy, iyaw,
                 g, h, steer, direction, parent_key=None):
        self.x,  self.y,  self.yaw  = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw
        self.g, self.h = g, h
        self.steer     = steer
        self.direction = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Obstacle Heuristic 사전 계산 (Nav2: cache_obstacle_heuristic)
# ─────────────────────────────────────────────────────────────────────────────

def _build_obstacle_heuristic(
    goal_ix: int, goal_iy: int,
    grid: np.ndarray,
    res: float,
    occ_thresh: int = 50,
) -> np.ndarray:
    """
    목표 셀에서 역방향 Dijkstra 로 전체 맵의 실제 이동 비용(m) 사전 계산.

    Nav2 SmacPlannerHybrid 의 cache_obstacle_heuristic 에 해당.
    장애물 우회 비용이 반영되므로 유클리드 거리보다 정확한 휴리스틱 하한값.
    plan() 호출당 1회만 수행.
    """
    H, W = grid.shape
    dist = np.full((H, W), np.inf, dtype=np.float32)
    dist[goal_iy, goal_ix] = 0.0

    heap = [(0.0, goal_ix, goal_iy)]

    DIRS  = [(1,0),(0,1),(-1,0),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]
    COSTS = [1.0,  1.0,  1.0,  1.0,   1.414, 1.414, 1.414, 1.414]

    while heap:
        d, cx, cy = heapq.heappop(heap)
        if d > dist[cy, cx]:
            continue
        for (dx, dy), c in zip(DIRS, COSTS):
            nx, ny = cx + dx, cy + dy
            if not (0 <= nx < W and 0 <= ny < H):
                continue
            if int(grid[ny, nx]) >= occ_thresh:
                continue
            nd = d + c * res
            if nd < dist[ny, nx]:
                dist[ny, nx] = nd
                heapq.heappush(heap, (nd, nx, ny))

    return dist  # shape (H, W), 단위 [m]


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float       = 0.06,
        n_steer: int           = 7,
        yaw_resolution: float  = math.radians(5.0),
        goal_xy_tol: float     = 0.08,
        goal_yaw_tol: float    = math.radians(10.0),
        reverse_cost: float    = 1.5,
        dir_change_cost: float = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int     = 50,
        max_iter: int          = 80000,
        # ── ★ 추가: Nav2 대응 기능 3가지 ────────────────────────────
        analytic_expansion_ratio: int  = 3,    # 매 N×n_steer×2 iter 마다 RS expansion 시도
        use_obstacle_heuristic: bool   = True, # 이중 휴리스틱 ON/OFF
        auto_step_size: bool           = False, # True 시 step = max(res, r_min×yaw_res) 자동 계산
    ):
        self.vc               = vehicle_cfg
        self.step             = step_size
        self.n_steer          = n_steer
        self.yaw_res          = yaw_resolution
        self.goal_xy_tol      = goal_xy_tol
        self.goal_yaw_tol     = goal_yaw_tol
        self.reverse_cost     = reverse_cost
        self.dir_change_cost  = dir_change_cost
        self.steer_chg_cost   = steer_change_cost
        self.occ_thresh       = occ_threshold
        self.max_iter         = max_iter

        # ── ★ 추가 속성 ─────────────────────────────────────────────
        self._step_override          = step_size
        self._auto_step_size         = auto_step_size
        self._analytic_ratio         = analytic_expansion_ratio
        self._use_obstacle_heuristic = use_obstacle_heuristic
        self._obs_heuristic: Optional[np.ndarray] = None  # plan() 시 사전 계산

        self.steers = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
        self._yaw_bins = max(1, int(round(2 * math.pi / self.yaw_res)))

    def plan(
        self,
        start_x, start_y, start_yaw,
        goal_x,  goal_y,  goal_yaw,
        occ_grid: np.ndarray,
        origin_x: float, origin_y: float,
        resolution: float,
    ) -> Optional[List[Tuple[float, float, float]]]:

        self._occ    = occ_grid
        self._ox     = origin_x
        self._oy     = origin_y
        self._res    = resolution
        self._height, self._width = occ_grid.shape

        # ── ★ 추가 3: Motion primitive 자동 계산 ─────────────────────
        if self._auto_step_size:
            r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
            self.step = max(resolution, r_min * self.yaw_res)
        else:
            self.step = self._step_override

        # ── ★ 추가 2: Obstacle heuristic 사전 계산 ───────────────────
        self._r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        if self._use_obstacle_heuristic:
            gix = max(0, min(self._width  - 1, int(round((goal_x - origin_x) / resolution))))
            giy = max(0, min(self._height - 1, int(round((goal_y - origin_y) / resolution))))
            self._obs_heuristic = _build_obstacle_heuristic(
                gix, giy, occ_grid, resolution, self.occ_thresh
            )
        else:
            self._obs_heuristic = None

        # ── ★ Analytic Expansion 주기 ─────────────────────────────────
        ae_interval = max(1, self._analytic_ratio * self.n_steer * 2)

        s = self._make_node(start_x, start_y, start_yaw, g=0.0,
                            steer=0.0, direction=1, parent_key=None)
        s.h = self._heuristic(s.x, s.y, s.yaw, goal_x, goal_y, goal_yaw)

        open_heap: List[Tuple[float, HANode]] = []
        heapq.heappush(open_heap, (s.f, s))
        open_dict:   Dict[int, HANode] = {self._key(s): s}
        closed_dict: Dict[int, HANode] = {}

        iterations = 0
        t0 = time.monotonic()

        while open_heap:
            iterations += 1
            if iterations > self.max_iter:
                if closed_dict:
                    best_node = min(
                        closed_dict.values(),
                        key=lambda n: math.hypot(n.x - goal_x, n.y - goal_y)
                    )
                    print(
                        f'[DBG] max_iter({self.max_iter}) 소진. '
                        f'최근접=({best_node.x:.3f},{best_node.y:.3f}) '
                        f'목표까지={math.hypot(best_node.x-goal_x, best_node.y-goal_y):.3f}m',
                        file=sys.stderr, flush=True
                    )
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)
            if ckey in closed_dict:
                continue
            closed_dict[ckey] = cur

            if iterations % 10000 == 0:
                print(
                    f'[DBG] iter={iterations} closed={len(closed_dict)} '
                    f'cur=({cur.x:.3f},{cur.y:.3f},{math.degrees(cur.yaw):.1f}°) '
                    f'경과={time.monotonic()-t0:.1f}s',
                    file=sys.stderr, flush=True
                )

            # ── ★ 추가 1: Analytic Expansion ─────────────────────────
            if _RSPLAN_AVAILABLE and iterations % ae_interval == 0:
                rs_result = self._try_analytic_expansion(
                    cur.x, cur.y, cur.yaw,
                    goal_x, goal_y, goal_yaw,
                )
                if rs_result is not None:
                    search_path = self._extract_path(cur, closed_dict, open_dict)
                    if search_path is not None:
                        return search_path + rs_result[1:]
                    return rs_result

            if self._reached_goal(cur.x, cur.y, cur.yaw, goal_x, goal_y, goal_yaw):
                path = self._extract_path(cur, closed_dict, open_dict)
                return path  # None 이면 체인 끊김 → 탐색 실패로 처리

            for succ in self._expand(cur, goal_x, goal_y, goal_yaw):
                skey = self._key(succ)
                if skey in closed_dict:
                    continue
                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _try_analytic_expansion(
        self,
        sx: float, sy: float, syaw: float,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        ★ Analytic Expansion (Nav2: analytic_expansion_ratio)

        현재 노드 → 목표까지 Reeds-Shepp 경로를 계산하고,
        충돌이 없으면 경로를 반환해 탐색을 즉시 종료.
        rsplan 패키지 미설치 시 자동으로 비활성화됨.
        """
        try:
            p = _rs_path(
                (sx, sy, syaw),
                (gx, gy, gyaw),
                turn_radius=self._r_min,
                runway_length=0,
                step_size=self.step,
            )
        except Exception:
            return None

        waypoints = list(p.waypoints())
        if not waypoints:
            return None

        for wp in waypoints:
            if self._in_collision(wp.x, wp.y, wp.yaw):
                return None

        return [(wp.x, wp.y, wp.yaw) for wp in waypoints]

    def _expand(self, node, gx, gy, gyaw):
        children = []
        for direction in (1, -1):
            for steer in self.steers:
                nx, ny, nyaw = self._bicycle_step(
                    node.x, node.y, node.yaw, steer, direction
                )
                if not self._in_bounds(nx, ny):
                    continue
                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step
                if direction == -1:
                    cost *= self.reverse_cost
                if direction != node.direction:
                    cost += self.dir_change_cost * self.step
                steer_diff = abs(steer - node.steer)
                cost += steer_diff * self.steer_chg_cost

                new_g = node.g + cost
                child = self._make_node(nx, ny, nyaw, g=new_g,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx   = x + d * math.cos(mid_yaw)
        ny   = y + d * math.sin(mid_yaw)
        nyaw = self._norm_angle(yaw + delta_yaw)
        return nx, ny, nyaw

    def _in_collision(self, x, y, yaw):
        """
        차량 직사각형 풋프린트 샘플링 충돌 검사.
        전후 방향 n_samples 점 × 좌우 5열 (폭 방향 커버리지 향상).
        """
        cos_t = math.cos(yaw)
        sin_t = math.sin(yaw)
        hw    = self.vc.width / 2.0
        n_lon = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        # 폭 방향 샘플: 이전 3점 → 5점으로 확대 (얇은 벽 탐지 강화)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                px = cx - w * sin_t
                py = cy + w * cos_t
                if self._cell_occupied(px, py):
                    return True
        return False

    def _cell_occupied(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True
        val = int(self._occ[iy, ix])
        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):
        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm_angle(yaw - gyaw))
        return dist <= self.goal_xy_tol and dyaw <= self.goal_yaw_tol

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):
        """
        ★ 이중 휴리스틱 (Nav2: cache_obstacle_heuristic)

        h1 = max(euclidean, r_min × |Δyaw|)   ← 기존 kinematic 하한
        h2 = obstacle_heuristic[iy, ix]         ← ★ 장애물 반영 실제 비용
        h  = max(h1, h2)                         ← 둘 중 더 큰 하한 선택
        """
        dist  = math.hypot(x - gx, y - gy)
        dyaw  = abs(self._norm_angle(yaw - gyaw))
        r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        h1    = max(dist, r_min * dyaw)

        if self._obs_heuristic is not None:
            ix = max(0, min(self._width  - 1, int(round((x - self._ox) / self._res))))
            iy = max(0, min(self._height - 1, int(round((y - self._oy) / self._res))))
            h2 = float(self._obs_heuristic[iy, ix])
        else:
            h2 = 0.0

        return max(h1, h2)

    # ── [★ 수정] _extract_path: 체인 끊기면 None 반환 ────────────────
    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        목표 노드 → 시작 노드 역추적.

        [버그 수정]
        이전: 체인 끊겨도 start 좌표를 강제 append → 불연속 경로 반환
        수정: 체인이 끊기면 (parent_key 가 어디에도 없으면) None 반환.
              parent_key=None 인 노드(시작 노드)를 만날 때만 정상 종료.
        """
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                # 시작 노드에 도달 → 정상 종료
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        # 체인 끊김: 복구 불가 → None
        print('[ERR] _extract_path: 경로 체인 끊김', file=sys.stderr, flush=True)
        return None

    def _make_node(self, x, y, yaw, g, steer, direction, parent_key):
        ix   = int(round((x - self._ox) / self._res))
        iy   = int(round((y - self._oy) / self._res))
        raw  = int(round(self._norm_angle(yaw) / self.yaw_res))
        iyaw = raw % self._yaw_bins
        return HANode(x, y, yaw, ix, iy, iyaw,
                      g=g, h=0.0,
                      steer=steer, direction=direction,
                      parent_key=parent_key)

    # ── [★ 수정] _key: Python 내장 hash 로 충돌 제거 ─────────────────
    def _key(self, node: HANode) -> int:
        """
        (ix, iy, iyaw) 3-튜플을 Python 내장 hash 로 인코딩.

        [버그 수정]
        이전: iyaw + yaw_bins*(ix + 100000*iy)
              → ix > 100000 (맵 5km 이상) 이면 충돌 발생
        수정: hash((ix, iy, iyaw)) — Python tuple hash 는 충돌이 사실상 없고
              음수가 나올 수 있으므로 dict key 로 직접 사용 (음수 OK).
        """
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a


# ─────────────────────────────────────────────────────────────────────────────
# ROS 2 노드
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarNode(Node):
    """
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2 로 경로를 계획·발행.

    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출 (권장)
    use_nav2=False → 자체 구현 Hybrid A* 실행 (Nav2 없이 동작)
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        # ── 파라미터 선언 ─────────────────────────────────────────────
        self.declare_parameter('wheelbase',           0.25)
        self.declare_parameter('max_steer_deg',       35.0)
        self.declare_parameter('vehicle_length',      0.35)
        self.declare_parameter('vehicle_width',       0.22)
        self.declare_parameter('front_overhang',      0.05)
        self.declare_parameter('rear_overhang',       0.05)
        self.declare_parameter('step_size',           0.06)
        self.declare_parameter('n_steer',             7)
        self.declare_parameter('yaw_resolution_deg',  5.0)
        self.declare_parameter('goal_xy_tol',         0.08)
        self.declare_parameter('goal_yaw_tol_deg',    10.0)
        self.declare_parameter('reverse_cost',        1.5)
        self.declare_parameter('dir_change_cost',     3.0)
        self.declare_parameter('steer_change_cost',   0.5)
        self.declare_parameter('occ_threshold',       50)
        self.declare_parameter('max_iter',            80000)
        self.declare_parameter('base_frame',          'base_link')
        # ── ★ 추가: Nav2 대응 파라미터 ──────────────────────────────
        self.declare_parameter('analytic_expansion_ratio', 3)
        self.declare_parameter('use_obstacle_heuristic',   True)
        self.declare_parameter('auto_step_size',           False)
        # Nav2 연동 파라미터
        self.declare_parameter('use_nav2',            False)
        self.declare_parameter('nav2_planner_id',     'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',    30.0)

        self._load_params()

        # ── 상태 머신 ─────────────────────────────────────────────────
        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        # ── 최신 데이터 저장 ─────────────────────────────────────────
        self._latest_map:     Optional[OccupancyGrid] = None
        self._latest_spaces:  Optional[PoseArray]     = None
        self._latest_info:    Optional[List[dict]]    = None  # ★ JSON info
        self._target_info:    Optional[dict]          = None  # BEST 후보 스냅샷

        # ── TF2 ──────────────────────────────────────────────────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ─────────────────────────────────────────────────
        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        # ── 서브스크라이버 ────────────────────────────────────────────
        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,     10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces,  10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,    10)  # ★

        # ── Nav2 Action 클라이언트 (use_nav2=True 일 때) ──────────────
        self._nav2_client = None
        if self._use_nav2:
            if not _NAV2_AVAILABLE:
                self.get_logger().error(
                    'use_nav2=True 이지만 nav2_msgs 패키지를 찾을 수 없습니다. '
                    'sudo apt install ros-<distro>-nav2-msgs 로 설치하세요. '
                    'use_nav2=False 로 폴백합니다.'
                )
                self._use_nav2 = False
            else:
                self._nav2_client = ActionClient(self, ComputePathToPose,
                                                 'compute_path_to_pose')
                self.get_logger().info(
                    'Nav2 Action 클라이언트 생성 완료. '
                    f'planner_id={self._nav2_planner_id}'
                )

        # ── 키보드 확인 스레드 ────────────────────────────────────────
        kb = threading.Thread(target=self._keyboard_listener, daemon=True)
        kb.start()

        mode = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A* v3'
        ae_status  = f'ON (ratio={self.get_parameter("analytic_expansion_ratio").value})' if _RSPLAN_AVAILABLE else 'OFF (rsplan 미설치)'
        oh_status  = 'ON' if self.get_parameter('use_obstacle_heuristic').value else 'OFF'
        self.get_logger().info(
            f'HybridAStarPlanner v3 시작 [{mode}]\n'
            f'  Analytic Expansion: {ae_status}\n'
            f'  Obstacle Heuristic: {oh_status}\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────────

    def _load_params(self):
        vc = VehicleConfig(
            wheelbase      = self.get_parameter('wheelbase').value,
            max_steer_deg  = self.get_parameter('max_steer_deg').value,
            length         = self.get_parameter('vehicle_length').value,
            width          = self.get_parameter('vehicle_width').value,
            front_overhang = self.get_parameter('front_overhang').value,
            rear_overhang  = self.get_parameter('rear_overhang').value,
        )
        self._planner = HybridAStarPlanner(
            vehicle_cfg                = vc,
            step_size                  = self.get_parameter('step_size').value,
            n_steer                    = self.get_parameter('n_steer').value,
            yaw_resolution             = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol                = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol               = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost               = self.get_parameter('reverse_cost').value,
            dir_change_cost            = self.get_parameter('dir_change_cost').value,
            steer_change_cost          = self.get_parameter('steer_change_cost').value,
            occ_threshold              = self.get_parameter('occ_threshold').value,
            max_iter                   = self.get_parameter('max_iter').value,
            # ── ★ 추가 ────────────────────────────────────────────────
            analytic_expansion_ratio   = self.get_parameter('analytic_expansion_ratio').value,
            use_obstacle_heuristic     = self.get_parameter('use_obstacle_heuristic').value,
            auto_step_size             = self.get_parameter('auto_step_size').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    # ── 콜백: /map ───────────────────────────────────────────────────────

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    # ── 콜백: /parking_spaces_info (JSON) ────────────────────────────────
    # ★ 핵심 수정: markers[0] 가정 제거, JSON 으로 정확한 정보 수신

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    # ── 콜백: /parking_spaces ────────────────────────────────────────────

    def _cb_spaces(self, msg: PoseArray):
        self._latest_spaces = msg

        with self._state_lock:
            if self._state != State.SEARCHING:
                return
            if not msg.poses:
                return
            if self._latest_map is None:
                self.get_logger().warn('/map 미수신 — 대기 중.',
                                       throttle_duration_sec=3.0)
                return
            if self._latest_info is None:
                self.get_logger().warn(
                    '/parking_spaces_info 미수신 — goal_yaw 결정 불가, 스킵.',
                    throttle_duration_sec=2.0)
                return

            # ★ is_best=True 항목 검색 (index 매칭)
            best_info = next(
                (item for item in self._latest_info if item.get('is_best', False)),
                None
            )
            if best_info is None:
                self.get_logger().warn('is_best=True 항목 없음, 스킵.')
                return

            self._target_info = best_info
            self._state       = State.WAITING

        self.get_logger().info(
            f'[발견] 목표: ({self._target_info["mx"]:.3f}, {self._target_info["my"]:.3f}) '
            f'type={self._target_info["type"]}  '
            f'goal_yaw={math.degrees(self._target_info["goal_yaw"]):.1f}°\n'
            '  터미널에서 Y(주차 시작) / N(취소) 를 입력하세요.'
        )

    # ── 키보드 확인 스레드 ────────────────────────────────────────────────

    def _keyboard_listener(self):
        while rclpy.ok():
            with self._state_lock:
                state = self._state

            if state == State.WAITING and self._target_info is not None:
                info = self._target_info
                try:
                    ans = input(
                        f'\n목표: ({info["mx"]:.3f}, {info["my"]:.3f})  '
                        f'[{info["type"]}]\n'
                        '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                    ).strip().upper()
                except EOFError:
                    time.sleep(0.2)
                    continue

                if ans == 'Y':
                    with self._state_lock:
                        self._state = State.PARKING
                    self._run_parking()
                elif ans == 'N':
                    self._reset_to_searching()
                    print('주차 취소 — 계속 탐색합니다.')
            else:
                time.sleep(0.2)

    # ── 경로 계획 실행 ───────────────────────────────────────────────────

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        # 1. 로봇 현재 포즈
        start_x, start_y, start_yaw = self._get_robot_pose()

        # 2. 주차 공간 중심
        space_cx = info['mx']
        space_cy = info['my']

        # ── [★ 수정] goal_yaw: detector 가 계산한 기준각 + ±π flip ────
        goal_yaw = self._resolve_goal_yaw(
            base_yaw  = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # ── [★ 2nd version 통합] 후륜 차축 오프셋 보정 ──────────────
        lf = self._planner.vc.lf
        lb = self._planner.vc.lb
        half_offset = (lf - lb) / 2.0
        goal_x = space_cx - half_offset * math.cos(goal_yaw)
        goal_y = space_cy - half_offset * math.sin(goal_yaw)

        self.get_logger().info(
            f'공간중심=({space_cx:.3f},{space_cy:.3f})  '
            f'goal_yaw={math.degrees(goal_yaw):.1f}°  '
            f'후축목표=({goal_x:.3f},{goal_y:.3f})  '
            f'오프셋={half_offset:.3f}m'
        )
        self.get_logger().info(
            f'경로 계획 — '
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        # 3. 목표 충돌 사전 검사
        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox, oy, res = m.info.origin.position.x, m.info.origin.position.y, m.info.resolution

        self._planner._occ    = occ
        self._planner._ox     = ox
        self._planner._oy     = oy
        self._planner._res    = res
        self._planner._height, self._planner._width = occ.shape

        if self._planner._in_collision(goal_x, goal_y, goal_yaw):
            self.get_logger().error(
                '목표 위치에서 차량 풋프린트 충돌 감지. '
                '공간이 차량보다 좁거나 vehicle_length/width 파라미터 확인 필요.'
            )
            self._reset_to_searching()
            return

        # 4. 경로 계획 (Nav2 or 자체 구현)
        if self._use_nav2:
            path = self._plan_with_nav2(goal_x, goal_y, goal_yaw)
        else:
            path = self._plan_with_self(
                start_x, start_y, start_yaw,
                goal_x,  goal_y,  goal_yaw,
                occ, ox, oy, res,
            )

        if path is None:
            self.get_logger().error('경로를 찾지 못했습니다.')
            self._reset_to_searching()
            return

        self.get_logger().info(f'경로 계획 완료: {len(path)}개 웨이포인트')
        self._publish_path(path)
        self._publish_vis_markers(path)
        self._reset_to_searching()

    # ── [★ 수정] goal_yaw 해석: 기준각 + ±π flip ─────────────────────

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        detector 가 계산한 기준각(base_yaw)에 대해
        0°↔180° (또는 90°↔-90°) 중 접근 방향과 더 가까운 쪽을 선택.

        접근 방향 벡터와의 내적이 양수인 쪽을 선택함으로써
        로봇이 목표를 향해 전진하는 방향으로 진입하도록 유도.

        예) base_yaw=0.0, approach=-170° → 180° 선택 (뒤로 진입이 더 자연스러움)
        """
        approach = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)

        diff_a = abs(self._norm_angle(candidate_a - approach))
        diff_b = abs(self._norm_angle(candidate_b - approach))

        selected = candidate_a if diff_a <= diff_b else candidate_b
        self.get_logger().info(
            f'[goal_yaw] base={math.degrees(base_yaw):.1f}°  '
            f'approach={math.degrees(approach):.1f}°  '
            f'선택={math.degrees(selected):.1f}°'
        )
        return selected

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a

    # ── 자체 Hybrid A* 실행 ───────────────────────────────────────────────

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0   = time.monotonic()
        path = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    # ── Nav2 SmacPlannerHybrid Action 호출 ───────────────────────────────

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action 으로 SmacPlannerHybrid 경로 요청.

        Nav2 설정 (nav2_params.yaml) 에 아래가 필요:
          planner_server:
            ros__parameters:
              planner_plugins: ["HybridAStar"]
              HybridAStar:
                plugin: "nav2_smac_planner/SmacPlannerHybrid"
                minimum_turning_radius: 0.30       # wheelbase/tan(max_steer) 보다 크게
                motion_model_for_search: "REEDS_SHEPP"
                angle_quantization_bins: 72        # 5° 해상도
                smooth_path: true
                max_planning_time: 10.0

        반환: [(x, y, yaw), ...] or None
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id = 'map'
        goal_msg.goal.header.stamp    = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x = gx
        goal_msg.goal.pose.position.y = gy
        goal_msg.goal.pose.position.z = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        # 시작 포즈 (현재 로봇 위치)
        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id = 'map'
        goal_msg.start.header.stamp    = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x = sx
        goal_msg.start.pose.position.y = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        # 동기식 대기 (Action 결과 수신까지 블로킹)
        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(
            self, future, timeout_sec=self._nav2_timeout_sec
        )

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(
            self, result_future, timeout_sec=self._nav2_timeout_sec
        )

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        result = result_future.result().result
        nav2_path: Path = result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x = ps.pose.position.x
            y = ps.pose.position.y
            qz = ps.pose.orientation.z
            qw = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(
            f'Nav2 경로 수신: {len(path)}개 웨이포인트'
        )
        return path

    # ── TF: 로봇 포즈 ────────────────────────────────────────────────────

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx = tf.transform.translation.x
            ty = tf.transform.translation.y
            q  = tf.transform.rotation
            siny = 2.0 * (q.w * q.z + q.x * q.y)
            cosy = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
            return tx, ty, math.atan2(siny, cosy)
        except tf2_ros.TransformException as e:
            self.get_logger().warn(f'TF 오류 ({e}); 원점(0,0,0) 사용',
                                   throttle_duration_sec=5.0)
            return 0.0, 0.0, 0.0

    def _reset_to_searching(self):
        with self._state_lock:
            self._target_info = None
            self._state       = State.SEARCHING
        self.get_logger().info('SEARCHING 상태로 복귀.')

    # ── /parking_path 발행 ───────────────────────────────────────────────

    def _publish_path(self, path):
        ros_path = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps = PoseStamped()
            ps.header = ros_path.header
            ps.pose.position.x = x
            ps.pose.position.y = y
            ps.pose.orientation.z = math.sin(yaw / 2.0)
            ps.pose.orientation.w = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    # ── /parking_path_markers 발행 ───────────────────────────────────────

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point(); p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow = Marker()
            arrow.header.stamp    = stamp
            arrow.header.frame_id = 'map'
            arrow.ns              = 'parking_path_arrows'
            arrow.id              = i + 1
            arrow.type            = Marker.ARROW
            arrow.action          = Marker.ADD
            arrow.pose.position.x = x
            arrow.pose.position.y = y
            arrow.pose.position.z = 0.05
            arrow.pose.orientation.z = math.sin(yaw / 2.0)
            arrow.pose.orientation.w = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color           = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec    = 10
            ma.markers.append(arrow)

        self._pub_markers.publish(ma)


# ─────────────────────────────────────────────────────────────────────────────
# 진입점
# ─────────────────────────────────────────────────────────────────────────────

def main(args=None):
    rclpy.init(args=args)
    node = HybridAStarNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```


```python
import cv2
import numpy as np
import heapq

# 1. 휴리스틱(Heuristic) 함수: 두 점 사이의 직선 거리(유클리디안 거리) 계산
# A* 알고리즘이 "이쪽으로 가면 목적지랑 가까워지겠네!"라고 힌트를 얻는 데 사용됩니다.
def heuristic(a, b):
    return np.sqrt((a[0] - b[0])**2 + (a[1] - b[1])**2)

# 2. 핵심 알고리즘: A* 경로 탐색
def a_star_search(costmap, start, goal):
    # 로봇이 픽셀 상에서 이동할 수 있는 8방향 (상, 하, 좌, 우, 대각선)
    neighbors = [(0,1), (0,-1), (1,0), (-1,0), (1,1), (1,-1), (-1,1), (-1,-1)]

    # 탐색할 노드들을 비용이 적은 순서대로 정렬해두는 우선순위 큐(Heap)
    open_set = []
    heapq.heappush(open_set, (0, start))

    # 경로를 다 찾은 후 선을 긋기 위해, '내가 어디서 왔는지' 발자취를 저장하는 딕셔너리
    came_from = {}

    # 시작점에서 현재 픽셀까지 오는데 걸린 '실제 이동 비용'
    g_score = {start: 0}

    while open_set:
        # 가장 최적일 것으로 예상되는 픽셀을 꺼냅니다.
        current = heapq.heappop(open_set)[1]

        # 🎯 목적지에 도착했다면? 발자취를 거꾸로 추적해서 최종 경로(선)를 만듭니다.
        if current == goal:
            path = []
            while current in came_from:
                path.append(current)
                current = came_from[current]
            path.append(start)
            path.reverse() # 시작점 -> 도착점 순서로 뒤집기
            return path

        # 주변 8방향 픽셀들을 둘러봅니다.
        for dx, dy in neighbors:
            nx, ny = current[0] + dx, current[1] + dy
            neighbor = (nx, ny)

            # [예외 1] 이미지(맵) 범위를 벗어나면 탐색 안 함
            if nx < 0 or ny < 0 or nx >= costmap.shape[1] or ny >= costmap.shape[0]:
                continue

            # [예외 2] 장애물 판별 (흰색이 자유 공간, 검은색/회색이 장애물)
            # OpenCV 이미지는 costmap[y, x] 순서로 접근해야 합니다.
            # 픽셀 값이 200보다 작으면(어두우면) 하드보드지 벽으로 간주하고 통과하지 못하게 막습니다.
            if costmap[ny, nx] < 200:
                continue

            # 직선 이동은 비용 1, 대각선 이동은 비용 1.414 (루트 2)를 추가
            cost = 1.414 if dx != 0 and dy != 0 else 1
            tentative_g_score = g_score[current] + cost

            # 더 지름길을 발견했거나, 처음 와본 길이라면 데이터 갱신!
            if neighbor not in g_score or tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                
                # f_score = 지금까지 온 거리(g) + 앞으로 갈 예상 거리(heuristic)
                f_score = tentative_g_score + heuristic(neighbor, goal)
                heapq.heappush(open_set, (f_score, neighbor))

    return None # 맵이 다 막혀있어서 경로를 찾을 수 없는 경우

# 3. 메인 실행부
if __name__ == "__main__":
    # 📷 매니저님이 뽑아내신 PNG 파일(코스트맵)을 흑백 모드로 불러옵니다.
    # ('map_image.png' 부분을 실제 파일 이름으로 바꿔주세요)
    img = cv2.imread('map_image.png', cv2.IMREAD_GRAYSCALE)

    # 경로(초록색 선)를 예쁘게 그리기 위해 컬러 캔버스를 하나 복사해 둡니다.
    result_img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)

    # 🚦 시작점과 도착점 좌표 설정 (X, Y 픽셀 좌표)
    # 이미지 확인 후 실제 로봇 위치와 탐지된 빨간 십자가 중심 픽셀 좌표를 넣으시면 됩니다!
    start_point = (50, 400)   # 예시: 로봇 현재 위치
    goal_point = (350, 150)   # 예시: 탐지된 주차 공간 좌표

    print("자율 주차 경로 탐색을 시작합니다...")
    path = a_star_search(img, start_point, goal_point)

    # 🖌️ 결과 시각화
    if path:
        print(f"경로 탐색 성공! 총 {len(path)}개의 픽셀을 지납니다.")

        # 시작점은 파란색(Blue), 도착점은 빨간색(Red) 원으로 표시
        cv2.circle(result_img, start_point, 5, (255, 0, 0), -1)
        cv2.circle(result_img, goal_point, 5, (0, 0, 255), -1)

        # A*가 찾은 경로를 따라 초록색 선(Green Line) 긋기
        for i in range(len(path) - 1):
            pt1 = path[i]
            pt2 = path[i+1]
            cv2.line(result_img, pt1, pt2, (0, 255, 0), 2)

        # 결과 화면 띄우기
        cv2.imshow("A* Parking Path Planning", result_img)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
        
        # 이미지 파일로 저장해 두기
        cv2.imwrite("final_parking_path.png", result_img)
    else:
        print("하드보드지 벽에 완전히 막혀있어 경로를 생성할 수 없습니다!")
```


다른 버전


```python
#Hybrid_A_star.py
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node  (v2 — 버그 수정 + Nav2 연동)
=======================================================================

【v2 수정 사항】

  [버그 수정]
  1. goal_yaw 결정 오류 수정
       이전: markers[0] 가정 + 오직 0°/180° 고집
       수정: /parking_spaces_info (JSON) 에서 index 매칭으로 정확한 goal_yaw 획득.
             detector 가 travel_direction 기반으로 이미 계산한 값을 그대로 사용.
             ±π flip 은 접근 방향과의 내적으로 결정.

  2. _extract_path 체인 끊김 버그 수정
       이전: chain 끊겨도 start 를 강제 append → 불연속 경로 반환
       수정: chain 끊기면 즉시 None 반환 → 탐색 실패로 처리.

  3. _key() 해시 충돌 수정
       이전: iyaw + yaw_bins*(ix + 100000*iy)  → ix>100000 이면 충돌
       수정: Cantor 쌍 함수 기반 3D 튜플 해시 (Python 내장 hash 사용)

  4. markers[0] 가정 제거
       이전: self._latest_markers.markers[0] 으로 BEST 공간 정보 추정
       수정: /parking_spaces_info JSON 의 is_best=True 항목에서 직접 읽기.

  5. 후륜 차축 오프셋 적용 (2nd version 의 수정 사항 통합)
       공간 중심 ≠ 후륜 차축 목표. (lf-lb)/2 오프셋 보정.

  6. 목표 충돌 사전 검사 추가

  [Nav2 연동 — 권장 방식]
  use_nav2 파라미터를 True 로 설정하면 Nav2 SmacPlannerHybrid Action 을 호출.
  Nav2 스택(planner_server, costmap)이 실행 중이어야 함.

  use_nav2=False (기본): 자체 구현 Hybrid A* 실행 (Nav2 없이도 동작)
  use_nav2=True        : Nav2 ComputePathToPose Action 호출

  Nav2 사용 시 nav2_params.yaml 에 아래 설정 필요:
    planner_server:
      ros__parameters:
        planner_plugins: ["HybridAStar"]
        HybridAStar:
          plugin: "nav2_smac_planner/SmacPlannerHybrid"
          minimum_turning_radius: 0.30
          motion_model_for_search: "REEDS_SHEPP"
          angle_quantization_bins: 72
          smooth_path: true

【구독 토픽】
  /parking_spaces        (PoseArray)   ← detector 발행 (기존 호환)
  /parking_spaces_info   (String/JSON) ← detector 발행 ★신규: goal_yaw·type 포함
  /parking_space_markers (MarkerArray) ← detector 발행
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)
"""

import json
import math
import heapq
import sys
import threading
import time
from enum import Enum
from typing import Dict, List, Optional, Tuple

import numpy as np
import rclpy
import rclpy.action
import tf2_ros
from geometry_msgs.msg import Point, PoseArray, PoseStamped
from nav_msgs.msg import OccupancyGrid, Path
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from visualization_msgs.msg import Marker, MarkerArray

# Nav2 Action (use_nav2=True 일 때만 실제 사용)
try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False


# ─────────────────────────────────────────────────────────────────────────────
# 상태 머신
# ─────────────────────────────────────────────────────────────────────────────

class State(Enum):
    SEARCHING = 1
    WAITING   = 2
    PARKING   = 3


# ─────────────────────────────────────────────────────────────────────────────
# 차량 파라미터
# ─────────────────────────────────────────────────────────────────────────────

class VehicleConfig:
    def __init__(self, wheelbase=0.25, max_steer_deg=35.0,
                 length=0.35, width=0.22,
                 front_overhang=0.05, rear_overhang=0.05):
        self.wheelbase      = wheelbase
        self.max_steer      = math.radians(max_steer_deg)
        self.length         = length
        self.width          = width
        self.front_overhang = front_overhang
        self.rear_overhang  = rear_overhang
        self.lf = wheelbase + front_overhang   # 후축 → 차량 전면
        self.lb = rear_overhang                # 후축 → 차량 후면


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 탐색 노드
# ─────────────────────────────────────────────────────────────────────────────

class HANode:
    __slots__ = ('x', 'y', 'yaw', 'ix', 'iy', 'iyaw',
                 'g', 'h', 'steer', 'direction', 'parent_key')

    def __init__(self, x, y, yaw, ix, iy, iyaw,
                 g, h, steer, direction, parent_key=None):
        self.x,  self.y,  self.yaw  = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw
        self.g, self.h = g, h
        self.steer     = steer
        self.direction = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float       = 0.06,
        n_steer: int           = 7,
        yaw_resolution: float  = math.radians(5.0),
        goal_xy_tol: float     = 0.08,
        goal_yaw_tol: float    = math.radians(10.0),
        reverse_cost: float    = 1.5,
        dir_change_cost: float = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int     = 50,
        max_iter: int          = 80000,
    ):
        self.vc               = vehicle_cfg
        self.step             = step_size
        self.n_steer          = n_steer
        self.yaw_res          = yaw_resolution
        self.goal_xy_tol      = goal_xy_tol
        self.goal_yaw_tol     = goal_yaw_tol
        self.reverse_cost     = reverse_cost
        self.dir_change_cost  = dir_change_cost
        self.steer_chg_cost   = steer_change_cost
        self.occ_thresh       = occ_threshold
        self.max_iter         = max_iter

        self.steers = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
        self._yaw_bins = max(1, int(round(2 * math.pi / self.yaw_res)))

    def plan(
        self,
        start_x, start_y, start_yaw,
        goal_x,  goal_y,  goal_yaw,
        occ_grid: np.ndarray,
        origin_x: float, origin_y: float,
        resolution: float,
    ) -> Optional[List[Tuple[float, float, float]]]:

        self._occ    = occ_grid
        self._ox     = origin_x
        self._oy     = origin_y
        self._res    = resolution
        self._height, self._width = occ_grid.shape

        s = self._make_node(start_x, start_y, start_yaw, g=0.0,
                            steer=0.0, direction=1, parent_key=None)
        s.h = self._heuristic(s.x, s.y, s.yaw, goal_x, goal_y, goal_yaw)

        open_heap: List[Tuple[float, HANode]] = []
        heapq.heappush(open_heap, (s.f, s))
        open_dict:   Dict[int, HANode] = {self._key(s): s}
        closed_dict: Dict[int, HANode] = {}

        iterations = 0
        t0 = time.monotonic()

        while open_heap:
            iterations += 1
            if iterations > self.max_iter:
                if closed_dict:
                    best_node = min(
                        closed_dict.values(),
                        key=lambda n: math.hypot(n.x - goal_x, n.y - goal_y)
                    )
                    print(
                        f'[DBG] max_iter({self.max_iter}) 소진. '
                        f'최근접=({best_node.x:.3f},{best_node.y:.3f}) '
                        f'목표까지={math.hypot(best_node.x-goal_x, best_node.y-goal_y):.3f}m',
                        file=sys.stderr, flush=True
                    )
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)
            if ckey in closed_dict:
                continue
            closed_dict[ckey] = cur

            if iterations % 10000 == 0:
                print(
                    f'[DBG] iter={iterations} closed={len(closed_dict)} '
                    f'cur=({cur.x:.3f},{cur.y:.3f},{math.degrees(cur.yaw):.1f}°) '
                    f'경과={time.monotonic()-t0:.1f}s',
                    file=sys.stderr, flush=True
                )

            if self._reached_goal(cur.x, cur.y, cur.yaw, goal_x, goal_y, goal_yaw):
                path = self._extract_path(cur, closed_dict, open_dict)
                return path  # None 이면 체인 끊김 → 탐색 실패로 처리

            for succ in self._expand(cur, goal_x, goal_y, goal_yaw):
                skey = self._key(succ)
                if skey in closed_dict:
                    continue
                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _expand(self, node, gx, gy, gyaw):
        children = []
        for direction in (1, -1):
            for steer in self.steers:
                nx, ny, nyaw = self._bicycle_step(
                    node.x, node.y, node.yaw, steer, direction
                )
                if not self._in_bounds(nx, ny):
                    continue
                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step
                if direction == -1:
                    cost *= self.reverse_cost
                if direction != node.direction:
                    cost += self.dir_change_cost * self.step
                steer_diff = abs(steer - node.steer)
                cost += steer_diff * self.steer_chg_cost

                new_g = node.g + cost
                child = self._make_node(nx, ny, nyaw, g=new_g,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx   = x + d * math.cos(mid_yaw)
        ny   = y + d * math.sin(mid_yaw)
        nyaw = self._norm_angle(yaw + delta_yaw)
        return nx, ny, nyaw

    def _in_collision(self, x, y, yaw):
        """
        차량 직사각형 풋프린트 샘플링 충돌 검사.
        전후 방향 n_samples 점 × 좌우 5열 (폭 방향 커버리지 향상).
        """
        cos_t = math.cos(yaw)
        sin_t = math.sin(yaw)
        hw    = self.vc.width / 2.0
        n_lon = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        # 폭 방향 샘플: 이전 3점 → 5점으로 확대 (얇은 벽 탐지 강화)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                px = cx - w * sin_t
                py = cy + w * cos_t
                if self._cell_occupied(px, py):
                    return True
        return False

    def _cell_occupied(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True
        val = int(self._occ[iy, ix])
        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):
        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm_angle(yaw - gyaw))
        return dist <= self.goal_xy_tol and dyaw <= self.goal_yaw_tol

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):
        dist  = math.hypot(x - gx, y - gy)
        dyaw  = abs(self._norm_angle(yaw - gyaw))
        r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        return max(dist, r_min * dyaw)

    # ── [★ 수정] _extract_path: 체인 끊기면 None 반환 ────────────────
    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        목표 노드 → 시작 노드 역추적.

        [버그 수정]
        이전: 체인 끊겨도 start 좌표를 강제 append → 불연속 경로 반환
        수정: 체인이 끊기면 (parent_key 가 어디에도 없으면) None 반환.
              parent_key=None 인 노드(시작 노드)를 만날 때만 정상 종료.
        """
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                # 시작 노드에 도달 → 정상 종료
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        # 체인 끊김: 복구 불가 → None
        print('[ERR] _extract_path: 경로 체인 끊김', file=sys.stderr, flush=True)
        return None

    def _make_node(self, x, y, yaw, g, steer, direction, parent_key):
        ix   = int(round((x - self._ox) / self._res))
        iy   = int(round((y - self._oy) / self._res))
        raw  = int(round(self._norm_angle(yaw) / self.yaw_res))
        iyaw = raw % self._yaw_bins
        return HANode(x, y, yaw, ix, iy, iyaw,
                      g=g, h=0.0,
                      steer=steer, direction=direction,
                      parent_key=parent_key)

    # ── [★ 수정] _key: Python 내장 hash 로 충돌 제거 ─────────────────
    def _key(self, node: HANode) -> int:
        """
        (ix, iy, iyaw) 3-튜플을 Python 내장 hash 로 인코딩.

        [버그 수정]
        이전: iyaw + yaw_bins*(ix + 100000*iy)
              → ix > 100000 (맵 5km 이상) 이면 충돌 발생
        수정: hash((ix, iy, iyaw)) — Python tuple hash 는 충돌이 사실상 없고
              음수가 나올 수 있으므로 dict key 로 직접 사용 (음수 OK).
        """
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a


# ─────────────────────────────────────────────────────────────────────────────
# ROS 2 노드
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarNode(Node):
    """
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2 로 경로를 계획·발행.

    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출 (권장)
    use_nav2=False → 자체 구현 Hybrid A* 실행 (Nav2 없이 동작)
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        # ── 파라미터 선언 ─────────────────────────────────────────────
        self.declare_parameter('wheelbase',           0.25)
        self.declare_parameter('max_steer_deg',       35.0)
        self.declare_parameter('vehicle_length',      0.35)
        self.declare_parameter('vehicle_width',       0.22)
        self.declare_parameter('front_overhang',      0.05)
        self.declare_parameter('rear_overhang',       0.05)
        self.declare_parameter('step_size',           0.06)
        self.declare_parameter('n_steer',             7)
        self.declare_parameter('yaw_resolution_deg',  5.0)
        self.declare_parameter('goal_xy_tol',         0.08)
        self.declare_parameter('goal_yaw_tol_deg',    10.0)
        self.declare_parameter('reverse_cost',        1.5)
        self.declare_parameter('dir_change_cost',     3.0)
        self.declare_parameter('steer_change_cost',   0.5)
        self.declare_parameter('occ_threshold',       50)
        self.declare_parameter('max_iter',            80000)
        self.declare_parameter('base_frame',          'base_link')
        # Nav2 연동 파라미터
        self.declare_parameter('use_nav2',            False)
        self.declare_parameter('nav2_planner_id',     'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',    30.0)

        self._load_params()

        # ── 상태 머신 ─────────────────────────────────────────────────
        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        # ── 최신 데이터 저장 ─────────────────────────────────────────
        self._latest_map:     Optional[OccupancyGrid] = None
        self._latest_spaces:  Optional[PoseArray]     = None
        self._latest_info:    Optional[List[dict]]    = None  # ★ JSON info
        self._target_info:    Optional[dict]          = None  # BEST 후보 스냅샷

        # ── TF2 ──────────────────────────────────────────────────────
        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ─────────────────────────────────────────────────
        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        # ── 서브스크라이버 ────────────────────────────────────────────
        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,     10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces,  10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,    10)  # ★

        # ── Nav2 Action 클라이언트 (use_nav2=True 일 때) ──────────────
        self._nav2_client = None
        if self._use_nav2:
            if not _NAV2_AVAILABLE:
                self.get_logger().error(
                    'use_nav2=True 이지만 nav2_msgs 패키지를 찾을 수 없습니다. '
                    'sudo apt install ros-<distro>-nav2-msgs 로 설치하세요. '
                    'use_nav2=False 로 폴백합니다.'
                )
                self._use_nav2 = False
            else:
                self._nav2_client = ActionClient(self, ComputePathToPose,
                                                 'compute_path_to_pose')
                self.get_logger().info(
                    'Nav2 Action 클라이언트 생성 완료. '
                    f'planner_id={self._nav2_planner_id}'
                )

        # ── 키보드 확인 스레드 ────────────────────────────────────────
        kb = threading.Thread(target=self._keyboard_listener, daemon=True)
        kb.start()

        mode = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A*'
        self.get_logger().info(
            f'HybridAStarPlanner v2 시작 [{mode}] — 주차 공간 탐색 중...\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────────

    def _load_params(self):
        vc = VehicleConfig(
            wheelbase      = self.get_parameter('wheelbase').value,
            max_steer_deg  = self.get_parameter('max_steer_deg').value,
            length         = self.get_parameter('vehicle_length').value,
            width          = self.get_parameter('vehicle_width').value,
            front_overhang = self.get_parameter('front_overhang').value,
            rear_overhang  = self.get_parameter('rear_overhang').value,
        )
        self._planner = HybridAStarPlanner(
            vehicle_cfg       = vc,
            step_size         = self.get_parameter('step_size').value,
            n_steer           = self.get_parameter('n_steer').value,
            yaw_resolution    = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol       = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol      = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost      = self.get_parameter('reverse_cost').value,
            dir_change_cost   = self.get_parameter('dir_change_cost').value,
            steer_change_cost = self.get_parameter('steer_change_cost').value,
            occ_threshold     = self.get_parameter('occ_threshold').value,
            max_iter          = self.get_parameter('max_iter').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    # ── 콜백: /map ───────────────────────────────────────────────────────

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    # ── 콜백: /parking_spaces_info (JSON) ────────────────────────────────
    # ★ 핵심 수정: markers[0] 가정 제거, JSON 으로 정확한 정보 수신

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    # ── 콜백: /parking_spaces ────────────────────────────────────────────

    def _cb_spaces(self, msg: PoseArray):
        self._latest_spaces = msg

        with self._state_lock:
            if self._state != State.SEARCHING:
                return
            if not msg.poses:
                return
            if self._latest_map is None:
                self.get_logger().warn('/map 미수신 — 대기 중.',
                                       throttle_duration_sec=3.0)
                return
            if self._latest_info is None:
                self.get_logger().warn(
                    '/parking_spaces_info 미수신 — goal_yaw 결정 불가, 스킵.',
                    throttle_duration_sec=2.0)
                return

            # ★ is_best=True 항목 검색 (index 매칭)
            best_info = next(
                (item for item in self._latest_info if item.get('is_best', False)),
                None
            )
            if best_info is None:
                self.get_logger().warn('is_best=True 항목 없음, 스킵.')
                return

            self._target_info = best_info
            self._state       = State.WAITING

        self.get_logger().info(
            f'[발견] 목표: ({self._target_info["mx"]:.3f}, {self._target_info["my"]:.3f}) '
            f'type={self._target_info["type"]}  '
            f'goal_yaw={math.degrees(self._target_info["goal_yaw"]):.1f}°\n'
            '  터미널에서 Y(주차 시작) / N(취소) 를 입력하세요.'
        )

    # ── 키보드 확인 스레드 ────────────────────────────────────────────────

    def _keyboard_listener(self):
        while rclpy.ok():
            with self._state_lock:
                state = self._state

            if state == State.WAITING and self._target_info is not None:
                info = self._target_info
                try:
                    ans = input(
                        f'\n목표: ({info["mx"]:.3f}, {info["my"]:.3f})  '
                        f'[{info["type"]}]\n'
                        '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                    ).strip().upper()
                except EOFError:
                    time.sleep(0.2)
                    continue

                if ans == 'Y':
                    with self._state_lock:
                        self._state = State.PARKING
                    self._run_parking()
                elif ans == 'N':
                    self._reset_to_searching()
                    print('주차 취소 — 계속 탐색합니다.')
            else:
                time.sleep(0.2)

    # ── 경로 계획 실행 ───────────────────────────────────────────────────

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        # 1. 로봇 현재 포즈
        start_x, start_y, start_yaw = self._get_robot_pose()

        # 2. 주차 공간 중심
        space_cx = info['mx']
        space_cy = info['my']

        # ── [★ 수정] goal_yaw: detector 가 계산한 기준각 + ±π flip ────
        goal_yaw = self._resolve_goal_yaw(
            base_yaw  = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # ── [★ 2nd version 통합] 후륜 차축 오프셋 보정 ──────────────
        lf = self._planner.vc.lf
        lb = self._planner.vc.lb
        half_offset = (lf - lb) / 2.0
        goal_x = space_cx - half_offset * math.cos(goal_yaw)
        goal_y = space_cy - half_offset * math.sin(goal_yaw)

        self.get_logger().info(
            f'공간중심=({space_cx:.3f},{space_cy:.3f})  '
            f'goal_yaw={math.degrees(goal_yaw):.1f}°  '
            f'후축목표=({goal_x:.3f},{goal_y:.3f})  '
            f'오프셋={half_offset:.3f}m'
        )
        self.get_logger().info(
            f'경로 계획 — '
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        # 3. 목표 충돌 사전 검사
        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox, oy, res = m.info.origin.position.x, m.info.origin.position.y, m.info.resolution

        self._planner._occ    = occ
        self._planner._ox     = ox
        self._planner._oy     = oy
        self._planner._res    = res
        self._planner._height, self._planner._width = occ.shape

        if self._planner._in_collision(goal_x, goal_y, goal_yaw):
            self.get_logger().error(
                '목표 위치에서 차량 풋프린트 충돌 감지. '
                '공간이 차량보다 좁거나 vehicle_length/width 파라미터 확인 필요.'
            )
            self._reset_to_searching()
            return

        # 4. 경로 계획 (Nav2 or 자체 구현)
        if self._use_nav2:
            path = self._plan_with_nav2(goal_x, goal_y, goal_yaw)
        else:
            path = self._plan_with_self(
                start_x, start_y, start_yaw,
                goal_x,  goal_y,  goal_yaw,
                occ, ox, oy, res,
            )

        if path is None:
            self.get_logger().error('경로를 찾지 못했습니다.')
            self._reset_to_searching()
            return

        self.get_logger().info(f'경로 계획 완료: {len(path)}개 웨이포인트')
        self._publish_path(path)
        self._publish_vis_markers(path)
        self._reset_to_searching()

    # ── [★ 수정] goal_yaw 해석: 기준각 + ±π flip ─────────────────────

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        detector 가 계산한 기준각(base_yaw)에 대해
        0°↔180° (또는 90°↔-90°) 중 접근 방향과 더 가까운 쪽을 선택.

        접근 방향 벡터와의 내적이 양수인 쪽을 선택함으로써
        로봇이 목표를 향해 전진하는 방향으로 진입하도록 유도.

        예) base_yaw=0.0, approach=-170° → 180° 선택 (뒤로 진입이 더 자연스러움)
        """
        approach = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)

        diff_a = abs(self._norm_angle(candidate_a - approach))
        diff_b = abs(self._norm_angle(candidate_b - approach))

        selected = candidate_a if diff_a <= diff_b else candidate_b
        self.get_logger().info(
            f'[goal_yaw] base={math.degrees(base_yaw):.1f}°  '
            f'approach={math.degrees(approach):.1f}°  '
            f'선택={math.degrees(selected):.1f}°'
        )
        return selected

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a

    # ── 자체 Hybrid A* 실행 ───────────────────────────────────────────────

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0   = time.monotonic()
        path = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    # ── Nav2 SmacPlannerHybrid Action 호출 ───────────────────────────────

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action 으로 SmacPlannerHybrid 경로 요청.

        Nav2 설정 (nav2_params.yaml) 에 아래가 필요:
          planner_server:
            ros__parameters:
              planner_plugins: ["HybridAStar"]
              HybridAStar:
                plugin: "nav2_smac_planner/SmacPlannerHybrid"
                minimum_turning_radius: 0.30       # wheelbase/tan(max_steer) 보다 크게
                motion_model_for_search: "REEDS_SHEPP"
                angle_quantization_bins: 72        # 5° 해상도
                smooth_path: true
                max_planning_time: 10.0

        반환: [(x, y, yaw), ...] or None
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id = 'map'
        goal_msg.goal.header.stamp    = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x = gx
        goal_msg.goal.pose.position.y = gy
        goal_msg.goal.pose.position.z = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        # 시작 포즈 (현재 로봇 위치)
        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id = 'map'
        goal_msg.start.header.stamp    = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x = sx
        goal_msg.start.pose.position.y = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        # 동기식 대기 (Action 결과 수신까지 블로킹)
        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(
            self, future, timeout_sec=self._nav2_timeout_sec
        )

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(
            self, result_future, timeout_sec=self._nav2_timeout_sec
        )

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        result = result_future.result().result
        nav2_path: Path = result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x = ps.pose.position.x
            y = ps.pose.position.y
            qz = ps.pose.orientation.z
            qw = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(
            f'Nav2 경로 수신: {len(path)}개 웨이포인트'
        )
        return path

    # ── TF: 로봇 포즈 ────────────────────────────────────────────────────

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx = tf.transform.translation.x
            ty = tf.transform.translation.y
            q  = tf.transform.rotation
            siny = 2.0 * (q.w * q.z + q.x * q.y)
            cosy = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
            return tx, ty, math.atan2(siny, cosy)
        except tf2_ros.TransformException as e:
            self.get_logger().warn(f'TF 오류 ({e}); 원점(0,0,0) 사용',
                                   throttle_duration_sec=5.0)
            return 0.0, 0.0, 0.0

    def _reset_to_searching(self):
        with self._state_lock:
            self._target_info = None
            self._state       = State.SEARCHING
        self.get_logger().info('SEARCHING 상태로 복귀.')

    # ── /parking_path 발행 ───────────────────────────────────────────────

    def _publish_path(self, path):
        ros_path = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps = PoseStamped()
            ps.header = ros_path.header
            ps.pose.position.x = x
            ps.pose.position.y = y
            ps.pose.orientation.z = math.sin(yaw / 2.0)
            ps.pose.orientation.w = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    # ── /parking_path_markers 발행 ───────────────────────────────────────

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point(); p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow = Marker()
            arrow.header.stamp    = stamp
            arrow.header.frame_id = 'map'
            arrow.ns              = 'parking_path_arrows'
            arrow.id              = i + 1
            arrow.type            = Marker.ARROW
            arrow.action          = Marker.ADD
            arrow.pose.position.x = x
            arrow.pose.position.y = y
            arrow.pose.position.z = 0.05
            arrow.pose.orientation.z = math.sin(yaw / 2.0)
            arrow.pose.orientation.w = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color           = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec    = 10
            ma.markers.append(arrow)

        self._pub_markers.publish(ma)


# ─────────────────────────────────────────────────────────────────────────────
# 진입점
# ─────────────────────────────────────────────────────────────────────────────

def main(args=None):
    rclpy.init(args=args)
    node = HybridAStarNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```


```yaml
# ============================================================
# nav2_params_parking.yaml
# SPAS 소형 로봇 주차 전용 Nav2 파라미터
# ============================================================
#
# 사용법:
#   ros2 launch nav2_bringup navigation_launch.py \
#       params_file:=$(pwd)/nav2_params_parking.yaml
#
# 또는 기존 nav2_params.yaml 에 아래 섹션을 병합.
# ============================================================

# ── Planner Server ──────────────────────────────────────────
planner_server:
  ros__parameters:
    # HybridAStar 이름으로 SmacPlannerHybrid 플러그인 등록
    planner_plugins: ["HybridAStar"]

    HybridAStar:
      plugin: "nav2_smac_planner/SmacPlannerHybrid"

      # ── 기하 ──────────────────────────────────────────────
      # minimum_turning_radius = wheelbase / tan(max_steer)
      #   = 0.25 / tan(35°) ≈ 0.357m  → 여유 있게 0.30 설정
      minimum_turning_radius: 0.30

      # ── 탐색 모드 ─────────────────────────────────────────
      # REEDS_SHEPP: 전진+후진 모두 허용 → 좁은 주차공간 필수
      # DUBIN: 전진만 허용 (단방향 이동 환경용)
      motion_model_for_search: "REEDS_SHEPP"

      # ── 방향각 이산화 ─────────────────────────────────────
      # 360° / 72 = 5° 해상도 (촘촘할수록 정밀하지만 느림)
      angle_quantization_bins: 72

      # ── 경로 평활화 ───────────────────────────────────────
      smooth_path: true
      smoother_max_iterations: 1000
      smoother_w_smooth: 0.3
      smoother_w_data: 0.2
      smoother_tolerance: 1.0e-10

      # ── 탐색 비용 ─────────────────────────────────────────
      reverse_penalty: 1.5          # 후진 비용 배수
      change_penalty: 0.0           # 방향 전환 페널티 (0=비활성)
      non_straight_penalty: 1.2     # 조향 비용 배수
      cost_penalty: 2.0             # costmap 값 반영 비율

      # ── 탐색 제한 ─────────────────────────────────────────
      max_planning_time: 10.0       # 초 (소형 실내 환경에서 충분)
      max_on_approach_iterations: 1000
      max_iterations: 1000000

      # ── 목표 도달 허용 오차 ───────────────────────────────
      analytic_expansion_ratio: 3.5
      analytic_expansion_max_length: 3.0
      analytic_expansion_max_cost: 200.0
      retrospective_penalty: 0.015

      # ── 허용 격자 해상도 ──────────────────────────────────
      lookup_table_size: 20.0       # 조회 테이블 크기 (m)
      cache_obstacle_heuristic: true
      allow_unknown: true           # 미탐색 영역 통과 허용

      # ── 디버그 ────────────────────────────────────────────
      debug_visualizations: false   # true 면 /plan_smoothed 등 추가 토픽 발행


# ── Costmap (로컬) ──────────────────────────────────────────
# SmacPlannerHybrid 는 global_costmap 을 사용.
# 소형 로봇에 맞게 inflation_radius 를 차량 폭의 절반으로 설정.
#
# 참고: inflation_radius 가 너무 크면 좁은 주차 공간 진입이 막힘.
#       vehicle_width/2 = 0.22/2 = 0.11m → 0.12m 로 설정.

global_costmap:
  global_costmap:
    ros__parameters:
      update_frequency: 1.0
      publish_frequency: 1.0
      global_frame: map
      robot_base_frame: base_link
      robot_radius: 0.18          # 소형 로봇 반경 (충돌 마진 포함)
      resolution: 0.05
      track_unknown_space: true
      plugins: ["static_layer", "inflation_layer"]

      static_layer:
        plugin: "nav2_costmap_2d::StaticLayer"
        map_subscribe_transient_local: true

      inflation_layer:
        plugin: "nav2_costmap_2d::InflationLayer"
        # 핵심: inflation_radius = vehicle_width/2 + 여유 (0.03m)
        # 너무 크게 설정하면 주차 공간 진입 자체가 costmap 상 불가능해짐
        inflation_radius: 0.12
        cost_scaling_factor: 3.0

local_costmap:
  local_costmap:
    ros__parameters:
      update_frequency: 5.0
      publish_frequency: 2.0
      global_frame: odom
      robot_base_frame: base_link
      robot_radius: 0.18
      resolution: 0.05
      rolling_window: true
      width: 3
      height: 3
      plugins: ["obstacle_layer", "inflation_layer"]

      obstacle_layer:
        plugin: "nav2_costmap_2d::ObstacleLayer"
        enabled: true
        observation_sources: scan
        scan:
          topic: /scan
          max_obstacle_height: 2.0
          clearing: true
          marking: true
          data_type: "LaserScan"

      inflation_layer:
        plugin: "nav2_costmap_2d::InflationLayer"
        inflation_radius: 0.12
        cost_scaling_factor: 3.0

```


테스트


```python
#평행주차
#!/usr/bin/env python3

import math, heapq, time
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches


# ─────────────────────────────────────────────
# Vehicle
# ─────────────────────────────────────────────

class VehicleConfig:
    def __init__(
        self,
        wheelbase=0.25,
        max_steer_deg=35.0,
        length=0.35,
        width=0.22,
        front_overhang=0.05,
        rear_overhang=0.05
    ):
        self.wheelbase = wheelbase
        self.max_steer = math.radians(max_steer_deg)

        self.length = length
        self.width = width

        self.front_overhang = front_overhang
        self.rear_overhang = rear_overhang

        self.lf = wheelbase + front_overhang
        self.lb = rear_overhang


# ─────────────────────────────────────────────
# Node
# ─────────────────────────────────────────────

class HANode:

    __slots__ = (
        'x', 'y', 'yaw',
        'ix', 'iy', 'iyaw',
        'g', 'h',
        'steer', 'direction',
        'parent_key'
    )

    def __init__(
        self,
        x, y, yaw,
        ix, iy, iyaw,
        g, h,
        steer, direction,
        parent_key=None
    ):
        self.x, self.y, self.yaw = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw

        self.g, self.h = g, h
        self.steer = steer
        self.direction = direction

        self.parent_key = parent_key

    @property
    def f(self):
        return self.g + self.h

    def __lt__(self, other):
        return self.f < other.f


# ─────────────────────────────────────────────
# Hybrid A*
# ─────────────────────────────────────────────

class HybridAStarPlanner:

    def __init__(
        self,
        vehicle_cfg,
        step_size=0.06,
        n_steer=7,
        yaw_resolution=math.radians(5),
        goal_xy_tol=0.08,
        goal_yaw_tol=math.radians(10),
        reverse_cost=1.5,
        dir_change_cost=1.5,
        steer_change_cost=0.5,
        occ_threshold=50,
        max_iter=80000
    ):

        self.vc = vehicle_cfg

        self.step = step_size
        self.yaw_res = yaw_resolution

        self.goal_xy_tol = goal_xy_tol
        self.goal_yaw_tol = goal_yaw_tol

        self.reverse_cost = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost = steer_change_cost

        self.occ_thresh = occ_threshold
        self.max_iter = max_iter

        self.steers = np.linspace(
            -self.vc.max_steer,
            self.vc.max_steer,
            n_steer
        )

        self._yaw_bins = max(
            1,
            int(round(2 * math.pi / self.yaw_res))
        )

    def plan(
        self,
        sx, sy, syaw,
        gx, gy, gyaw,
        occ_grid,
        ox, oy,
        res
    ):

        self._occ = occ_grid
        self._ox, self._oy = ox, oy
        self._res = res

        self._height, self._width = occ_grid.shape

        start = self._make_node(
            sx, sy, syaw,
            g=0.0,
            steer=0.0,
            direction=1,
            parent_key=None
        )

        start.h = self._heuristic(
            sx, sy, syaw,
            gx, gy, gyaw
        )

        open_heap = [(start.f, start)]
        open_dict = {self._key(start): start}
        closed_dict = {}

        iterations = 0

        while open_heap:

            iterations += 1

            if iterations > self.max_iter:
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)

            if ckey in closed_dict:
                continue

            closed_dict[ckey] = cur

            if self._reached_goal(
                cur.x, cur.y, cur.yaw,
                gx, gy, gyaw
            ):
                return self._extract_path(
                    cur,
                    closed_dict,
                    open_dict
                )

            for succ in self._expand(cur, gx, gy, gyaw):

                skey = self._key(succ)

                if skey in closed_dict:
                    continue

                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _expand(self, node, gx, gy, gyaw):

        children = []

        for direction in (1, -1):

            for steer in self.steers:

                nx, ny, nyaw = self._bicycle_step(
                    node.x,
                    node.y,
                    node.yaw,
                    steer,
                    direction
                )

                if not self._in_bounds(nx, ny):
                    continue

                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step

                if direction == -1:
                    cost *= self.reverse_cost

                if direction != node.direction:
                    cost += self.dir_change_cost * self.step

                cost += abs(steer - node.steer) * self.steer_chg_cost

                child = self._make_node(
                    nx, ny, nyaw,
                    g=node.g + cost,
                    steer=steer,
                    direction=direction,
                    parent_key=self._key(node)
                )

                child.h = self._heuristic(
                    nx, ny, nyaw,
                    gx, gy, gyaw
                )

                children.append(child)

        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):

        d = self.step * direction

        dyaw = (d / self.vc.wheelbase) * math.tan(steer)

        mid = yaw + dyaw / 2

        nx = x + d * math.cos(mid)
        ny = y + d * math.sin(mid)

        return nx, ny, self._norm(yaw + dyaw)

    def _in_collision(self, x, y, yaw):

        c, s = math.cos(yaw), math.sin(yaw)

        hw = self.vc.width / 2

        n_lon = max(
            3,
            int(math.ceil(self.vc.length / self._res)) + 1
        )

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):

            cx = x + d * c
            cy = y + d * s

            for w in np.linspace(-hw, hw, 5):

                px = cx - w * s
                py = cy + w * c

                if self._cell_occupied(px, py):
                    return True

        return False

    def _cell_occupied(self, wx, wy):

        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)

        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True

        val = int(self._occ[iy, ix])

        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):

        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)

        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm(yaw - gyaw))

        return (
            dist <= self.goal_xy_tol and
            dyaw <= self.goal_yaw_tol
        )

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)

        dyaw = abs(self._norm(yaw - gyaw))

        rmin = self.vc.wheelbase / math.tan(self.vc.max_steer)

        return max(dist, rmin * dyaw)

    def _extract_path(self, goal_node, closed_dict, open_dict):

        all_nodes = {**closed_dict, **open_dict}

        path = []
        node = goal_node

        while node is not None:

            path.append((node.x, node.y, node.yaw))

            if node.parent_key is None:
                path.reverse()
                return path

            node = all_nodes.get(node.parent_key)

        return None

    def _make_node(
        self,
        x, y, yaw,
        g,
        steer,
        direction,
        parent_key
    ):

        ix = int(round((x - self._ox) / self._res))
        iy = int(round((y - self._oy) / self._res))

        raw = int(round(self._norm(yaw) / self.yaw_res))

        iyaw = raw % self._yaw_bins

        return HANode(
            x, y, yaw,
            ix, iy, iyaw,
            g=g,
            h=0.0,
            steer=steer,
            direction=direction,
            parent_key=parent_key
        )

    def _key(self, node):
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm(a):

        while a > math.pi:
            a -= 2 * math.pi

        while a < -math.pi:
            a += 2 * math.pi

        return a


# ─────────────────────────────────────────────
# Map Utils
# ─────────────────────────────────────────────

def make(w, h, res=0.05):

    ny = int(round(h / res))
    nx = int(round(w / res))

    return np.zeros((ny, nx), dtype=np.int8)


def fill(grid, x0, y0, x1, y1, res=0.05, val=100):

    iy0 = max(0, int(round(y0 / res)))
    iy1 = min(grid.shape[0], int(round(y1 / res)))

    ix0 = max(0, int(round(x0 / res)))
    ix1 = min(grid.shape[1], int(round(x1 / res)))

    grid[iy0:iy1, ix0:ix1] = val


def ow(grid, w, h, res=0.05):

    fill(grid, 0, 0, w, res)
    fill(grid, 0, h - res, w, h)

    fill(grid, 0, 0, res, h)
    fill(grid, w - res, 0, w, h)


# ─────────────────────────────────────────────
# Draw Car
# ─────────────────────────────────────────────

def draw_car(ax, x, y, yaw, vc, color='green', alpha=0.3):

    c, s = math.cos(yaw), math.sin(yaw)

    corners = [
        (vc.lf,  vc.width / 2),
        (vc.lf, -vc.width / 2),
        (-vc.lb, -vc.width / 2),
        (-vc.lb,  vc.width / 2)
    ]

    pts = []

    for lx, ly in corners:

        gx = x + lx * c - ly * s
        gy = y + lx * s + ly * c

        pts.append([gx, gy])

    poly = patches.Polygon(
        pts,
        closed=True,
        edgecolor=color,
        facecolor=color,
        alpha=alpha,
        lw=1.5
    )

    ax.add_patch(poly)


# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────

def main():

    print("=== Hybrid A* Test ===")

    width_m = 1.8
    height_m = 1.6
    res = 0.05

    g = make(width_m, height_m, res)

    ow(g, width_m, height_m, res)

    px, py = 0.875, 1.1
    pw, ph = 0.4, 0.60

    fill(
        g,
        px - ph/2 - 0.06,
        py + pw/2 - 0.06,
        px + ph/2 + 0.06,
        py + pw/2,
        res
    )

    fill(
        g,
        px - ph/2 - 0.06,
        py - pw/2,
        px - ph/2,
        py + pw/2,
        res
    )

    fill(
        g,
        px + ph/2,
        py - pw/2,
        px + ph/2 + 0.06,
        py + pw/2,
        res
    )

    vc = VehicleConfig()

    planner = HybridAStarPlanner(
        vc,
        step_size=0.08,
        max_iter=80000
    )

    sx, sy, syaw = 0.75, 0.60, 0.0

    gyaw = 0.0

    offset = (vc.lf - vc.lb) / 2

    gx = px - offset * math.cos(gyaw)
    gy = py - offset * math.sin(gyaw)

    t0 = time.monotonic()

    path = planner.plan(
        sx, sy, syaw,
        gx, gy, gyaw,
        g,
        0.0, 0.0,
        res
    )

    elapsed_ms = (time.monotonic() - t0) * 1000

    fig, ax = plt.subplots(figsize=(7, 6))

    ax.imshow(
        g,
        cmap='binary',
        origin='lower',
        extent=[0, width_m, 0, height_m],
        alpha=0.6
    )

    if path:

        print(f"SUCCESS ({elapsed_ms:.1f}ms)")

        path_x = [p[0] for p in path]
        path_y = [p[1] for p in path]

        ax.plot(path_x, path_y, color='red', linewidth=2)

        draw_car(ax, sx, sy, syaw, vc, 'green', 0.4)
        draw_car(ax, gx, gy, gyaw, vc, 'blue', 0.4)

        sample_step = max(1, len(path) // 4)

        for idx in range(sample_step, len(path)-1, sample_step):

            x, y, yaw = path[idx]

            draw_car(
                ax,
                x, y, yaw,
                vc,
                'red',
                0.1
            )

        ax.set_title(
            f"SUCCESS ({elapsed_ms:.1f}ms)"
        )

    else:

        print(f"FAIL ({elapsed_ms:.1f}ms)")

        ax.set_title(
            f"FAIL ({elapsed_ms:.1f}ms)"
        )

    ax.set_xlim(-0.05, width_m + 0.05)
    ax.set_ylim(-0.05, height_m + 0.05)

    ax.grid(True)

    plt.savefig(
        "hybrid_astar_test_result.png",
        dpi=150,
        bbox_inches='tight'
    )

    plt.close()

    print("saved: hybrid_astar_test_result.png")


if __name__ == '__main__':
    main()
```


![hybrid_astar_test_result.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f4488183-c564-4609-89eb-6a9114b2eadc/hybrid_astar_test_result.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZBREZRD2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIALygqa%2BFfPr8uy7cn1WgLXEa1Vs7t04QLXB3%2Fm0Ana%2FAiEAmxa8mpmP3S25pUuGC3bC0RreVu1oyn02Wj7ufE3KvSMqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBzEXMMAkVa5nyZGFircA1zdjSuqKIE6D%2F7I8oy7nihsDaYnUt8EBE2sAlMS1qv%2BSXxQBUkS7hcrShwCKjeNMFwFStbTo%2F8G543YQidc%2FUjXSzOfSVqjPLs%2BsxNGUQePNm0dvzOXotFEtZCT44lVqsDCS6FCaQE8Z0QjAOWTi%2BTKAMAB28UhVf42DKgg4jKyZ%2FTnn8c6Rr20Juxl0OFHUBbXvzxWsTtxvauMP2hzGPPwMojuKEOcjjKZ2c31%2FSIxIr1EsJ%2FmNt0yjI8VlfMtM60Tuhr4ZR5OzR8zS%2BAB%2BioW08LfONiEaV3KWmg%2FH6rY2pYsPN0wKh4iLVxt9m7x1lh5UebO87axYdevbW%2BkMKH3wnb2QrexC5DgSWST6Yc7qCytF26vkzT2ROpglveWSZ%2BOx8tT9np8p2hz61H6pdkdRNYoi5PE6SIfYMHsfGWc5HccfjLVcKxIx%2Bdr1zdul7PPE0FD3AeNp2zF8aA0gdhAgG9swjgcNh79dJ7S1kjRZT5CLFI0njhLtsBi5enS%2F9O7rFVvhTT5JgKWRXA8jRIm%2FXYnr3jGe5Opp%2BbNO71QYEpbCm%2F96OmyO1iIAGePhuHJmt0OexmlMxUXpi48aD0cQhGBxKdwaXaLneXxLGjfRH7c%2B5K4ECyU5OZVMM%2FmkNIGOqUB8bS29TPbwSP9f00ZOB3b26GA8PdlJHgoiaU7PBenm6bPUd6voHoPrvA7t%2FmZjm1%2FcLyGoPh9Adn9RAC5NVZUrTNhB1WxOJVLHnEUl5OoMWwkfIQlQvDSNFGGBrAPYK2512h9lBhz7ZQPR%2BaNJppXUDlhImc9%2Bc21jLSiuJIA5HErRZyn%2BiYvbJxUT7R4R39A7ADG1pjfOQOdE0He5zPSd7uY3H2%2F&X-Amz-Signature=c2b784062404c2ad91ab1d2343ea757c028cad27604535ace583769746404fe5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


```python
#T자 주차
#!/usr/bin/env python3

import math, heapq, time
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches


# ─────────────────────────────────────────────
# Vehicle
# ─────────────────────────────────────────────

class VehicleConfig:
    def __init__(
        self,
        wheelbase=0.25,
        max_steer_deg=35.0,
        length=0.35,
        width=0.22,
        front_overhang=0.05,
        rear_overhang=0.05
    ):
        self.wheelbase = wheelbase
        self.max_steer = math.radians(max_steer_deg)

        self.length = length
        self.width = width

        self.front_overhang = front_overhang
        self.rear_overhang = rear_overhang

        self.lf = wheelbase + front_overhang
        self.lb = rear_overhang


# ─────────────────────────────────────────────
# Node
# ─────────────────────────────────────────────

class HANode:

    __slots__ = (
        'x', 'y', 'yaw',
        'ix', 'iy', 'iyaw',
        'g', 'h',
        'steer', 'direction',
        'parent_key'
    )

    def __init__(
        self,
        x, y, yaw,
        ix, iy, iyaw,
        g, h,
        steer, direction,
        parent_key=None
    ):
        self.x, self.y, self.yaw = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw

        self.g, self.h = g, h
        self.steer = steer
        self.direction = direction

        self.parent_key = parent_key

    @property
    def f(self):
        return self.g + self.h

    def __lt__(self, other):
        return self.f < other.f


# ─────────────────────────────────────────────
# Hybrid A*
# ─────────────────────────────────────────────

class HybridAStarPlanner:

    def __init__(
        self,
        vehicle_cfg,
        step_size=0.06,
        n_steer=7,
        yaw_resolution=math.radians(5),
        goal_xy_tol=0.08,
        goal_yaw_tol=math.radians(10),
        reverse_cost=1.5,
        dir_change_cost=1.5,
        steer_change_cost=0.5,
        occ_threshold=50,
        max_iter=80000
    ):

        self.vc = vehicle_cfg

        self.step = step_size
        self.yaw_res = yaw_resolution

        self.goal_xy_tol = goal_xy_tol
        self.goal_yaw_tol = goal_yaw_tol

        self.reverse_cost = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost = steer_change_cost

        self.occ_thresh = occ_threshold
        self.max_iter = max_iter

        self.steers = np.linspace(
            -self.vc.max_steer,
            self.vc.max_steer,
            n_steer
        )

        self._yaw_bins = max(
            1,
            int(round(2 * math.pi / self.yaw_res))
        )

    def plan(
        self,
        sx, sy, syaw,
        gx, gy, gyaw,
        occ_grid,
        ox, oy,
        res
    ):

        self._occ = occ_grid
        self._ox, self._oy = ox, oy
        self._res = res

        self._height, self._width = occ_grid.shape

        start = self._make_node(
            sx, sy, syaw,
            g=0.0,
            steer=0.0,
            direction=1,
            parent_key=None
        )

        start.h = self._heuristic(
            sx, sy, syaw,
            gx, gy, gyaw
        )

        open_heap = [(start.f, start)]
        open_dict = {self._key(start): start}
        closed_dict = {}

        iterations = 0

        while open_heap:

            iterations += 1

            if iterations > self.max_iter:
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)

            if ckey in closed_dict:
                continue

            closed_dict[ckey] = cur

            if self._reached_goal(
                cur.x, cur.y, cur.yaw,
                gx, gy, gyaw
            ):
                return self._extract_path(
                    cur,
                    closed_dict,
                    open_dict
                )

            for succ in self._expand(cur, gx, gy, gyaw):

                skey = self._key(succ)

                if skey in closed_dict:
                    continue

                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _expand(self, node, gx, gy, gyaw):

        children = []

        for direction in (1, -1):

            for steer in self.steers:

                nx, ny, nyaw = self._bicycle_step(
                    node.x,
                    node.y,
                    node.yaw,
                    steer,
                    direction
                )

                if not self._in_bounds(nx, ny):
                    continue

                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step

                if direction == -1:
                    cost *= self.reverse_cost

                if direction != node.direction:
                    cost += self.dir_change_cost * self.step

                cost += abs(steer - node.steer) * self.steer_chg_cost

                child = self._make_node(
                    nx, ny, nyaw,
                    g=node.g + cost,
                    steer=steer,
                    direction=direction,
                    parent_key=self._key(node)
                )

                child.h = self._heuristic(
                    nx, ny, nyaw,
                    gx, gy, gyaw
                )

                children.append(child)

        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):

        d = self.step * direction

        dyaw = (d / self.vc.wheelbase) * math.tan(steer)

        mid = yaw + dyaw / 2

        nx = x + d * math.cos(mid)
        ny = y + d * math.sin(mid)

        return nx, ny, self._norm(yaw + dyaw)

    def _in_collision(self, x, y, yaw):

        c, s = math.cos(yaw), math.sin(yaw)

        hw = self.vc.width / 2

        n_lon = max(
            3,
            int(math.ceil(self.vc.length / self._res)) + 1
        )

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):

            cx = x + d * c
            cy = y + d * s

            for w in np.linspace(-hw, hw, 5):

                px = cx - w * s
                py = cy + w * c

                if self._cell_occupied(px, py):
                    return True

        return False

    def _cell_occupied(self, wx, wy):

        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)

        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True

        val = int(self._occ[iy, ix])

        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):

        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)

        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm(yaw - gyaw))

        return (
            dist <= self.goal_xy_tol and
            dyaw <= self.goal_yaw_tol
        )

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):

        dist = math.hypot(x - gx, y - gy)

        dyaw = abs(self._norm(yaw - gyaw))

        rmin = self.vc.wheelbase / math.tan(self.vc.max_steer)

        return max(dist, rmin * dyaw)

    def _extract_path(self, goal_node, closed_dict, open_dict):

        all_nodes = {**closed_dict, **open_dict}

        path = []
        node = goal_node

        while node is not None:

            path.append((node.x, node.y, node.yaw))

            if node.parent_key is None:
                path.reverse()
                return path

            node = all_nodes.get(node.parent_key)

        return None

    def _make_node(
        self,
        x, y, yaw,
        g,
        steer,
        direction,
        parent_key
    ):

        ix = int(round((x - self._ox) / self._res))
        iy = int(round((y - self._oy) / self._res))

        raw = int(round(self._norm(yaw) / self.yaw_res))

        iyaw = raw % self._yaw_bins

        return HANode(
            x, y, yaw,
            ix, iy, iyaw,
            g=g,
            h=0.0,
            steer=steer,
            direction=direction,
            parent_key=parent_key
        )

    def _key(self, node):
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm(a):

        while a > math.pi:
            a -= 2 * math.pi

        while a < -math.pi:
            a += 2 * math.pi

        return a


# ─────────────────────────────────────────────
# Map Utils
# ─────────────────────────────────────────────

def make(w, h, res=0.05):

    ny = int(round(h / res))
    nx = int(round(w / res))

    return np.zeros((ny, nx), dtype=np.int8)


def fill(grid, x0, y0, x1, y1, res=0.05, val=100):

    iy0 = max(0, int(round(y0 / res)))
    iy1 = min(grid.shape[0], int(round(y1 / res)))

    ix0 = max(0, int(round(x0 / res)))
    ix1 = min(grid.shape[1], int(round(x1 / res)))

    grid[iy0:iy1, ix0:ix1] = val


def ow(grid, w, h, res=0.05):

    fill(grid, 0, 0, w, res)
    fill(grid, 0, h - res, w, h)

    fill(grid, 0, 0, res, h)
    fill(grid, w - res, 0, w, h)


# ─────────────────────────────────────────────
# Draw Car
# ─────────────────────────────────────────────

def draw_car(ax, x, y, yaw, vc, color='green', alpha=0.3):

    c, s = math.cos(yaw), math.sin(yaw)

    corners = [
        (vc.lf,  vc.width / 2),
        (vc.lf, -vc.width / 2),
        (-vc.lb, -vc.width / 2),
        (-vc.lb,  vc.width / 2)
    ]

    pts = []

    for lx, ly in corners:

        gx = x + lx * c - ly * s
        gy = y + lx * s + ly * c

        pts.append([gx, gy])

    poly = patches.Polygon(
        pts,
        closed=True,
        edgecolor=color,
        facecolor=color,
        alpha=alpha,
        lw=1.5
    )

    ax.add_patch(poly)


# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────

def main():

    print("=== Hybrid A* Test ===")

    width_m = 1.8
    height_m = 1.6
    res = 0.05

    g = make(width_m, height_m, res)

    ow(g, width_m, height_m, res)

    px, py = 0.65, 0.37
    pw, ph = 0.30, 0.40

    fill(
        g,
        px - pw/2 - 0.06,
        py - ph/2 - 0.06,
        px + pw/2 + 0.06,
        py - ph/2,
        res
    )

    fill(
        g,
        px - pw/2 - 0.06,
        py - ph/2,
        px - pw/2,
        py + ph/2,
        res
    )

    fill(
        g,
        px + pw/2,
        py - ph/2,
        px + pw/2 + 0.06,
        py + ph/2,
        res
    )

    vc = VehicleConfig()

    planner = HybridAStarPlanner(
        vc,
        step_size=0.08,
        max_iter=80000
    )

    sx, sy, syaw = 0.25, 0.80, 0.0

    gyaw = math.pi / 2

    offset = (vc.lf - vc.lb) / 2

    gx = px - offset * math.cos(gyaw)
    gy = py - offset * math.sin(gyaw)

    t0 = time.monotonic()

    path = planner.plan(
        sx, sy, syaw,
        gx, gy, gyaw,
        g,
        0.0, 0.0,
        res
    )

    elapsed_ms = (time.monotonic() - t0) * 1000

    fig, ax = plt.subplots(figsize=(7, 6))

    ax.imshow(
        g,
        cmap='binary',
        origin='lower',
        extent=[0, width_m, 0, height_m],
        alpha=0.6
    )

    if path:

        print(f"SUCCESS ({elapsed_ms:.1f}ms)")

        path_x = [p[0] for p in path]
        path_y = [p[1] for p in path]

        ax.plot(path_x, path_y, color='red', linewidth=2)

        draw_car(ax, sx, sy, syaw, vc, 'green', 0.4)
        draw_car(ax, gx, gy, gyaw, vc, 'blue', 0.4)

        sample_step = max(1, len(path) // 4)

        for idx in range(sample_step, len(path)-1, sample_step):

            x, y, yaw = path[idx]

            draw_car(
                ax,
                x, y, yaw,
                vc,
                'red',
                0.1
            )

        ax.set_title(
            f"SUCCESS ({elapsed_ms:.1f}ms)"
        )

    else:

        print(f"FAIL ({elapsed_ms:.1f}ms)")

        ax.set_title(
            f"FAIL ({elapsed_ms:.1f}ms)"
        )

    ax.set_xlim(-0.05, width_m + 0.05)
    ax.set_ylim(-0.05, height_m + 0.05)

    ax.grid(True)

    plt.savefig(
        "hybrid_astar_test_result_T.png",
        dpi=150,
        bbox_inches='tight'
    )

    plt.close()

    print("saved: hybrid_astar_T_test_result.png")


if __name__ == '__main__':
    main()
```


![hybrid_astar_test_result_T.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bca57554-2c9f-4ed7-b409-f7ba4c60899d/hybrid_astar_test_result_T.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZBREZRD2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIALygqa%2BFfPr8uy7cn1WgLXEa1Vs7t04QLXB3%2Fm0Ana%2FAiEAmxa8mpmP3S25pUuGC3bC0RreVu1oyn02Wj7ufE3KvSMqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBzEXMMAkVa5nyZGFircA1zdjSuqKIE6D%2F7I8oy7nihsDaYnUt8EBE2sAlMS1qv%2BSXxQBUkS7hcrShwCKjeNMFwFStbTo%2F8G543YQidc%2FUjXSzOfSVqjPLs%2BsxNGUQePNm0dvzOXotFEtZCT44lVqsDCS6FCaQE8Z0QjAOWTi%2BTKAMAB28UhVf42DKgg4jKyZ%2FTnn8c6Rr20Juxl0OFHUBbXvzxWsTtxvauMP2hzGPPwMojuKEOcjjKZ2c31%2FSIxIr1EsJ%2FmNt0yjI8VlfMtM60Tuhr4ZR5OzR8zS%2BAB%2BioW08LfONiEaV3KWmg%2FH6rY2pYsPN0wKh4iLVxt9m7x1lh5UebO87axYdevbW%2BkMKH3wnb2QrexC5DgSWST6Yc7qCytF26vkzT2ROpglveWSZ%2BOx8tT9np8p2hz61H6pdkdRNYoi5PE6SIfYMHsfGWc5HccfjLVcKxIx%2Bdr1zdul7PPE0FD3AeNp2zF8aA0gdhAgG9swjgcNh79dJ7S1kjRZT5CLFI0njhLtsBi5enS%2F9O7rFVvhTT5JgKWRXA8jRIm%2FXYnr3jGe5Opp%2BbNO71QYEpbCm%2F96OmyO1iIAGePhuHJmt0OexmlMxUXpi48aD0cQhGBxKdwaXaLneXxLGjfRH7c%2B5K4ECyU5OZVMM%2FmkNIGOqUB8bS29TPbwSP9f00ZOB3b26GA8PdlJHgoiaU7PBenm6bPUd6voHoPrvA7t%2FmZjm1%2FcLyGoPh9Adn9RAC5NVZUrTNhB1WxOJVLHnEUl5OoMWwkfIQlQvDSNFGGBrAPYK2512h9lBhz7ZQPR%2BaNJppXUDlhImc9%2Bc21jLSiuJIA5HErRZyn%2BiYvbJxUT7R4R39A7ADG1pjfOQOdE0He5zPSd7uY3H2%2F&X-Amz-Signature=561705ce40bd21f73eebfc09927543f46036de2fdbb96d0bee9074db2c5d37d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


라이다 물리적 연결확인 명령어


```json
lsusb
```


**기대하는 결과 :** 출력되는 목록 중에 **`Silicon Labs CP210x UART Bridge`** (또는 이와 비슷한 이름)가 나타나야 합니다. 이게 뜬다면 데이터 통신이 정상적으로 연결


라이다 포트번호 확인


```json
ls -l /dev/ttyUSB*
```


**기대하는 결과 :** `No such file or directory` 에러가 뜨지 않고, **`/dev/ttyUSB0`** 이라는 반가운 이름이 화면에 출력




라이다 실행 명령어


```json
ros2 launch sllidar_ros2 sllidar_a1_launch.py serial_port:=/dev/ttyUSB0
```


### 라이다 그리드 맵 확인


tigerVNC에서 쉘창에 `rviz2` 


**RViz2 세팅하기:**

- 왼쪽 Displays 패널의 **Fixed Frame**을 `map`에서 **`laser`** (또는 `laser_frame`)로 변경합니다.
- 왼쪽 하단의 **Add** 버튼을 누르고 **LaserScan**을 추가합니다.
- 추가된 LaserScan 메뉴의 삼각형을 눌러 확장한 뒤, **Topic**을 **`/scan`*으로 선택합니다.

### 참고


라이다 센서 점근권한 열어주기


```json
sudo chmod 666 /dev/ttyUSB0
```


---


## option1 : 라이다 그리드 맵 좌표 반환


```python
import rclpy
from rclpy.node import Node
from nav_msgs.msg import OccupancyGrid
from geometry_msgs.msg import PoseArray, Pose
import numpy as np
import cv2

class ParkingSpotDetector(Node):
    def __init__(self):
        super().__init__('parking_spot_detector')
        
        # 1. 구독 및 발행 설정
        self.subscription = self.create_subscription(
            OccupancyGrid,
            '/map',  # rviz2에서 확인한 맵 토픽명
            self.map_callback,
            10)
        
        # 주차 가능 공간 좌표를 발행 (Rviz2 시각화용)
        self.pose_pub = self.create_publisher(PoseArray, '/detected_parking_spots', 10)

        # 2. 주차 공간 파라미터 (단위: 미터)
        self.spot_width_m = 2.5   # 주차 칸 가로
        self.spot_height_m = 5.0  # 주차 칸 세로
        self.margin = 0.2         # 최소 여유 공간

    def map_callback(self, msg):
        # 맵 정보 추출
        res = msg.info.resolution
        width = msg.info.width
        height = msg.info.height
        origin = msg.info.origin.position

        # 1차원 데이터를 2차원 Numpy 배열로 변환
        # 0: Free, 100: Occupied, -1: Unknown
        raw_data = np.array(msg.data).reshape((height, width))

        # 데이터 전처리: 빈 공간(0)은 255로, 나머지는 0으로 이진화
        binary_map = np.where(raw_data == 0, 255, 0).astype(np.uint8)

        # 주차 공간 크기를 픽셀 단위로 변환
        pixel_w = int((self.spot_width_m + self.margin) / res)
        pixel_h = int((self.spot_height_m + self.margin) / res)

        # 3. 템플릿 매칭 (빈 직사각형 찾기)
        # 주차 공간 크기의 흰색(255) 사각형 생성
        template = np.full((pixel_h, pixel_w), 255, dtype=np.uint8)
        
        # 템플릿과 일치하는 영역 탐색
        result = cv2.matchTemplate(binary_map, template, cv2.TM_SQDIFF)
        
        # 차이값이 0에 가까운(빈 공간인) 지점 필터링
        threshold = 0.1
        loc = np.where(result <= threshold)

        # 4. 결과 처리 및 좌표 발행
        parking_poses = PoseArray()
        parking_poses.header.frame_id = "map"
        parking_poses.header.stamp = self.get_clock().now().to_msg()

        # 중복 검출 방지를 위해 일정 간격으로 샘플링
        detected_points = zip(*loc[::-1])
        last_added = None

        for pt in detected_points:
            # 월드 좌표계(m)로 변환
            world_x = origin.x + (pt[0] * res)
            world_y = origin.y + (pt[1] * res)

            # 너무 가까운 포인트들은 무시 (간단한 필터링)
            if last_added is None or (abs(world_x - last_added[0]) > 1.0 or abs(world_y - last_added[1]) > 1.0):
                pose = Pose()
                pose.position.x = world_x + (self.spot_width_m / 2)
                pose.position.y = world_y + (self.spot_height_m / 2)
                parking_poses.poses.append(pose)
                last_added = (world_x, world_y)

        self.pose_pub.publish(parking_poses)
        self.get_logger().info(f"검출된 주차 공간 개수: {len(parking_poses.poses)}")

def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpotDetector()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


### 코드 사용 및 확인 방법

1. **파라미터 수정:** `self.spot_width_m`과 `self.spot_height_m`을 현재 사용 중인 시뮬레이션 환경이나 실제 주차장 규격에 맞춰 수정하세요.
2. **Rviz2 시각화:**
	- Rviz2를 실행합니다.
	- **Add** -> **By topic** -> `/detected_parking_spots` (**PoseArray**)를 추가합니다.
	- 맵 위에 화살표나 점으로 표시되는 지점이 주차 가능한 후보지입니다.
3. **성능 최적화:** 라즈베리파이 4에서 속도가 느리다면 `map_callback` 내에서 `cv2.resize()`를 이용해 맵 크기를 줄여 처리하거나, 차량 주변 5~10m 영역만 슬라이싱하여 연산하도록 코드를 보완할 수 있습니다.

이 코드는 "빈 공간"을 찾는 데 집중되어 있습니다. 이후에 **Hybrid A*** 알고리즘을 여기에 연결하면, 검출된 `PoseArray` 중 현재 차량 위치에서 가장 가까운 좌표를 목표물(Goal)로 설정하여 자동 주차 경로를 생성하게 됩니다.


---


### 라이다 출력 테스트


```python
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan

class LidarSubscriber(Node):
    def __init__(self):
        super().__init__('lidar_subscriber')
        # /scan 토픽을 구독하는 Subscriber 생성
        self.subscription = self.create_subscription(
            LaserScan,
            '/scan',
            self.scan_callback,
            10  # QoS 설정 (필요시 rclpy.qos.qos_profile_sensor_data 사용)
        )
        self.subscription  # prevent unused variable warning

    def scan_callback(self, msg):
        # 콜백 함수: /scan 데이터가 들어올 때마다 실행됨
        ranges = msg.ranges
        
        # 예시: 특정 각도(대략적인 전, 후, 좌, 우)의 데이터 추출
        # (실제 센서의 0도 방향이 어디인지 확인 후 인덱스를 조정해야 합니다)
        total_points = len(ranges)
        front_idx = 0                  # 0도 (가정)
        left_idx = total_points // 4     # 90도 (가정)
        back_idx = total_points // 2     # 180도 (가정)
        right_idx = total_points * 3 // 4 # 270도 (가정)

        front_dist = ranges[front_idx]
        left_dist = ranges[left_idx]
        back_dist = ranges[back_idx]
        right_dist = ranges[right_idx]

        self.get_logger().info(f'정면: {front_dist:.2f}m, 좌측: {left_dist:.2f}m, 후면: {back_dist:.2f}m, 우측: {right_dist:.2f}m')
        
        # ----------------------------------------------------
        # TODO 1: (프로젝트 목표) 장애물 인지 및 경고 (PDW)
        # 예: 전방 0.5m 이내에 장애물이 감지되면 경고 플래그 활성화
        # ----------------------------------------------------
        
        # ----------------------------------------------------
        # TODO 2: (프로젝트 목표) 긴급 제동 (PCA/AEB)
        # 예: 전방 0.15m 이내에 장애물이 감지되면 긴급 제동 플래그 활성화
        # ----------------------------------------------------

def main(args=None):
    rclpy.init(args=args)
    lidar_subscriber = LidarSubscriber()
    rclpy.spin(lidar_subscriber)
    lidar_subscriber.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
```


### 실패


```python
ros2 run tf2_ros static_transform_publisher 0 0 0 0 0 0 map laser
```


## STM32[CUBEMX]

### 초기설정


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/719d2285-b601-403f-991a-e89e533ea909/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=86ac8a9b7897364183ecdc3126c7ca67e1460d11b5ddffe397056a7efe887a7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1109438d-9e25-4fc7-96da-7b0d4b7cb274/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=2d5fb427ab400600aeb3f6c182d0bdc8704d4b033026421c142b84131c63e200&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- ACCESS TO MCU SELECTOR에서 STM32F407FVET6 모델 선택 → start project

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/59e3d70c-016b-4a3b-a83a-81e95ebe9271/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=fc653af2a22c59c8ebb677ae489e0695f4bf9720f38b0cb16864e4fc42527b30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴창 System Core에서 SYS → Debug → Serial Wire
- 왼쪽 메뉴창 System Core에서 RCC → HSE → Crystal/Ceramic 항목

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1745a8fd-aa13-47f3-a053-44075cba6edc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=d7ca7b5d4fa6b83a76425166a29693c193041cdc4eb9a2bd341318b49b318e8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 위 메뉴 Clock Configuration에서 그림과 같이 숫자 설정

### 엔코더 핀 설정

- 왼쪽 메뉴에서 Timers → TIM5, TIM2 클릭 → Combined Channels → Encoder Mode 선택
- 오른쪽 보드 이미지에서 PA15 찾아서 클릭 → TIM2_CH1 으로 설정
- TIM5 CH1~2는 PA0, PA1 | TIM2 CH1~2는 PA15, PB3

### 구동모터 핀 설정

- 왼쪽 메뉴에서 Timers → TIM1 클릭 → Channel 1~4 PWM Generation CHx 선택
- PE9, PE11, PE13, PE14 TIM1 Channel 1~4 할당
- Parameter Settings → Prescaler 0 , Counter period 60000

### 서보모터 핀 설정

- 칩셋 이미지에서 PA12 클릭 → GPIO_Output 선택
- 왼쪽 메뉴 중 System Core에서 GPIO 클릭 → PA12 선택해서 아래 Configuration에서 User Label → SERVO_PIN으로 변경

그러면 칩셋 이미지가 아래 그림처럼 나옴


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/b3435a1c-cf6a-4420-a3be-e2268f0bc0a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=26284eef943b2d93c809204c234df5beb0209c052c6a3151c74701fb24db000e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### MX project → IDE project로 생성


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ac8ff79-7546-49db-b00c-4fb16b503e9e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T5KN3NPK%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222209Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJGMEQCIAhlJ0R3uCGOseODxEqP7rvi4a%2B575wdUyXob4BsBkiCAiAXHdU0gYOkMwbl%2BOmkMjKUjGAgg1gWXbmBAKEGFGFyJyqIBAjO%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMf6sp9vmMFEqmH0tqKtwD1fptT321Gdc7um72qeM3cWEF7Cm4sM1zSEG2EacyhYW1SOvmoYkAe3c2OELpOIDwkFxEgBAoFEwBNu1LeRg2lV9e0nuhCULdp1AhFxm1hWvTWJtHAm1Of1ilVJzLP8rPrtIMfzPaZVQTqWy8DTAb%2Fk5COuK0PITicMGZuYvwuBJ4%2BC6r%2FPitIhNt92uwhq8IzuZTwqkyBmRyPBKbl8EcylkZQeQj4B6Zq7ubiuPDb%2BcFzEcAgz%2BEGjxBHUZeCBf3liC8Nr5HZSVu%2Fhx0%2FWKJ7Dyr6t8lORHWqtkh7EN3SdnkdUKTsDtZR1rg34NIm6WIUJAbLbkqKRIU20nV%2Bd1XPo2tDuF2DDVLT1%2F%2BisjdM6gvnBndiXVTYx8sg0FFYVVzbroXmzZQYASGTWXIV0v%2FDFwYoMOqS6xWG1OAPBrSc6XCsDnowSfhMm0k1f05H4Wla3wOv4Dvr58yeZYbl7BtQsuvPAeMSRlD0xlo2DeUHPI7iPSmgkkx5FuCTIU4hjUSmjQ1FmzhsMBWgWqmj39jllICv%2BPqebBb4xBfrByCwyk9tE8L3UJ4gpSnKmzbDa6OX31tzLKBW8inzQa7psU7oa35P122YlQhegeKJN0N5tTCf6TEvX2vFouh1lMw%2B%2BeQ0gY6pgFitV7UAfNj%2FGgp9YQrZKI1Tk%2BUlSsUpkVQ21V%2BXen8wBWJ0PJkNJJ2q9mPpNPD2PEQ4bmk3yo0wDWbEOGEo748gMGFTTSCUSPvV0h%2F%2Fi6F%2BYSaxzmDkO4uL58QepVTsWH7KjKmzhOITeD5cwnkG6iSdxCAPrlC9%2BqI0NwN1czovhqy%2FkqDbsZObIapMHPvZa9F%2FKMCgYkFdX5IWU5Ze%2BqSQNnDPsph&X-Amz-Signature=05d9d2f6fd7328900e18ca8c952847ec64cd74b665249e8583281222c91681f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 위 메뉴에서 Project Manager 클릭 → Toolchain / IDE → STM32CubeIDE 선택
- 이름 설정 하고 GENERATE CODE 클릭

## STM32[CUBEIDE]

### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVHLLNR2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIA2kRNzKloMkR%2BanIc92np8tqpQR56cXEO%2F8eNM9dUhLAiEAiC0vi6WvtYwrUgmlWy3XmtdoeokS3zAJXgH3fHKe514qiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDII9yBYfuSea9k1HdyrcAzrYgphkrI%2BPBmX6wu19xeV8zx0MUDR5uHBZyV3oZw5SQ6I2aGz%2F4UyFn61sOqTwV4H2yXhhp5p7sB3lIvufHn%2BJk0Vqvajll4GXERS8IhkNyFzUpi6n5EUUBvYF3KkU232kN9KAChTWnM7oPqEi87cZin3CXVaoA%2B4%2Fgab1rcvDjx%2FmDV%2BXHgzrQp2r%2FxJcwK63Rc7avnbsZrpmVAoOEOIfM9oQ8xrMp0KH46%2F2IxH7LkXNoYBKzqsxDaZicqPD5u84T3TfbrkpVDtAVkDbAYOd1jcJH%2BeUIeh%2FboGkR7HNHvdb3FWWLsVi2fLeE4Edy6IiR1aJfXE1vNTbOoQoaGZB11QKttYQ6Xzu7HLf7lcCHyxZTZCPDHXCXRl6Q3eHD9xO3p6BCxGZtpSQzO3VOLJt%2BeLSmwkVLx2I7u56b7bv2bicvE9zz06YN4NCUoUmezeFcn%2FKWAqmr18rcI%2BLaCb%2FzS3ISkXS2V%2BMAxcr%2Bbp3Kqhz%2FiO4fia4AnkLs0JiO16g7IXso9BC%2FUtZVhRAFzClj%2Bc4nT5fHlN7k3uvaIamsq9V6li5lCnRts%2B4oyzWvd9V%2BWbPxA2maWNwHEs7UhwoBYwxVofHy3hdfIlhCftQ2d3yGlFM7rufVJnqMK7okNIGOqUBCyzy%2FyFNDhAXmiyj7o3UHdqWFL6cs%2F0fi%2BmajRodsq9Xug%2B3R6lkvtBN%2BasntTrm5AjYMFKpOlXB757MAAPy5BCq4RcUk%2BFGzXksmbBmIy%2F6kyYjSEBm4q5QXqOWETCK7v65LmboHzmEzOhb5BhpIuCXXOzPrCiVc7VxVbwx02VLs92tGD7Pk475LktkImZFdhbehkEj2OZBX%2FTX%2BUqPQ5FU6egi&X-Amz-Signature=764cf121848d1b2d70a71f2ff8d4f832b4074558531a5a1148ee35e992877fdf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVHLLNR2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIA2kRNzKloMkR%2BanIc92np8tqpQR56cXEO%2F8eNM9dUhLAiEAiC0vi6WvtYwrUgmlWy3XmtdoeokS3zAJXgH3fHKe514qiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDII9yBYfuSea9k1HdyrcAzrYgphkrI%2BPBmX6wu19xeV8zx0MUDR5uHBZyV3oZw5SQ6I2aGz%2F4UyFn61sOqTwV4H2yXhhp5p7sB3lIvufHn%2BJk0Vqvajll4GXERS8IhkNyFzUpi6n5EUUBvYF3KkU232kN9KAChTWnM7oPqEi87cZin3CXVaoA%2B4%2Fgab1rcvDjx%2FmDV%2BXHgzrQp2r%2FxJcwK63Rc7avnbsZrpmVAoOEOIfM9oQ8xrMp0KH46%2F2IxH7LkXNoYBKzqsxDaZicqPD5u84T3TfbrkpVDtAVkDbAYOd1jcJH%2BeUIeh%2FboGkR7HNHvdb3FWWLsVi2fLeE4Edy6IiR1aJfXE1vNTbOoQoaGZB11QKttYQ6Xzu7HLf7lcCHyxZTZCPDHXCXRl6Q3eHD9xO3p6BCxGZtpSQzO3VOLJt%2BeLSmwkVLx2I7u56b7bv2bicvE9zz06YN4NCUoUmezeFcn%2FKWAqmr18rcI%2BLaCb%2FzS3ISkXS2V%2BMAxcr%2Bbp3Kqhz%2FiO4fia4AnkLs0JiO16g7IXso9BC%2FUtZVhRAFzClj%2Bc4nT5fHlN7k3uvaIamsq9V6li5lCnRts%2B4oyzWvd9V%2BWbPxA2maWNwHEs7UhwoBYwxVofHy3hdfIlhCftQ2d3yGlFM7rufVJnqMK7okNIGOqUBCyzy%2FyFNDhAXmiyj7o3UHdqWFL6cs%2F0fi%2BmajRodsq9Xug%2B3R6lkvtBN%2BasntTrm5AjYMFKpOlXB757MAAPy5BCq4RcUk%2BFGzXksmbBmIy%2F6kyYjSEBm4q5QXqOWETCK7v65LmboHzmEzOhb5BhpIuCXXOzPrCiVc7VxVbwx02VLs92tGD7Pk475LktkImZFdhbehkEj2OZBX%2FTX%2BUqPQ5FU6egi&X-Amz-Signature=fde8ba7cc29f3b81d5d9b5461b72214f9638e69abe6fa89073572b785edcfbca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVHLLNR2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIA2kRNzKloMkR%2BanIc92np8tqpQR56cXEO%2F8eNM9dUhLAiEAiC0vi6WvtYwrUgmlWy3XmtdoeokS3zAJXgH3fHKe514qiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDII9yBYfuSea9k1HdyrcAzrYgphkrI%2BPBmX6wu19xeV8zx0MUDR5uHBZyV3oZw5SQ6I2aGz%2F4UyFn61sOqTwV4H2yXhhp5p7sB3lIvufHn%2BJk0Vqvajll4GXERS8IhkNyFzUpi6n5EUUBvYF3KkU232kN9KAChTWnM7oPqEi87cZin3CXVaoA%2B4%2Fgab1rcvDjx%2FmDV%2BXHgzrQp2r%2FxJcwK63Rc7avnbsZrpmVAoOEOIfM9oQ8xrMp0KH46%2F2IxH7LkXNoYBKzqsxDaZicqPD5u84T3TfbrkpVDtAVkDbAYOd1jcJH%2BeUIeh%2FboGkR7HNHvdb3FWWLsVi2fLeE4Edy6IiR1aJfXE1vNTbOoQoaGZB11QKttYQ6Xzu7HLf7lcCHyxZTZCPDHXCXRl6Q3eHD9xO3p6BCxGZtpSQzO3VOLJt%2BeLSmwkVLx2I7u56b7bv2bicvE9zz06YN4NCUoUmezeFcn%2FKWAqmr18rcI%2BLaCb%2FzS3ISkXS2V%2BMAxcr%2Bbp3Kqhz%2FiO4fia4AnkLs0JiO16g7IXso9BC%2FUtZVhRAFzClj%2Bc4nT5fHlN7k3uvaIamsq9V6li5lCnRts%2B4oyzWvd9V%2BWbPxA2maWNwHEs7UhwoBYwxVofHy3hdfIlhCftQ2d3yGlFM7rufVJnqMK7okNIGOqUBCyzy%2FyFNDhAXmiyj7o3UHdqWFL6cs%2F0fi%2BmajRodsq9Xug%2B3R6lkvtBN%2BasntTrm5AjYMFKpOlXB757MAAPy5BCq4RcUk%2BFGzXksmbBmIy%2F6kyYjSEBm4q5QXqOWETCK7v65LmboHzmEzOhb5BhpIuCXXOzPrCiVc7VxVbwx02VLs92tGD7Pk475LktkImZFdhbehkEj2OZBX%2FTX%2BUqPQ5FU6egi&X-Amz-Signature=ebfe5f21cb0d95190866de5cead98fd7a6a3908b5b2c7eec038529d1d2dd65ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVHLLNR2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIA2kRNzKloMkR%2BanIc92np8tqpQR56cXEO%2F8eNM9dUhLAiEAiC0vi6WvtYwrUgmlWy3XmtdoeokS3zAJXgH3fHKe514qiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDII9yBYfuSea9k1HdyrcAzrYgphkrI%2BPBmX6wu19xeV8zx0MUDR5uHBZyV3oZw5SQ6I2aGz%2F4UyFn61sOqTwV4H2yXhhp5p7sB3lIvufHn%2BJk0Vqvajll4GXERS8IhkNyFzUpi6n5EUUBvYF3KkU232kN9KAChTWnM7oPqEi87cZin3CXVaoA%2B4%2Fgab1rcvDjx%2FmDV%2BXHgzrQp2r%2FxJcwK63Rc7avnbsZrpmVAoOEOIfM9oQ8xrMp0KH46%2F2IxH7LkXNoYBKzqsxDaZicqPD5u84T3TfbrkpVDtAVkDbAYOd1jcJH%2BeUIeh%2FboGkR7HNHvdb3FWWLsVi2fLeE4Edy6IiR1aJfXE1vNTbOoQoaGZB11QKttYQ6Xzu7HLf7lcCHyxZTZCPDHXCXRl6Q3eHD9xO3p6BCxGZtpSQzO3VOLJt%2BeLSmwkVLx2I7u56b7bv2bicvE9zz06YN4NCUoUmezeFcn%2FKWAqmr18rcI%2BLaCb%2FzS3ISkXS2V%2BMAxcr%2Bbp3Kqhz%2FiO4fia4AnkLs0JiO16g7IXso9BC%2FUtZVhRAFzClj%2Bc4nT5fHlN7k3uvaIamsq9V6li5lCnRts%2B4oyzWvd9V%2BWbPxA2maWNwHEs7UhwoBYwxVofHy3hdfIlhCftQ2d3yGlFM7rufVJnqMK7okNIGOqUBCyzy%2FyFNDhAXmiyj7o3UHdqWFL6cs%2F0fi%2BmajRodsq9Xug%2B3R6lkvtBN%2BasntTrm5AjYMFKpOlXB757MAAPy5BCq4RcUk%2BFGzXksmbBmIy%2F6kyYjSEBm4q5QXqOWETCK7v65LmboHzmEzOhb5BhpIuCXXOzPrCiVc7VxVbwx02VLs92tGD7Pk475LktkImZFdhbehkEj2OZBX%2FTX%2BUqPQ5FU6egi&X-Amz-Signature=11f278378ba826d66739849b1e0dd02d0149901f58d6ad4980aa963ed2159322&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SVHLLNR2%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIA2kRNzKloMkR%2BanIc92np8tqpQR56cXEO%2F8eNM9dUhLAiEAiC0vi6WvtYwrUgmlWy3XmtdoeokS3zAJXgH3fHKe514qiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDII9yBYfuSea9k1HdyrcAzrYgphkrI%2BPBmX6wu19xeV8zx0MUDR5uHBZyV3oZw5SQ6I2aGz%2F4UyFn61sOqTwV4H2yXhhp5p7sB3lIvufHn%2BJk0Vqvajll4GXERS8IhkNyFzUpi6n5EUUBvYF3KkU232kN9KAChTWnM7oPqEi87cZin3CXVaoA%2B4%2Fgab1rcvDjx%2FmDV%2BXHgzrQp2r%2FxJcwK63Rc7avnbsZrpmVAoOEOIfM9oQ8xrMp0KH46%2F2IxH7LkXNoYBKzqsxDaZicqPD5u84T3TfbrkpVDtAVkDbAYOd1jcJH%2BeUIeh%2FboGkR7HNHvdb3FWWLsVi2fLeE4Edy6IiR1aJfXE1vNTbOoQoaGZB11QKttYQ6Xzu7HLf7lcCHyxZTZCPDHXCXRl6Q3eHD9xO3p6BCxGZtpSQzO3VOLJt%2BeLSmwkVLx2I7u56b7bv2bicvE9zz06YN4NCUoUmezeFcn%2FKWAqmr18rcI%2BLaCb%2FzS3ISkXS2V%2BMAxcr%2Bbp3Kqhz%2FiO4fia4AnkLs0JiO16g7IXso9BC%2FUtZVhRAFzClj%2Bc4nT5fHlN7k3uvaIamsq9V6li5lCnRts%2B4oyzWvd9V%2BWbPxA2maWNwHEs7UhwoBYwxVofHy3hdfIlhCftQ2d3yGlFM7rufVJnqMK7okNIGOqUBCyzy%2FyFNDhAXmiyj7o3UHdqWFL6cs%2F0fi%2BmajRodsq9Xug%2B3R6lkvtBN%2BasntTrm5AjYMFKpOlXB757MAAPy5BCq4RcUk%2BFGzXksmbBmIy%2F6kyYjSEBm4q5QXqOWETCK7v65LmboHzmEzOhb5BhpIuCXXOzPrCiVc7VxVbwx02VLs92tGD7Pk475LktkImZFdhbehkEj2OZBX%2FTX%2BUqPQ5FU6egi&X-Amz-Signature=f4563bcd331aa20a402794bdcf488a50e927847390605c7a0af44fcc771edfc5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 위에 망치모양 아이콘 눌러서 build → 위 초록색 run 누르면 생성되는 창에서 Debugger 클릭 → Debug probe SEGGER J-LINK 선택

## code main


```c
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_TIM5_Init();
  MX_TIM7_Init();
  /* USER CODE BEGIN 2 */
  // 구동 모터용 PWM 4개 채널 모두 시작
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_4);

  // M1, M2 엔코더 타이머 시작
  // 디버깅 모드에서 TIM5->CNT, TIM2->CNT 값을 확인하시면 모터 회전에 따라 값이 변하는 것을 볼 수 있습니다.
  HAL_TIM_Encoder_Start(&htim5, TIM_CHANNEL_ALL); // M1 엔코더
  HAL_TIM_Encoder_Start(&htim2, TIM_CHANNEL_ALL); // M2 엔코더
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	 
	  // 1. M1, M2 동시 전진
	 	  Motor1_Control(30000, 1);
	 	  Motor2_Control(30000, 1);
	 	  HAL_Delay(2000); // 2초 대기

	 	  // 2. 정지
	 	  Motor1_Control(0, 0);
	 	  Motor2_Control(0, 0);
	 	  HAL_Delay(2000); // 1초 대기

	 	  // 3. M1, M2 동시 후진
	 	  Motor1_Control(30000, -1);
	 	  Motor2_Control(30000, -1);
	 	  HAL_Delay(2000); // 2초 대기

	 	  // 4. 정지
	 	  Motor1_Control(0, 0);
	 	  Motor2_Control(0, 0);
	 	  HAL_Delay(2000); // 1초 대기
	 	  
	  // --- 조향 한계점 테스트 및 스윕(Sweep) 구동 ---

	      // 1. 좌회전 한계 테스트 (1900에서 100씩 깎아보며 확인)
	      // 1800, 1700, 1600... 숫자를 내려보며 바퀴가 닿지 않는 안전한 최소값을 찾습니다.
	      // 임시로 1400을 좌측 끝으로 가정했습니다.
	      for(int i = 0; i < 50; i++) {
	          Servo_GPIO_Control(1200);
	      }
	      HAL_Delay(500);

	      // 2. 직진 (형님이 찾으신 완벽한 영점!)
	      for(int i = 0; i < 50; i++) {
	          Servo_GPIO_Control(1900);
	      }
	      HAL_Delay(500);

	      // 3. 우회전 한계 테스트 (1900에서 100씩 올려보며 확인)
	      // 2000, 2100, 2200... 숫자를 올려보며 바퀴가 닿지 않는 안전한 최대값을 찾습니다.
	      // 임시로 2400을 우측 끝으로 가정했습니다.
	      for(int i = 0; i < 50; i++) {
	          Servo_GPIO_Control(2800);
	      }
	      HAL_Delay(500);
  }
  /* USER CODE END 3 */
}
```


### 서보모터 각도 펄스

- 왼쪽 : 1200
- 중앙 : 1900
- 오른쪽 : 2800

# Source Code


## 아두이노

## PDW

**칼만 필터 적용  (Arduino Mega 2560) → PDW 기능 구현**


```arduino
//PDW
#include <SimpleKalmanFilter.h>

// ─── 핀 설정 ─────────────────────────────────────────────────
const int trigPins[4]  = {22, 24, 26, 28};  // 전, 후, 좌, 우
const int echoPins[4]  = {23, 25, 27, 29};
const int BUZZER_PIN   = 11;

// ─── SimpleKalmanFilter(e_mea, e_est, q) ─────────────────────
// e_mea : 측정 노이즈 공분산
// e_est : 추정 오차 초기값
// q     : 프로세스 노이즈 (낮을수록 부드러움)
SimpleKalmanFilter filters[4] = {
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01),
  SimpleKalmanFilter(0.1, 0.1, 0.01)
};

// ─── 경계 및 채터링 방지 마진 ────────────────────────────────
const float MARGIN     = 0.3;   // 히스테리시스 마진 (cm)
const float BOUNDARY_1 = 2.0;  
const float BOUNDARY_2 = 5.0;  
const float BOUNDARY_3 = 8.0;  
const float BOUNDARY_4 = 11.0;

// 현재 PDW 단계 (0=안전, 1=주의, 2=경고, 3=위험)
int pdwState = 0;

// ─── 초음파 거리 측정 ────────────────────────────────────────
float getDistance(int id) {
  digitalWrite(trigPins[id], LOW);
  delayMicroseconds(2);
  digitalWrite(trigPins[id], HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPins[id], LOW);

  long duration = pulseIn(echoPins[id], HIGH, 20000);
  if (duration == 0) return 400.0;
  return duration * 0.0343 / 2.0;
}

// ─── 히스테리시스 적용 PDW 상태 전환 ────────────────────────
// 현재 단계에서 벗어나려면 경계 ± MARGIN을 완전히 넘어야 전환
// 예) 단계2(경고)→단계1(주의) 전환 조건: minDist > BOUNDARY_2 + MARGIN
//     단계1(주의)→단계2(경고) 전환 조건: minDist < BOUNDARY_2 - MARGIN
int getNextState(float minDist, int currentState) {
  switch (currentState) {

    case 0:  // 안전 → 주의 전환 조건
      if (minDist < BOUNDARY_4) return 1;
      return 0;

    case 1:  // 주의
      if (minDist < BOUNDARY_3) return 2;  // 주의 → 경고
      if (minDist > BOUNDARY_4 + MARGIN) return 0;  // 주의 → 안전
      return 1;

    case 2:  // 경고
      if (minDist < BOUNDARY_2) return 3;  // 경고 → 위험
      if (minDist > BOUNDARY_3 + MARGIN) return 1;  // 경고 → 주의
      return 2;
    
    case 3:  // 위험
      if (minDist < BOUNDARY_1) return 4;  // 경고 → 위험
      if (minDist > BOUNDARY_2 + MARGIN) return 2;  // 경고 → 주의
      return 3;

    case 4:  // 제동
      if (minDist > BOUNDARY_1 + MARGIN) return 3;  // 위험 → 경고
      return 4;
      

    default:
      return 0;
  }
}

// ─── PDW 부저 출력 ───────────────────────────────────────────
void updatePDW(float minDist) {
  pdwState = getNextState(minDist, pdwState);

  switch (pdwState) {
    case 4:  // 제동 (2cm 미만): 지속음
      digitalWrite(BUZZER_PIN, HIGH);
      break;
    case 3:  // 위험 (5cm 미만): 빠른 단속음 200ms 주기
      digitalWrite(BUZZER_PIN, HIGH);
      break;
    case 2:  // 경고 (8cm 미만)
      digitalWrite(BUZZER_PIN, (millis() % 200 < 100));
      break;
    case 1:  // 주의 (11cm 미만): 느린 단속음 600ms 주기
      digitalWrite(BUZZER_PIN, (millis() % 600 < 100));
      break;
    case 0:  // 안전: 무음
    default:
      digitalWrite(BUZZER_PIN, LOW);
      break;
  }
}

// ─── Setup ───────────────────────────────────────────────────
void setup() {
  Serial.begin(115200);
  for (int i = 0; i < 4; i++) {
    pinMode(trigPins[i], OUTPUT);
    pinMode(echoPins[i], INPUT);
  }
  pinMode(BUZZER_PIN, OUTPUT);
}

// ─── Loop ────────────────────────────────────────────────────
void loop() {
  float minD = 400.0;

  Serial.print("S");
  for (int i = 0; i < 4; i++) {
    float raw = getDistance(i);
    float filtered = filters[i].updateEstimate(raw);

    if (filtered < minD) minD = filtered;

    Serial.print(",");
    Serial.print(filtered, 1);
  }
  Serial.println(",E");

  updatePDW(minD);
  delay(50);
}
```


## 라즈베리 파이

```text
~/spas_ws/
└── src/
    ├── sllidar_ros2/                     # (오픈소스) RPLIDAR A1 구동 패키지
    ├── slam_toolbox/                     # (오픈소스) 2D 지도 생성 패키지
    │
    ├── spas_bringup/                     # 🚀 [통합 제어] 시스템 전체를 켜주는 마스터 패키지
    │   ├── CMakeLists.txt
    │   ├── package.xml
    │   └── launch/
    │       └── spas_bringup_launch.py    # 방법1: 단 한 줄로 시동 거는 마스터 런치 파일
    │
    ├── spas_perception/                  # 👁️ [인지 레이어] 
    │   ├── package.xml
    │   ├── setup.py
    │   └── spas_perception/
    │       └── sensor_filter_node.py     # 아두이노 초음파 수신 및 파싱 노드
    │
    ├── spas_planning/                    # 🧠 [판단 레이어]
    │   ├── package.xml
    │   ├── setup.py
    │   └── spas_planning/
    │       ├── parking_space_detector.py # 주차 칸 탐지 노드
    │       ├── hybrid_A_star_node.py     # 하이브리드 A* 경로 생성 노드
    │       ├── vehicle_control_node.py   # 경로 추적 제어 노드 (Pure Pursuit 등)
    │       └── safety_node.py            # 긴급 제동 및 PDW 감시 노드
    │
    └── spas_control/                     # ⚙️ [제어 레이어]
        ├── package.xml
        ├── setup.py
        └── spas_control/
            └── stm32_bridge_node.py      # STM32 UART 통신 및 /odom 동적 발행 노드
```


## src

## spas_bringup

## CMakeLists.txt

```text
cmake_minimum_required(VERSION 3.8)
project(spas_bringup)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic -std=c++17)
endif()

find_package(ament_cmake REQUIRED)

# 💡 launch 폴더 안에 있는 모든 런치 파일을 인스톨(빌드 타겟에 포함)하라는 명령
install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
```


```text
cmake_minimum_required(VERSION 3.8)
project(spas_bringup)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()

```


## launch

## spas_bringup_launch.py

```python
x`import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node

def generate_launch_description():
    # 1. 기성품 오픈소스 패키지들의 설치 경로(Share 디렉토리) 가져오기
    sllidar_share = get_package_share_directory('sllidar_ros2')
    slam_toolbox_share = get_package_share_directory('slam_toolbox')

    # 2. 기성품 라이다 런치 파일 호출 설정 (sllidar_a1_launch.py)
    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(sllidar_share, 'launch', 'sllidar_a1_launch.py')
        )
    )

    # 3. 고정 TF 브로드캐스터 노드 설정: 차체(base_link) 정중앙 기준, 위로 10cm(Z=0.1)에 라이다가 달렸다고 선언
    static_tf_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='static_tf_pdw_laser',
        arguments=['--x', '0', '--y', '0', '--z', '0.1', '--frame-id', 'base_link', '--child-frame-id', 'laser']
    )

    # 4. 우리가 만든 [제어 레이어] STM32 브리지 노드 실행 설정
    stm32_bridge_node = Node(
        package='spas_control',
        executable='stm32_bridge_node',
        name='stm32_bridge_node',
        output='screen'
    )

    # 5. 우리가 만든 [인지 레이어] 아두이노 초음파 필터 노드 실행 설정
    sensor_filter_node = Node(
        package='spas_perception',
        executable='sensor_filter_node',
        name='sensor_filter_node',
        output='screen'
    )

    # 6. 우리가 만든 [판단 레이어] 긴급 제동 안전 감시 노드 실행 설정
    safety_node = Node(
        package='spas_planning',
        executable='safety_node',
        name='safety_node',
        output='screen'
    )

    # 7. 기성품 SLAM 툴박스 런치 파일 호출 설정 (online_async_launch.py)
    # 매니저님의 슬램 파라미터 파일 경로($HOME/spas_slam_params.yaml)를 동적으로 지정합니다.
    home_dir = os.path.expanduser('~')
    slam_params_path = os.path.join(home_dir, 'spas_slam_params.yaml')
    
    slam_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(slam_toolbox_share, 'launch', 'online_async_launch.py')
        ),
        launch_arguments={
            'slam_params_file': slam_params_path,
            'use_sim_time': 'false'
        }.items()
    )

    # 🚀 최종 실행할 노드 및 런치 파일들을 하나의 마스터 리스트로 묶어서 반환
    return LaunchDescription([
        lidar_launch,       # 1. 라이다 켜기
        static_tf_node,     # 2. 라이다 높이(TF) 등록
        stm32_bridge_node,  # 3. STM32 통신 및 /odom 연산 시작
        sensor_filter_node, # 4. 아두이노 초음파 데이터 파싱 시작
        safety_node,        # 5. 긴급 제동 감시 브레인 가동
        slam_launch         # 6. 실시간 지도(SLAM) 작성 시작
    ])
```


수정 전 0604


```c++
import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node

def generate_launch_description():
    # 1. 기성품 오픈소스 패키지들의 Share 경로 가져오기
    sllidar_share = get_package_share_directory('sllidar_ros2')
    slam_toolbox_share = get_package_share_directory('slam_toolbox')

    # 2. 기성품 라이다 드라이버 런치 파일 호출 설정
    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(sllidar_share, 'launch', 'sllidar_a1_launch.py')
        )
    )

    # 3. 고정 TF 브로드캐스터: 차체(base_link) 중심 기준, 위로 10cm(Z=0.1)에 라이다가 연결됨을 선언
    static_tf_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='static_tf_laser',
        arguments=['--x', '0', '--y', '0', '--z', '0.1', '--frame-id', 'base_link', '--child-frame-id', 'laser']
    )

    # 4. 슬램 툴박스 런치 파일 호출 설정 (기본 비동기 SLAM 켜기)
    slam_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(slam_toolbox_share, 'launch', 'online_async_launch.py')
        ),
        launch_arguments={
            'use_sim_time': 'false'
        }.items()
    )

    return LaunchDescription([
        # === 하드웨어 및 인프라 레이어 ===
        lidar_launch,       # 라이다 가동
        static_tf_node,     # 라이다-차체 신체 구조 등록
        slam_launch,        # 실시간 지도 생성(SLAM) 가동
        
        # 아두이노 초음파 센서 가동
        Node(
            package='spas_perception',
            executable='sensor_filter_node',
            name='sensor_filter_node',
            output='screen'
        ),

        # === 브레인 판단 레이어 (Planning) ===
        # 안전 감시 노드
        Node(
            package='spas_planning',
            executable='safety_node',
            name='safety_node',
            output='screen'
        ),
        # 공간 인식 노드 (진짜 슬램 맵을 바라보게 됨!)
        Node(
            package='spas_planning',
            executable='parking_space_detector',
            name='parking_space_detector',
            output='screen'
        ),
        # 하이브리드 A* 플래너 노드
        Node(
            package='spas_planning',
            executable='hybrid_A_star_node',
            name='hybrid_A_star_node',
            output='screen'
        ),
        # 차량 제어 노드
        Node(
            package='spas_planning',
            executable='vehicle_control_node',
            name='vehicle_control_node',
            output='screen'
        ),

        # === 하드웨어 제어 레이어 (Control) ===
        # STM32 브리지 노드: /cmd_vel 수신 → STM32 송신, 엔코더 피드백 → /odom + odom→base_link TF
        # ⚠️ 활성화 시 odom→base_link 동적 TF 를 발행하므로 base_link 를 고정하는
        #    static TF 가 다른 곳에 있으면 충돌함. STM32 보드 연결 후 주석 해제.
        # Node(
        #     package='spas_control',
        #     executable='stm32_bridge_node',
        #     name='stm32_bridge_node',
        #     output='screen'
        # ),
    ])
```


## spas_perception

## spas_perception

## sensor_filter_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray  # 소수점 데이터 배열을 위한 메시지 타입
import serial

class SensorFilterNode(Node):
    def __init__(self):
        super().__init__('sensor_filter_node')
        
        # 1. 판단 레이어(Master Brain)로 정제된 데이터를 보낼 토픽 퍼블리셔 선언
        # 데이터 순서 양식: [전방, 후방, 좌측, 우측]
        self.distance_pub = self.create_publisher(Float32MultiArray, '/filtered_distance', 10)
        
        # 2. 아두이노 연결 설정 (아두이노 코드의 115200 보드레이트와 일치 필수)
        # 라즈베리파이에 아두이노를 연결한 포트 경로를 적어줍니다. ('/dev/ttyACM0' 등)
        arduino_port = '/dev/ttyACM0' 
        baud_rate = 115200
        
        try:
            self.ser = serial.Serial(arduino_port, baud_rate, timeout=1)
            self.ser.flush()  # 시리얼 버퍼 초기화 (쓰레기 데이터 방지)
            self.get_logger().info(f"아두이노(초음파 센서) 시리얼 연결 성공: {arduino_port}")
        except Exception as e:
            self.get_logger().error(f"아두이노 시리얼 연결 실패: {e}")
            return
            
        # 3. 아두이노의 데이터 송신 주기(50ms)에 맞추어 20Hz(0.05초) 타이머 루프 생성
        self.timer = self.create_timer(0.05, self.process_sensor_data)

    def process_sensor_data(self):
        # 시리얼 수신 버퍼에 데이터가 쌓여있는지 확인
        if self.ser.in_waiting > 0:
            try:
                # 아두이노가 보낸 한 줄을 읽고 엔터(\r\n) 제거
                # 예: "S,12.5,145.0,80.2,21.0,E"
                raw_line = self.ser.readline().decode('utf-8').rstrip()
                
                # 콤마(,)를 기준으로 패킷 쪼개기
                parts = raw_line.split(',')
                
                # 무결성 체크: 데이터 개수가 정확히 6개이고, 시작('S')과 끝('E') 마커가 완벽한지 검증
                if len(parts) == 6 and parts[0] == 'S' and parts[5] == 'E':
                    
                    # 문자열 데이터를 판단 레이어 연산용 실수(Float)로 형변환
                    front_dist = float(parts[1])
                    back_dist  = float(parts[2])
                    left_dist  = float(parts[3])
                    right_dist = float(parts[4])
                    
                    # ROS 2 표준 배열 메시지에 데이터 적재
                    msg = Float32MultiArray()
                    msg.data = [front_dist, back_dist, left_dist, right_dist]
                    
                    # 판단 레이어로 가공된 토픽 발행 (Publish)
                    self.distance_pub.publish(msg)
                    
                    # 모니터링용 디버그 로그 출력
                    self.get_logger().info(
                        f"정제 데이터 발행 중 -> [전: {front_dist:.1f}cm, 후: {back_dist:.1f}cm, 좌: {left_dist:.1f}cm, 우: {right_dist:.1f}cm]"
                    )
                else:
                    self.get_logger().warn("잘못된 패킷 구조 또는 데이터 누락 감지. 해당 패킷은 폐기합니다.")
                    
            except ValueError:
                # 순간적인 문자열 깨짐으로 인해 float() 변환 실패 시 노드 다운 방지
                self.get_logger().warn("수신된 데이터에 문자 깨짐(노이즈)이 있어 파싱을 스킵합니다.")
            except Exception as e:
                self.get_logger().error(f"시리얼 통신 처리 중 예외 발생: {e}")

    def destroy_node(self):
        # 노드 종료 시 안전하게 시리얼 포트를 닫아줍니다.
        if hasattr(self, 'ser') and self.ser.is_open:
            self.ser.close()
            self.get_logger().info("아두이노 시리얼 포트가 안전하게 닫혔습니다.")
        super().destroy_node()

def main(args=None):
    rclpy.init(args=args)
    node = SensorFilterNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info("사용자에 의해 노드가 종료되었습니다.")
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## spas_planning

## spas_planning

## parking_space_detector.py

```python
#!/usr/bin/env python3
"""
SPAS Parking Space Detector Node  ―  슬라이딩 윈도우 알고리즘
=============================================================

【동작 흐름】
  /map (OccupancyGrid)
    │
    ├─① 맵 이진화
    │    OccupancyGrid 셀 값을 free_map / occ_map 으로 분리
    │
    ├─② 탐색 반경 마스크
    │    TF 로 로봇 위치를 읽어 search_radius 원 안만 탐색
    │
    ├─③ 슬라이딩 윈도우 탐지
    │    space_length × space_width 창을 두 방향(가로/세로)으로 모두 탐색
    │      (a) 창 내부 자유 공간 비율 ≥ min_free_ratio
    │      (b) 창 외곽 4면 벽 검사: 각 면 점유 비율 ≥ wall_occ_ratio 인 면 수 ≥ min_wall_sides
    │    후보마다 뚫린 면 방향(open_yaw) 계산
    │
    ├─④ NMS
    │    동일 공간 중복 후보 제거 (score 기준)
    │
    ├─⑤ 주차 유형 판별 (travel_direction 무관)
    │    탐지 창의 깊이(depth) vs 입구 폭(opening) 비교:
    │      depth > opening  →  직각주차
    │      depth ≤ opening  →  평행주차
    │    여기서 depth = 뚫린 면에 수직인 변의 길이
    │
    ├─⑥ goal_yaw 계산
    │    TF 에서 차체 현재 yaw 읽기
    │    직각주차: 뚫린 면의 법선 방향 (open_yaw) → 차 앞쪽이 입구를 향함
    │    평행주차: 뚫린 면과 평행한 방향 (open_yaw ± π/2)
    │    최종 부호(±)는 플래너가 접근 방향 보고 선택
    │
    └─⑦ 발행 & 저장
         /parking_spaces        (PoseArray)   ← 중심 좌표
         /parking_spaces_info   (String/JSON) ← type, goal_yaw, open_yaw 포함
         /parking_space_markers (MarkerArray) ← RViz2 박스
         ~/spas_ws/maps/*.png              ← 디버그 이미지

【주차 유형 판별 상세】
  슬라이딩 윈도우는 항상 가로창(ww=sl, wh=sw) / 세로창(ww=sw, wh=sl) 두 방향 탐색.
  벽 검사 결과에서 점유 비율이 낮은 면 = 뚫린 면(입구).
  뚫린 면에 수직인 변 = depth, 뚫린 면과 평행한 변 = opening.
    depth > opening  →  공간이 진입 방향으로 깊게 파여있음  →  직각주차
    depth ≤ opening  →  공간이 옆으로 넓게 열려있음         →  평행주차

【goal_yaw 상세】
  open_yaw: 뚫린 면의 법선 방향 (맵 좌표계 기준, rad)
    뚫린 면이 top (row 방향 위) → 차가 위쪽으로 진입 → open_yaw = -π/2
    뚫린 면이 bot               → open_yaw = +π/2
    뚫린 면이 lft (col 방향 왼) → open_yaw = π
    뚫린 면이 rgt               → open_yaw = 0.0

  직각주차 goal_yaw = open_yaw
    (차 앞쪽이 입구 방향을 향한 채로 주차 완료)

  평행주차 goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 선택)
    (차가 공간과 나란히 정렬되어 주차 완료)

【파라미터】
  space_length      : 주차 공간 긴 변 (m)
  space_width       : 주차 공간 짧은 변 (m)
  free_threshold    : 이 값 이하 셀 = 빈 공간
  occupied_threshold: 이 값 이상 셀 = 벽/장애물
  search_radius     : 로봇 중심 탐색 반경 (m)
  wall_border       : 창 외곽 벽 검사 띠 두께 (m)
  min_wall_sides    : 벽으로 인정할 최소 면 수 (2~4)
  min_free_ratio    : 창 내부 자유 셀 비율 하한 (0~1)
  wall_occ_ratio    : 벽 판정 점유 비율 하한 (0~1)
  base_frame        : 로봇 TF 프레임
  map_save_scale    : PNG 저장 업스케일 배율
"""

import json
import math
import os
import time

import cv2
import numpy as np
import rclpy
import tf2_ros
from geometry_msgs.msg import Pose, PoseArray, Quaternion
from nav_msgs.msg import OccupancyGrid
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from tf_transformations import euler_from_quaternion
from visualization_msgs.msg import Marker, MarkerArray


class ParkingSpaceDetectorNode(Node):
    def __init__(self):
        super().__init__('parking_space_detector')

        # ── 파라미터 선언 ───────────────────────────────────────────────
        self.declare_parameter('space_length',       0.40)
        self.declare_parameter('space_width',        0.30)
        self.declare_parameter('free_threshold',     30)
        self.declare_parameter('occupied_threshold', 65)
        self.declare_parameter('search_radius',      2.0)
        self.declare_parameter('wall_border',        0.05)
        self.declare_parameter('min_wall_sides',     3)
        self.declare_parameter('min_free_ratio',     0.70)
        self.declare_parameter('wall_occ_ratio',     0.20)
        self.declare_parameter('base_frame',         'base_link')
        self.declare_parameter('map_save_scale',     4)

        self._load_params()

        self._map_dir = os.path.expanduser('~/spas_ws/maps')
        os.makedirs(self._map_dir, exist_ok=True)

        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        # ── 퍼블리셔 ───────────────────────────────────────────────────
        self._pub_spaces  = self.create_publisher(PoseArray,   '/parking_spaces',        10)
        self._pub_info    = self.create_publisher(String,      '/parking_spaces_info',   10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_space_markers', 10)

        self._sub_map = self.create_subscription(
            OccupancyGrid, '/map', self._map_callback, 10
        )

        self.get_logger().info(
            f'ParkingSpaceDetector 시작. '
            f'space={self._space_length:.2f}x{self._space_width:.2f}m  '
            f'search_radius={self._search_radius:.1f}m'
        )

    # ── 파라미터 로드 ─────────────────────────────────────────────────
    def _load_params(self):
        self._space_length   = self.get_parameter('space_length').value
        self._space_width    = self.get_parameter('space_width').value
        self._free_threshold = self.get_parameter('free_threshold').value
        self._occ_threshold  = self.get_parameter('occupied_threshold').value
        self._search_radius  = self.get_parameter('search_radius').value
        self._wall_border    = self.get_parameter('wall_border').value
        self._min_wall_sides = self.get_parameter('min_wall_sides').value
        self._min_free_ratio = self.get_parameter('min_free_ratio').value
        self._wall_occ_ratio = self.get_parameter('wall_occ_ratio').value
        self._base_frame     = self.get_parameter('base_frame').value
        self._map_save_scale = max(1, int(self.get_parameter('map_save_scale').value))

    # ── TF: 로봇 위치 + 차체 yaw ──────────────────────────────────────
    def _get_robot_pose(self):
        """
        TF 에서 map → base_frame 변환을 읽어
        로봇 위치 (x, y) 와 차체 yaw (rad) 를 반환.
        TF 실패 시 (0.0, 0.0, 0.0) 폴백.
        """
        try:
            tf = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.1)
            )
            t = tf.transform.translation
            q = tf.transform.rotation
            _, _, yaw = euler_from_quaternion([q.x, q.y, q.z, q.w])
            return t.x, t.y, yaw
        except tf2_ros.TransformException:
            self.get_logger().warn(
                f'TF map→{self._base_frame} 없음; 원점(0,0) yaw=0 사용',
                throttle_duration_sec=5.0
            )
            return 0.0, 0.0, 0.0

    # ── 주차 유형 판별 ────────────────────────────────────────────────
    def _classify_parking_type(self, open_face: str, pw: float, ph: float) -> str:
        """
        뚫린 면(open_face)을 기준으로 depth / opening 을 결정한 뒤
        주차 유형을 판별한다.

        open_face 가 'top' 또는 'bot' (행 방향으로 뚫림):
          depth   = ph  (세로 변, 뚫린 면에 수직)
          opening = pw  (가로 변, 뚫린 면에 평행)

        open_face 가 'lft' 또는 'rgt' (열 방향으로 뚫림):
          depth   = pw  (가로 변, 뚫린 면에 수직)
          opening = ph  (세로 변, 뚫린 면에 평행)

        depth > opening  →  직각주차  (그림의 오른쪽 케이스)
        depth ≤ opening  →  평행주차  (그림의 왼쪽 케이스)
        """
        if open_face in ('top', 'bot'):
            depth, opening = ph, pw
        else:  # 'lft', 'rgt'
            depth, opening = pw, ph

        return '직각주차' if depth > opening else '평행주차'

    # ── 뚫린 면의 법선 방향 계산 ─────────────────────────────────────
    def _open_face_yaw(self, open_face: str) -> float:
        """
        뚫린 면의 법선이 맵 좌표계에서 향하는 방향각 (rad) 반환.
        차가 이 방향을 정면으로 향한 채 진입하면 공간 안으로 들어간다.

          top  → 공간 위쪽이 열림 → 차는 위(-Y) 방향으로 들어감 → -π/2
          bot  → 공간 아래쪽이 열림 → 차는 아래(+Y) 방향        → +π/2
          lft  → 공간 왼쪽이 열림  → 차는 왼쪽(-X) 방향         → π
          rgt  → 공간 오른쪽이 열림 → 차는 오른쪽(+X) 방향      → 0.0
        """
        return {
            'top': -math.pi / 2.0,
            'bot':  math.pi / 2.0,
            'lft':  math.pi,
            'rgt':  0.0,
        }[open_face]

    # ── goal_yaw 계산 ─────────────────────────────────────────────────
    def _compute_goal_yaw(self, parking_type: str, open_yaw: float) -> float:
        """
        주차 완료 시 차체가 향할 방향각 (기준각, rad).

        직각주차:
          차 앞쪽이 입구(open_yaw)를 향한 채 주차 완료.
          goal_yaw = open_yaw

        평행주차:
          차가 공간과 나란히 정렬된 채 주차 완료.
          goal_yaw = open_yaw + π/2  (기준각; ±는 플래너가 접근 방향 보고 선택)

        반환값은 기준각이며 플래너가 실제 접근 방향을 보고
        goal_yaw vs goal_yaw + π 중 가까운 쪽을 선택한다.
        """
        if parking_type == '직각주차':
            return open_yaw
        else:  # 평행주차
            return open_yaw + math.pi / 2.0

    # ── 메인 콜백 ─────────────────────────────────────────────────────
    def _map_callback(self, msg: OccupancyGrid):
        self.get_logger().info('Map received — sliding-window detection 시작.')

        resolution = msg.info.resolution
        origin     = msg.info.origin
        width      = msg.info.width
        height     = msg.info.height

        grid     = np.array(msg.data, dtype=np.int8).reshape((height, width))
        free_map = ((grid >= 0) & (grid <= self._free_threshold)).astype(np.float32)
        occ_map  = (grid >= self._occ_threshold).astype(np.float32)

        robot_x, robot_y, robot_yaw = self._get_robot_pose()
        rx_cell = (robot_x - origin.position.x) / resolution
        ry_cell = (robot_y - origin.position.y) / resolution

        candidates = self._sliding_window_detect(
            free_map, occ_map, rx_cell, ry_cell, origin, resolution, height, width
        )

        self.get_logger().info(f'탐지된 주차 공간 수: {len(candidates)}')

        pose_array = PoseArray()
        pose_array.header.stamp    = self.get_clock().now().to_msg()
        pose_array.header.frame_id = 'map'
        marker_array = MarkerArray()
        info_list    = []

        best_idx = 0
        for i, c in enumerate(candidates):
            # ── Pose ──────────────────────────────────────────────────
            pose = Pose()
            pose.position.x  = c['mx']
            pose.position.y  = c['my']
            pose.position.z  = 0.0
            pose.orientation = Quaternion(x=0.0, y=0.0, z=0.0, w=1.0)
            pose_array.poses.append(pose)

            # ── 주차 유형 판별 & goal_yaw 계산 ──────────────────────
            open_face    = c['open_face']
            open_yaw     = self._open_face_yaw(open_face)
            parking_type = self._classify_parking_type(open_face, c['pw'], c['ph'])
            goal_yaw     = self._compute_goal_yaw(parking_type, open_yaw)

            info_list.append({
                'index':      i,
                'is_best':    (i == best_idx),
                'mx':         round(c['mx'],   4),
                'my':         round(c['my'],   4),
                'pw':         round(c['pw'],   4),
                'ph':         round(c['ph'],   4),
                'type':       parking_type,
                'open_face':  open_face,
                'open_yaw':   round(open_yaw,  6),
                'goal_yaw':   round(goal_yaw,  6),
                'score':      round(c['score'], 4),
                'walls':      c['walls'],
            })

            # ── 마커 색상 ───────────────────────────────────────────
            is_best = (i == best_idx)
            if is_best:
                color = ColorRGBA(r=1.0, g=0.0, b=0.0, a=0.85)
            elif parking_type == '평행주차':
                color = ColorRGBA(r=0.0, g=0.8, b=0.0, a=0.30)
            else:
                color = ColorRGBA(r=0.0, g=0.0, b=0.8, a=0.30)

            marker_array.markers.append(
                self._make_box_marker(
                    i, pose_array.header,
                    c['mx'], c['my'], c['pw'], c['ph'],
                    color, parking_type
                )
            )

            best_tag = ' ★ BEST' if is_best else ''
            self.get_logger().info(
                f'Space #{i} [{parking_type}]{best_tag} '
                f'at ({c["mx"]:.3f}, {c["my"]:.3f}) m  '
                f'open={open_face}  open_yaw={open_yaw:.3f}rad  '
                f'goal_yaw={goal_yaw:.3f}rad  score={c["score"]:.3f}'
            )

        self._pub_spaces.publish(pose_array)

        info_msg      = String()
        info_msg.data = json.dumps(info_list, ensure_ascii=False)
        self._pub_info.publish(info_msg)

        self._pub_markers.publish(marker_array)
        self._save_map_png(free_map, occ_map, rx_cell, ry_cell,
                           candidates, best_idx, resolution, height, width)

    # ── 슬라이딩 윈도우 탐지 ──────────────────────────────────────────
    def _sliding_window_detect(self, free_map, occ_map,
                                rx_cell, ry_cell,
                                origin, resolution, height, width):
        sl = max(1, int(round(self._space_length / resolution)))
        sw = max(1, int(round(self._space_width  / resolution)))
        b  = max(1, int(round(self._wall_border  / resolution)))

        radius_cells = self._search_radius / resolution

        r_lo = max(0,      int(ry_cell - radius_cells) - b)
        r_hi = min(height, int(ry_cell + radius_cells) + b + 1)
        c_lo = max(0,      int(rx_cell - radius_cells) - b)
        c_hi = min(width,  int(rx_cell + radius_cells) + b + 1)

        fi = cv2.integral(free_map)
        oi = cv2.integral(occ_map)

        def box_sum(intg, r1, c1, r2, c2):
            r1, c1 = max(0, r1), max(0, c1)
            r2, c2 = min(height, r2), min(width, c2)
            if r2 <= r1 or c2 <= c1:
                return 0.0
            return float(intg[r2, c2] - intg[r1, c2]
                         - intg[r2, c1] + intg[r1, c1])

        raw = []

        # 두 방향 모두 탐색 (travel_direction 무관)
        orientations = [(sw, sl), (sl, sw)] if sl != sw else [(sw, sl)]

        for wh, ww in orientations:
            for r in range(r_lo, min(r_hi, height - wh + 1)):
                for c in range(c_lo, min(c_hi, width - ww + 1)):

                    dr = (r + wh / 2.0) - ry_cell
                    dc = (c + ww / 2.0) - rx_cell
                    if dr * dr + dc * dc > radius_cells ** 2:
                        continue

                    area = float(wh * ww)
                    interior_free = box_sum(fi, r, c, r + wh, c + ww)
                    free_ratio = interior_free / area
                    if free_ratio < self._min_free_ratio:
                        continue

                    top_area = float(b * ww)
                    lr_area  = float(wh * b)

                    top_occ = box_sum(oi, r - b,     c,      r,          c + ww)
                    bot_occ = box_sum(oi, r + wh,    c,      r + wh + b, c + ww)
                    lft_occ = box_sum(oi, r,         c - b,  r + wh,     c     )
                    rgt_occ = box_sum(oi, r,         c + ww, r + wh,     c + ww + b)

                    top_hit = top_area > 0 and top_occ / top_area >= self._wall_occ_ratio
                    bot_hit = top_area > 0 and bot_occ / top_area >= self._wall_occ_ratio
                    lft_hit = lr_area  > 0 and lft_occ / lr_area  >= self._wall_occ_ratio
                    rgt_hit = lr_area  > 0 and rgt_occ / lr_area  >= self._wall_occ_ratio

                    walls = sum([top_hit, bot_hit, lft_hit, rgt_hit])
                    if walls < self._min_wall_sides:
                        continue

                    # ── 뚫린 면 결정 ──────────────────────────────
                    # 벽이 없는(점유 비율이 낮은) 면 = 입구
                    # 여러 면이 뚫려있으면 점유 비율이 가장 낮은 면을 입구로 선택
                    face_occ = {
                        'top': top_occ / top_area if top_area > 0 else 1.0,
                        'bot': bot_occ / top_area if top_area > 0 else 1.0,
                        'lft': lft_occ / lr_area  if lr_area  > 0 else 1.0,
                        'rgt': rgt_occ / lr_area  if lr_area  > 0 else 1.0,
                    }
                    open_face = min(face_occ, key=face_occ.get)

                    score = free_ratio + 0.05 * walls

                    cx_cell = c + ww / 2.0
                    cy_cell = r + wh / 2.0
                    mx = origin.position.x + (cx_cell + 0.5) * resolution
                    my = origin.position.y + (cy_cell + 0.5) * resolution

                    raw.append({
                        'mx': mx, 'my': my,
                        'pw': ww * resolution,
                        'ph': wh * resolution,
                        'score': score,
                        'walls': walls,
                        'open_face': open_face,
                        'r': r, 'c': c, 'wh': wh, 'ww': ww,
                    })

        self.get_logger().info(f'윈도우 후보 수 (NMS 전): {len(raw)}')

        raw.sort(key=lambda x: -x['score'])
        nms_dist_sq = self._space_length ** 2
        kept = []
        for cand in raw:
            too_close = any(
                (cand['mx'] - k['mx']) ** 2 + (cand['my'] - k['my']) ** 2 < nms_dist_sq
                for k in kept
            )
            if not too_close:
                kept.append(cand)

        return kept

    # ── RViz2 마커 생성 ───────────────────────────────────────────────
    def _make_box_marker(self, mid, header, x, y, sx, sy, color, parking_type=''):
        m = Marker()
        m.header  = header
        m.ns      = 'parking_spaces'
        m.id      = mid
        m.type    = Marker.CUBE
        m.action  = Marker.ADD
        m.pose.position.x    = x
        m.pose.position.y    = y
        m.pose.position.z    = 0.1
        m.pose.orientation.w = 1.0
        m.scale.x = sx
        m.scale.y = sy
        m.scale.z = 0.05
        m.color   = color
        m.text    = parking_type
        m.lifetime.sec = 1
        return m

    # ── PNG 디버그 이미지 저장 ────────────────────────────────────────
    def _save_map_png(self, free_map, occ_map, rx_cell, ry_cell,
                      candidates, best_idx, resolution, height, width):
        s = self._map_save_scale
        vis = np.zeros((height, width, 3), dtype=np.uint8)
        vis[free_map > 0] = (255, 255, 255)
        vis[occ_map  > 0] = (100, 100, 100)
        vis = cv2.resize(vis, (width * s, height * s),
                         interpolation=cv2.INTER_NEAREST)

        def sc(v):
            return int(round(v * s))

        radius_cells = self._search_radius / resolution
        line_w = max(1, s // 2)
        cv2.circle(vis, (sc(rx_cell), sc(ry_cell)), sc(radius_cells),
                   (255, 0, 0), line_w)

        for idx, c in enumerate(candidates):
            r0, c0 = sc(c['r']), sc(c['c'])
            r1 = sc(c['r'] + c['wh'])
            c1 = sc(c['c'] + c['ww'])
            if idx == best_idx:
                rect_w  = max(2, s)
                cross_s = max(6, s * 3)
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 0, 255), rect_w)
                cx = (c0 + c1) // 2
                cy = (r0 + r1) // 2
                cv2.drawMarker(vis, (cx, cy), (0, 0, 255),
                               cv2.MARKER_CROSS, cross_s, max(1, s // 2))
            else:
                cv2.rectangle(vis, (c0, r0), (c1, r1), (0, 200, 0),
                              max(1, s // 2))

        timestamp = time.strftime('%Y%m%d_%H%M%S')
        fname = os.path.join(self._map_dir, f'map_{timestamp}.png')
        cv2.imwrite(fname, vis)
        self.get_logger().info(f'Map 저장 → {fname}  ({width*s}×{height*s}px)')


def main(args=None):
    rclpy.init(args=args)
    node = ParkingSpaceDetectorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


## hybrid_A_star_node.py

```python
#!/usr/bin/env python3
"""
SPAS Hybrid A* Parking Path Planner Node

【구독 토픽】
  /parking_spaces        (PoseArray)
  /parking_spaces_info   (String/JSON)  goal_yaw·type 포함
  /parking_space_markers (MarkerArray)
  /map                   (OccupancyGrid)
  TF: map → base_link

【발행 토픽】
  /parking_path          (Path)
  /parking_path_markers  (MarkerArray)

【Nav2 연동】
  use_nav2=False (기본): 자체 구현 Hybrid A*
  use_nav2=True        : Nav2 ComputePathToPose Action 호출
"""

import json
import math
import heapq
import sys
import threading
import time
from enum import Enum
from typing import Dict, List, Optional, Tuple

import numpy as np
import rclpy
import rclpy.action
import tf2_ros
from geometry_msgs.msg import Point, PoseArray, PoseStamped
from nav_msgs.msg import OccupancyGrid, Path
from rclpy.node import Node
from std_msgs.msg import ColorRGBA, String
from visualization_msgs.msg import Marker, MarkerArray

try:
    from nav2_msgs.action import ComputePathToPose
    from rclpy.action import ActionClient
    _NAV2_AVAILABLE = True
except ImportError:
    _NAV2_AVAILABLE = False

# pip install rsplan
try:
    from rsplan import path as _rs_path
    _RSPLAN_AVAILABLE = True
except ImportError:
    _RSPLAN_AVAILABLE = False


# ─────────────────────────────────────────────────────────────────────────────
# 상태 머신
# ─────────────────────────────────────────────────────────────────────────────

class State(Enum):
    SEARCHING = 1
    WAITING   = 2
    PARKING   = 3


# ─────────────────────────────────────────────────────────────────────────────
# 차량 파라미터
# ─────────────────────────────────────────────────────────────────────────────

class VehicleConfig:
    def __init__(self, wheelbase=0.25, max_steer_deg=35.0,
                 length=0.35, width=0.22,
                 front_overhang=0.05, rear_overhang=0.05):
        self.wheelbase      = wheelbase
        self.max_steer      = math.radians(max_steer_deg)
        self.length         = length
        self.width          = width
        self.front_overhang = front_overhang
        self.rear_overhang  = rear_overhang
        self.lf = wheelbase + front_overhang   # 후축 → 차량 전면
        self.lb = rear_overhang                # 후축 → 차량 후면


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 탐색 노드
# ─────────────────────────────────────────────────────────────────────────────

class HANode:
    __slots__ = ('x', 'y', 'yaw', 'ix', 'iy', 'iyaw',
                 'g', 'h', 'steer', 'direction', 'parent_key')

    def __init__(self, x, y, yaw, ix, iy, iyaw,
                 g, h, steer, direction, parent_key=None):
        self.x,  self.y,  self.yaw  = x, y, yaw
        self.ix, self.iy, self.iyaw = ix, iy, iyaw
        self.g, self.h = g, h
        self.steer      = steer
        self.direction  = direction
        self.parent_key = parent_key

    @property
    def f(self) -> float:
        return self.g + self.h

    def __lt__(self, other: 'HANode') -> bool:
        return self.f < other.f


# ─────────────────────────────────────────────────────────────────────────────
# Obstacle Heuristic 사전 계산
# ─────────────────────────────────────────────────────────────────────────────

def _build_obstacle_heuristic(
    goal_ix: int, goal_iy: int,
    grid: np.ndarray,
    res: float,
    occ_thresh: int = 50,
) -> np.ndarray:
    """
    목표 셀에서 역방향 Dijkstra로 전체 맵의 실제 이동 비용(m)을 사전 계산.
    plan() 호출당 1회 수행.
    """
    H, W = grid.shape
    dist = np.full((H, W), np.inf, dtype=np.float32)
    dist[goal_iy, goal_ix] = 0.0

    heap = [(0.0, goal_ix, goal_iy)]

    DIRS  = [(1,0),(0,1),(-1,0),(0,-1),(1,1),(-1,1),(1,-1),(-1,-1)]
    COSTS = [1.0,  1.0,  1.0,  1.0,   1.414, 1.414, 1.414, 1.414]

    while heap:
        d, cx, cy = heapq.heappop(heap)
        if d > dist[cy, cx]:
            continue
        for (dx, dy), c in zip(DIRS, COSTS):
            nx, ny = cx + dx, cy + dy
            if not (0 <= nx < W and 0 <= ny < H):
                continue
            if int(grid[ny, nx]) >= occ_thresh:
                continue
            nd = d + c * res
            if nd < dist[ny, nx]:
                dist[ny, nx] = nd
                heapq.heappush(heap, (nd, nx, ny))

    return dist


# ─────────────────────────────────────────────────────────────────────────────
# Hybrid A* 플래너
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarPlanner:
    def __init__(
        self,
        vehicle_cfg: VehicleConfig,
        step_size: float         = 0.06,
        n_steer: int             = 7,
        yaw_resolution: float    = math.radians(5.0),
        goal_xy_tol: float       = 0.08,
        goal_yaw_tol: float      = math.radians(10.0),
        reverse_cost: float      = 1.5,
        dir_change_cost: float   = 3.0,
        steer_change_cost: float = 0.5,
        occ_threshold: int       = 50,
        max_iter: int            = 80000,
        analytic_expansion_ratio: int = 3,   # 매 N×n_steer×2 iter 마다 RS expansion 시도
        use_obstacle_heuristic: bool  = True,
        auto_step_size: bool          = False,  # True 시 step = max(res, r_min×yaw_res) 자동 계산
    ):
        self.vc              = vehicle_cfg
        self.step            = step_size
        self.n_steer         = n_steer
        self.yaw_res         = yaw_resolution
        self.goal_xy_tol     = goal_xy_tol
        self.goal_yaw_tol    = goal_yaw_tol
        self.reverse_cost    = reverse_cost
        self.dir_change_cost = dir_change_cost
        self.steer_chg_cost  = steer_change_cost
        self.occ_thresh      = occ_threshold
        self.max_iter        = max_iter

        self._step_override          = step_size
        self._auto_step_size         = auto_step_size
        self._analytic_ratio         = analytic_expansion_ratio
        self._use_obstacle_heuristic = use_obstacle_heuristic
        self._obs_heuristic: Optional[np.ndarray] = None

        self.steers    = np.linspace(-self.vc.max_steer, self.vc.max_steer, n_steer)
        self._yaw_bins = max(1, int(round(2 * math.pi / self.yaw_res)))

    def plan(
        self,
        start_x, start_y, start_yaw,
        goal_x,  goal_y,  goal_yaw,
        occ_grid: np.ndarray,
        origin_x: float, origin_y: float,
        resolution: float,
    ) -> Optional[List[Tuple[float, float, float]]]:

        self._occ    = occ_grid
        self._ox     = origin_x
        self._oy     = origin_y
        self._res    = resolution
        self._height, self._width = occ_grid.shape

        # step 자동 계산 (auto_step_size=True 일 때)
        if self._auto_step_size:
            r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
            self.step = max(resolution, r_min * self.yaw_res)
        else:
            self.step = self._step_override

        # obstacle heuristic 사전 계산
        self._r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        if self._use_obstacle_heuristic:
            gix = max(0, min(self._width  - 1, int(round((goal_x - origin_x) / resolution))))
            giy = max(0, min(self._height - 1, int(round((goal_y - origin_y) / resolution))))
            self._obs_heuristic = _build_obstacle_heuristic(
                gix, giy, occ_grid, resolution, self.occ_thresh
            )
        else:
            self._obs_heuristic = None

        ae_interval = max(1, self._analytic_ratio * self.n_steer * 2)

        s = self._make_node(start_x, start_y, start_yaw, g=0.0,
                            steer=0.0, direction=1, parent_key=None)
        s.h = self._heuristic(s.x, s.y, s.yaw, goal_x, goal_y, goal_yaw)

        open_heap: List[Tuple[float, HANode]] = []
        heapq.heappush(open_heap, (s.f, s))
        open_dict:   Dict[int, HANode] = {self._key(s): s}
        closed_dict: Dict[int, HANode] = {}

        iterations = 0
        t0 = time.monotonic()

        while open_heap:
            iterations += 1
            if iterations > self.max_iter:
                if closed_dict:
                    best_node = min(
                        closed_dict.values(),
                        key=lambda n: math.hypot(n.x - goal_x, n.y - goal_y)
                    )
                    print(
                        f'[DBG] max_iter({self.max_iter}) 소진. '
                        f'최근접=({best_node.x:.3f},{best_node.y:.3f}) '
                        f'목표까지={math.hypot(best_node.x-goal_x, best_node.y-goal_y):.3f}m',
                        file=sys.stderr, flush=True
                    )
                return None

            _, cur = heapq.heappop(open_heap)
            ckey = self._key(cur)
            if ckey in closed_dict:
                continue
            closed_dict[ckey] = cur

            if iterations % 10000 == 0:
                print(
                    f'[DBG] iter={iterations} closed={len(closed_dict)} '
                    f'cur=({cur.x:.3f},{cur.y:.3f},{math.degrees(cur.yaw):.1f}°) '
                    f'경과={time.monotonic()-t0:.1f}s',
                    file=sys.stderr, flush=True
                )

            # Analytic Expansion: 현재 노드 → 목표까지 RS 경로 시도
            if _RSPLAN_AVAILABLE and iterations % ae_interval == 0:
                rs_result = self._try_analytic_expansion(
                    cur.x, cur.y, cur.yaw,
                    goal_x, goal_y, goal_yaw,
                )
                if rs_result is not None:
                    search_path = self._extract_path(cur, closed_dict, open_dict)
                    if search_path is not None:
                        return search_path + rs_result[1:]
                    return rs_result

            if self._reached_goal(cur.x, cur.y, cur.yaw, goal_x, goal_y, goal_yaw):
                return self._extract_path(cur, closed_dict, open_dict)

            for succ in self._expand(cur, goal_x, goal_y, goal_yaw):
                skey = self._key(succ)
                if skey in closed_dict:
                    continue
                if skey not in open_dict or open_dict[skey].g > succ.g:
                    open_dict[skey] = succ
                    heapq.heappush(open_heap, (succ.f, succ))

        return None

    def _try_analytic_expansion(
        self,
        sx: float, sy: float, syaw: float,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """현재 노드 → 목표까지 Reeds-Shepp 경로를 계산하고 충돌이 없으면 반환."""
        try:
            p = _rs_path(
                (sx, sy, syaw),
                (gx, gy, gyaw),
                turn_radius=self._r_min,
                runway_length=0,
                step_size=self.step,
            )
        except Exception:
            return None

        waypoints = list(p.waypoints())
        if not waypoints:
            return None

        for wp in waypoints:
            if self._in_collision(wp.x, wp.y, wp.yaw):
                return None

        return [(wp.x, wp.y, wp.yaw) for wp in waypoints]

    def _expand(self, node, gx, gy, gyaw):
        children = []
        for direction in (1, -1):
            for steer in self.steers:
                nx, ny, nyaw = self._bicycle_step(
                    node.x, node.y, node.yaw, steer, direction
                )
                if not self._in_bounds(nx, ny):
                    continue
                if self._in_collision(nx, ny, nyaw):
                    continue

                cost = self.step
                if direction == -1:
                    cost *= self.reverse_cost
                if direction != node.direction:
                    cost += self.dir_change_cost * self.step
                cost += abs(steer - node.steer) * self.steer_chg_cost

                child = self._make_node(nx, ny, nyaw, g=node.g + cost,
                                        steer=steer, direction=direction,
                                        parent_key=self._key(node))
                child.h = self._heuristic(nx, ny, nyaw, gx, gy, gyaw)
                children.append(child)
        return children

    def _bicycle_step(self, x, y, yaw, steer, direction):
        d         = self.step * direction
        delta_yaw = (d / self.vc.wheelbase) * math.tan(steer)
        mid_yaw   = yaw + delta_yaw / 2.0
        nx        = x + d * math.cos(mid_yaw)
        ny        = y + d * math.sin(mid_yaw)
        return nx, ny, self._norm_angle(yaw + delta_yaw)

    def _in_collision(self, x, y, yaw):
        """차량 풋프린트 샘플링 충돌 검사 (전후 n점 × 좌우 5열)."""
        cos_t      = math.cos(yaw)
        sin_t      = math.sin(yaw)
        hw         = self.vc.width / 2.0
        n_lon      = max(3, int(math.ceil(self.vc.length / self._res)) + 1)
        lat_samples = np.linspace(-hw, hw, 5)

        for d in np.linspace(-self.vc.lb, self.vc.lf, n_lon):
            cx = x + d * cos_t
            cy = y + d * sin_t
            for w in lat_samples:
                if self._cell_occupied(cx - w * sin_t, cy + w * cos_t):
                    return True
        return False

    def _cell_occupied(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        if not (0 <= ix < self._width and 0 <= iy < self._height):
            return True
        val = int(self._occ[iy, ix])
        return val != -1 and val >= self.occ_thresh

    def _in_bounds(self, wx, wy):
        ix = int((wx - self._ox) / self._res)
        iy = int((wy - self._oy) / self._res)
        return 0 <= ix < self._width and 0 <= iy < self._height

    def _reached_goal(self, x, y, yaw, gx, gy, gyaw):
        dist = math.hypot(x - gx, y - gy)
        dyaw = abs(self._norm_angle(yaw - gyaw))
        return dist <= self.goal_xy_tol and dyaw <= self.goal_yaw_tol

    def _heuristic(self, x, y, yaw, gx, gy, gyaw):
        """
        이중 휴리스틱:
          h1 = max(euclidean, r_min × |Δyaw|)
          h2 = obstacle_heuristic[iy, ix]
          h  = max(h1, h2)
        """
        dist  = math.hypot(x - gx, y - gy)
        dyaw  = abs(self._norm_angle(yaw - gyaw))
        r_min = self.vc.wheelbase / math.tan(self.vc.max_steer)
        h1    = max(dist, r_min * dyaw)

        if self._obs_heuristic is not None:
            ix = max(0, min(self._width  - 1, int(round((x - self._ox) / self._res))))
            iy = max(0, min(self._height - 1, int(round((y - self._oy) / self._res))))
            h2 = float(self._obs_heuristic[iy, ix])
        else:
            h2 = 0.0

        return max(h1, h2)

    def _extract_path(
        self,
        goal_node: HANode,
        closed_dict: Dict[int, HANode],
        open_dict:   Dict[int, HANode],
    ) -> Optional[List[Tuple[float, float, float]]]:
        """목표 노드 → 시작 노드 역추적. 체인 끊기면 None 반환."""
        all_nodes = {**closed_dict, **open_dict}
        path = []
        node: Optional[HANode] = goal_node

        while node is not None:
            path.append((node.x, node.y, node.yaw))
            if node.parent_key is None:
                path.reverse()
                return path
            node = all_nodes.get(node.parent_key)

        print('[ERR] _extract_path: 경로 체인 끊김', file=sys.stderr, flush=True)
        return None

    def _make_node(self, x, y, yaw, g, steer, direction, parent_key):
        ix   = int(round((x - self._ox) / self._res))
        iy   = int(round((y - self._oy) / self._res))
        raw  = int(round(self._norm_angle(yaw) / self.yaw_res))
        iyaw = raw % self._yaw_bins
        return HANode(x, y, yaw, ix, iy, iyaw,
                      g=g, h=0.0,
                      steer=steer, direction=direction,
                      parent_key=parent_key)

    def _key(self, node: HANode) -> int:
        return hash((node.ix, node.iy, node.iyaw))

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a


# ─────────────────────────────────────────────────────────────────────────────
# ROS 2 노드
# ─────────────────────────────────────────────────────────────────────────────

class HybridAStarNode(Node):
    """
    주차 공간 탐지 결과를 받아 Hybrid A* 또는 Nav2로 경로를 계획·발행.
    use_nav2=True  → Nav2 SmacPlannerHybrid Action 호출
    use_nav2=False → 자체 구현 Hybrid A*
    """

    def __init__(self):
        super().__init__('hybrid_astar_planner')

        self.declare_parameter('wheelbase',                0.25)
        self.declare_parameter('max_steer_deg',            35.0)
        self.declare_parameter('vehicle_length',           0.35)
        self.declare_parameter('vehicle_width',            0.22)
        self.declare_parameter('front_overhang',           0.05)
        self.declare_parameter('rear_overhang',            0.05)
        self.declare_parameter('step_size',                0.06)
        self.declare_parameter('n_steer',                  7)
        self.declare_parameter('yaw_resolution_deg',       5.0)
        self.declare_parameter('goal_xy_tol',              0.08)
        self.declare_parameter('goal_yaw_tol_deg',         10.0)
        self.declare_parameter('reverse_cost',             1.5)
        self.declare_parameter('dir_change_cost',          3.0)
        self.declare_parameter('steer_change_cost',        0.5)
        self.declare_parameter('occ_threshold',            50)
        self.declare_parameter('max_iter',                 80000)
        self.declare_parameter('base_frame',               'base_link')
        self.declare_parameter('analytic_expansion_ratio', 3)
        self.declare_parameter('use_obstacle_heuristic',   True)
        self.declare_parameter('auto_step_size',           False)
        self.declare_parameter('use_nav2',                 False)
        self.declare_parameter('nav2_planner_id',          'HybridAStar')
        self.declare_parameter('nav2_timeout_sec',         30.0)

        self._load_params()

        self._state      = State.SEARCHING
        self._state_lock = threading.Lock()

        self._latest_map:    Optional[OccupancyGrid] = None
        self._latest_spaces: Optional[PoseArray]     = None
        self._latest_info:   Optional[List[dict]]    = None
        self._target_info:   Optional[dict]          = None

        self._tf_buffer   = tf2_ros.Buffer()
        self._tf_listener = tf2_ros.TransformListener(self._tf_buffer, self)

        self._pub_path    = self.create_publisher(Path,        '/parking_path',         10)
        self._pub_markers = self.create_publisher(MarkerArray, '/parking_path_markers', 10)

        self.create_subscription(OccupancyGrid, '/map',                  self._cb_map,    10)
        self.create_subscription(PoseArray,     '/parking_spaces',       self._cb_spaces, 10)
        self.create_subscription(String,        '/parking_spaces_info',  self._cb_info,   10)

        self._nav2_client = None
        if self._use_nav2:
            if not _NAV2_AVAILABLE:
                self.get_logger().error(
                    'use_nav2=True 이지만 nav2_msgs 패키지를 찾을 수 없습니다. '
                    'sudo apt install ros-<distro>-nav2-msgs 로 설치하세요. '
                    'use_nav2=False 로 폴백합니다.'
                )
                self._use_nav2 = False
            else:
                self._nav2_client = ActionClient(self, ComputePathToPose,
                                                 'compute_path_to_pose')
                self.get_logger().info(
                    f'Nav2 Action 클라이언트 생성 완료. planner_id={self._nav2_planner_id}'
                )

        threading.Thread(target=self._keyboard_listener, daemon=True).start()

        mode      = 'Nav2 SmacPlannerHybrid' if self._use_nav2 else '자체 Hybrid A*'
        ae_status = f'ON (ratio={self.get_parameter("analytic_expansion_ratio").value})' \
                    if _RSPLAN_AVAILABLE else 'OFF (rsplan 미설치)'
        oh_status = 'ON' if self.get_parameter('use_obstacle_heuristic').value else 'OFF'
        self.get_logger().info(
            f'HybridAStarPlanner 시작 [{mode}]\n'
            f'  Analytic Expansion: {ae_status}\n'
            f'  Obstacle Heuristic: {oh_status}\n'
            '  공간 발견 시 터미널에서 Y(주차) / N(취소) 입력'
        )

    def _load_params(self):
        vc = VehicleConfig(
            wheelbase      = self.get_parameter('wheelbase').value,
            max_steer_deg  = self.get_parameter('max_steer_deg').value,
            length         = self.get_parameter('vehicle_length').value,
            width          = self.get_parameter('vehicle_width').value,
            front_overhang = self.get_parameter('front_overhang').value,
            rear_overhang  = self.get_parameter('rear_overhang').value,
        )
        self._planner = HybridAStarPlanner(
            vehicle_cfg              = vc,
            step_size                = self.get_parameter('step_size').value,
            n_steer                  = self.get_parameter('n_steer').value,
            yaw_resolution           = math.radians(self.get_parameter('yaw_resolution_deg').value),
            goal_xy_tol              = self.get_parameter('goal_xy_tol').value,
            goal_yaw_tol             = math.radians(self.get_parameter('goal_yaw_tol_deg').value),
            reverse_cost             = self.get_parameter('reverse_cost').value,
            dir_change_cost          = self.get_parameter('dir_change_cost').value,
            steer_change_cost        = self.get_parameter('steer_change_cost').value,
            occ_threshold            = self.get_parameter('occ_threshold').value,
            max_iter                 = self.get_parameter('max_iter').value,
            analytic_expansion_ratio = self.get_parameter('analytic_expansion_ratio').value,
            use_obstacle_heuristic   = self.get_parameter('use_obstacle_heuristic').value,
            auto_step_size           = self.get_parameter('auto_step_size').value,
        )
        self._base_frame       = self.get_parameter('base_frame').value
        self._use_nav2         = self.get_parameter('use_nav2').value
        self._nav2_planner_id  = self.get_parameter('nav2_planner_id').value
        self._nav2_timeout_sec = self.get_parameter('nav2_timeout_sec').value

    def _cb_map(self, msg: OccupancyGrid):
        self._latest_map = msg

    def _cb_info(self, msg: String):
        try:
            self._latest_info = json.loads(msg.data)
        except json.JSONDecodeError as e:
            self.get_logger().error(f'/parking_spaces_info JSON 파싱 실패: {e}')

    def _cb_spaces(self, msg: PoseArray):
        self._latest_spaces = msg

        with self._state_lock:
            if self._state != State.SEARCHING:
                return
            if not msg.poses:
                return
            if self._latest_map is None:
                self.get_logger().warn('/map 미수신 — 대기 중.',
                                       throttle_duration_sec=3.0)
                return
            if self._latest_info is None:
                self.get_logger().warn(
                    '/parking_spaces_info 미수신 — goal_yaw 결정 불가, 스킵.',
                    throttle_duration_sec=2.0)
                return

            best_info = next(
                (item for item in self._latest_info if item.get('is_best', False)),
                None
            )
            if best_info is None:
                self.get_logger().warn('is_best=True 항목 없음, 스킵.')
                return

            self._target_info = best_info
            self._state       = State.WAITING

        self.get_logger().info(
            f'[발견] 목표: ({self._target_info["mx"]:.3f}, {self._target_info["my"]:.3f}) '
            f'type={self._target_info["type"]}  '
            f'goal_yaw={math.degrees(self._target_info["goal_yaw"]):.1f}°\n'
            '  터미널에서 Y(주차 시작) / N(취소) 를 입력하세요.'
        )

    def _keyboard_listener(self):
        while rclpy.ok():
            with self._state_lock:
                state = self._state

            if state == State.WAITING and self._target_info is not None:
                info = self._target_info
                try:
                    ans = input(
                        f'\n목표: ({info["mx"]:.3f}, {info["my"]:.3f})  '
                        f'[{info["type"]}]\n'
                        '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                    ).strip().upper()
                except EOFError:
                    time.sleep(0.2)
                    continue

                if ans == 'Y':
                    with self._state_lock:
                        self._state = State.PARKING
                    self._run_parking()
                elif ans == 'N':
                    self._reset_to_searching()
                    print('주차 취소 — 계속 탐색합니다.')
            else:
                time.sleep(0.2)

    def _run_parking(self):
        print('\n경로 계획 시작...')
        info = self._target_info

        start_x, start_y, start_yaw = self._get_robot_pose()

        space_cx = info['mx']
        space_cy = info['my']

        goal_yaw = self._resolve_goal_yaw(
            base_yaw = info['goal_yaw'],
            sx=start_x, sy=start_y,
            gx=space_cx, gy=space_cy,
        )

        # 후륜 차축 오프셋 보정: 공간 중심 → 후축 목표
        lf = self._planner.vc.lf
        lb = self._planner.vc.lb
        half_offset = (lf - lb) / 2.0
        goal_x = space_cx - half_offset * math.cos(goal_yaw)
        goal_y = space_cy - half_offset * math.sin(goal_yaw)

        self.get_logger().info(
            f'공간중심=({space_cx:.3f},{space_cy:.3f})  '
            f'goal_yaw={math.degrees(goal_yaw):.1f}°  '
            f'후축목표=({goal_x:.3f},{goal_y:.3f})  '
            f'오프셋={half_offset:.3f}m'
        )
        self.get_logger().info(
            f'start=({start_x:.3f},{start_y:.3f},{math.degrees(start_yaw):.1f}°)  '
            f'goal=({goal_x:.3f},{goal_y:.3f},{math.degrees(goal_yaw):.1f}°)  '
            f'dist={math.hypot(goal_x-start_x, goal_y-start_y):.3f}m'
        )

        m   = self._latest_map
        occ = np.array(m.data, dtype=np.int8).reshape((m.info.height, m.info.width))
        ox  = m.info.origin.position.x
        oy  = m.info.origin.position.y
        res = m.info.resolution

        self._planner._occ    = occ
        self._planner._ox     = ox
        self._planner._oy     = oy
        self._planner._res    = res
        self._planner._height, self._planner._width = occ.shape

        if self._planner._in_collision(goal_x, goal_y, goal_yaw):
            self.get_logger().error(
                '목표 위치에서 차량 풋프린트 충돌 감지. '
                '공간이 차량보다 좁거나 vehicle_length/width 파라미터 확인 필요.'
            )
            self._reset_to_searching()
            return

        if self._use_nav2:
            path = self._plan_with_nav2(goal_x, goal_y, goal_yaw)
        else:
            path = self._plan_with_self(
                start_x, start_y, start_yaw,
                goal_x,  goal_y,  goal_yaw,
                occ, ox, oy, res,
            )

        if path is None:
            self.get_logger().error('경로를 찾지 못했습니다.')
            self._reset_to_searching()
            return

        self.get_logger().info(f'경로 계획 완료: {len(path)}개 웨이포인트')
        self._publish_path(path)
        self._publish_vis_markers(path)
        self._reset_to_searching()

    def _resolve_goal_yaw(
        self,
        base_yaw: float,
        sx: float, sy: float,
        gx: float, gy: float,
    ) -> float:
        """
        기준각(base_yaw)과 그 반대(+π) 중 접근 방향에 더 가까운 쪽을 선택.
        예) base_yaw=0.0, approach=-170° → 180° 선택
        """
        approach    = math.atan2(gy - sy, gx - sx)
        candidate_a = base_yaw
        candidate_b = self._norm_angle(base_yaw + math.pi)
        diff_a      = abs(self._norm_angle(candidate_a - approach))
        diff_b      = abs(self._norm_angle(candidate_b - approach))
        selected    = candidate_a if diff_a <= diff_b else candidate_b

        self.get_logger().info(
            f'[goal_yaw] base={math.degrees(base_yaw):.1f}°  '
            f'approach={math.degrees(approach):.1f}°  '
            f'선택={math.degrees(selected):.1f}°'
        )
        return selected

    @staticmethod
    def _norm_angle(a: float) -> float:
        while a >  math.pi: a -= 2.0 * math.pi
        while a < -math.pi: a += 2.0 * math.pi
        return a

    def _plan_with_self(
        self,
        sx, sy, syaw, gx, gy, gyaw,
        occ, ox, oy, res,
    ) -> Optional[List[Tuple[float, float, float]]]:
        t0      = time.monotonic()
        path    = self._planner.plan(sx, sy, syaw, gx, gy, gyaw, occ, ox, oy, res)
        elapsed = (time.monotonic() - t0) * 1000
        self.get_logger().info(f'자체 Hybrid A* 계산: {elapsed:.1f} ms')
        return path

    def _plan_with_nav2(
        self,
        gx: float, gy: float, gyaw: float,
    ) -> Optional[List[Tuple[float, float, float]]]:
        """
        Nav2 ComputePathToPose Action으로 SmacPlannerHybrid 경로 요청.

        nav2_params.yaml 설정 필요:
          planner_plugins: ["HybridAStar"]
          HybridAStar:
            plugin: "nav2_smac_planner/SmacPlannerHybrid"
            minimum_turning_radius: 0.30
            motion_model_for_search: "REEDS_SHEPP"
            angle_quantization_bins: 72
            smooth_path: true
        """
        if not self._nav2_client.wait_for_server(timeout_sec=5.0):
            self.get_logger().error(
                'Nav2 compute_path_to_pose Action 서버에 연결할 수 없습니다. '
                'Nav2 스택(planner_server)이 실행 중인지 확인하세요.'
            )
            return None

        goal_msg            = ComputePathToPose.Goal()
        goal_msg.planner_id = self._nav2_planner_id

        goal_msg.goal.header.frame_id    = 'map'
        goal_msg.goal.header.stamp       = self.get_clock().now().to_msg()
        goal_msg.goal.pose.position.x    = gx
        goal_msg.goal.pose.position.y    = gy
        goal_msg.goal.pose.position.z    = 0.0
        goal_msg.goal.pose.orientation.z = math.sin(gyaw / 2.0)
        goal_msg.goal.pose.orientation.w = math.cos(gyaw / 2.0)

        sx, sy, syaw = self._get_robot_pose()
        goal_msg.start.header.frame_id    = 'map'
        goal_msg.start.header.stamp       = goal_msg.goal.header.stamp
        goal_msg.start.pose.position.x    = sx
        goal_msg.start.pose.position.y    = sy
        goal_msg.start.pose.orientation.z = math.sin(syaw / 2.0)
        goal_msg.start.pose.orientation.w = math.cos(syaw / 2.0)
        goal_msg.use_start = True

        self.get_logger().info(
            f'Nav2 경로 요청 → goal=({gx:.3f},{gy:.3f},{math.degrees(gyaw):.1f}°) '
            f'planner={self._nav2_planner_id}'
        )

        future = self._nav2_client.send_goal_async(goal_msg)
        rclpy.spin_until_future_complete(self, future, timeout_sec=self._nav2_timeout_sec)

        if not future.done():
            self.get_logger().error('Nav2 Action 타임아웃.')
            return None

        goal_handle = future.result()
        if not goal_handle.accepted:
            self.get_logger().error('Nav2 goal 거부됨.')
            return None

        result_future = goal_handle.get_result_async()
        rclpy.spin_until_future_complete(self, result_future, timeout_sec=self._nav2_timeout_sec)

        if not result_future.done():
            self.get_logger().error('Nav2 결과 타임아웃.')
            return None

        nav2_path: Path = result_future.result().result.path

        if not nav2_path.poses:
            self.get_logger().error('Nav2 가 빈 경로 반환.')
            return None

        # nav_msgs/Path → [(x, y, yaw), ...]
        path = []
        for ps in nav2_path.poses:
            x   = ps.pose.position.x
            y   = ps.pose.position.y
            qz  = ps.pose.orientation.z
            qw  = ps.pose.orientation.w
            yaw = 2.0 * math.atan2(qz, qw)
            path.append((x, y, yaw))

        self.get_logger().info(f'Nav2 경로 수신: {len(path)}개 웨이포인트')
        return path

    def _get_robot_pose(self) -> Tuple[float, float, float]:
        try:
            tf   = self._tf_buffer.lookup_transform(
                'map', self._base_frame,
                rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.5),
            )
            tx   = tf.transform.translation.x
            ty   = tf.transform.translation.y
            q    = tf.transform.rotation
            siny = 2.0 * (q.w * q.z + q.x * q.y)
            cosy = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
            return tx, ty, math.atan2(siny, cosy)
        except tf2_ros.TransformException as e:
            self.get_logger().warn(f'TF 오류 ({e}); 원점(0,0,0) 사용',
                                   throttle_duration_sec=5.0)
            return 0.0, 0.0, 0.0

    def _reset_to_searching(self):
        with self._state_lock:
            self._target_info = None
            self._state       = State.SEARCHING
        self.get_logger().info('SEARCHING 상태로 복귀.')

    def _publish_path(self, path):
        ros_path             = Path()
        ros_path.header.stamp    = self.get_clock().now().to_msg()
        ros_path.header.frame_id = 'map'
        for x, y, yaw in path:
            ps                        = PoseStamped()
            ps.header                 = ros_path.header
            ps.pose.position.x        = x
            ps.pose.position.y        = y
            ps.pose.orientation.z     = math.sin(yaw / 2.0)
            ps.pose.orientation.w     = math.cos(yaw / 2.0)
            ros_path.poses.append(ps)
        self._pub_path.publish(ros_path)

    def _publish_vis_markers(self, path):
        ma    = MarkerArray()
        stamp = self.get_clock().now().to_msg()

        line                 = Marker()
        line.header.stamp    = stamp
        line.header.frame_id = 'map'
        line.ns, line.id     = 'parking_path_line', 0
        line.type            = Marker.LINE_STRIP
        line.action          = Marker.ADD
        line.scale.x         = 0.015
        line.color           = ColorRGBA(r=1.0, g=0.5, b=0.0, a=0.9)
        line.lifetime.sec    = 10
        for x, y, _ in path:
            p = Point()
            p.x, p.y, p.z = x, y, 0.05
            line.points.append(p)
        ma.markers.append(line)

        sample_step = max(1, len(path) // 10)
        for i, (x, y, yaw) in enumerate(path[::sample_step]):
            arrow                      = Marker()
            arrow.header.stamp         = stamp
            arrow.header.frame_id      = 'map'
            arrow.ns                   = 'parking_path_arrows'
            arrow.id                   = i + 1
            arrow.type                 = Marker.ARROW
            arrow.action               = Marker.ADD
            arrow.pose.position.x      = x
            arrow.pose.position.y      = y
            arrow.pose.position.z      = 0.05
            arrow.pose.orientation.z   = math.sin(yaw / 2.0)
            arrow.pose.orientation.w   = math.cos(yaw / 2.0)
            arrow.scale.x, arrow.scale.y, arrow.scale.z = 0.07, 0.02, 0.02
            arrow.color                = ColorRGBA(r=0.0, g=0.8, b=1.0, a=0.9)
            arrow.lifetime.sec         = 10
            ma.markers.append(arrow)

        self._pub_markers.publish(ma)


# ─────────────────────────────────────────────────────────────────────────────
# 진입점
# ─────────────────────────────────────────────────────────────────────────────

def main(args=None):
    rclpy.init(args=args)
    node = HybridAStarNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('종료.')
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
```


## vehicle_control_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry, Path
from geometry_msgs.msg import Twist
from std_msgs.msg import Bool
import math

class VehicleControlNode(Node):
    def __init__(self):
        super().__init__('vehicle_control_node')

    # 1. 서브스크라이버 선언: 현재 위치, 주차 경로, 긴급 정지 상황 구독
        self.odom_sub = self.create_subscription(Odometry, '/odom', self.odom_callback, 10)
        self.path_sub = self.create_subscription(Path, '/parking_path', self.path_callback, 10)
        self.trigger_sub = self.create_subscription(Bool, '/emergency_trigger', self.emergency_callback, 10)

        # 2. 퍼블리셔 선언: safety_node가 가로채서 검사할 수 있도록 RAW 토픽으로 발행!
        self.cmd_pub = self.create_publisher(Twist, '/cmd_vel_raw', 10)

        # 3. 제어 알고리즘 파라미터 (RC카 제원에 맞춰 선언)
        self.wheelbase = 0.25         # 축거 (바퀴 축 간격, m)
        self.lookahead_dist = 0.3      # 조준 거리 (m, 값이 작을수록 경로에 칼같이 붙고, 크면 부드러워짐)
        self.target_speed = 0.15       # 기본 주행 속도 (m/s, 안전한 주차를 위해 저속 세팅)

        # 상태 변수 초기화
        self.current_path = None
        self.emergency_triggered = False
        self.robot_x = 0.0
        self.robot_y = 0.0
        self.robot_yaw = 0.0

        self.get_logger().info("Pure Pursuit 주차 추적 제어기(Vehicle Control Node) 활성화 완료.")

    def path_callback(self, msg):
        """ 새 주차 경로가 들어오면 제어기에 경로를 등록합니다. """
        if len(msg.poses) > 0:
            self.current_path = msg.poses
            self.get_logger().info(f"새로운 주차 경로가 제어기에 등록되었습니다. 웨이포인트 개수: {len(msg.poses)}")

    def emergency_callback(self, msg):
        """ 긴급 정지 상황 여부를 실시간으로 업데이트합니다. """
        self.emergency_triggered = msg.data

    def odom_callback(self, msg):
        """ 오도메트리가 들어올 때마다(약 50Hz) 가야 할 조향각을 실시간 연산하여 모터 명령 생성 """
        # 현재 차량 포즈 업데이트
        self.robot_x = msg.pose.pose.position.x
        self.robot_y = msg.pose.pose.position.y
        
        # 쿼터니언 각도를 Yaw 각도로 변환
        qz = msg.pose.pose.orientation.z
        qw = msg.pose.pose.orientation.w
        self.robot_yaw = 2.0 * math.atan2(qz, qw)

        # 출력할 속도 명령 박스 준비
        cmd_msg = Twist()

        # 만약 긴급 정지 상황이거나 등록된 주차 경로가 없으면 정지 명령을 쏩니다.
        if self.emergency_triggered or self.current_path is None:
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 🎯 Pure Pursuit 핵심 연산 시작
        target_pt = self.get_lookahead_point()

        if target_pt is None:
            # 경로의 끝자락(종점)에 거의 도달했거나 경로를 완전히 이탈한 경우 정지
            self.get_logger().info("주차 목표 지점에 도달 완료하여 차량을 정지합니다.")
            self.current_path = None # 경로 초기화
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 차량 기준 좌표계(Local Frame)로 조준점 위치 변환
        dx = target_pt.pose.position.x - self.robot_x
        dy = target_pt.pose.position.y - self.robot_y

        # 회전 변환 행렬을 적용하여 차량 중심 기준 상대 좌표(local_x, local_y) 도출
        local_x = dx * math.cos(-self.robot_yaw) - dy * math.sin(-self.robot_yaw)
        local_y = dx * math.sin(-self.robot_yaw) + dy * math.cos(-self.robot_yaw)

        # 🔄 전진/후진 판별 로직
        # 조준점이 차량 앞쪽에 있으면 전진, 뒤쪽에 있으면 후진 주차 상황임
        direction = 1.0 if local_x >= 0.0 else -1.0

        # 기하학적 Pure Pursuit 곡률 계산 공식
        # 조준 거리 정방형 분의 2 * 상대 Y축 변위
        L_sq = self.lookahead_dist ** 2
        curvature = (2.0 * local_y) / L_sq if L_sq > 0 else 0.0

        # 아커만 조향(Ackermann Steering) 공식에 따른 최종 핸들 조향각 계산
        # delta = atan(휠베이스 * 곡률)
        steering_angle = math.atan2(self.wheelbase * curvature, 1.0)

        # 최종 명령 적재 후 발행
        cmd_msg.linear.x = self.target_speed * direction  # 전진은 +, 후진은 - 속도 배정
        cmd_msg.angular.z = steering_angle                # 조향각 (라디안 단위)
        
        self.cmd_pub.publish(cmd_msg)

    def get_lookahead_point(self):
        """ 현재 차량 위치에서 조준 거리(Look-ahead)와 가장 일치하는 경로 상의 점을 검색 """
        best_wp = None
        min_dist_error = float('inf')

        for wp in self.current_path:
            dist = math.hypot(wp.pose.position.x - self.robot_x, wp.pose.position.y - self.robot_y)
            error = abs(dist - self.lookahead_dist)
            
            # 내가 설정한 조준 거리(30cm)와 거리 차이가 가장 적은 포인트를 픽합니다.
            if error < min_dist_error:
                min_dist_error = error
                best_wp = wp

        # 만약 최적의 포인트를 찾았더라도, 경로의 최종 종점과 내 차의 거리가 5cm 이내라면 다 온 것으로 판정
        final_wp = self.current_path[-1]
        final_dist = math.hypot(final_wp.pose.position.x - self.robot_x, final_wp.pose.position.y - self.robot_y)
        if final_dist < 0.05:
            return None

        return best_wp

def main(args=None):
    rclpy.init(args=args)
    node = VehicleControlNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## safety_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray, Bool
from geometry_msgs.msg import Twist

class SafetyNode(Node):
    def __init__(self):
        super().__init__('safety_node')

        # 1. 서브스크라이버 선언: 초음파 거리 및 차량의 원래 제어 명령 감시
        # [전, 후, 좌, 우] 형태의 배열 수신
        self.distance_sub = self.create_subscription(Float32MultiArray, '/filtered_distance', self.distance_callback, 10)
        # vehicle_control_node가 보내는 주행 명령을 가로채기 위해 구독
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel_raw', self.cmd_vel_raw_callback, 10)

        # 2. 퍼블리셔 선언: 최종 안전이 검증된 명령 송신 및 긴급 제동 플래그 발행
        # stm32_bridge_node가 최종적으로 받아서 실행할 안전한 cmd_vel
        self.cmd_vel_pub = self.create_publisher(Twist, '/cmd_vel', 10)
        # 다른 노드들에게 긴급 상황임을 알리는 플래그 방송
        self.trigger_pub = self.create_publisher(Bool, '/emergency_trigger', 10)

        # 3. 안전 파라미터 및 상태 변수 설정
        self.CRITICAL_DISTANCE = 4.0  # 긴급 정지 임계치 (4.0cm)
        self.emergency_trigger = False
        
        # 최신 초음파 거리 저장용 변수 [전, 후, 좌, 우] (초기값은 충분히 먼 거리인 400cm)
        self.current_distances = [400.0, 400.0, 400.0, 400.0]

        self.get_logger().info("안전 감시 브레인(Safety Node)이 활성화되었습니다.")

    def distance_callback(self, msg):
        """ 초음파 센서 값을 받아 실시간으로 거리를 갱신하는 콜백 함수 """
        if len(msg.data) == 4:
            self.current_distances = msg.data

    def cmd_vel_raw_callback(self, msg):
        """ 주행 제어기가 보낸 명령을 받아서, 안전 검사 후 STM32 브리지로 토스하는 핵심 함수 """
        front_dist = self.current_distances[0]
        back_dist  = self.current_distances[1]

        # 기본적으로 주행 노드가 보낸 속도와 조향각을 복사
        safe_cmd = Twist()
        safe_cmd.linear.x = msg.linear.x
        safe_cmd.angular.z = msg.angular.z

        # 🚨 [안전 검사 로직]
        # 상황 A: 차량이 전진(속도 > 0)하려는데 전방 거리가 임계치보다 가까운 경우
        if msg.linear.x > 0.0 and front_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [전방 위험!] 정면 장애물 감지 ({front_dist:.1f}cm). 강제 제동합니다!")

        # 상황 B: 차량이 후진(속도 < 0)하려는데 후방 거리가 임계치보다 가까운 경우
        elif msg.linear.x < 0.0 and back_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [후방 위험!] 후면 장애물 감지 ({back_dist:.1f}cm). 강제 제동합니다!")
        
        else:
            # 위험 상황이 아니면 플래그 해제
            self.emergency_trigger = False

        # 🛑 긴급 상황일 경우 모든 속도 명령을 무조건 0으로 차단!
        if self.emergency_trigger:
            safe_cmd.linear.x = 0.0
            # 조향(핸들)은 안전을 위해 그대로 유지하거나 필요시 0으로 제어
            safe_cmd.angular.z = msg.angular.z  

        # 최종 검증된(또는 차단된) 안전한 명령을 STM32 브리지가 보고 있는 토픽으로 최종 발행
        self.cmd_vel_pub.publish(safe_cmd)

        # 다른 노드들에게도 현재 긴급 상황 여부를 실시간 방송
        trigger_msg = Bool()
        trigger_msg.data = self.emergency_trigger
        self.trigger_pub.publish(trigger_msg)

def main(args=None):
    rclpy.init(args=args)
    node = SafetyNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## parking_operator.py

```javascript
#!/usr/bin/env python3
"""
SPAS Parking Operator Node  ―  Y/N 키보드 조작 노드
=====================================================

hybrid_A_star_node 가 주차 공간을 찾아 WAITING 상태가 되면 /parking_waiting
토픽으로 대상 정보를 발행한다. 이 노드는 그 신호를 받아 터미널에 Y/N
프롬프트를 띄우고, 입력 결과를 /parking_start(Bool) 로 발행한다.

플래너(hybrid_A_star_node)는 launch 안에 그대로 두고, 이 노드만 자체
터미널에서 단독 실행하면 Y/N 키보드 입력을 그대로 쓸 수 있다.
  ros2 run spas_planning parking_operator

【구독】 /parking_waiting (String/JSON)  비어있으면 대기 공간 없음(프롬프트 닫힘)
【발행】 /parking_start   (Bool)         True=주차 시작 / False=취소
"""

import json
import threading
import time

import rclpy
from rclpy.node import Node
from rclpy.qos import DurabilityPolicy, QoSProfile
from std_msgs.msg import Bool, String


class ParkingOperatorNode(Node):
    def __init__(self):
        super().__init__('parking_operator')

        # 플래너의 /parking_waiting 은 transient_local(래치)로 발행되므로
        # 이 노드가 늦게 떠도 마지막 상태를 받도록 동일 QoS 로 구독한다.
        latched_qos = QoSProfile(depth=1, durability=DurabilityPolicy.TRANSIENT_LOCAL)
        self.create_subscription(String, '/parking_waiting', self._cb_waiting, latched_qos)
        self._pub_start = self.create_publisher(Bool, '/parking_start', 10)

        self._lock         = threading.Lock()
        self._waiting_info = None   # dict(대상 정보) 또는 None
        self._waiting_seq  = 0      # WAITING 진입마다 증가 → 중복/지연 프롬프트 구분

        threading.Thread(target=self._prompt_loop, daemon=True).start()
        self.get_logger().info(
            'parking_operator 시작. 주차 공간 발견 시 이 터미널에서 Y/N 를 입력하세요.'
        )

    # ── /parking_waiting 콜백 ─────────────────────────────────────────
    def _cb_waiting(self, msg: String):
        data = msg.data.strip()
        with self._lock:
            if data:
                try:
                    self._waiting_info = json.loads(data)
                except json.JSONDecodeError:
                    self._waiting_info = {}
                self._waiting_seq += 1
            else:
                # WAITING 이탈 → 프롬프트 닫힘 표시
                self._waiting_info = None

    # ── Y/N 프롬프트 루프 (별도 스레드, input 블로킹) ─────────────────
    def _prompt_loop(self):
        handled_seq = -1
        while rclpy.ok():
            with self._lock:
                info = self._waiting_info
                seq  = self._waiting_seq

            # 대기 공간이 없거나 이미 처리한 세션이면 쉬어간다.
            if info is None or seq == handled_seq:
                time.sleep(0.2)
                continue

            mx    = info.get('mx')
            my    = info.get('my')
            ptype = info.get('type', '?')
            try:
                ans = input(
                    f'\n[주차 공간 발견] 목표: ({mx}, {my})  [{ptype}]\n'
                    '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                ).strip().upper()
            except EOFError:
                self.get_logger().error(
                    'stdin(TTY)이 없어 키보드 입력을 받을 수 없습니다. '
                    '이 노드는 ros2 run 으로 단독 실행해야 합니다.'
                )
                time.sleep(1.0)
                continue

            # 입력하는 동안 상태가 바뀌었으면(다른 경로로 시작/취소) 무시.
            with self._lock:
                still_waiting = (self._waiting_info is not None
                                 and self._waiting_seq == seq)
            if not still_waiting:
                print('상태가 변경되어 입력을 무시합니다.')
                handled_seq = seq
                continue

            if ans == 'Y':
                self._publish(True)
                print('▶ 주차 시작 명령을 전송했습니다.')
                handled_seq = seq
            elif ans == 'N':
                self._publish(False)
                print('■ 주차 취소 명령을 전송했습니다.')
                handled_seq = seq
            else:
                print('Y 또는 N 만 입력하세요.')
                # handled_seq 갱신 안 함 → 같은 세션을 다시 프롬프트

    def _publish(self, decision: bool):
        msg = Bool()
        msg.data = decision
        self._pub_start.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = ParkingOperatorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()

```


## spas_control

## spas_control

## stm32_bridge_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from geometry_msgs.msg import TransformStamped
import tf2_ros

import serial
import struct
import math

class Stm32BridgeNode(Node):
    def __init__(self):
        super().__init__('stm32_bridge_node')
        
        # 1. ROS 2 퍼블리셔 및 서브스크라이버 선언
        # 판단 레이어로부터 주행 명령 수신
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel', self.cmd_vel_callback, 10)
        # 판단 레이어 및 SLAM으로 오도메트리 좌표 정보 송신
        self.odom_pub = self.create_publisher(Odometry, '/odom', 10)
        # 실전용 동적 TF 브로드캐스터 생성 (odom -> base_link 위치 연결 고리)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster(self)

        # 2. STM32 시리얼 포트 연결 설정 (CH9102F 내장 보드)
        stm32_port = '/dev/ttyUSB0'  # 라즈베리파이 환경에 맞게 ttyUSB1 등으로 변경 가능
        baud_rate = 115200
        try:
            self.ser = serial.Serial(stm32_port, baud_rate, timeout=0.1)
            self.ser.flush()
            self.get_logger().info(f"STM32 제어기 연결 성공: {stm32_port}")
        except Exception as e:
            self.get_logger().error(f"STM32 제어기 연결 실패: {e}")
            return

        # 3. 오도메트리(위치 추정) 연산용 변수 초기화
        self.x = 0.0        # 차량의 현재 X 좌표 (m)
        self.y = 0.0        # 차량의 현재 Y 좌표 (m)
        self.th = 0.0       # 차량의 현재 헤딩 각도 (Yaw, rad)
        self.last_time = self.get_clock().now()

        # 차량 제원 설정 (RC카의 물리적 수치에 맞게 추후 수정 가능)
        self.wheel_track = 0.22  # 좌우 바퀴 간격 (m)

        # 4. STM32로부터 데이터(엔코더 피드백)를 수신하기 위한 고속 주기 타이머 (50Hz = 0.02초)
        self.create_timer(0.02, self.read_stm32_data)

    # ──────────────────────────────────────────────────────────
    # TX: 라즈베리파이 -> STM32 (명령 송신)
    # ──────────────────────────────────────────────────────────
    def cmd_vel_callback(self, msg):
        # ROS 2의 m/s 및 rad/s 단위를 STM32용 정수 데이터형으로 변환
        # 선속도: m/s -> mm/s 단위 정수로 변환
        linear_x_mm = int(msg.linear.x * 1000.0)
        # 조향각: rad -> 0.01도 단위 정수로 변환
        steering_deg_001 = int(math.degrees(msg.angular.z) * 100.0)

        # 헥사 패킷 규격 빌드: 헤더(0x55, 0xAA), CMD(0x01), 데이터 길이(4바이트)
        header = b'\x55\xAA'
        cmd_id = b'\x01'
        length = b'\x04'
        
        # Payload 패킹: h(signed short, 2바이트) 2개로 묶음 -> 총 4바이트
        payload = struct.pack('<hh', linear_x_mm, steering_deg_001)

        # 체크섬 계산 (Header부터 Payload까지의 모든 바이트 합의 하위 1바이트)
        full_packet_without_cs = header + cmd_id + length + payload
        checksum = bytes([sum(full_packet_without_cs) & 0xFF])

        # 최종 패킷 완성 후 STM32로 전송
        final_packet = full_packet_without_cs + checksum
        try:
            self.ser.write(final_packet)
        except Exception as e:
            self.get_logger().error(f"STM32 명령 송신 실패: {e}")

    # ──────────────────────────────────────────────────────────
    # RX: STM32 -> 라즈베리파이 (피드백 수신 및 /odom 연산)
    # ──────────────────────────────────────────────────────────
    def read_stm32_data(self):
        # 수신 버퍼에 최소 패킷 크기(헤더2+CMD1+LEN1+DATA4+CS1 = 9바이트) 이상 쌓였는지 확인
        if self.ser.in_waiting >= 9:
            # 0x55 0xAA 헤더를 찾기 위한 정렬 동기화 로직
            if self.ser.read(1) == b'\x55':
                if self.ser.read(1) == b'\xAA':
                    cmd_id = self.ser.read(1)
                    length = int.from_bytes(self.ser.read(1), byteorder='little')
                    
                    # 피드백 데이터 패킷(CMD: 0x02)인지 검증
                    if cmd_id == b'\x02' and length == 4:
                        payload = self.ser.read(4)
                        checksum = self.ser.read(1)
                        
                        # 체크섬 무결성 검증
                        calc_sum = (0x55 + 0xAA + int.from_bytes(cmd_id, 'little') + length + sum(payload)) & 0xFF
                        if checksum == bytes([calc_sum]):
                            # 데이터 해독: 좌/우 바퀴 속도 (mm/s) -> m/s 단위 실수로 복원
                            left_vel_mm, right_vel_mm = struct.unpack('<hh', payload)
                            v_left = left_vel_mm / 1000.0
                            v_right = right_vel_mm / 1000.0

                            # 데드 레코닝(Dead Reckoning) 기반 오도메트리 연산 수행
                            self.calculate_odometry(v_left, v_right)
                        else:
                            self.get_logger().warn("STM32 수신 패킷의 체크섬이 일치하지 않습니다.")

    def calculate_odometry(self, v_left, v_right):
        current_time = self.get_clock().now()
        dt = (current_time - self.last_time).nanoseconds / 1e9
        self.last_time = current_time

        if dt <= 0.0:
            return

        # 두 바퀴의 속도를 바탕으로 차량 중심의 선속도(v)와 각속도(w) 산출
        v = (v_right + v_left) / 2.0
        w = (v_right - v_left) / self.wheel_track

        # 삼각함수를 통한 실시간 로봇 상대 좌표 변위 계산
        delta_x = (v * math.cos(self.th)) * dt
        delta_y = (v * math.sin(self.th)) * dt
        delta_th = w * dt

        # 절대 좌표계 누적
        self.x += delta_x
        self.y += delta_y
        self.th += delta_th

        # 오일러 각도(Yaw)를 ROS 2 표준 사원수(Quaternion) 구조로 변환
        cy = math.cos(self.th * 0.5)
        sy = math.sin(self.th * 0.5)
        odom_quat = [0.0, 0.0, sy, cy]

        # 1. Dynamic TF 브로드캐스팅 발행 (기존의 임시 고정 static TF 명령을 완벽히 대체!)
        t = TransformStamped()
        t.header.stamp = current_time.to_msg()
        t.header.frame_id = 'odom'
        t.child_frame_id = 'base_link'
        t.transform.translation.x = self.x
        t.transform.translation.y = self.y
        t.transform.translation.z = 0.0
        t.transform.rotation.x = odom_quat[0]
        t.transform.rotation.y = odom_quat[1]
        t.transform.rotation.z = odom_quat[2]
        t.transform.rotation.w = odom_quat[3]
        self.tf_broadcaster.sendTransform(t)

        # 2. Odometry 토픽 메시지 발행
        odom = Odometry()
        odom.header.stamp = current_time.to_msg()
        odom.header.frame_id = 'odom'
        odom.child_frame_id = 'base_link'
        odom.pose.pose.position.x = self.x
        odom.pose.pose.position.y = self.y
        odom.pose.pose.position.z = 0.0
        odom.pose.pose.orientation.x = odom_quat[0]
        odom.pose.pose.orientation.y = odom_quat[1]
        odom.pose.pose.orientation.z = odom_quat[2]
        odom.pose.pose.orientation.w = odom_quat[3]
        odom.twist.twist.linear.x = v
        odom.twist.twist.angular.z = w
        self.odom_pub.publish(odom)

def main(args=None):
    rclpy.init(args=args)
    node = Stm32BridgeNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        if hasattr(node, 'ser') and node.ser.is_open:
            node.ser.close()
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


[SPAS_SWDD_%EC%BD%94%EB%93%9C%EC%83%81%EC%84%B8%EC%84%A4%EB%AA%85%EC%84%9C.pdf](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/96e98060-8c29-4d33-ace9-17f06484b835/SPAS_SWDD_%EC%BD%94%EB%93%9C%EC%83%81%EC%84%B8%EC%84%A4%EB%AA%85%EC%84%9C.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TVDETH7D%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222210Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJIMEYCIQCHk92FnQzDZgn7F6rDjYVsbOMrf1rr4migDZcZI064vQIhAJ2uAeHHcRP6avO94mbvusqrx6Si8E10U5TnwNNKhgDyKogECM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzMmrojIEry8sTamU0q3ANh4jxVMu4azkCpqSoNN2dmZDgZUuIzhGsQkgPfI2SviQnrJC9Nu9J37PPPSzQirLO5KbD31dhuFWVlcqtUUQCGw1Jse9Lc3H4cJ1N3lahMu4T6NgBM4RomwQs91z7HSsLx9Rs%2FvUuzZUgETQdfLnYwAhcHHf62rax5Q8HXynmaWwbrLjW2rG1Pj066Y7lZMTXf0hrn%2Fp68PIBBBZZhbXDHbfxOVJZMW4qOhz9EDquN0puG1oYJ%2Frw5ctuESckmeO8C8PrE1ShFewnJc0GEJesEIfyFm22DoFrXca2hBlQT3j8tRJxzWmnpLVDiSVO3u2P2P5AuuiVW97mwQQ1glQ5ASi2RkhQd6uioLpmWvrlXfTstQb%2FF9M5sk3hjSC3BQyksh2QTS0LZlQFzmaR7HSy5Klmjmx%2FxTm8za0q26EfzQY%2Bn5Ko84vccMX1aq5nTRyZARQP0%2FY4pLtbloW%2FxQgao%2FT11swB%2BTLG0YqajSmxSAvFUHAdbuEV6OHcZ50574NZyu5GXTrHYpT7xhdQPSU%2BJ4%2FvCpvX6skIkz5Oq64q%2BEn%2F3AgKb8amGMHkiuyTJ6HoS4%2FF4jZRXE6rplky9z3EDUJoCLiLlYEAIKNimaQ58XyHHxr8VVY2lwFzhADCJ5pDSBjqkAZeq7JNj1F2t9AH6lraQsXLPoE9XctXIHyXT0tdm%2BmSU3pB8ivZhFBbRHQtSLvidUhz5TgjD1B5ApiRPrF1el8uxu2TKMhUOYVelbyld16d7CUY96TCIsNh02ntzfL33i5hO8zgCCA6r5KSqtEpDcV3nFBAPk4Xj0NveGC%2FbIS%2FjPYuT7GKqQ%2FWi5mvXG0PgIkXqHxY50gH%2BwEGz9Bt8pz%2FFLWBu&X-Amz-Signature=f1dcecd62fb035f8c32dafda9d272fe2040ed1edd9bc5f5d12a5243cb0f7ffb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


프로젝트 초기 설치 방법


```bash
# 1. 작업 공간(Workspace) 폴더 및 src 폴더 만들기
mkdir -p ~/spas_ws/src
cd ~/spas_ws/src

# 2. 우리 팀이 코딩할 파이썬(Python) 기반 패키지 3개 생성
ros2 pkg create --build-type ament_python spas_perception
ros2 pkg create --build-type ament_python spas_planning
ros2 pkg create --build-type ament_python spas_control

# 3. 마스터 런치(Launch) 파일이 들어갈 빌드 패키지 생성 (런치 전용은 보통 CMake 타입으로 만듭니다)
ros2 pkg create --build-type ament_cmake spas_bringup
```


```bash
# 1. 기성품 라이다 드라이버 패키지 다운로드 (Slamtec 공식 깃허브)
git clone https://github.com/Slamtec/sllidar_ros2.git

# 2. 실시간 지도 생성(SLAM) 패키지 다운로드 (ROS 2 Humble 공식 소스코드)
# 분기(Branch)를 humble 버전에 맞추어 정확하게 다운로드합니다.
git clone -b humble https://github.com/SteveMacenski/slam_toolbox.git
```


```bash
# launch 폴더 생성
mkdir -p ~/spas_ws/src/spas_bringup/launch
```


```bash
# 1. 작업 공간 루트(최상단) 폴더로 이동
cd ~/spas_ws

# 2. 다운로드한 패키지들이 요구하는 리눅스 의존성 라이브러리 자동 설치
sudo apt update
rosdep update
rosdep install --from-paths src --ignore-src -r -y

# 3. 프로젝트 전체 빌드 (조립 시작 - 컴퓨터 사양에 따라 1~3분 소요)
colcon build --symlink-install

# 4. 빌드 성공 후, 현재 터미널 창에 우리 자율주행 주소록(환경변수) 등록
source install/setup.bash
```


빌드방법


```bash
# 1. 작업 공간 이동
cd ~/spas_ws

# 2. 소스코드 빌드 실행 (colcon 빌드 도구 사용)
colcon build --symlink-install

# 3. 빌드 완료 후, 현재 터미널 창에 우리 프로젝트의 주소록(환경변수) 등록
source install/setup.bash
```


실행방법


```bash
# 터미널 창 1개만 실행
source ~/spas_ws/install/setup.bash
ros2 launch spas_bringup spas_bringup_launch.py
```


### 1.`spas_bringup_launch.py` (런치 파일)

- **할 일:** ROS 2 런치 시스템(LaunchDescription)을 이용해 라이다, SLAM, 그리고 우리가 만든 5개의 노드가 컴퓨터 메모리에 순차적으로 켜지도록 경로를 지정하고 묶어줍니다.

### 2.`sensor_filter_node.py` (인지 계층)

- **할 일:** 아두이노가 보낸 패킷이 `S`로 시작하고 `E`로 끝나는지 검사한 뒤, 가운데 4개 숫자를 쪼개서 `[전, 후, 좌, 우]` 리스트로 묶어 `/filtered_distance` 토픽으로 내보냅니다.

### 3.`parking_space_detector.py` (판단 계층)

- **할 일:** `slam_toolbox`가 실시간으로 그려주는 `/map` (이진 격자 지도) 데이터를 받아옵니다. 구역을 슬라이딩 윈도우로 훑으면서, 장애물 점들이 없고 차가 들어갈 수 있는 직사각형 빈 공간을 찾아내어 그 좌표를 `/parking_spaces`로 출력합니다.

### 4.`hybrid_A_star_node.py` (판단 계층)

- **할 일:**  차량의 회전 반경 기하학(Ackermann Steering)을 수학적으로 녹여내어, 후진 주차가 가능한 곡선 형태의 주차 궤적 경로(`/parking_path`)를 계산해 냅니다.

### 5.`vehicle_control_node.py` (판단 계층)

- **할 일:** 차량의 현재 위치(`/odom`)와 가야 할 경로(`/parking_path`)를 비교하여, 앞쪽의 가상 조준점을 잡고 핸들 조향 각도와 속도를 결정하는 명령인 `/cmd_vel`을 만들어냅니다.

### 6.`safety_node.py` (판단 계층)

- **할 일:** `sensor_filter_node`가 쏘는 초음파 거리 데이터를 실시간 감시합니다. 만약 후진 주차 중인데 후방 초음파 값이 임계치 밑으로 떨어지면, 주행 노드가 보내는 속도 명령을 가로채서 즉시 강제로 `0`으로 만들고 `emergency_trigger` 플래그를 켭니다.

### 7. `stm32_bridge_node.py` (제어 계층)

- **할 일:** 제어기 노드가 준 `/cmd_vel`(선속도 m/s, 조향각 rad)을 STM32가 알아들을 수 있는 문자(Hex 패킷)로 변환해 USB로 쏩니다. 동시에 STM32가 쏴주는 좌/우 바퀴 엔코더 값을 역산하여, 현재 차체의 위치와 상태를 누적 계산(Dead Reckoning)하여 `/odom` 토픽과 TF 좌표를 발행합니다.

## STM32

```text
~/spas_ws/
└── src/
    ├── sllidar_ros2/                    # (오픈소스) RPLIDAR A1 구동 패키지
    ├── slam_toolbox/                    # (오픈소스) 2D 지도 생성 패키지
    │
    ├── spas_bringup/                    # 🚀 [통합 제어] 시스템 전체를 켜주는 마스터 패키지
    │   ├── CMakeLists.txt
    │   ├── package.xml
    │   └── launch/
    │       └── spas_bringup_launch.py   # 방법1: 단 한 줄로 시동 거는 마스터 런치 파일
    │
    ├── spas_perception/                 # 👁️ [인지 레이어] 
    │   ├── package.xml
    │   ├── setup.py
    │   └── spas_perception/
    │       └── sensor_filter_node.py    # 아두이노 초음파 수신 및 파싱 노드
    │
    ├── spas_planning/                   # 🧠 [판단 레이어]
    │   ├── package.xml
    │   ├── setup.py
    │   └── spas_planning/
    │       ├── parking_space_detector.py # 주차 칸 탐지 노드
    │       ├── hybrid_A_star_node.py    # 하이브리드 A* 경로 생성 노드
    │       ├── vehicle_control_node.py  # 경로 추적 제어 노드 (Pure Pursuit 등)
    │       └── safety_node.py           # 긴급 제동 및 PDW 감시 노드
    │
    └── spas_control/                    # ⚙️ [제어 레이어]
        ├── package.xml
        ├── setup.py
        └── spas_control/
            └── stm32_bridge_node.py     # STM32 UART 통신 및 /odom 동적 발행 노드
            
            
   -- tmp
   
            
```


## STM32 main.c

```c
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim5;

UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM2_Init(void);
static void MX_TIM5_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
// 1.
void delay_us(uint32_t us) {
    uint32_t count = us * 14;
    while(count--) {
        __NOP();
    }
}

// 2.
void Servo_GPIO_Control(uint32_t pulse_us) {
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_SET);
    delay_us(pulse_us);

    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);
    delay_us(20000 - pulse_us);
}
// M1 모터  (PE13: TIM1_CH3, PE14: TIM1_CH4)
void Motor1_Control(int speed, int direction) {
    if (direction == 1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, speed);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    } else if (direction == -1) {
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, speed);
    } else { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, 0);
    }
}

// M2 모터 (PE9: TIM1_CH1, PE11: TIM1_CH2)
void Motor2_Control(int speed, int direction) {
    if (direction == 1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, speed);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    } else if (direction == -1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, speed);
    } else { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    }
}

#include <stdint.h>

// --- UART 수신용 (RX) 변수 ---
uint8_t rx_byte;
uint8_t rx_buffer[9];     // 정확히 9바이트를 담을 바구니
uint8_t rx_index = 0;
uint8_t rx_complete = 0;

// --- 파싱된 타겟 데이터 ---
int16_t target_linear_vel_mm = 0;   // 목표 선속도 (mm/s)
int16_t target_steering_deg = 0;    // 목표 조향각 (0.01도 단위)

// --- UART RX 인터럽트 콜백 ---
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
    if (huart->Instance == USART1) { 
        
        // 1. 헤더 동기화 (0x55, 0xAA가 아니면 바구니 초기화)
        if (rx_index == 0 && rx_byte != 0x55) { goto END_RX; }
        if (rx_index == 1 && rx_byte != 0xAA) { rx_index = 0; goto END_RX; }

        // 2. 바구니에 담기
        rx_buffer[rx_index++] = rx_byte;

        // 3. 9바이트(헤더2 + CMD1 + LEN1 + DATA4 + CS1)가 다 찼다면!
        if (rx_index >= 9) {
            rx_complete = 1; // 메인 루프에 파싱 지시
            rx_index = 0;    // 다음 패킷을 위해 초기화
        }

    END_RX:
        // 다음 1바이트 대기 장전
        HAL_UART_Receive_IT(&huart1, &rx_byte, 1); 
    }
}

// --- 오도메트리 송신용 (TX) 함수 ---
// 파이썬 코드의 타이머(50Hz)에 맞춰 STM32도 엔코더 값을 쏴줍니다.
void Send_Odometry_Packet(int16_t left_vel_mm, int16_t right_vel_mm) {
    uint8_t tx_buf[9];
    uint8_t checksum = 0;

    tx_buf[0] = 0x55; // Header 1
    tx_buf[1] = 0xAA; // Header 2
    tx_buf[2] = 0x02; // CMD ID (0x02: 오도메트리 피드백)
    tx_buf[3] = 0x04; // Length (4 Bytes)

    // 파이썬 구조체 struct.pack('<hh') 처럼 Little Endian으로 바이트 쪼개기
    tx_buf[4] = left_vel_mm & 0xFF;
    tx_buf[5] = (left_vel_mm >> 8) & 0xFF;
    tx_buf[6] = right_vel_mm & 0xFF;
    tx_buf[7] = (right_vel_mm >> 8) & 0xFF;

    // 체크섬 계산 (0번 인덱스부터 7번 인덱스까지 모두 더함)
    for(int i = 0; i < 8; i++) {
        checksum += tx_buf[i];
    }
    tx_buf[8] = checksum;

    // UART 전송 (폴링 방식)
    HAL_UART_Transmit(&huart1, tx_buf, 9, 10);
}

// 1. 이전 카운트 값을 기억할 전역 변수
uint32_t prev_left_count = 0;
uint32_t prev_right_count = 0;

// 2. 형님의 RC카 제원 (🚨 반드시 실제 스펙으로 수정하십시오!)
#define ENCODER_PPR     11.0f   // 모터 1회전당 펄스 수 (예시)
#define GEAR_RATIO      30.0f   // 기어비 (예: 30:1)
#define WHEEL_DIA       65.0f   // 바퀴 지름 (mm)
#define PI              3.141592f
#define DT_MS           20.0f   // 측정 주기 (20ms)

// 3. 연산 최적화를 위해 '1 Tick당 이동 거리'를 미리 계산해 둠
// 공식: 원둘레 / (PPR * 기어비)
#define DISTANCE_PER_TICK  ((PI * WHEEL_DIA) / (ENCODER_PPR * GEAR_RATIO))


// --- 왼쪽 바퀴 속도 계산 함수 ---
int16_t Get_Left_Encoder_Velocity(void) {
    // 1. 현재 타이머 카운트 읽기 (왼쪽 바퀴가 TIM2라고 가정)
    uint32_t current_count = TIM2->CNT;

    // 2. 변화량(Tick) 계산 (16비트 오버플로우/언더플로우 자동 해결!)
    int16_t delta_ticks = (int16_t)(current_count - prev_left_count);
    prev_left_count = current_count;

    // 3. 속도(mm/s) 계산: 변화량 * 1Tick거리 * (1000ms / 20ms)
    float velocity_mm_s = (delta_ticks * DISTANCE_PER_TICK) * (1000.0f / DT_MS);

    // 정수형으로 반환 (라즈베리파이에는 int16_t로 쏴야 하니까요!)
    return (int16_t)velocity_mm_s;
}

// --- 오른쪽 바퀴 속도 계산 함수 ---
int16_t Get_Right_Encoder_Velocity(void) {
    // 오른쪽 바퀴가 TIM5라고 가정
    uint32_t current_count = TIM5->CNT;

    int16_t delta_ticks = (int16_t)(current_count - prev_right_count);
    prev_right_count = current_count;

    // 만약 오른쪽 모터가 거꾸로 달려있어서 값이 반대로 나오면 delta_ticks에 -1을 곱해주면 됩니다.
    float velocity_mm_s = (delta_ticks * DISTANCE_PER_TICK) * (1000.0f / DT_MS);

    return (int16_t)velocity_mm_s;
}

/* USER CODE END 0 */

```


```c
/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_TIM5_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */
  __HAL_RCC_GPIOE_CLK_ENABLE();
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_10;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
  // 구동 모터
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_4);

  // M1, M2 
  // 
  HAL_TIM_Encoder_Start(&htim5, TIM_CHANNEL_ALL); // M1 엔코더
  HAL_TIM_Encoder_Start(&htim2, TIM_CHANNEL_ALL); // M2 엔코더

  // 최초 UART 수신 인터럽트 가동!
  HAL_UART_Receive_IT(&huart1, &rx_byte, 1);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

    // ────────────────────────────────────────────────────────
    // [1] RX 처리: 라즈베리파이의 구동 명령(CMD: 0x01) 파싱
    // ────────────────────────────────────────────────────────
    if (rx_complete == 1) {
        
        // CMD 아이디가 0x01이고 길이가 4바이트인지 확인
        if (rx_buffer[2] == 0x01 && rx_buffer[3] == 0x04) {
            
            uint8_t calc_sum = 0;
            for(int i = 0; i < 8; i++) calc_sum += rx_buffer[i];
            
            // 🚨 체크섬 검증 통과 시에만 실행 (노이즈 완벽 차단!)
            if (calc_sum == rx_buffer[8]) {
                
                // Little Endian 바이트 결합 (2바이트씩 묶어서 부호 있는 16비트 정수로!)
                target_linear_vel_mm = (int16_t)(rx_buffer[4] | (rx_buffer[5] << 8));
                target_steering_deg  = (int16_t)(rx_buffer[6] | (rx_buffer[7] << 8));

                // ----------------------------------------------------
                // 🔥 형님의 모터 제어 함수로 맵핑 (수치는 상황에 맞게 튜닝!)
                // ----------------------------------------------------
                // 1. 전후진 제어 (목표 속도가 0 이상이면 전진, 아니면 후진)
                if (target_linear_vel_mm > 0) {
                    Motor1_Control(25000, 1);
                } else if (target_linear_vel_mm < 0) {
                    Motor1_Control(25000, 0); // 방향 0으로 후진 (예시)
                } else {
                    Motor1_Control(0, 0);     // 정지
                }

                // 2. 조향 제어 (0.01도 단위 각도를 PWM으로 매핑)
                // 예: 직진 0도 -> 1900 / 좌 3000(30도) -> 1200 / 우 -3000(-30도) -> 2800 등
                int steer_pwm = 1900 - (target_steering_deg * (700 / 3000)); // 매핑 비율 예시
                
                // 안전장치 (PWM 한계 고정)
                if(steer_pwm < 1200) steer_pwm = 1200;
                if(steer_pwm > 2800) steer_pwm = 2800;
                
                Servo_GPIO_Control(steer_pwm);
            }
        }
        rx_complete = 0; 
    }

    // ────────────────────────────────────────────────────────
    // [2] TX 처리: 오도메트리 데이터 50Hz(20ms) 주기 발송
    // ────────────────────────────────────────────────────────
    // 타이머 틱(HAL_GetTick)을 이용해 20ms마다 엔코더 값을 쏩니다.
    static uint32_t last_tx_time = 0;
    if (HAL_GetTick() - last_tx_time >= 20) {
        last_tx_time = HAL_GetTick();

        // 1. 형님이 작성해두신 엔코더 함수를 통해 현재 좌/우 바퀴 속도(mm/s) 계산
        int16_t current_left_vel = Get_Left_Encoder_Velocity();   // 형님의 함수로 대체!
        int16_t current_right_vel = Get_Right_Encoder_Velocity(); // 형님의 함수로 대체!

        // 2. 패킷 조립 및 라즈베리파이로 쾅! 발사
        Send_Odometry_Packet(current_left_vel, current_right_vel);
    }

  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 168;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

```


```c
/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 65535;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_Encoder_InitTypeDef sConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 0;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 60000;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  sConfig.EncoderMode = TIM_ENCODERMODE_TI12;
  sConfig.IC1Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC1Filter = 0;
  sConfig.IC2Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC2Filter = 0;
  if (HAL_TIM_Encoder_Init(&htim2, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * @brief TIM5 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM5_Init(void)
{

  /* USER CODE BEGIN TIM5_Init 0 */

  /* USER CODE END TIM5_Init 0 */

  TIM_Encoder_InitTypeDef sConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM5_Init 1 */

  /* USER CODE END TIM5_Init 1 */
  htim5.Instance = TIM5;
  htim5.Init.Prescaler = 0;
  htim5.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim5.Init.Period = 60000;
  htim5.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim5.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  sConfig.EncoderMode = TIM_ENCODERMODE_TI12;
  sConfig.IC1Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC1Filter = 0;
  sConfig.IC2Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC2Filter = 0;
  if (HAL_TIM_Encoder_Init(&htim5, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim5, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM5_Init 2 */

  /* USER CODE END TIM5_Init 2 */

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, GPIO_PIN_10, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(PWM_SERVO_2_GPIO_Port, PWM_SERVO_2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : PE10 */
  GPIO_InitStruct.Pin = GPIO_PIN_10;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /*Configure GPIO pin : PWM_SERVO_2_Pin */
  GPIO_InitStruct.Pin = PWM_SERVO_2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(PWM_SERVO_2_GPIO_Port, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
	  // ?��?��?�� 빠졌?��?�� 것을 ?��리기 ?��?�� PE10 LED�?? 미친 ?��?�� 깜빡?��
	        HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_10);

	        // ?��?��?�� 깨졌?�� ?�� HAL_Delay�?? ?�� 먹히�??�?? 무식?�� 반복�?? ?��?��
	        for(volatile int i = 0; i < 500000; i++) {
	            __NOP();
	        }
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

```


### 코드 전체 main.c


```c
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim2;
TIM_HandleTypeDef htim5;

UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM2_Init(void);
static void MX_TIM5_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
// 통신 펄스
void delay_us(uint32_t us) {
    uint32_t count = us * 14;
    while(count--) {
        __NOP();
    }
}

// 조향 모터
void Servo_GPIO_Control(uint32_t pulse_us) {
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_SET);
    delay_us(pulse_us);

    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);
    delay_us(20000 - pulse_us);
}
// M1 모터  (PE13: TIM1_CH3, PE14: TIM1_CH4)
void Motor1_Control(int speed, int direction) {
    if (direction == 1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, speed);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
    } else if (direction == -1) {
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, speed);
    } else { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, 0);
    }
}

// M2 모터 (PE9: TIM1_CH1, PE11: TIM1_CH2)
void Motor2_Control(int speed, int direction) {
    if (direction == 1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, speed);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    } else if (direction == -1) { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, speed);
    } else { 
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, 0);
    }
}

#include <stdint.h>

// UART 수신용 (RX) 변수
uint8_t rx_byte;
uint8_t rx_buffer[9];     // 정확히 9바이트를 담을 바구니
uint8_t rx_index = 0;
uint8_t rx_complete = 0;

// 파싱된 타겟 데이터
int16_t target_linear_vel_mm = 0;   // 목표 선속도 (mm/s)
int16_t target_steering_deg = 0;    // 목표 조향각 (0.01도 단위)

// UART RX 인터럽트 콜백
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
    if (huart->Instance == USART1) { 
        
        // 1. 헤더 동기화 (0x55, 0xAA가 아니면 바구니 초기화)
        if (rx_index == 0 && rx_byte != 0x55) { goto END_RX; }
        if (rx_index == 1 && rx_byte != 0xAA) { rx_index = 0; goto END_RX; }

        // 2. 바구니에 담기
        rx_buffer[rx_index++] = rx_byte;

        // 3. 9바이트(헤더2 + CMD1 + LEN1 + DATA4 + CS1) 다 채워짐
        if (rx_index >= 9) {
            rx_complete = 1; // 메인 루프에 파싱 지시
            rx_index = 0;    // 다음 패킷을 위해 초기화
        }

    END_RX:
        // 다음 1바이트 대기 장전
        HAL_UART_Receive_IT(&huart1, &rx_byte, 1); 
    }
}

// 오도메트리 송신용 (TX) 함수
// 파이썬 코드의 타이머(50Hz)에 맞춰 STM32도 엔코더 값을 쏴줍니다.
void Send_Odometry_Packet(int16_t left_vel_mm, int16_t right_vel_mm) {
    uint8_t tx_buf[9];
    uint8_t checksum = 0;

    tx_buf[0] = 0x55; // Header 1
    tx_buf[1] = 0xAA; // Header 2
    tx_buf[2] = 0x02; // CMD ID (0x02: 오도메트리 피드백)
    tx_buf[3] = 0x04; // Length (4 Bytes)

    // Little Endian으로 바이트 쪼개기
    tx_buf[4] = left_vel_mm & 0xFF;
    tx_buf[5] = (left_vel_mm >> 8) & 0xFF;
    tx_buf[6] = right_vel_mm & 0xFF;
    tx_buf[7] = (right_vel_mm >> 8) & 0xFF;

    // 체크섬 계산 (0번 인덱스부터 7번 인덱스까지 모두 더함)
    for(int i = 0; i < 8; i++) {
        checksum += tx_buf[i];
    }
    tx_buf[8] = checksum;

    // UART 전송 (폴링 방식)
    HAL_UART_Transmit(&huart1, tx_buf, 9, 10);
}

// 이전 카운트 값을 기억할 전역 변수
uint32_t prev_left_count = 0;
uint32_t prev_right_count = 0;

// RC카 스펙 (반드시 실제 스펙으로 수정하십시오!)
#define ENCODER_PPR     11.0f   // 모터 1회전당 펄스 수 (예시)
#define GEAR_RATIO      30.0f   // 기어비 (예: 30:1)
#define WHEEL_DIA       65.0f   // 바퀴 지름 (mm)
#define PI              3.141592f
#define DT_MS           20.0f   // 측정 주기 (20ms)

// 연산 최적화를 위해 '1 Tick당 이동 거리'를 미리 계산해 둠
// 공식: 원둘레 / (PPR * 기어비)
#define DISTANCE_PER_TICK  ((PI * WHEEL_DIA) / (ENCODER_PPR * GEAR_RATIO))


// 왼쪽 바퀴 속도 계산 함수
int16_t Get_Left_Encoder_Velocity(void) {
    // 1. 현재 타이머 카운트 읽기 (왼쪽 바퀴가 TIM2라고 가정)
    uint32_t current_count = TIM2->CNT;

    // 2. 변화량(Tick) 계산
    int16_t delta_ticks = (int16_t)(current_count - prev_left_count);
    prev_left_count = current_count;

    // 3. 속도(mm/s) 계산: 변화량 * 1Tick거리 * (1000ms / 20ms)
    float velocity_mm_s = (delta_ticks * DISTANCE_PER_TICK) * (1000.0f / DT_MS);

    // 정수형으로 반환
    return (int16_t)velocity_mm_s;
}

// 오른쪽 바퀴 속도 계산 함수
int16_t Get_Right_Encoder_Velocity(void) {
    // 오른쪽 바퀴가 TIM5라고 가정
    uint32_t current_count = TIM5->CNT;

    int16_t delta_ticks = (int16_t)(current_count - prev_right_count);
    prev_right_count = current_count;

    // 만약 오른쪽 모터가 거꾸로 달려있어서 값이 반대로 나오면 delta_ticks에 -1을 곱해주면 됩니다.
    float velocity_mm_s = (delta_ticks * DISTANCE_PER_TICK) * (1000.0f / DT_MS);

    return (int16_t)velocity_mm_s;
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM1_Init();
  MX_TIM2_Init();
  MX_TIM5_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */
  __HAL_RCC_GPIOE_CLK_ENABLE();
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_10;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
  // 구동 모터
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_4);

  // M1, M2  
  HAL_TIM_Encoder_Start(&htim5, TIM_CHANNEL_ALL); // M1 엔코더
  HAL_TIM_Encoder_Start(&htim2, TIM_CHANNEL_ALL); // M2 엔코더

  // 최초 UART 수신 인터럽트
  HAL_UART_Receive_IT(&huart1, &rx_byte, 1);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

    // ────────────────────────────────────────────────────────
    // [1] RX 처리: 라즈베리파이의 구동 명령(CMD: 0x01) 파싱
    // ────────────────────────────────────────────────────────
    if (rx_complete == 1) {
        
        // CMD 아이디가 0x01이고 길이가 4바이트인지 확인
        if (rx_buffer[2] == 0x01 && rx_buffer[3] == 0x04) {
            
            uint8_t calc_sum = 0;
            for(int i = 0; i < 8; i++) calc_sum += rx_buffer[i];
            
            // 체크섬 검증 통과 시에만 실행
            if (calc_sum == rx_buffer[8]) {
                
                // Little Endian 바이트 결합 (2바이트씩 묶어서 부호 있는 16비트 정수로)
                target_linear_vel_mm = (int16_t)(rx_buffer[4] | (rx_buffer[5] << 8));
                target_steering_deg  = (int16_t)(rx_buffer[6] | (rx_buffer[7] << 8));

                // ----------------------------------------------------
                // 모터 제어 함수로 맵핑 (수치는 상황에 맞게 튜닝)
                // ----------------------------------------------------
                // 1. 전후진 제어 (목표 속도가 0 이상이면 전진, 아니면 후진)
                if (target_linear_vel_mm > 0) {
                    Motor1_Control(25000, 1);
                } else if (target_linear_vel_mm < 0) {
                    Motor1_Control(25000, 0); // 방향 0으로 후진
                } else {
                    Motor1_Control(0, 0);     // 정지
                }

                // 2. 조향 제어 (0.01도 단위 각도를 PWM으로 매핑)
                // 직진 0도 -> 1900 / 좌 3000(30도) -> 1200 / 우 -3000(-30도) -> 2800
                int steer_pwm = 1900 - (target_steering_deg * (700 / 3000)); // 매핑 비율
                
                // 안전장치 (PWM 한계 고정)
                if(steer_pwm < 1200) steer_pwm = 1200;
                if(steer_pwm > 2800) steer_pwm = 2800;
                
                Servo_GPIO_Control(steer_pwm);
            }
        }
        rx_complete = 0; 
    }

    // ────────────────────────────────────────────────────────
    // [2] TX 처리: 오도메트리 데이터 50Hz(20ms) 주기 발송
    // ────────────────────────────────────────────────────────
    // 타이머 틱(HAL_GetTick)을 이용해 20ms마다 엔코더 값을 쏨
    static uint32_t last_tx_time = 0;
    if (HAL_GetTick() - last_tx_time >= 20) {
        last_tx_time = HAL_GetTick();

        // 1. 엔코더 함수를 통해 현재 좌/우 바퀴 속도(mm/s) 계산
        int16_t current_left_vel = Get_Left_Encoder_Velocity();  
        int16_t current_right_vel = Get_Right_Encoder_Velocity(); 

        // 2. 패킷 조립 및 라즈베리파이로 송신
        Send_Odometry_Packet(current_left_vel, current_right_vel);
    }

  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 168;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 65535;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_4) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * @brief TIM2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM2_Init(void)
{

  /* USER CODE BEGIN TIM2_Init 0 */

  /* USER CODE END TIM2_Init 0 */

  TIM_Encoder_InitTypeDef sConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM2_Init 1 */

  /* USER CODE END TIM2_Init 1 */
  htim2.Instance = TIM2;
  htim2.Init.Prescaler = 0;
  htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim2.Init.Period = 60000;
  htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  sConfig.EncoderMode = TIM_ENCODERMODE_TI12;
  sConfig.IC1Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC1Filter = 0;
  sConfig.IC2Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC2Filter = 0;
  if (HAL_TIM_Encoder_Init(&htim2, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM2_Init 2 */

  /* USER CODE END TIM2_Init 2 */

}

/**
  * @brief TIM5 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM5_Init(void)
{

  /* USER CODE BEGIN TIM5_Init 0 */

  /* USER CODE END TIM5_Init 0 */

  TIM_Encoder_InitTypeDef sConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};

  /* USER CODE BEGIN TIM5_Init 1 */

  /* USER CODE END TIM5_Init 1 */
  htim5.Instance = TIM5;
  htim5.Init.Prescaler = 0;
  htim5.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim5.Init.Period = 60000;
  htim5.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim5.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  sConfig.EncoderMode = TIM_ENCODERMODE_TI12;
  sConfig.IC1Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC1Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC1Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC1Filter = 0;
  sConfig.IC2Polarity = TIM_ICPOLARITY_RISING;
  sConfig.IC2Selection = TIM_ICSELECTION_DIRECTTI;
  sConfig.IC2Prescaler = TIM_ICPSC_DIV1;
  sConfig.IC2Filter = 0;
  if (HAL_TIM_Encoder_Init(&htim5, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim5, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM5_Init 2 */

  /* USER CODE END TIM5_Init 2 */

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, GPIO_PIN_10, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(PWM_SERVO_2_GPIO_Port, PWM_SERVO_2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : PE10 */
  GPIO_InitStruct.Pin = GPIO_PIN_10;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /*Configure GPIO pin : PWM_SERVO_2_Pin */
  GPIO_InitStruct.Pin = PWM_SERVO_2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(PWM_SERVO_2_GPIO_Port, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
	        HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_10);

	        for(volatile int i = 0; i < 500000; i++) {
	            __NOP();
	        }
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

```

