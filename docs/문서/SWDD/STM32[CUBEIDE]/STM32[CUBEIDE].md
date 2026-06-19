# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVHKJO2O%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T221134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDwtum6umeJYPsreMVn%2BEb%2FvZzMxOX27Z6EP9lH%2FrBFOAiA64zgSKkUENC%2BkWBnXyW%2BywaEwm%2BJI26z624c4tLzr7SqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM91PGPyjp%2FBGFpmKpKtwDbdgTNMPXd9HZu3aQY7phrsVGR1IpGwogyA4mi0wNXB9TWZUl4wWI%2FGxchd%2BYx%2F4%2BsLlffP%2BZloKRZAEAFx2sUEm%2Fr4vRbQsovNWijJRkekEPVvHLEjfoKtgZY3%2FbRYQsmOhMxlRJOFJsY4xCG%2FKUl2rpkEtvuShh%2Fz3Q4mAQLyEhm7zuQFt%2F3qWb5FRG3qZ6VTq3QA5aXbrUHEdYOJfjIy7EiSx%2BXte4PU6zRPmIRRY1pKTAoRTs6S7ShGIQPaQHLNarGog%2BuS%2BMtUiUZsjTrJa85bgj8rt0DAxanfl7rAjRuF5WZMWQUmmpsYgWuPuvoK5K8wctMDdwuMyE6oInVy9tF6OeYPf3CuJTPaOF8FyndHYoMKF5dz4naAqF3TDAoY4hYFZ09IqTixFZyz9VaoALTN6Ry7AgQX%2FLmiWhFFLh454SfPk6UINWU1WsaZqNxs2hFQJkh18JZEl3ABdLen5sfIN5rOTDuI5nozs1r5YbNHQFE3oyDLRFsjI2gIAX2p2yevDM7ny2wa02SHG60zNlwen%2BFPvScRljem98cIIlFC8sirQd2tExsjiNdeQt%2Fjd7zzMXtXOFJJdMw5QAUHb80Q7JlD67XvqRqmM5MkzvWBxgEiv9hd6ElpYwpPLW0QY6pgH99n0Bwh9ZLeqLw8ETtZcIVppP3bR0JDgJ85WO0%2Bdhi%2FPm39%2BzHy8jkuM18vpbgebUCMKjEHzMP8zDOtK%2FIjBD%2Fur9vypCyY5otLgyTsrRnU0KxDqxbRk3QYkOcZJ8mhx6gRE4eSJCweGKRE1gbl%2BT%2Bpdbz7w8TWXH1Q4cC1SBLpddX3bC6bC91jBWPOd70RB7kZWbOHrhnd3kdpBVFa9ehPWhFl7L&X-Amz-Signature=9eb21ff1ce73ec47a0ab59b6632d156af4e164a9822a8c4b07b2b4710f72cec8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVHKJO2O%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T221134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDwtum6umeJYPsreMVn%2BEb%2FvZzMxOX27Z6EP9lH%2FrBFOAiA64zgSKkUENC%2BkWBnXyW%2BywaEwm%2BJI26z624c4tLzr7SqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM91PGPyjp%2FBGFpmKpKtwDbdgTNMPXd9HZu3aQY7phrsVGR1IpGwogyA4mi0wNXB9TWZUl4wWI%2FGxchd%2BYx%2F4%2BsLlffP%2BZloKRZAEAFx2sUEm%2Fr4vRbQsovNWijJRkekEPVvHLEjfoKtgZY3%2FbRYQsmOhMxlRJOFJsY4xCG%2FKUl2rpkEtvuShh%2Fz3Q4mAQLyEhm7zuQFt%2F3qWb5FRG3qZ6VTq3QA5aXbrUHEdYOJfjIy7EiSx%2BXte4PU6zRPmIRRY1pKTAoRTs6S7ShGIQPaQHLNarGog%2BuS%2BMtUiUZsjTrJa85bgj8rt0DAxanfl7rAjRuF5WZMWQUmmpsYgWuPuvoK5K8wctMDdwuMyE6oInVy9tF6OeYPf3CuJTPaOF8FyndHYoMKF5dz4naAqF3TDAoY4hYFZ09IqTixFZyz9VaoALTN6Ry7AgQX%2FLmiWhFFLh454SfPk6UINWU1WsaZqNxs2hFQJkh18JZEl3ABdLen5sfIN5rOTDuI5nozs1r5YbNHQFE3oyDLRFsjI2gIAX2p2yevDM7ny2wa02SHG60zNlwen%2BFPvScRljem98cIIlFC8sirQd2tExsjiNdeQt%2Fjd7zzMXtXOFJJdMw5QAUHb80Q7JlD67XvqRqmM5MkzvWBxgEiv9hd6ElpYwpPLW0QY6pgH99n0Bwh9ZLeqLw8ETtZcIVppP3bR0JDgJ85WO0%2Bdhi%2FPm39%2BzHy8jkuM18vpbgebUCMKjEHzMP8zDOtK%2FIjBD%2Fur9vypCyY5otLgyTsrRnU0KxDqxbRk3QYkOcZJ8mhx6gRE4eSJCweGKRE1gbl%2BT%2Bpdbz7w8TWXH1Q4cC1SBLpddX3bC6bC91jBWPOd70RB7kZWbOHrhnd3kdpBVFa9ehPWhFl7L&X-Amz-Signature=f841cd65a96e38741fd1a15e1ae5be516f283c66e1302b99b5dcd03e65dce463&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVHKJO2O%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T221134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDwtum6umeJYPsreMVn%2BEb%2FvZzMxOX27Z6EP9lH%2FrBFOAiA64zgSKkUENC%2BkWBnXyW%2BywaEwm%2BJI26z624c4tLzr7SqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM91PGPyjp%2FBGFpmKpKtwDbdgTNMPXd9HZu3aQY7phrsVGR1IpGwogyA4mi0wNXB9TWZUl4wWI%2FGxchd%2BYx%2F4%2BsLlffP%2BZloKRZAEAFx2sUEm%2Fr4vRbQsovNWijJRkekEPVvHLEjfoKtgZY3%2FbRYQsmOhMxlRJOFJsY4xCG%2FKUl2rpkEtvuShh%2Fz3Q4mAQLyEhm7zuQFt%2F3qWb5FRG3qZ6VTq3QA5aXbrUHEdYOJfjIy7EiSx%2BXte4PU6zRPmIRRY1pKTAoRTs6S7ShGIQPaQHLNarGog%2BuS%2BMtUiUZsjTrJa85bgj8rt0DAxanfl7rAjRuF5WZMWQUmmpsYgWuPuvoK5K8wctMDdwuMyE6oInVy9tF6OeYPf3CuJTPaOF8FyndHYoMKF5dz4naAqF3TDAoY4hYFZ09IqTixFZyz9VaoALTN6Ry7AgQX%2FLmiWhFFLh454SfPk6UINWU1WsaZqNxs2hFQJkh18JZEl3ABdLen5sfIN5rOTDuI5nozs1r5YbNHQFE3oyDLRFsjI2gIAX2p2yevDM7ny2wa02SHG60zNlwen%2BFPvScRljem98cIIlFC8sirQd2tExsjiNdeQt%2Fjd7zzMXtXOFJJdMw5QAUHb80Q7JlD67XvqRqmM5MkzvWBxgEiv9hd6ElpYwpPLW0QY6pgH99n0Bwh9ZLeqLw8ETtZcIVppP3bR0JDgJ85WO0%2Bdhi%2FPm39%2BzHy8jkuM18vpbgebUCMKjEHzMP8zDOtK%2FIjBD%2Fur9vypCyY5otLgyTsrRnU0KxDqxbRk3QYkOcZJ8mhx6gRE4eSJCweGKRE1gbl%2BT%2Bpdbz7w8TWXH1Q4cC1SBLpddX3bC6bC91jBWPOd70RB7kZWbOHrhnd3kdpBVFa9ehPWhFl7L&X-Amz-Signature=0cfaefc6435eaa99876b9e719bbd2103b3ec930fbaadaf5ae503819129341980&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVHKJO2O%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T221134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDwtum6umeJYPsreMVn%2BEb%2FvZzMxOX27Z6EP9lH%2FrBFOAiA64zgSKkUENC%2BkWBnXyW%2BywaEwm%2BJI26z624c4tLzr7SqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM91PGPyjp%2FBGFpmKpKtwDbdgTNMPXd9HZu3aQY7phrsVGR1IpGwogyA4mi0wNXB9TWZUl4wWI%2FGxchd%2BYx%2F4%2BsLlffP%2BZloKRZAEAFx2sUEm%2Fr4vRbQsovNWijJRkekEPVvHLEjfoKtgZY3%2FbRYQsmOhMxlRJOFJsY4xCG%2FKUl2rpkEtvuShh%2Fz3Q4mAQLyEhm7zuQFt%2F3qWb5FRG3qZ6VTq3QA5aXbrUHEdYOJfjIy7EiSx%2BXte4PU6zRPmIRRY1pKTAoRTs6S7ShGIQPaQHLNarGog%2BuS%2BMtUiUZsjTrJa85bgj8rt0DAxanfl7rAjRuF5WZMWQUmmpsYgWuPuvoK5K8wctMDdwuMyE6oInVy9tF6OeYPf3CuJTPaOF8FyndHYoMKF5dz4naAqF3TDAoY4hYFZ09IqTixFZyz9VaoALTN6Ry7AgQX%2FLmiWhFFLh454SfPk6UINWU1WsaZqNxs2hFQJkh18JZEl3ABdLen5sfIN5rOTDuI5nozs1r5YbNHQFE3oyDLRFsjI2gIAX2p2yevDM7ny2wa02SHG60zNlwen%2BFPvScRljem98cIIlFC8sirQd2tExsjiNdeQt%2Fjd7zzMXtXOFJJdMw5QAUHb80Q7JlD67XvqRqmM5MkzvWBxgEiv9hd6ElpYwpPLW0QY6pgH99n0Bwh9ZLeqLw8ETtZcIVppP3bR0JDgJ85WO0%2Bdhi%2FPm39%2BzHy8jkuM18vpbgebUCMKjEHzMP8zDOtK%2FIjBD%2Fur9vypCyY5otLgyTsrRnU0KxDqxbRk3QYkOcZJ8mhx6gRE4eSJCweGKRE1gbl%2BT%2Bpdbz7w8TWXH1Q4cC1SBLpddX3bC6bC91jBWPOd70RB7kZWbOHrhnd3kdpBVFa9ehPWhFl7L&X-Amz-Signature=de4fd7ae5160b8a9a97016e2b22e69423b5a4db3bc5a8fe51fd9f6129da36a1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466QVHKJO2O%2F20260619%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260619T221134Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDwtum6umeJYPsreMVn%2BEb%2FvZzMxOX27Z6EP9lH%2FrBFOAiA64zgSKkUENC%2BkWBnXyW%2BywaEwm%2BJI26z624c4tLzr7SqIBAjH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIM91PGPyjp%2FBGFpmKpKtwDbdgTNMPXd9HZu3aQY7phrsVGR1IpGwogyA4mi0wNXB9TWZUl4wWI%2FGxchd%2BYx%2F4%2BsLlffP%2BZloKRZAEAFx2sUEm%2Fr4vRbQsovNWijJRkekEPVvHLEjfoKtgZY3%2FbRYQsmOhMxlRJOFJsY4xCG%2FKUl2rpkEtvuShh%2Fz3Q4mAQLyEhm7zuQFt%2F3qWb5FRG3qZ6VTq3QA5aXbrUHEdYOJfjIy7EiSx%2BXte4PU6zRPmIRRY1pKTAoRTs6S7ShGIQPaQHLNarGog%2BuS%2BMtUiUZsjTrJa85bgj8rt0DAxanfl7rAjRuF5WZMWQUmmpsYgWuPuvoK5K8wctMDdwuMyE6oInVy9tF6OeYPf3CuJTPaOF8FyndHYoMKF5dz4naAqF3TDAoY4hYFZ09IqTixFZyz9VaoALTN6Ry7AgQX%2FLmiWhFFLh454SfPk6UINWU1WsaZqNxs2hFQJkh18JZEl3ABdLen5sfIN5rOTDuI5nozs1r5YbNHQFE3oyDLRFsjI2gIAX2p2yevDM7ny2wa02SHG60zNlwen%2BFPvScRljem98cIIlFC8sirQd2tExsjiNdeQt%2Fjd7zzMXtXOFJJdMw5QAUHb80Q7JlD67XvqRqmM5MkzvWBxgEiv9hd6ElpYwpPLW0QY6pgH99n0Bwh9ZLeqLw8ETtZcIVppP3bR0JDgJ85WO0%2Bdhi%2FPm39%2BzHy8jkuM18vpbgebUCMKjEHzMP8zDOtK%2FIjBD%2Fur9vypCyY5otLgyTsrRnU0KxDqxbRk3QYkOcZJ8mhx6gRE4eSJCweGKRE1gbl%2BT%2Bpdbz7w8TWXH1Q4cC1SBLpddX3bC6bC91jBWPOd70RB7kZWbOHrhnd3kdpBVFa9ehPWhFl7L&X-Amz-Signature=278188c6a8998c27a71e18df074e8e1addcdf11bb4ac147c761187d9060a562e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
