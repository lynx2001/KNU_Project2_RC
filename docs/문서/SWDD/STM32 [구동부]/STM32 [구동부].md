# STM32 [구동부]


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

