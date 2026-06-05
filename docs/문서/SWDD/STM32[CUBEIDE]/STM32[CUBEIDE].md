# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CEHYCDD%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T050332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDLqsXPZ14cHEmYlHv47TSIoyazDYfgmzzzo8BaMvQ5IAiB9xr8MLiOjkDj3HZSHi2pZFfa7sNm6eYU2VhtWZD%2FCLir%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMrBwAgwJ0o0CYtcf8KtwDn6rgAShIbenZNjx9yS6v8KR3VuLO0EhFgisIAnD6t7eG0oli2DymN69%2BvcjbnL9RCTA3K5%2BhF8JXUdlptHES7vG%2BOdmRiuSCrBq8AC%2Fl2MgBgs5CX08hxBmwV6ru3eMIwxXzlVPcZu5K4RyitZ%2BWpb%2FNkZ0rKXzLL8WnsDG3w1gQjt2%2B4owOxEsCozdpOmxk9PNpq0BLD8lhwosgja845RQaQV9n5H1hRrnGREjq33xsjvQkP1T4hjG795rV6NnjQ1Oq65USKBtdKtIQJn5h0pXldsXPiwvHoWWs3AeiJr29egGLnes3ELt0MemCnasw6YonznrR41J8jTY6SgYaGCp%2FW657q1XjPzkI12WPvEU%2FVnEOpU3eE6iA%2B6DSFWReKYCf5CKXTcMr%2BTvnHrI1qO4SyykdkYSSXaX3eK0nVy0f9ThsJHjVnwmqCRUULVPOJquhF2TyWx2WRuopLO3FLT%2FA21z18IWXHAtyJALeG8NNey24pkGHdKaunsUUOBwptP4a9gRh7P3wD7d0cRo66%2Bns9e3WL2JifOp2uunYh2bQDXRQ4ICh6dzqx2M1imhoSQ1QZTO0vrw38PN7%2BB%2B4N%2BFnA0pII3%2Ff67JqPpQPMr4ffHVdUayGku1X5Ccwro2J0QY6pgEKKYmUD%2BwD%2B7G4wEbaZDUKqSheOw1PT47ZqLwoZWdgPfuyQlALJaSghxn7%2FDvm%2FIBWd9AG%2BPPvDWN3dQucpLDNiRhBihLLARv9JHqhDIVuSepII6hluq99GuD%2Fi9v3W5dfwO1YZWca7g2shtJHJhx37YWeXNTSewQ6%2BXeSJZQnAakgbfdOA8hwnvSHK0NLtOP6LWJVZft3pKGnDcyMQvKFqEkZaCFa&X-Amz-Signature=91c64614c440f6e9db5fb825231f668b2190c407939b126dd733299cf2772bc7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CEHYCDD%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T050332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDLqsXPZ14cHEmYlHv47TSIoyazDYfgmzzzo8BaMvQ5IAiB9xr8MLiOjkDj3HZSHi2pZFfa7sNm6eYU2VhtWZD%2FCLir%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMrBwAgwJ0o0CYtcf8KtwDn6rgAShIbenZNjx9yS6v8KR3VuLO0EhFgisIAnD6t7eG0oli2DymN69%2BvcjbnL9RCTA3K5%2BhF8JXUdlptHES7vG%2BOdmRiuSCrBq8AC%2Fl2MgBgs5CX08hxBmwV6ru3eMIwxXzlVPcZu5K4RyitZ%2BWpb%2FNkZ0rKXzLL8WnsDG3w1gQjt2%2B4owOxEsCozdpOmxk9PNpq0BLD8lhwosgja845RQaQV9n5H1hRrnGREjq33xsjvQkP1T4hjG795rV6NnjQ1Oq65USKBtdKtIQJn5h0pXldsXPiwvHoWWs3AeiJr29egGLnes3ELt0MemCnasw6YonznrR41J8jTY6SgYaGCp%2FW657q1XjPzkI12WPvEU%2FVnEOpU3eE6iA%2B6DSFWReKYCf5CKXTcMr%2BTvnHrI1qO4SyykdkYSSXaX3eK0nVy0f9ThsJHjVnwmqCRUULVPOJquhF2TyWx2WRuopLO3FLT%2FA21z18IWXHAtyJALeG8NNey24pkGHdKaunsUUOBwptP4a9gRh7P3wD7d0cRo66%2Bns9e3WL2JifOp2uunYh2bQDXRQ4ICh6dzqx2M1imhoSQ1QZTO0vrw38PN7%2BB%2B4N%2BFnA0pII3%2Ff67JqPpQPMr4ffHVdUayGku1X5Ccwro2J0QY6pgEKKYmUD%2BwD%2B7G4wEbaZDUKqSheOw1PT47ZqLwoZWdgPfuyQlALJaSghxn7%2FDvm%2FIBWd9AG%2BPPvDWN3dQucpLDNiRhBihLLARv9JHqhDIVuSepII6hluq99GuD%2Fi9v3W5dfwO1YZWca7g2shtJHJhx37YWeXNTSewQ6%2BXeSJZQnAakgbfdOA8hwnvSHK0NLtOP6LWJVZft3pKGnDcyMQvKFqEkZaCFa&X-Amz-Signature=5aae7fdd9d8d070c628d6c4fdae77dde0ce3064910682dccc972f2f06b9f6b16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CEHYCDD%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T050332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDLqsXPZ14cHEmYlHv47TSIoyazDYfgmzzzo8BaMvQ5IAiB9xr8MLiOjkDj3HZSHi2pZFfa7sNm6eYU2VhtWZD%2FCLir%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMrBwAgwJ0o0CYtcf8KtwDn6rgAShIbenZNjx9yS6v8KR3VuLO0EhFgisIAnD6t7eG0oli2DymN69%2BvcjbnL9RCTA3K5%2BhF8JXUdlptHES7vG%2BOdmRiuSCrBq8AC%2Fl2MgBgs5CX08hxBmwV6ru3eMIwxXzlVPcZu5K4RyitZ%2BWpb%2FNkZ0rKXzLL8WnsDG3w1gQjt2%2B4owOxEsCozdpOmxk9PNpq0BLD8lhwosgja845RQaQV9n5H1hRrnGREjq33xsjvQkP1T4hjG795rV6NnjQ1Oq65USKBtdKtIQJn5h0pXldsXPiwvHoWWs3AeiJr29egGLnes3ELt0MemCnasw6YonznrR41J8jTY6SgYaGCp%2FW657q1XjPzkI12WPvEU%2FVnEOpU3eE6iA%2B6DSFWReKYCf5CKXTcMr%2BTvnHrI1qO4SyykdkYSSXaX3eK0nVy0f9ThsJHjVnwmqCRUULVPOJquhF2TyWx2WRuopLO3FLT%2FA21z18IWXHAtyJALeG8NNey24pkGHdKaunsUUOBwptP4a9gRh7P3wD7d0cRo66%2Bns9e3WL2JifOp2uunYh2bQDXRQ4ICh6dzqx2M1imhoSQ1QZTO0vrw38PN7%2BB%2B4N%2BFnA0pII3%2Ff67JqPpQPMr4ffHVdUayGku1X5Ccwro2J0QY6pgEKKYmUD%2BwD%2B7G4wEbaZDUKqSheOw1PT47ZqLwoZWdgPfuyQlALJaSghxn7%2FDvm%2FIBWd9AG%2BPPvDWN3dQucpLDNiRhBihLLARv9JHqhDIVuSepII6hluq99GuD%2Fi9v3W5dfwO1YZWca7g2shtJHJhx37YWeXNTSewQ6%2BXeSJZQnAakgbfdOA8hwnvSHK0NLtOP6LWJVZft3pKGnDcyMQvKFqEkZaCFa&X-Amz-Signature=c3cbe034fb7af470030d41ee1ac4d982ac3eb5317fdb9be1db4e89e652678dc1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CEHYCDD%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T050332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDLqsXPZ14cHEmYlHv47TSIoyazDYfgmzzzo8BaMvQ5IAiB9xr8MLiOjkDj3HZSHi2pZFfa7sNm6eYU2VhtWZD%2FCLir%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMrBwAgwJ0o0CYtcf8KtwDn6rgAShIbenZNjx9yS6v8KR3VuLO0EhFgisIAnD6t7eG0oli2DymN69%2BvcjbnL9RCTA3K5%2BhF8JXUdlptHES7vG%2BOdmRiuSCrBq8AC%2Fl2MgBgs5CX08hxBmwV6ru3eMIwxXzlVPcZu5K4RyitZ%2BWpb%2FNkZ0rKXzLL8WnsDG3w1gQjt2%2B4owOxEsCozdpOmxk9PNpq0BLD8lhwosgja845RQaQV9n5H1hRrnGREjq33xsjvQkP1T4hjG795rV6NnjQ1Oq65USKBtdKtIQJn5h0pXldsXPiwvHoWWs3AeiJr29egGLnes3ELt0MemCnasw6YonznrR41J8jTY6SgYaGCp%2FW657q1XjPzkI12WPvEU%2FVnEOpU3eE6iA%2B6DSFWReKYCf5CKXTcMr%2BTvnHrI1qO4SyykdkYSSXaX3eK0nVy0f9ThsJHjVnwmqCRUULVPOJquhF2TyWx2WRuopLO3FLT%2FA21z18IWXHAtyJALeG8NNey24pkGHdKaunsUUOBwptP4a9gRh7P3wD7d0cRo66%2Bns9e3WL2JifOp2uunYh2bQDXRQ4ICh6dzqx2M1imhoSQ1QZTO0vrw38PN7%2BB%2B4N%2BFnA0pII3%2Ff67JqPpQPMr4ffHVdUayGku1X5Ccwro2J0QY6pgEKKYmUD%2BwD%2B7G4wEbaZDUKqSheOw1PT47ZqLwoZWdgPfuyQlALJaSghxn7%2FDvm%2FIBWd9AG%2BPPvDWN3dQucpLDNiRhBihLLARv9JHqhDIVuSepII6hluq99GuD%2Fi9v3W5dfwO1YZWca7g2shtJHJhx37YWeXNTSewQ6%2BXeSJZQnAakgbfdOA8hwnvSHK0NLtOP6LWJVZft3pKGnDcyMQvKFqEkZaCFa&X-Amz-Signature=218312ffc8bc9d222155ad75a0e4ad3b94845adc5be9dbb2638cc957e83eeca4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666CEHYCDD%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T050332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDLqsXPZ14cHEmYlHv47TSIoyazDYfgmzzzo8BaMvQ5IAiB9xr8MLiOjkDj3HZSHi2pZFfa7sNm6eYU2VhtWZD%2FCLir%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMrBwAgwJ0o0CYtcf8KtwDn6rgAShIbenZNjx9yS6v8KR3VuLO0EhFgisIAnD6t7eG0oli2DymN69%2BvcjbnL9RCTA3K5%2BhF8JXUdlptHES7vG%2BOdmRiuSCrBq8AC%2Fl2MgBgs5CX08hxBmwV6ru3eMIwxXzlVPcZu5K4RyitZ%2BWpb%2FNkZ0rKXzLL8WnsDG3w1gQjt2%2B4owOxEsCozdpOmxk9PNpq0BLD8lhwosgja845RQaQV9n5H1hRrnGREjq33xsjvQkP1T4hjG795rV6NnjQ1Oq65USKBtdKtIQJn5h0pXldsXPiwvHoWWs3AeiJr29egGLnes3ELt0MemCnasw6YonznrR41J8jTY6SgYaGCp%2FW657q1XjPzkI12WPvEU%2FVnEOpU3eE6iA%2B6DSFWReKYCf5CKXTcMr%2BTvnHrI1qO4SyykdkYSSXaX3eK0nVy0f9ThsJHjVnwmqCRUULVPOJquhF2TyWx2WRuopLO3FLT%2FA21z18IWXHAtyJALeG8NNey24pkGHdKaunsUUOBwptP4a9gRh7P3wD7d0cRo66%2Bns9e3WL2JifOp2uunYh2bQDXRQ4ICh6dzqx2M1imhoSQ1QZTO0vrw38PN7%2BB%2B4N%2BFnA0pII3%2Ff67JqPpQPMr4ffHVdUayGku1X5Ccwro2J0QY6pgEKKYmUD%2BwD%2B7G4wEbaZDUKqSheOw1PT47ZqLwoZWdgPfuyQlALJaSghxn7%2FDvm%2FIBWd9AG%2BPPvDWN3dQucpLDNiRhBihLLARv9JHqhDIVuSepII6hluq99GuD%2Fi9v3W5dfwO1YZWca7g2shtJHJhx37YWeXNTSewQ6%2BXeSJZQnAakgbfdOA8hwnvSHK0NLtOP6LWJVZft3pKGnDcyMQvKFqEkZaCFa&X-Amz-Signature=819e68617f1485683d11595e06b547464ff25674d62a4867259bd22533adbf65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
