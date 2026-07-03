# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662I2ROLLZ%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T221128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQCs82DA7evYZ7vMVZrWd0M9W%2FT1KELrpDrWorQO3r3jEQIhAPMTn5aOscYqDW6o8%2Ftx3N7ppwoW5veGEsgpBoZDQ4VAKv8DCBcQABoMNjM3NDIzMTgzODA1Igx0TFLZax%2BQG72%2Fn6Qq3AMsYPGj%2B54%2F2I4ykor0rIYAxu%2BTRWbklLMPeiIGPffwwEqZm%2FEj1zfxYAykhieI%2F48Xi%2B0WIDTZz%2B1JqVDkz3LhURjOR3WDYs56UF6ADT%2F2mZi3EbkBFI0%2BuLwlsaLtOavQ4%2BOuSZMtpYGzhdeNKLXU6I9jwYd3jelNeq%2FeWPjnk9cBWYbd9awofo48o8prIwxEj6ABOBi56azX6v4L4EQvrBPTTauRRN54qrLMX97ePoBxDncYLMPW%2BqAmYjHexPr7IoCiE%2Bg6UDDMQvYqeguUSo7ci3sTdEBXGNlpL2P8KbRsSU3%2Fa0ZODYw77o1bxWZ%2FThNRNf4Hwec4h7M%2B2B41Wq4MNeuPaPqVhQIvfpnadDIb4LmB2Vok67Sy%2Fsf9Qk5JPl908F1Gs69esEm1IN8oqyXVeGGKLU0Sqbrs4SOcerfc0X%2BN3GCcgGQUgqBSdjpSsHeh1dAbYEitQRxjWfllxGcihXMC1DoUOoFlI4c1VTsZW%2BZq2I6l%2BV9fEluAt6k3o6Rs2EmYamXjACIyKow5XRTTSalfPSw%2Bs%2FyzLExIZETOystxYwTJmXIZQ%2Fcnwthrk3x3SGHMdgT5p0ZVrNrbpLm82lu08xrMFcn3MdUf0FnRhZ0Qu6iyRVScDjC446DSBjqkAW4iQ90TGziWbaQ1w43fkTGOBrfy0uoDfKUk08V%2BGVcgYiDsMvhB6LJ0gqyrDSIsiUBSb1ENGD5RJedcd3z2AmqKJwzDaQB9w105%2BQ9y3kLhNHYe8cyAvBT3HIc1vIHMZ4zErYa5bQo9Wnnc%2BzH%2BJsZd0mJzhQ84RSqUnaMfKUD%2BdC6vl89ANPgQ7Bp3qQTV7mgdYccAHwrMZOc1pHlXhxrdZTml&X-Amz-Signature=5188fb9213f307efe154b9f28860a39734241f220b9b607b2b6fdaa46f5c3c62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662I2ROLLZ%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T221128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQCs82DA7evYZ7vMVZrWd0M9W%2FT1KELrpDrWorQO3r3jEQIhAPMTn5aOscYqDW6o8%2Ftx3N7ppwoW5veGEsgpBoZDQ4VAKv8DCBcQABoMNjM3NDIzMTgzODA1Igx0TFLZax%2BQG72%2Fn6Qq3AMsYPGj%2B54%2F2I4ykor0rIYAxu%2BTRWbklLMPeiIGPffwwEqZm%2FEj1zfxYAykhieI%2F48Xi%2B0WIDTZz%2B1JqVDkz3LhURjOR3WDYs56UF6ADT%2F2mZi3EbkBFI0%2BuLwlsaLtOavQ4%2BOuSZMtpYGzhdeNKLXU6I9jwYd3jelNeq%2FeWPjnk9cBWYbd9awofo48o8prIwxEj6ABOBi56azX6v4L4EQvrBPTTauRRN54qrLMX97ePoBxDncYLMPW%2BqAmYjHexPr7IoCiE%2Bg6UDDMQvYqeguUSo7ci3sTdEBXGNlpL2P8KbRsSU3%2Fa0ZODYw77o1bxWZ%2FThNRNf4Hwec4h7M%2B2B41Wq4MNeuPaPqVhQIvfpnadDIb4LmB2Vok67Sy%2Fsf9Qk5JPl908F1Gs69esEm1IN8oqyXVeGGKLU0Sqbrs4SOcerfc0X%2BN3GCcgGQUgqBSdjpSsHeh1dAbYEitQRxjWfllxGcihXMC1DoUOoFlI4c1VTsZW%2BZq2I6l%2BV9fEluAt6k3o6Rs2EmYamXjACIyKow5XRTTSalfPSw%2Bs%2FyzLExIZETOystxYwTJmXIZQ%2Fcnwthrk3x3SGHMdgT5p0ZVrNrbpLm82lu08xrMFcn3MdUf0FnRhZ0Qu6iyRVScDjC446DSBjqkAW4iQ90TGziWbaQ1w43fkTGOBrfy0uoDfKUk08V%2BGVcgYiDsMvhB6LJ0gqyrDSIsiUBSb1ENGD5RJedcd3z2AmqKJwzDaQB9w105%2BQ9y3kLhNHYe8cyAvBT3HIc1vIHMZ4zErYa5bQo9Wnnc%2BzH%2BJsZd0mJzhQ84RSqUnaMfKUD%2BdC6vl89ANPgQ7Bp3qQTV7mgdYccAHwrMZOc1pHlXhxrdZTml&X-Amz-Signature=bc6b76f7b6dd2439467dccab4b481e2d5cf20af5acce41235b8f5de152b37de0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662I2ROLLZ%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T221128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQCs82DA7evYZ7vMVZrWd0M9W%2FT1KELrpDrWorQO3r3jEQIhAPMTn5aOscYqDW6o8%2Ftx3N7ppwoW5veGEsgpBoZDQ4VAKv8DCBcQABoMNjM3NDIzMTgzODA1Igx0TFLZax%2BQG72%2Fn6Qq3AMsYPGj%2B54%2F2I4ykor0rIYAxu%2BTRWbklLMPeiIGPffwwEqZm%2FEj1zfxYAykhieI%2F48Xi%2B0WIDTZz%2B1JqVDkz3LhURjOR3WDYs56UF6ADT%2F2mZi3EbkBFI0%2BuLwlsaLtOavQ4%2BOuSZMtpYGzhdeNKLXU6I9jwYd3jelNeq%2FeWPjnk9cBWYbd9awofo48o8prIwxEj6ABOBi56azX6v4L4EQvrBPTTauRRN54qrLMX97ePoBxDncYLMPW%2BqAmYjHexPr7IoCiE%2Bg6UDDMQvYqeguUSo7ci3sTdEBXGNlpL2P8KbRsSU3%2Fa0ZODYw77o1bxWZ%2FThNRNf4Hwec4h7M%2B2B41Wq4MNeuPaPqVhQIvfpnadDIb4LmB2Vok67Sy%2Fsf9Qk5JPl908F1Gs69esEm1IN8oqyXVeGGKLU0Sqbrs4SOcerfc0X%2BN3GCcgGQUgqBSdjpSsHeh1dAbYEitQRxjWfllxGcihXMC1DoUOoFlI4c1VTsZW%2BZq2I6l%2BV9fEluAt6k3o6Rs2EmYamXjACIyKow5XRTTSalfPSw%2Bs%2FyzLExIZETOystxYwTJmXIZQ%2Fcnwthrk3x3SGHMdgT5p0ZVrNrbpLm82lu08xrMFcn3MdUf0FnRhZ0Qu6iyRVScDjC446DSBjqkAW4iQ90TGziWbaQ1w43fkTGOBrfy0uoDfKUk08V%2BGVcgYiDsMvhB6LJ0gqyrDSIsiUBSb1ENGD5RJedcd3z2AmqKJwzDaQB9w105%2BQ9y3kLhNHYe8cyAvBT3HIc1vIHMZ4zErYa5bQo9Wnnc%2BzH%2BJsZd0mJzhQ84RSqUnaMfKUD%2BdC6vl89ANPgQ7Bp3qQTV7mgdYccAHwrMZOc1pHlXhxrdZTml&X-Amz-Signature=e56dfd47ec195d4b522877f3b0a0d82aa79fb7016edfc396b8929cfee246eeb3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662I2ROLLZ%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T221128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQCs82DA7evYZ7vMVZrWd0M9W%2FT1KELrpDrWorQO3r3jEQIhAPMTn5aOscYqDW6o8%2Ftx3N7ppwoW5veGEsgpBoZDQ4VAKv8DCBcQABoMNjM3NDIzMTgzODA1Igx0TFLZax%2BQG72%2Fn6Qq3AMsYPGj%2B54%2F2I4ykor0rIYAxu%2BTRWbklLMPeiIGPffwwEqZm%2FEj1zfxYAykhieI%2F48Xi%2B0WIDTZz%2B1JqVDkz3LhURjOR3WDYs56UF6ADT%2F2mZi3EbkBFI0%2BuLwlsaLtOavQ4%2BOuSZMtpYGzhdeNKLXU6I9jwYd3jelNeq%2FeWPjnk9cBWYbd9awofo48o8prIwxEj6ABOBi56azX6v4L4EQvrBPTTauRRN54qrLMX97ePoBxDncYLMPW%2BqAmYjHexPr7IoCiE%2Bg6UDDMQvYqeguUSo7ci3sTdEBXGNlpL2P8KbRsSU3%2Fa0ZODYw77o1bxWZ%2FThNRNf4Hwec4h7M%2B2B41Wq4MNeuPaPqVhQIvfpnadDIb4LmB2Vok67Sy%2Fsf9Qk5JPl908F1Gs69esEm1IN8oqyXVeGGKLU0Sqbrs4SOcerfc0X%2BN3GCcgGQUgqBSdjpSsHeh1dAbYEitQRxjWfllxGcihXMC1DoUOoFlI4c1VTsZW%2BZq2I6l%2BV9fEluAt6k3o6Rs2EmYamXjACIyKow5XRTTSalfPSw%2Bs%2FyzLExIZETOystxYwTJmXIZQ%2Fcnwthrk3x3SGHMdgT5p0ZVrNrbpLm82lu08xrMFcn3MdUf0FnRhZ0Qu6iyRVScDjC446DSBjqkAW4iQ90TGziWbaQ1w43fkTGOBrfy0uoDfKUk08V%2BGVcgYiDsMvhB6LJ0gqyrDSIsiUBSb1ENGD5RJedcd3z2AmqKJwzDaQB9w105%2BQ9y3kLhNHYe8cyAvBT3HIc1vIHMZ4zErYa5bQo9Wnnc%2BzH%2BJsZd0mJzhQ84RSqUnaMfKUD%2BdC6vl89ANPgQ7Bp3qQTV7mgdYccAHwrMZOc1pHlXhxrdZTml&X-Amz-Signature=7128ce29b6f8cebbeca2aa95ce4a3640a8f5ebc29ea6ac2c6f17c2f4b304f6f6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662I2ROLLZ%2F20260703%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260703T221128Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE4aCXVzLXdlc3QtMiJIMEYCIQCs82DA7evYZ7vMVZrWd0M9W%2FT1KELrpDrWorQO3r3jEQIhAPMTn5aOscYqDW6o8%2Ftx3N7ppwoW5veGEsgpBoZDQ4VAKv8DCBcQABoMNjM3NDIzMTgzODA1Igx0TFLZax%2BQG72%2Fn6Qq3AMsYPGj%2B54%2F2I4ykor0rIYAxu%2BTRWbklLMPeiIGPffwwEqZm%2FEj1zfxYAykhieI%2F48Xi%2B0WIDTZz%2B1JqVDkz3LhURjOR3WDYs56UF6ADT%2F2mZi3EbkBFI0%2BuLwlsaLtOavQ4%2BOuSZMtpYGzhdeNKLXU6I9jwYd3jelNeq%2FeWPjnk9cBWYbd9awofo48o8prIwxEj6ABOBi56azX6v4L4EQvrBPTTauRRN54qrLMX97ePoBxDncYLMPW%2BqAmYjHexPr7IoCiE%2Bg6UDDMQvYqeguUSo7ci3sTdEBXGNlpL2P8KbRsSU3%2Fa0ZODYw77o1bxWZ%2FThNRNf4Hwec4h7M%2B2B41Wq4MNeuPaPqVhQIvfpnadDIb4LmB2Vok67Sy%2Fsf9Qk5JPl908F1Gs69esEm1IN8oqyXVeGGKLU0Sqbrs4SOcerfc0X%2BN3GCcgGQUgqBSdjpSsHeh1dAbYEitQRxjWfllxGcihXMC1DoUOoFlI4c1VTsZW%2BZq2I6l%2BV9fEluAt6k3o6Rs2EmYamXjACIyKow5XRTTSalfPSw%2Bs%2FyzLExIZETOystxYwTJmXIZQ%2Fcnwthrk3x3SGHMdgT5p0ZVrNrbpLm82lu08xrMFcn3MdUf0FnRhZ0Qu6iyRVScDjC446DSBjqkAW4iQ90TGziWbaQ1w43fkTGOBrfy0uoDfKUk08V%2BGVcgYiDsMvhB6LJ0gqyrDSIsiUBSb1ENGD5RJedcd3z2AmqKJwzDaQB9w105%2BQ9y3kLhNHYe8cyAvBT3HIc1vIHMZ4zErYa5bQo9Wnnc%2BzH%2BJsZd0mJzhQ84RSqUnaMfKUD%2BdC6vl89ANPgQ7Bp3qQTV7mgdYccAHwrMZOc1pHlXhxrdZTml&X-Amz-Signature=dd20f43f321e180b88d5e8a6d3f7051e68035087c54195fe27371d05f3a4e460&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
