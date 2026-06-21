# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HLREFB6%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T222040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIH0CjA4VffCrCk9TX0zhR7srIXAZp73pNSp7EJl8DQi4AiEA7wFc4wEiYqp84lBRyDk%2FhVS7cXr9HsUP67JbSKEkRBIqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIe6HZlN863aYvfOpircA4me7ej5NVlN%2BYNjTW5i7hDK5dXtJlw1Yru%2FI1MlKv01IK64uktOKFHhpaI11PwsxOWKrFMyblNBwqbd%2FKCWgdb4tq8iIxB2PYIbcLtPzmLbSYcUZfxvYfct35lrI%2BCVNBWGvia2mWnDf4x%2F0QZMuOz7ji9Yq7XwwGwnUIhqPkIo2ZXVxb%2FXQ65aQFjbkQRTBrnMcir%2B39mxTVKXU%2F%2FvaNF6BmpL%2BdwP0OU4LmG%2F64mYF2X0HrzwCaVnXXafxH11IsQAW38p6AzebHbsvmuGm5l3TkXNNA2ElQ9JduXwfT4qW5LjKki5s8yUWmrfAG4bJTjgdLL44FoPtrIlKI8kR0NQ1lePQq8mhxobl5gFn9X39QWJ7LbRUpgvauCWzckppBZlogV7qmitVzIJt%2FcHVnrxebgGCcOHR2KsanaBuQq4h%2F%2B%2BluP9qZxULK3Qz79ml4rVQrgVGnaNMJ2ivIuzkUxTe9tic%2FBFh6yyBLEDVHZEA7nDhsqgaWdenvMjmhumq3cEqurkyu2sUvMhZoogNWKZPyPlDvYb%2BRcdpD7xFMcMgqLrr1eJu%2BqbdVHPbxukFsnXatsDhMnpAONRnZehKS5nVc%2BL2xFHT5dyJxJGbwh1oFER%2BCN%2FIr1Oyj2TMJLs4NEGOqUB46RSVprVGwAHXu%2BabQrofAcST2rPj6UkQC6oGl9ZJINIWL%2Fmxf1OF5JB3j4nOAxlqZXaZpOrtxgkwHj0IC2RNysjMnIhWc3MDYsT0TRcS0syqMFbRhTYGSDkEkb5Dw62EI18raZ0jQfkEQlQhH8kD2lF52h2Fgfjwj5ArPfcDoIIQvqrnvYzvnZQXNmsz2eatHFCXRBfJqfFTNVQmKK9sJ%2Ba80cu&X-Amz-Signature=54eea7b3919abf6c088522cc04159e30f6dcb848f0a07e904bb363f0c0953982&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HLREFB6%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T222040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIH0CjA4VffCrCk9TX0zhR7srIXAZp73pNSp7EJl8DQi4AiEA7wFc4wEiYqp84lBRyDk%2FhVS7cXr9HsUP67JbSKEkRBIqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIe6HZlN863aYvfOpircA4me7ej5NVlN%2BYNjTW5i7hDK5dXtJlw1Yru%2FI1MlKv01IK64uktOKFHhpaI11PwsxOWKrFMyblNBwqbd%2FKCWgdb4tq8iIxB2PYIbcLtPzmLbSYcUZfxvYfct35lrI%2BCVNBWGvia2mWnDf4x%2F0QZMuOz7ji9Yq7XwwGwnUIhqPkIo2ZXVxb%2FXQ65aQFjbkQRTBrnMcir%2B39mxTVKXU%2F%2FvaNF6BmpL%2BdwP0OU4LmG%2F64mYF2X0HrzwCaVnXXafxH11IsQAW38p6AzebHbsvmuGm5l3TkXNNA2ElQ9JduXwfT4qW5LjKki5s8yUWmrfAG4bJTjgdLL44FoPtrIlKI8kR0NQ1lePQq8mhxobl5gFn9X39QWJ7LbRUpgvauCWzckppBZlogV7qmitVzIJt%2FcHVnrxebgGCcOHR2KsanaBuQq4h%2F%2B%2BluP9qZxULK3Qz79ml4rVQrgVGnaNMJ2ivIuzkUxTe9tic%2FBFh6yyBLEDVHZEA7nDhsqgaWdenvMjmhumq3cEqurkyu2sUvMhZoogNWKZPyPlDvYb%2BRcdpD7xFMcMgqLrr1eJu%2BqbdVHPbxukFsnXatsDhMnpAONRnZehKS5nVc%2BL2xFHT5dyJxJGbwh1oFER%2BCN%2FIr1Oyj2TMJLs4NEGOqUB46RSVprVGwAHXu%2BabQrofAcST2rPj6UkQC6oGl9ZJINIWL%2Fmxf1OF5JB3j4nOAxlqZXaZpOrtxgkwHj0IC2RNysjMnIhWc3MDYsT0TRcS0syqMFbRhTYGSDkEkb5Dw62EI18raZ0jQfkEQlQhH8kD2lF52h2Fgfjwj5ArPfcDoIIQvqrnvYzvnZQXNmsz2eatHFCXRBfJqfFTNVQmKK9sJ%2Ba80cu&X-Amz-Signature=3c531881bb6b04c4e680a195abe45542f3263ca2b7c59282f7585190d11cc46d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HLREFB6%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T222040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIH0CjA4VffCrCk9TX0zhR7srIXAZp73pNSp7EJl8DQi4AiEA7wFc4wEiYqp84lBRyDk%2FhVS7cXr9HsUP67JbSKEkRBIqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIe6HZlN863aYvfOpircA4me7ej5NVlN%2BYNjTW5i7hDK5dXtJlw1Yru%2FI1MlKv01IK64uktOKFHhpaI11PwsxOWKrFMyblNBwqbd%2FKCWgdb4tq8iIxB2PYIbcLtPzmLbSYcUZfxvYfct35lrI%2BCVNBWGvia2mWnDf4x%2F0QZMuOz7ji9Yq7XwwGwnUIhqPkIo2ZXVxb%2FXQ65aQFjbkQRTBrnMcir%2B39mxTVKXU%2F%2FvaNF6BmpL%2BdwP0OU4LmG%2F64mYF2X0HrzwCaVnXXafxH11IsQAW38p6AzebHbsvmuGm5l3TkXNNA2ElQ9JduXwfT4qW5LjKki5s8yUWmrfAG4bJTjgdLL44FoPtrIlKI8kR0NQ1lePQq8mhxobl5gFn9X39QWJ7LbRUpgvauCWzckppBZlogV7qmitVzIJt%2FcHVnrxebgGCcOHR2KsanaBuQq4h%2F%2B%2BluP9qZxULK3Qz79ml4rVQrgVGnaNMJ2ivIuzkUxTe9tic%2FBFh6yyBLEDVHZEA7nDhsqgaWdenvMjmhumq3cEqurkyu2sUvMhZoogNWKZPyPlDvYb%2BRcdpD7xFMcMgqLrr1eJu%2BqbdVHPbxukFsnXatsDhMnpAONRnZehKS5nVc%2BL2xFHT5dyJxJGbwh1oFER%2BCN%2FIr1Oyj2TMJLs4NEGOqUB46RSVprVGwAHXu%2BabQrofAcST2rPj6UkQC6oGl9ZJINIWL%2Fmxf1OF5JB3j4nOAxlqZXaZpOrtxgkwHj0IC2RNysjMnIhWc3MDYsT0TRcS0syqMFbRhTYGSDkEkb5Dw62EI18raZ0jQfkEQlQhH8kD2lF52h2Fgfjwj5ArPfcDoIIQvqrnvYzvnZQXNmsz2eatHFCXRBfJqfFTNVQmKK9sJ%2Ba80cu&X-Amz-Signature=1d3ea8a10266a61146fb3d62777d0b541ccf29c72d9cc3814a70b19d77e2c956&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HLREFB6%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T222040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIH0CjA4VffCrCk9TX0zhR7srIXAZp73pNSp7EJl8DQi4AiEA7wFc4wEiYqp84lBRyDk%2FhVS7cXr9HsUP67JbSKEkRBIqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIe6HZlN863aYvfOpircA4me7ej5NVlN%2BYNjTW5i7hDK5dXtJlw1Yru%2FI1MlKv01IK64uktOKFHhpaI11PwsxOWKrFMyblNBwqbd%2FKCWgdb4tq8iIxB2PYIbcLtPzmLbSYcUZfxvYfct35lrI%2BCVNBWGvia2mWnDf4x%2F0QZMuOz7ji9Yq7XwwGwnUIhqPkIo2ZXVxb%2FXQ65aQFjbkQRTBrnMcir%2B39mxTVKXU%2F%2FvaNF6BmpL%2BdwP0OU4LmG%2F64mYF2X0HrzwCaVnXXafxH11IsQAW38p6AzebHbsvmuGm5l3TkXNNA2ElQ9JduXwfT4qW5LjKki5s8yUWmrfAG4bJTjgdLL44FoPtrIlKI8kR0NQ1lePQq8mhxobl5gFn9X39QWJ7LbRUpgvauCWzckppBZlogV7qmitVzIJt%2FcHVnrxebgGCcOHR2KsanaBuQq4h%2F%2B%2BluP9qZxULK3Qz79ml4rVQrgVGnaNMJ2ivIuzkUxTe9tic%2FBFh6yyBLEDVHZEA7nDhsqgaWdenvMjmhumq3cEqurkyu2sUvMhZoogNWKZPyPlDvYb%2BRcdpD7xFMcMgqLrr1eJu%2BqbdVHPbxukFsnXatsDhMnpAONRnZehKS5nVc%2BL2xFHT5dyJxJGbwh1oFER%2BCN%2FIr1Oyj2TMJLs4NEGOqUB46RSVprVGwAHXu%2BabQrofAcST2rPj6UkQC6oGl9ZJINIWL%2Fmxf1OF5JB3j4nOAxlqZXaZpOrtxgkwHj0IC2RNysjMnIhWc3MDYsT0TRcS0syqMFbRhTYGSDkEkb5Dw62EI18raZ0jQfkEQlQhH8kD2lF52h2Fgfjwj5ArPfcDoIIQvqrnvYzvnZQXNmsz2eatHFCXRBfJqfFTNVQmKK9sJ%2Ba80cu&X-Amz-Signature=6f2b76f00b9859f1ddb0b3f4d684cd251f72e9c39ebd54388e017273310c7b3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662HLREFB6%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T222040Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIH0CjA4VffCrCk9TX0zhR7srIXAZp73pNSp7EJl8DQi4AiEA7wFc4wEiYqp84lBRyDk%2FhVS7cXr9HsUP67JbSKEkRBIqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDIe6HZlN863aYvfOpircA4me7ej5NVlN%2BYNjTW5i7hDK5dXtJlw1Yru%2FI1MlKv01IK64uktOKFHhpaI11PwsxOWKrFMyblNBwqbd%2FKCWgdb4tq8iIxB2PYIbcLtPzmLbSYcUZfxvYfct35lrI%2BCVNBWGvia2mWnDf4x%2F0QZMuOz7ji9Yq7XwwGwnUIhqPkIo2ZXVxb%2FXQ65aQFjbkQRTBrnMcir%2B39mxTVKXU%2F%2FvaNF6BmpL%2BdwP0OU4LmG%2F64mYF2X0HrzwCaVnXXafxH11IsQAW38p6AzebHbsvmuGm5l3TkXNNA2ElQ9JduXwfT4qW5LjKki5s8yUWmrfAG4bJTjgdLL44FoPtrIlKI8kR0NQ1lePQq8mhxobl5gFn9X39QWJ7LbRUpgvauCWzckppBZlogV7qmitVzIJt%2FcHVnrxebgGCcOHR2KsanaBuQq4h%2F%2B%2BluP9qZxULK3Qz79ml4rVQrgVGnaNMJ2ivIuzkUxTe9tic%2FBFh6yyBLEDVHZEA7nDhsqgaWdenvMjmhumq3cEqurkyu2sUvMhZoogNWKZPyPlDvYb%2BRcdpD7xFMcMgqLrr1eJu%2BqbdVHPbxukFsnXatsDhMnpAONRnZehKS5nVc%2BL2xFHT5dyJxJGbwh1oFER%2BCN%2FIr1Oyj2TMJLs4NEGOqUB46RSVprVGwAHXu%2BabQrofAcST2rPj6UkQC6oGl9ZJINIWL%2Fmxf1OF5JB3j4nOAxlqZXaZpOrtxgkwHj0IC2RNysjMnIhWc3MDYsT0TRcS0syqMFbRhTYGSDkEkb5Dw62EI18raZ0jQfkEQlQhH8kD2lF52h2Fgfjwj5ArPfcDoIIQvqrnvYzvnZQXNmsz2eatHFCXRBfJqfFTNVQmKK9sJ%2Ba80cu&X-Amz-Signature=ba54ff0d28faece4c2e93290227c17e34d1fecb5678e498ab7293de544d8e313&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
