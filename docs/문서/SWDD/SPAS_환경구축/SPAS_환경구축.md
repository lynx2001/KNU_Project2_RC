# SPAS_환경구축


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
ssh ubuntu@192.168.0.15   # 라즈베리 파이 IP로 교체
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

