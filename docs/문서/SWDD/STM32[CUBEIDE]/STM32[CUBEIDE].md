# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UQDOB4S%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221652Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZGBw%2B4HLY9hq7bfqY2hM8ffJkx%2F9gYOGFqgd0KHYA3AiEA3arPn%2BkkCmB3OoF%2Bb%2Bb3mnUx6e8Qf773Myq9W1siOScq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDHBG4yHwAG%2FxceCL%2BircA1UI%2B8Akck6iRpICK%2BdXOKxeRGbtTy44YCLnlXiZw7vWlzVuOkeUdvOGg8Dafu2zQEdgEHeqDBeQCvEbjHlyq%2BksBhZDb5A52cA135VZ%2F0VL1Hk6NwyHTfdi07BbLagdUG%2BWJGM2Qq38sRKJRWuV%2FiJsviGjjPhJgp2Hq0xo4z6TyzvqdWG%2BSlqgnXub6MKKmDJ3VE7Ajopo7o7VljIkvbitStk%2FMeTn6kSO0EjT0fHR25Xw28NcH7KlLVsMJD1AkdxMOoSJY1g3nibwcCQBsylZvuVhdTQybuymEv3XWrCGvE5z3duLbzTfveQsY79GhVHc6VKGtXRO5Unw8lAwP3ppz%2BWLcH2jvEftKvjBIZBpnbxd%2FD3BnncABwjJCLJ4VDFUgbU1%2Fsv0zynzgBEFr%2Fq3qDLuUWy%2Bz%2F39Mn9gDfTwR7Mj1LANjpFAlqR8tq%2ByLrokaOXntqXMrxOyqc%2Bi1FmYOi5K0zWCnEr9kBVQrlkqLhMMRkPWF0iYeskgs8FINse7%2F6r%2F%2Bh3hqn5jR5l4MZCf8XBdhtmnExM6rYz6kIpbi%2BVO%2BkGoyyC9sh0v5lyrbR0aJM9VWbalRITkDArSuk2KWRuHns9oqOSJdfKTEJr0uWWNazFPXMXb7IWOMODN%2B9EGOqUBQIS6QseNcFGpurhg40Jr2VAvQxb3TK1S30sekChel8vwbpmo3goUphIjwaJABbZa0gq7OCkdLNrXnw%2BxOKB2vIfAhLlL%2Fn2CrdFWY3WqgYBYkgOOW4VMo05as21MUKuP6ZC1MGvScrr3r7nZJqTUs7l0qbZiGdd2bT7awKDww60rly74ZfclcBlarNlH1fyfvMDyGsbO%2BzD0RdQ%2FxIV4n1osKfPy&X-Amz-Signature=235732e80671cd37d5615b3a5ab15d9e78db5ecdae66e38b7317f8f29293f919&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UQDOB4S%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221652Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZGBw%2B4HLY9hq7bfqY2hM8ffJkx%2F9gYOGFqgd0KHYA3AiEA3arPn%2BkkCmB3OoF%2Bb%2Bb3mnUx6e8Qf773Myq9W1siOScq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDHBG4yHwAG%2FxceCL%2BircA1UI%2B8Akck6iRpICK%2BdXOKxeRGbtTy44YCLnlXiZw7vWlzVuOkeUdvOGg8Dafu2zQEdgEHeqDBeQCvEbjHlyq%2BksBhZDb5A52cA135VZ%2F0VL1Hk6NwyHTfdi07BbLagdUG%2BWJGM2Qq38sRKJRWuV%2FiJsviGjjPhJgp2Hq0xo4z6TyzvqdWG%2BSlqgnXub6MKKmDJ3VE7Ajopo7o7VljIkvbitStk%2FMeTn6kSO0EjT0fHR25Xw28NcH7KlLVsMJD1AkdxMOoSJY1g3nibwcCQBsylZvuVhdTQybuymEv3XWrCGvE5z3duLbzTfveQsY79GhVHc6VKGtXRO5Unw8lAwP3ppz%2BWLcH2jvEftKvjBIZBpnbxd%2FD3BnncABwjJCLJ4VDFUgbU1%2Fsv0zynzgBEFr%2Fq3qDLuUWy%2Bz%2F39Mn9gDfTwR7Mj1LANjpFAlqR8tq%2ByLrokaOXntqXMrxOyqc%2Bi1FmYOi5K0zWCnEr9kBVQrlkqLhMMRkPWF0iYeskgs8FINse7%2F6r%2F%2Bh3hqn5jR5l4MZCf8XBdhtmnExM6rYz6kIpbi%2BVO%2BkGoyyC9sh0v5lyrbR0aJM9VWbalRITkDArSuk2KWRuHns9oqOSJdfKTEJr0uWWNazFPXMXb7IWOMODN%2B9EGOqUBQIS6QseNcFGpurhg40Jr2VAvQxb3TK1S30sekChel8vwbpmo3goUphIjwaJABbZa0gq7OCkdLNrXnw%2BxOKB2vIfAhLlL%2Fn2CrdFWY3WqgYBYkgOOW4VMo05as21MUKuP6ZC1MGvScrr3r7nZJqTUs7l0qbZiGdd2bT7awKDww60rly74ZfclcBlarNlH1fyfvMDyGsbO%2BzD0RdQ%2FxIV4n1osKfPy&X-Amz-Signature=383c05d8542a5ef715c493f46b788bfacc213783729f90e8ab6c567d570a1ece&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UQDOB4S%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221652Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZGBw%2B4HLY9hq7bfqY2hM8ffJkx%2F9gYOGFqgd0KHYA3AiEA3arPn%2BkkCmB3OoF%2Bb%2Bb3mnUx6e8Qf773Myq9W1siOScq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDHBG4yHwAG%2FxceCL%2BircA1UI%2B8Akck6iRpICK%2BdXOKxeRGbtTy44YCLnlXiZw7vWlzVuOkeUdvOGg8Dafu2zQEdgEHeqDBeQCvEbjHlyq%2BksBhZDb5A52cA135VZ%2F0VL1Hk6NwyHTfdi07BbLagdUG%2BWJGM2Qq38sRKJRWuV%2FiJsviGjjPhJgp2Hq0xo4z6TyzvqdWG%2BSlqgnXub6MKKmDJ3VE7Ajopo7o7VljIkvbitStk%2FMeTn6kSO0EjT0fHR25Xw28NcH7KlLVsMJD1AkdxMOoSJY1g3nibwcCQBsylZvuVhdTQybuymEv3XWrCGvE5z3duLbzTfveQsY79GhVHc6VKGtXRO5Unw8lAwP3ppz%2BWLcH2jvEftKvjBIZBpnbxd%2FD3BnncABwjJCLJ4VDFUgbU1%2Fsv0zynzgBEFr%2Fq3qDLuUWy%2Bz%2F39Mn9gDfTwR7Mj1LANjpFAlqR8tq%2ByLrokaOXntqXMrxOyqc%2Bi1FmYOi5K0zWCnEr9kBVQrlkqLhMMRkPWF0iYeskgs8FINse7%2F6r%2F%2Bh3hqn5jR5l4MZCf8XBdhtmnExM6rYz6kIpbi%2BVO%2BkGoyyC9sh0v5lyrbR0aJM9VWbalRITkDArSuk2KWRuHns9oqOSJdfKTEJr0uWWNazFPXMXb7IWOMODN%2B9EGOqUBQIS6QseNcFGpurhg40Jr2VAvQxb3TK1S30sekChel8vwbpmo3goUphIjwaJABbZa0gq7OCkdLNrXnw%2BxOKB2vIfAhLlL%2Fn2CrdFWY3WqgYBYkgOOW4VMo05as21MUKuP6ZC1MGvScrr3r7nZJqTUs7l0qbZiGdd2bT7awKDww60rly74ZfclcBlarNlH1fyfvMDyGsbO%2BzD0RdQ%2FxIV4n1osKfPy&X-Amz-Signature=4355fd68d76b1d85f12a61152dd9bb188fff268d9c2be3ead1460e4242160eeb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UQDOB4S%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221652Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZGBw%2B4HLY9hq7bfqY2hM8ffJkx%2F9gYOGFqgd0KHYA3AiEA3arPn%2BkkCmB3OoF%2Bb%2Bb3mnUx6e8Qf773Myq9W1siOScq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDHBG4yHwAG%2FxceCL%2BircA1UI%2B8Akck6iRpICK%2BdXOKxeRGbtTy44YCLnlXiZw7vWlzVuOkeUdvOGg8Dafu2zQEdgEHeqDBeQCvEbjHlyq%2BksBhZDb5A52cA135VZ%2F0VL1Hk6NwyHTfdi07BbLagdUG%2BWJGM2Qq38sRKJRWuV%2FiJsviGjjPhJgp2Hq0xo4z6TyzvqdWG%2BSlqgnXub6MKKmDJ3VE7Ajopo7o7VljIkvbitStk%2FMeTn6kSO0EjT0fHR25Xw28NcH7KlLVsMJD1AkdxMOoSJY1g3nibwcCQBsylZvuVhdTQybuymEv3XWrCGvE5z3duLbzTfveQsY79GhVHc6VKGtXRO5Unw8lAwP3ppz%2BWLcH2jvEftKvjBIZBpnbxd%2FD3BnncABwjJCLJ4VDFUgbU1%2Fsv0zynzgBEFr%2Fq3qDLuUWy%2Bz%2F39Mn9gDfTwR7Mj1LANjpFAlqR8tq%2ByLrokaOXntqXMrxOyqc%2Bi1FmYOi5K0zWCnEr9kBVQrlkqLhMMRkPWF0iYeskgs8FINse7%2F6r%2F%2Bh3hqn5jR5l4MZCf8XBdhtmnExM6rYz6kIpbi%2BVO%2BkGoyyC9sh0v5lyrbR0aJM9VWbalRITkDArSuk2KWRuHns9oqOSJdfKTEJr0uWWNazFPXMXb7IWOMODN%2B9EGOqUBQIS6QseNcFGpurhg40Jr2VAvQxb3TK1S30sekChel8vwbpmo3goUphIjwaJABbZa0gq7OCkdLNrXnw%2BxOKB2vIfAhLlL%2Fn2CrdFWY3WqgYBYkgOOW4VMo05as21MUKuP6ZC1MGvScrr3r7nZJqTUs7l0qbZiGdd2bT7awKDww60rly74ZfclcBlarNlH1fyfvMDyGsbO%2BzD0RdQ%2FxIV4n1osKfPy&X-Amz-Signature=24ee1443d2c64ac4dd4b830c02a84099e3854deb70c3d119d85e31dbd3844cec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664UQDOB4S%2F20260626%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260626T221652Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBZGBw%2B4HLY9hq7bfqY2hM8ffJkx%2F9gYOGFqgd0KHYA3AiEA3arPn%2BkkCmB3OoF%2Bb%2Bb3mnUx6e8Qf773Myq9W1siOScq%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDHBG4yHwAG%2FxceCL%2BircA1UI%2B8Akck6iRpICK%2BdXOKxeRGbtTy44YCLnlXiZw7vWlzVuOkeUdvOGg8Dafu2zQEdgEHeqDBeQCvEbjHlyq%2BksBhZDb5A52cA135VZ%2F0VL1Hk6NwyHTfdi07BbLagdUG%2BWJGM2Qq38sRKJRWuV%2FiJsviGjjPhJgp2Hq0xo4z6TyzvqdWG%2BSlqgnXub6MKKmDJ3VE7Ajopo7o7VljIkvbitStk%2FMeTn6kSO0EjT0fHR25Xw28NcH7KlLVsMJD1AkdxMOoSJY1g3nibwcCQBsylZvuVhdTQybuymEv3XWrCGvE5z3duLbzTfveQsY79GhVHc6VKGtXRO5Unw8lAwP3ppz%2BWLcH2jvEftKvjBIZBpnbxd%2FD3BnncABwjJCLJ4VDFUgbU1%2Fsv0zynzgBEFr%2Fq3qDLuUWy%2Bz%2F39Mn9gDfTwR7Mj1LANjpFAlqR8tq%2ByLrokaOXntqXMrxOyqc%2Bi1FmYOi5K0zWCnEr9kBVQrlkqLhMMRkPWF0iYeskgs8FINse7%2F6r%2F%2Bh3hqn5jR5l4MZCf8XBdhtmnExM6rYz6kIpbi%2BVO%2BkGoyyC9sh0v5lyrbR0aJM9VWbalRITkDArSuk2KWRuHns9oqOSJdfKTEJr0uWWNazFPXMXb7IWOMODN%2B9EGOqUBQIS6QseNcFGpurhg40Jr2VAvQxb3TK1S30sekChel8vwbpmo3goUphIjwaJABbZa0gq7OCkdLNrXnw%2BxOKB2vIfAhLlL%2Fn2CrdFWY3WqgYBYkgOOW4VMo05as21MUKuP6ZC1MGvScrr3r7nZJqTUs7l0qbZiGdd2bT7awKDww60rly74ZfclcBlarNlH1fyfvMDyGsbO%2BzD0RdQ%2FxIV4n1osKfPy&X-Amz-Signature=a01d04b8588805b6b8613a9589ae5dd74f90636b6fba1f8ea956e8d78834972e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
