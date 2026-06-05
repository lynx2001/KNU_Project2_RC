# STM32 main.c


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

