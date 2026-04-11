# SPAS_개발PC_환경구축


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

