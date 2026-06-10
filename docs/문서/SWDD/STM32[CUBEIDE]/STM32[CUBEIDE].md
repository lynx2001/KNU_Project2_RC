# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBMNGVOS%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIHL98mJvF6iKCXXeecHiSukT7xB5hY1kphRrv1P8rZE3AiEA0ayRxHXKb7K%2BWWD9JTSE5S%2B2l8Q2d7LZkYpdw%2B3XF3UqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJeUNtgGed7GAJDDiCrcAyk34i%2Flo%2BaX21gjDat0M25MXEvkppvbnIpjWMZG6Fbm3JbqXdrHt9DGrcEZS1p82vydOx4NeLLRlvSmF349NlcHAjFIB0GtBoAaIu2WVz3wU6XI2%2B2sTyESokGZR3zfS2ltYy5WdsQySLc56azZOhFi4U6BlDD0uyoF6ZzIy7gWmWdvqC9VlNBp0ueYPwdEisb3NM0PpCOSMZcBaFkDMyBW%2BxZuq5sMXWxJQOobCH5c0asdkS6cfJ9mW6vasO9gkVhRM34VsfA%2BxeniDSJA%2FOVRJVF%2FbTNMPxujHU%2BYTygOMOkIQz7RsEWy26yZK%2FbERHWroJW5Wd5tZ%2BIje7y3DjmY7BqeebdHCvuElKK%2Fa%2F%2Fgofel6C%2F8vtlWYaO0Q81dOU9ggXr7xHe4MnfxdNuETKWsu6z%2Bj0vKKQVHcVtRkPSJzy%2Bn5QyXXssscAU4EsCv4Imf0gYi0dH9VDisy%2F0CNf5kGBX1w9yLU8lN%2Bbu9r7VnC%2BnCE7OocuX5FRBTJ7K2cqIkwWOjqsmPI%2FfexFQzQbHJaRxUeMMxWVgh2Qls7TNnjncbVy36NMkhTDhELGbrLL3yFGxcb3tLsF9J1kDbqT5Vti95dduTjIzhuHByyZkn24DLnSwPmown0Ca5MIzFp9EGOqUB9Ntjcb8DFBSIDNklSSs%2FREZLklY%2F7NEGyDwVmwbinlRHc4%2BPM2CSEEiMbDHscUmIu2OXyXFwpagAKMuIgFoBqSw2TO2L504A7%2BDmH2STgtgxaqB%2B64qgxBkKGolMwG3tLHfEu09oLAgK7CPy0BA612wr27Ktqpq7bXSCBQ5WgkwNCkYgagrVh8GkuC7omCOmAI98mHrtic%2FcOdQrTdek1q33ByVG&X-Amz-Signature=73b70f878cda5f17ec272ea2aeded3dd220f6a3a85119522c181906dd42de39c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBMNGVOS%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIHL98mJvF6iKCXXeecHiSukT7xB5hY1kphRrv1P8rZE3AiEA0ayRxHXKb7K%2BWWD9JTSE5S%2B2l8Q2d7LZkYpdw%2B3XF3UqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJeUNtgGed7GAJDDiCrcAyk34i%2Flo%2BaX21gjDat0M25MXEvkppvbnIpjWMZG6Fbm3JbqXdrHt9DGrcEZS1p82vydOx4NeLLRlvSmF349NlcHAjFIB0GtBoAaIu2WVz3wU6XI2%2B2sTyESokGZR3zfS2ltYy5WdsQySLc56azZOhFi4U6BlDD0uyoF6ZzIy7gWmWdvqC9VlNBp0ueYPwdEisb3NM0PpCOSMZcBaFkDMyBW%2BxZuq5sMXWxJQOobCH5c0asdkS6cfJ9mW6vasO9gkVhRM34VsfA%2BxeniDSJA%2FOVRJVF%2FbTNMPxujHU%2BYTygOMOkIQz7RsEWy26yZK%2FbERHWroJW5Wd5tZ%2BIje7y3DjmY7BqeebdHCvuElKK%2Fa%2F%2Fgofel6C%2F8vtlWYaO0Q81dOU9ggXr7xHe4MnfxdNuETKWsu6z%2Bj0vKKQVHcVtRkPSJzy%2Bn5QyXXssscAU4EsCv4Imf0gYi0dH9VDisy%2F0CNf5kGBX1w9yLU8lN%2Bbu9r7VnC%2BnCE7OocuX5FRBTJ7K2cqIkwWOjqsmPI%2FfexFQzQbHJaRxUeMMxWVgh2Qls7TNnjncbVy36NMkhTDhELGbrLL3yFGxcb3tLsF9J1kDbqT5Vti95dduTjIzhuHByyZkn24DLnSwPmown0Ca5MIzFp9EGOqUB9Ntjcb8DFBSIDNklSSs%2FREZLklY%2F7NEGyDwVmwbinlRHc4%2BPM2CSEEiMbDHscUmIu2OXyXFwpagAKMuIgFoBqSw2TO2L504A7%2BDmH2STgtgxaqB%2B64qgxBkKGolMwG3tLHfEu09oLAgK7CPy0BA612wr27Ktqpq7bXSCBQ5WgkwNCkYgagrVh8GkuC7omCOmAI98mHrtic%2FcOdQrTdek1q33ByVG&X-Amz-Signature=67f4e07984808e8a29ccffa42be5129142211ee3b3dc2094ab3f523dc291d26a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBMNGVOS%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIHL98mJvF6iKCXXeecHiSukT7xB5hY1kphRrv1P8rZE3AiEA0ayRxHXKb7K%2BWWD9JTSE5S%2B2l8Q2d7LZkYpdw%2B3XF3UqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJeUNtgGed7GAJDDiCrcAyk34i%2Flo%2BaX21gjDat0M25MXEvkppvbnIpjWMZG6Fbm3JbqXdrHt9DGrcEZS1p82vydOx4NeLLRlvSmF349NlcHAjFIB0GtBoAaIu2WVz3wU6XI2%2B2sTyESokGZR3zfS2ltYy5WdsQySLc56azZOhFi4U6BlDD0uyoF6ZzIy7gWmWdvqC9VlNBp0ueYPwdEisb3NM0PpCOSMZcBaFkDMyBW%2BxZuq5sMXWxJQOobCH5c0asdkS6cfJ9mW6vasO9gkVhRM34VsfA%2BxeniDSJA%2FOVRJVF%2FbTNMPxujHU%2BYTygOMOkIQz7RsEWy26yZK%2FbERHWroJW5Wd5tZ%2BIje7y3DjmY7BqeebdHCvuElKK%2Fa%2F%2Fgofel6C%2F8vtlWYaO0Q81dOU9ggXr7xHe4MnfxdNuETKWsu6z%2Bj0vKKQVHcVtRkPSJzy%2Bn5QyXXssscAU4EsCv4Imf0gYi0dH9VDisy%2F0CNf5kGBX1w9yLU8lN%2Bbu9r7VnC%2BnCE7OocuX5FRBTJ7K2cqIkwWOjqsmPI%2FfexFQzQbHJaRxUeMMxWVgh2Qls7TNnjncbVy36NMkhTDhELGbrLL3yFGxcb3tLsF9J1kDbqT5Vti95dduTjIzhuHByyZkn24DLnSwPmown0Ca5MIzFp9EGOqUB9Ntjcb8DFBSIDNklSSs%2FREZLklY%2F7NEGyDwVmwbinlRHc4%2BPM2CSEEiMbDHscUmIu2OXyXFwpagAKMuIgFoBqSw2TO2L504A7%2BDmH2STgtgxaqB%2B64qgxBkKGolMwG3tLHfEu09oLAgK7CPy0BA612wr27Ktqpq7bXSCBQ5WgkwNCkYgagrVh8GkuC7omCOmAI98mHrtic%2FcOdQrTdek1q33ByVG&X-Amz-Signature=0d6c3582ce9b582e6f9e952001faad983fc9d097c8a7ae5b666237255883f00d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBMNGVOS%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIHL98mJvF6iKCXXeecHiSukT7xB5hY1kphRrv1P8rZE3AiEA0ayRxHXKb7K%2BWWD9JTSE5S%2B2l8Q2d7LZkYpdw%2B3XF3UqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJeUNtgGed7GAJDDiCrcAyk34i%2Flo%2BaX21gjDat0M25MXEvkppvbnIpjWMZG6Fbm3JbqXdrHt9DGrcEZS1p82vydOx4NeLLRlvSmF349NlcHAjFIB0GtBoAaIu2WVz3wU6XI2%2B2sTyESokGZR3zfS2ltYy5WdsQySLc56azZOhFi4U6BlDD0uyoF6ZzIy7gWmWdvqC9VlNBp0ueYPwdEisb3NM0PpCOSMZcBaFkDMyBW%2BxZuq5sMXWxJQOobCH5c0asdkS6cfJ9mW6vasO9gkVhRM34VsfA%2BxeniDSJA%2FOVRJVF%2FbTNMPxujHU%2BYTygOMOkIQz7RsEWy26yZK%2FbERHWroJW5Wd5tZ%2BIje7y3DjmY7BqeebdHCvuElKK%2Fa%2F%2Fgofel6C%2F8vtlWYaO0Q81dOU9ggXr7xHe4MnfxdNuETKWsu6z%2Bj0vKKQVHcVtRkPSJzy%2Bn5QyXXssscAU4EsCv4Imf0gYi0dH9VDisy%2F0CNf5kGBX1w9yLU8lN%2Bbu9r7VnC%2BnCE7OocuX5FRBTJ7K2cqIkwWOjqsmPI%2FfexFQzQbHJaRxUeMMxWVgh2Qls7TNnjncbVy36NMkhTDhELGbrLL3yFGxcb3tLsF9J1kDbqT5Vti95dduTjIzhuHByyZkn24DLnSwPmown0Ca5MIzFp9EGOqUB9Ntjcb8DFBSIDNklSSs%2FREZLklY%2F7NEGyDwVmwbinlRHc4%2BPM2CSEEiMbDHscUmIu2OXyXFwpagAKMuIgFoBqSw2TO2L504A7%2BDmH2STgtgxaqB%2B64qgxBkKGolMwG3tLHfEu09oLAgK7CPy0BA612wr27Ktqpq7bXSCBQ5WgkwNCkYgagrVh8GkuC7omCOmAI98mHrtic%2FcOdQrTdek1q33ByVG&X-Amz-Signature=7e6090751c108d8d4ce90e225aa4438aed90bcf1676fcb39c9b74d54507ed3e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBMNGVOS%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T230221Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECYaCXVzLXdlc3QtMiJHMEUCIHL98mJvF6iKCXXeecHiSukT7xB5hY1kphRrv1P8rZE3AiEA0ayRxHXKb7K%2BWWD9JTSE5S%2B2l8Q2d7LZkYpdw%2B3XF3UqiAQI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJeUNtgGed7GAJDDiCrcAyk34i%2Flo%2BaX21gjDat0M25MXEvkppvbnIpjWMZG6Fbm3JbqXdrHt9DGrcEZS1p82vydOx4NeLLRlvSmF349NlcHAjFIB0GtBoAaIu2WVz3wU6XI2%2B2sTyESokGZR3zfS2ltYy5WdsQySLc56azZOhFi4U6BlDD0uyoF6ZzIy7gWmWdvqC9VlNBp0ueYPwdEisb3NM0PpCOSMZcBaFkDMyBW%2BxZuq5sMXWxJQOobCH5c0asdkS6cfJ9mW6vasO9gkVhRM34VsfA%2BxeniDSJA%2FOVRJVF%2FbTNMPxujHU%2BYTygOMOkIQz7RsEWy26yZK%2FbERHWroJW5Wd5tZ%2BIje7y3DjmY7BqeebdHCvuElKK%2Fa%2F%2Fgofel6C%2F8vtlWYaO0Q81dOU9ggXr7xHe4MnfxdNuETKWsu6z%2Bj0vKKQVHcVtRkPSJzy%2Bn5QyXXssscAU4EsCv4Imf0gYi0dH9VDisy%2F0CNf5kGBX1w9yLU8lN%2Bbu9r7VnC%2BnCE7OocuX5FRBTJ7K2cqIkwWOjqsmPI%2FfexFQzQbHJaRxUeMMxWVgh2Qls7TNnjncbVy36NMkhTDhELGbrLL3yFGxcb3tLsF9J1kDbqT5Vti95dduTjIzhuHByyZkn24DLnSwPmown0Ca5MIzFp9EGOqUB9Ntjcb8DFBSIDNklSSs%2FREZLklY%2F7NEGyDwVmwbinlRHc4%2BPM2CSEEiMbDHscUmIu2OXyXFwpagAKMuIgFoBqSw2TO2L504A7%2BDmH2STgtgxaqB%2B64qgxBkKGolMwG3tLHfEu09oLAgK7CPy0BA612wr27Ktqpq7bXSCBQ5WgkwNCkYgagrVh8GkuC7omCOmAI98mHrtic%2FcOdQrTdek1q33ByVG&X-Amz-Signature=5aaeb6aa73de82b71c761e6abcc134240f84c2a2fe90a053d6600163b802e0e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
