# HC-SR04 [초음파 센서]


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

