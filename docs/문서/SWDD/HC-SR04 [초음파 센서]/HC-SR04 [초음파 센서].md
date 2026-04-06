# HC-SR04 [초음파 센서]


**칼만 필터 X - 이동 거리 평균 필터 O (Arduino Mega 2560)**


```bash
#include <NewPing.h>

#define TRIG_PIN 12
#define ECHO_PIN 11
#define BUZZER_PIN 8

#define MAX_DISTANCE 200
#define WINDOW_SIZE 5

NewPing sonar(TRIG_PIN, ECHO_PIN, MAX_DISTANCE);

int readings[WINDOW_SIZE];
int readIndex = 0;
long total = 0;

void setup() {
  pinMode(BUZZER_PIN, OUTPUT);
  digitalWrite(BUZZER_PIN, LOW);
  Serial.begin(9600);

  for (int i = 0; i < WINDOW_SIZE; i++) readings[i] = 999;
  total = 999 * WINDOW_SIZE;
}

int getSmoothedDistance() {
  int raw = sonar.ping_cm();
  if (raw == 0) raw = 999;

  total -= readings[readIndex];
  readings[readIndex] = raw;
  total += raw;
  readIndex = (readIndex + 1) % WINDOW_SIZE;

  return total / WINDOW_SIZE;
}

// 능동 부저용 beep 함수
void beep(int onTime, int offTime) {
  digitalWrite(BUZZER_PIN, HIGH);
  delay(onTime);
  digitalWrite(BUZZER_PIN, LOW);
  delay(offTime);
}

void triggerBuzzer(int dist) {
  if (dist <= 3) {
    // 연속음
    digitalWrite(BUZZER_PIN, HIGH);
    delay(60);
  } else if (dist <= 9) {
    beep(80, 80);     // 빠른 삑삑
  } else if (dist <= 15) {
    beep(150, 200);   // 중간 삑삑
  } else if (dist <= 21) {
    beep(200, 500);   // 느린 삑삑
  } else {
    digitalWrite(BUZZER_PIN, LOW);
  }
}

void loop() {
  int dist = getSmoothedDistance();

  Serial.print("Distance: ");
  Serial.print(dist);
  Serial.println(" cm");

  triggerBuzzer(dist);

  delay(60);
}
```


### 거리별 경고 패턴 요약


| 거리      | 주파수    | 패턴    |
| ------- | ------ | ----- |
| 21cm 이하 | 700Hz  | 느린 삑삑 |
| 15cm 이하 | 1000Hz | 중간 삑삑 |
| 9cm 이하  | 1500Hz | 빠른 삑삑 |
| 3cm 이하  | 2000Hz | 연속음   |


**칼만 필터 적용 O (Arduino Mega 2560)**


```bash
#include <NewPing.h>

#define TRIG_PIN 12
#define ECHO_PIN 11
#define BUZZER_PIN 8
#define MAX_DISTANCE 200
#define WINDOW_SIZE 5

NewPing sonar(TRIG_PIN, ECHO_PIN, MAX_DISTANCE);

// ── 칼만 필터 변수 ──────────────────────
float Q = 1.0;   // 프로세스 노이즈 (값 크면 센서 더 신뢰)
float R = 4.0;   // 측정 노이즈    (값 크면 필터 더 신뢰)
float P = 1.0;   // 오차 공분산
float K = 0.0;   // 칼만 게인
float X = 100.0; // 초기 추정값 (임의)
// ────────────────────────────────────────

// 이동평균 (칼만 전처리용)
int readings[WINDOW_SIZE];
int readIndex = 0;
long total = 0;

void setup() {
  pinMode(BUZZER_PIN, OUTPUT);
  digitalWrite(BUZZER_PIN, LOW);
  Serial.begin(9600);

  for (int i = 0; i < WINDOW_SIZE; i++) readings[i] = 999;
  total = 999 * WINDOW_SIZE;
}

// 이동평균
float getSmoothedDistance() {
  int raw = sonar.ping_cm();
  if (raw == 0) raw = 999;

  total -= readings[readIndex];
  readings[readIndex] = raw;
  total += raw;
  readIndex = (readIndex + 1) % WINDOW_SIZE;

  return (float)(total / WINDOW_SIZE);
}

// 칼만 필터
float kalmanFilter(float measurement) {
  // 예측
  P = P + Q;

  // 업데이트
  K = P / (P + R);
  X = X + K * (measurement - X);
  P = (1 - K) * P;

  return X;
}

void beep(int onTime, int offTime) {
  digitalWrite(BUZZER_PIN, HIGH);
  delay(onTime);
  digitalWrite(BUZZER_PIN, LOW);
  delay(offTime);
}

void triggerBuzzer(float dist) {
  if (dist <= 3) {
    digitalWrite(BUZZER_PIN, HIGH);
    delay(60);
  } else if (dist <= 9) {
    beep(80, 80);
  } else if (dist <= 15) {
    beep(150, 200);
  } else if (dist <= 21) {
    beep(200, 500);
  } else {
    digitalWrite(BUZZER_PIN, LOW);
  }
}

void loop() {
  float smoothed = getSmoothedDistance();
  float dist = kalmanFilter(smoothed);

  Serial.print("Raw: ");
  Serial.print(smoothed);
  Serial.print(" cm  |  Kalman: ");
  Serial.print(dist);
  Serial.println(" cm");

  triggerBuzzer(dist);

  delay(60);
}
```


### Q / R 튜닝 가이드


| 상황          | Q       | R       |
| ----------- | ------- | ------- |
| 센서 노이즈 많을 때 | 크게      | 크게      |
| 반응속도 빠르게    | 크게      | 작게      |
| 안정성 중시      | 작게      | 크게      |
| **실내 기본값**  | **1.0** | **4.0** |

