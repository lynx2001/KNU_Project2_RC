# 아두이노 ide stm32설치 (1)

1. 아두이노 IDE 설치
2. 아두이노 IDE를 실행합니다.
3. 상단 메뉴에서 **파일(File) > 기본 설정(Preferences)**으로 들어갑니다.
4. 중간쯤에 있는 **'추가 보드 매니저 URLs'** 칸 옆의 버튼을 누르거나, 칸에 아래 주소를 복사해서 붙여넣으세요.

> `https://github.com/stm32duino/BoardManagerFiles/raw/main/package_stmicroelectronics_index.json`

1. **확인**을 눌러 창을 닫습니다.

### **2. STM32 보드 파일 설치**

1. *도구(Tools) > 보드(Board) > 보드 매니저...**를 클릭합니다.
2. 검색창에 **STM32**라고 입력합니다.
3. **"STM32 MCU based boards"** (by STMicroelectronics) 항목이 나오면 **설치(Install)** 버튼을 누릅니다.
	- _데이터 용량이 꽤 커서 시간이 조금 걸릴 수 있습니다._

### **3. 보드 설정 맞추기**


설치가 완료되면 **도구 > 보드** 메뉴에 **STM32 MCU based boards**가 생깁니다. 거기서 아래와 같이 설정해 주세요.

- **Board:** "Generic STM32F4 series"
- **Board part number:** "BlackSTM32F407VET6" (또는 유사한 VET6 모델)
- **Uplaod method:** 이 보드는 보통 **"HID Bootloader"** 혹은 **"STM32CubeProgrammer (Serial)"** 방식을 사용합니다.

지금 가지고 계신 **ByteRobot** 보드는 사진상 상단 오른쪽에 **"USB serial port 1/burn download"** 포트가 있습니다.

1. 먼저 PC에 **STM32CubeProgrammer**를 설치하세요.
2. 보드의 해당 포트와 PC를 연결합니다.
3. 아두이노 IDE 설정:
	- **Upload method:** `STM32CubeProgrammer (Serial)` 선택
4. 업로드 버튼을 누릅니다.

### **1. 아두이노 IDE에서 경로 설정 (중요)**


아두이노 IDE가 방금 설치한 `STM32CubeProgrammer`가 어디 있는지 알아야 합니다.

1. 아두이노 IDE를 엽니다.
2. **도구(Tools) > Upload method**에서 **STM32CubeProgrammer (Serial)**을 선택합니다.
3. 만약 업로드 시 "STM32CubeProgrammer not found" 같은 에러가 뜬다면, PC의 환경 변수(Path)에 설치 경로가 등록되어야 합니다. (보통은 설치 시 자동으로 잡히지만, 안 될 경우 알려주세요.)

### **2. 보드와 연결**

1. 사진 오른쪽 상단의 **USB serial port 1/burn download** 포트와 PC를 USB 케이블로 연결합니다.
2. 보드의 **Power Switch**를 켜서 전원을 공급합니다. (배터리가 연결되어 있으면 더 확실합니다.)
3. PC의 장치 관리자에서 **포트(COM & LPT)** 항목을 확인해 보세요. `USB-SERIAL CH340` 혹은 `CP210x` 같은 이름으로 포트 번호(예: COM3)가 떠야 합니다.

# **STM32 칩이 "나 지금 코드 받을 준비 됐어!"라는 상태(부트 모드)가 아니라서** 발생하는 전형적인 에러


Error: Activating device: KO. Please, verify the boot mode configuration and check the serial port configuration. Reset your device then try again...


Failed uploading: uploading error: exit status 1


### **1. 수동으로 '다운로드 모드' 진입하기 (가장 확실한 방법)**


보드에 있는 **버튼 2개(Reset, User Button 등)**를 활용해야 합니다. 보드에 `BOOT0`라고 적힌 점퍼나 버튼이 있는지 확인해 보시고, 없다면 보통 `User Button` 중 하나가 그 역할을 합니다.

1. 보드에 USB 케이블을 연결하고 전원을 켭니다.
2. **BOOT0 버튼**(또는 User button 1)을 **꾹 누르고 있는 상태**에서,
3. **Reset 버튼**을 짧게 한 번 **딸깍** 눌렀다 뗍니다.
4. 누르고 있던 **BOOT0 버튼**을 뗍니다.
5. 이 상태가 되면 칩이 코드를 받을 준비가 된 상태입니다. 이제 아두이노 IDE에서 **업로드**를 다시 눌러보세요.

---


### **2. 아두이노 IDE 설정 확인**


에러 메시지에 `parity = even`이라고 되어 있는데, 가끔 이 설정이 칩과 안 맞을 때가 있습니다.

- **도구(Tools) > Optimize:** "Small (-Os) (default)"로 되어 있는지 확인.
- **도구(Tools) > C Runtime Library:** "Newlib Nano (default)" 확인.
- 가장 중요한 건 **Upload method**가 `STM32CubeProgrammer (Serial)`인지 다시 한번 확인해 주세요.

---


### **3. 하드웨어 스위치 확인**


보드 사진 왼쪽 상단에 **Motor control switch**나 빨간색 스위치들이 보입니다.

- 가끔 특정 보드들은 업로드 시 모터로 가는 전원을 차단해야 하거나, 통신 경로를 열어줘야 합니다.
- 만약 위 1번 방법(버튼 누르기)이 안 된다면, 보드 어딘가에 **작은 노란색 점퍼 캡**이 씌워진 핀이 있는지 보세요. `BOOT0`라고 써진 핀의 점퍼를 `0`에서 `1` 쪽으로 옮겨 꽂고 업로드해야 할 수도 있습니다. (업로드 후에는 다시 원복해야 코드가 실행됩니다.)

# Ubuntu VNC 여는 방법


vncserver -localhost no :1

