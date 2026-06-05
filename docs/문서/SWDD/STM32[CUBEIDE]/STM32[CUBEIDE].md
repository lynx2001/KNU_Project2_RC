# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7Q2PTRP%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICEngbo%2BB5dZwLl1Msy2eMQw7GvM%2B5CojtXFHtMtwKoGAiEAtVv515eFdG%2FHb4WrRXPTcV%2FKngd%2FPvdd7kb4KNqsvBQq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDB3nx1o7%2FOXq9OO3BSrcAyhFkvxL0qWw7qK8kL%2F2ee%2FJQ1HFc5t2N0K28SMegjS7a%2FHrvZI%2Fkxy4azcDv615hRQfXxe96Xqj%2FZCs3B9UFHaNkd%2BsI6hx4ribdJjXIP0KDIs7MTjLzSYGJj0LYB4Vv9KzrZMeWo6x22DQI5EnHo%2BBPxKl%2B2G5%2BZAfZXRxi8zQ15QvHS%2FNI1pxkEpQ8wmUNPGn%2FNqJgvP7T2qdYngOGDjgK6dWODQhQ%2FmIzP0XWN4dhMvGCPSDUi5HXr5rqSAtpDZHJsw9frcGdOKTIHCBk0gjz9dLfkMKzTrVpBRH0pZ7vgZ5YsQ6jb%2Bj3eBjtAK1Plc9kmCJP%2FSvtt16QxWRct2dY1rT2aI2DS9vuMKhVU0w92tBTNz1rCcKXBZhc%2B%2F2ZjWbmBeFz3fFz%2FLytPlPIWcutX9DXY4M55GEYcZCOqty6TNcXngSaRaKUADt2r1fa3SfYZpngL0Srl0frRBJWUA6WHzQwIFbV5wNHrh%2FCbfTB8g4I7aJMEmYtYeg%2B3aambQQqC18LSRiG0QTmEm34eW14UbjD57TopZ0cAkck3sD6WykSZ8q2%2B4XV8fA4%2B6NjC3ObA7U7uUpQEIz9UsIJYtDtY2WoRwjMHfiEf6KlxRJTai5PBBl1NBSquCKMNCzjNEGOqUBwdqIP8w8nNRxNNZ7ZvA2R3D1nkKpWjcrPsoOYMAt8tqvnYQangRBH%2Fdzi5YANs%2FUJwx0eQIgUGkm39RSgZZb5TruVSTJxhi45sNADTtTd8z3kvhJSArg0zcHC0PJnklACUxwFANzyAHuMbbLQgBUAKxs6fJrPw5qOIwKE%2Ffx4KifUMMT%2F7NxqGUuOlkCBRU6ZryzXQsYPYKh5nlAsbO5u9MXvMnt&X-Amz-Signature=9727a228a2319bf9b36f4e56bda8daa98a521b82ed018c709b829ab8a40d12fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7Q2PTRP%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICEngbo%2BB5dZwLl1Msy2eMQw7GvM%2B5CojtXFHtMtwKoGAiEAtVv515eFdG%2FHb4WrRXPTcV%2FKngd%2FPvdd7kb4KNqsvBQq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDB3nx1o7%2FOXq9OO3BSrcAyhFkvxL0qWw7qK8kL%2F2ee%2FJQ1HFc5t2N0K28SMegjS7a%2FHrvZI%2Fkxy4azcDv615hRQfXxe96Xqj%2FZCs3B9UFHaNkd%2BsI6hx4ribdJjXIP0KDIs7MTjLzSYGJj0LYB4Vv9KzrZMeWo6x22DQI5EnHo%2BBPxKl%2B2G5%2BZAfZXRxi8zQ15QvHS%2FNI1pxkEpQ8wmUNPGn%2FNqJgvP7T2qdYngOGDjgK6dWODQhQ%2FmIzP0XWN4dhMvGCPSDUi5HXr5rqSAtpDZHJsw9frcGdOKTIHCBk0gjz9dLfkMKzTrVpBRH0pZ7vgZ5YsQ6jb%2Bj3eBjtAK1Plc9kmCJP%2FSvtt16QxWRct2dY1rT2aI2DS9vuMKhVU0w92tBTNz1rCcKXBZhc%2B%2F2ZjWbmBeFz3fFz%2FLytPlPIWcutX9DXY4M55GEYcZCOqty6TNcXngSaRaKUADt2r1fa3SfYZpngL0Srl0frRBJWUA6WHzQwIFbV5wNHrh%2FCbfTB8g4I7aJMEmYtYeg%2B3aambQQqC18LSRiG0QTmEm34eW14UbjD57TopZ0cAkck3sD6WykSZ8q2%2B4XV8fA4%2B6NjC3ObA7U7uUpQEIz9UsIJYtDtY2WoRwjMHfiEf6KlxRJTai5PBBl1NBSquCKMNCzjNEGOqUBwdqIP8w8nNRxNNZ7ZvA2R3D1nkKpWjcrPsoOYMAt8tqvnYQangRBH%2Fdzi5YANs%2FUJwx0eQIgUGkm39RSgZZb5TruVSTJxhi45sNADTtTd8z3kvhJSArg0zcHC0PJnklACUxwFANzyAHuMbbLQgBUAKxs6fJrPw5qOIwKE%2Ffx4KifUMMT%2F7NxqGUuOlkCBRU6ZryzXQsYPYKh5nlAsbO5u9MXvMnt&X-Amz-Signature=4dcd9d000e6ffe5269974edd147cfd191922013f44a25ca0a01e3f1c4e082fe4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7Q2PTRP%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICEngbo%2BB5dZwLl1Msy2eMQw7GvM%2B5CojtXFHtMtwKoGAiEAtVv515eFdG%2FHb4WrRXPTcV%2FKngd%2FPvdd7kb4KNqsvBQq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDB3nx1o7%2FOXq9OO3BSrcAyhFkvxL0qWw7qK8kL%2F2ee%2FJQ1HFc5t2N0K28SMegjS7a%2FHrvZI%2Fkxy4azcDv615hRQfXxe96Xqj%2FZCs3B9UFHaNkd%2BsI6hx4ribdJjXIP0KDIs7MTjLzSYGJj0LYB4Vv9KzrZMeWo6x22DQI5EnHo%2BBPxKl%2B2G5%2BZAfZXRxi8zQ15QvHS%2FNI1pxkEpQ8wmUNPGn%2FNqJgvP7T2qdYngOGDjgK6dWODQhQ%2FmIzP0XWN4dhMvGCPSDUi5HXr5rqSAtpDZHJsw9frcGdOKTIHCBk0gjz9dLfkMKzTrVpBRH0pZ7vgZ5YsQ6jb%2Bj3eBjtAK1Plc9kmCJP%2FSvtt16QxWRct2dY1rT2aI2DS9vuMKhVU0w92tBTNz1rCcKXBZhc%2B%2F2ZjWbmBeFz3fFz%2FLytPlPIWcutX9DXY4M55GEYcZCOqty6TNcXngSaRaKUADt2r1fa3SfYZpngL0Srl0frRBJWUA6WHzQwIFbV5wNHrh%2FCbfTB8g4I7aJMEmYtYeg%2B3aambQQqC18LSRiG0QTmEm34eW14UbjD57TopZ0cAkck3sD6WykSZ8q2%2B4XV8fA4%2B6NjC3ObA7U7uUpQEIz9UsIJYtDtY2WoRwjMHfiEf6KlxRJTai5PBBl1NBSquCKMNCzjNEGOqUBwdqIP8w8nNRxNNZ7ZvA2R3D1nkKpWjcrPsoOYMAt8tqvnYQangRBH%2Fdzi5YANs%2FUJwx0eQIgUGkm39RSgZZb5TruVSTJxhi45sNADTtTd8z3kvhJSArg0zcHC0PJnklACUxwFANzyAHuMbbLQgBUAKxs6fJrPw5qOIwKE%2Ffx4KifUMMT%2F7NxqGUuOlkCBRU6ZryzXQsYPYKh5nlAsbO5u9MXvMnt&X-Amz-Signature=a0cae1ed280947a46404bbb59623177cc2bf32d85ed0e97fda3f6cd0495de0de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7Q2PTRP%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICEngbo%2BB5dZwLl1Msy2eMQw7GvM%2B5CojtXFHtMtwKoGAiEAtVv515eFdG%2FHb4WrRXPTcV%2FKngd%2FPvdd7kb4KNqsvBQq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDB3nx1o7%2FOXq9OO3BSrcAyhFkvxL0qWw7qK8kL%2F2ee%2FJQ1HFc5t2N0K28SMegjS7a%2FHrvZI%2Fkxy4azcDv615hRQfXxe96Xqj%2FZCs3B9UFHaNkd%2BsI6hx4ribdJjXIP0KDIs7MTjLzSYGJj0LYB4Vv9KzrZMeWo6x22DQI5EnHo%2BBPxKl%2B2G5%2BZAfZXRxi8zQ15QvHS%2FNI1pxkEpQ8wmUNPGn%2FNqJgvP7T2qdYngOGDjgK6dWODQhQ%2FmIzP0XWN4dhMvGCPSDUi5HXr5rqSAtpDZHJsw9frcGdOKTIHCBk0gjz9dLfkMKzTrVpBRH0pZ7vgZ5YsQ6jb%2Bj3eBjtAK1Plc9kmCJP%2FSvtt16QxWRct2dY1rT2aI2DS9vuMKhVU0w92tBTNz1rCcKXBZhc%2B%2F2ZjWbmBeFz3fFz%2FLytPlPIWcutX9DXY4M55GEYcZCOqty6TNcXngSaRaKUADt2r1fa3SfYZpngL0Srl0frRBJWUA6WHzQwIFbV5wNHrh%2FCbfTB8g4I7aJMEmYtYeg%2B3aambQQqC18LSRiG0QTmEm34eW14UbjD57TopZ0cAkck3sD6WykSZ8q2%2B4XV8fA4%2B6NjC3ObA7U7uUpQEIz9UsIJYtDtY2WoRwjMHfiEf6KlxRJTai5PBBl1NBSquCKMNCzjNEGOqUBwdqIP8w8nNRxNNZ7ZvA2R3D1nkKpWjcrPsoOYMAt8tqvnYQangRBH%2Fdzi5YANs%2FUJwx0eQIgUGkm39RSgZZb5TruVSTJxhi45sNADTtTd8z3kvhJSArg0zcHC0PJnklACUxwFANzyAHuMbbLQgBUAKxs6fJrPw5qOIwKE%2Ffx4KifUMMT%2F7NxqGUuOlkCBRU6ZryzXQsYPYKh5nlAsbO5u9MXvMnt&X-Amz-Signature=1a7ca7f0dfd81caa8dd8cc466e8e038e0300f0e471d0f70a1fbed011ef9c412a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466T7Q2PTRP%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T222156Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICEngbo%2BB5dZwLl1Msy2eMQw7GvM%2B5CojtXFHtMtwKoGAiEAtVv515eFdG%2FHb4WrRXPTcV%2FKngd%2FPvdd7kb4KNqsvBQq%2FwMIdBAAGgw2Mzc0MjMxODM4MDUiDB3nx1o7%2FOXq9OO3BSrcAyhFkvxL0qWw7qK8kL%2F2ee%2FJQ1HFc5t2N0K28SMegjS7a%2FHrvZI%2Fkxy4azcDv615hRQfXxe96Xqj%2FZCs3B9UFHaNkd%2BsI6hx4ribdJjXIP0KDIs7MTjLzSYGJj0LYB4Vv9KzrZMeWo6x22DQI5EnHo%2BBPxKl%2B2G5%2BZAfZXRxi8zQ15QvHS%2FNI1pxkEpQ8wmUNPGn%2FNqJgvP7T2qdYngOGDjgK6dWODQhQ%2FmIzP0XWN4dhMvGCPSDUi5HXr5rqSAtpDZHJsw9frcGdOKTIHCBk0gjz9dLfkMKzTrVpBRH0pZ7vgZ5YsQ6jb%2Bj3eBjtAK1Plc9kmCJP%2FSvtt16QxWRct2dY1rT2aI2DS9vuMKhVU0w92tBTNz1rCcKXBZhc%2B%2F2ZjWbmBeFz3fFz%2FLytPlPIWcutX9DXY4M55GEYcZCOqty6TNcXngSaRaKUADt2r1fa3SfYZpngL0Srl0frRBJWUA6WHzQwIFbV5wNHrh%2FCbfTB8g4I7aJMEmYtYeg%2B3aambQQqC18LSRiG0QTmEm34eW14UbjD57TopZ0cAkck3sD6WykSZ8q2%2B4XV8fA4%2B6NjC3ObA7U7uUpQEIz9UsIJYtDtY2WoRwjMHfiEf6KlxRJTai5PBBl1NBSquCKMNCzjNEGOqUBwdqIP8w8nNRxNNZ7ZvA2R3D1nkKpWjcrPsoOYMAt8tqvnYQangRBH%2Fdzi5YANs%2FUJwx0eQIgUGkm39RSgZZb5TruVSTJxhi45sNADTtTd8z3kvhJSArg0zcHC0PJnklACUxwFANzyAHuMbbLQgBUAKxs6fJrPw5qOIwKE%2Ffx4KifUMMT%2F7NxqGUuOlkCBRU6ZryzXQsYPYKh5nlAsbO5u9MXvMnt&X-Amz-Signature=d4136b9b3078dbf0fb1e8259d5dd30c49fd5fc247932efa565f44bdfe768933d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
