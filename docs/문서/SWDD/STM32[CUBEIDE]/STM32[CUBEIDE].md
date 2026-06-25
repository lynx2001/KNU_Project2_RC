# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFP7W3II%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCTE2RAu7I6ixhvXxRz4AkwQsRxvs4K8yPWp3%2FJDN9VggIhAMFmI%2FZUr4dZDRHAd1lOXidMFtRKlZanND%2FxqpVZ7DMFKv8DCFcQABoMNjM3NDIzMTgzODA1Igxkaze0gTgHskm2rNkq3AO2ZFYrIJw9A9GU6W9arV9dyej4BRRx6Tzh9VkRsyHPhZwwxVdyf3dQtfvCLFQhNMagKS8sbA6%2FCB2jeP0OWOCUzuhkFWs7TXnLvyW8g3jjvPjXpIwNMbJ%2Fsge6cz4bWO8TLaQF0g1VVMlXlWkNTEEytArFaKIY6Fv0kvPp0InfVV6v0Xq4jRj32IJOCZKay%2FQ4WBIdEEwC4FNtU8srRgpUKRKRZjJaLnyWzlGQs7BL9F9uOywUjeZX2ecBKiVMUvctQaC%2FN6wf%2B%2BweT72nIlxttJDSQeeln9KvYrCCSsEp%2BM64VZQD5JJPbh94E%2F%2B8%2B9LEZ9kOSw6kONaRJGuBY4oBh%2B1t5HG%2F9cIksy7nufwVF3%2B94PHvYDYmJ%2FWjBgBn8nvZitRSPYcU8rIfPkqbONO%2FXdH4HTsCiKi6fhA0fWr%2BBt%2BMwRfNDnZRVTlLPt5WyCodEALF7J53POtd4UltRzSD9H4yiAgDyF6kpE4T92IJ1RETSXYzi0VcLEvzKRK%2FcKSQ4AjnfkpQs9pKv2dT9mQh34EWMA3H6DWRo1zdAPV7uwFJbrEzKZoR7mTGsobpox%2FwT1ZNhlf6lRaVVfv7jaoaCesDOciKqNLDgHMd07vmJO3vYcolF5l3nlnhgTClufbRBjqkAcb9zMZYLU7s05E9ayNZKhO43eC5rHEc69OlDpSRZb6sG%2BXg4%2Fot%2FTAh8j8k1yPpemR0i4PIspYL1NNhpr0hdowrcgwN%2FbChBKiud%2FPimD8a3pwL%2F8Q9I0q7N3MsEltjtxD%2BrrW0GZGgnVjQtvUC%2F4Pu9SvLw6sofQhx1sfsPbwIw10L3asdlbvsdcKxlvlJVHP1DBRfcKNXwibDhZ9YlsYiKAMB&X-Amz-Signature=4199e2d1266719e5fec9f1d4c91c71816049a7a8e8ca13b54d1964d02b220d74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFP7W3II%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCTE2RAu7I6ixhvXxRz4AkwQsRxvs4K8yPWp3%2FJDN9VggIhAMFmI%2FZUr4dZDRHAd1lOXidMFtRKlZanND%2FxqpVZ7DMFKv8DCFcQABoMNjM3NDIzMTgzODA1Igxkaze0gTgHskm2rNkq3AO2ZFYrIJw9A9GU6W9arV9dyej4BRRx6Tzh9VkRsyHPhZwwxVdyf3dQtfvCLFQhNMagKS8sbA6%2FCB2jeP0OWOCUzuhkFWs7TXnLvyW8g3jjvPjXpIwNMbJ%2Fsge6cz4bWO8TLaQF0g1VVMlXlWkNTEEytArFaKIY6Fv0kvPp0InfVV6v0Xq4jRj32IJOCZKay%2FQ4WBIdEEwC4FNtU8srRgpUKRKRZjJaLnyWzlGQs7BL9F9uOywUjeZX2ecBKiVMUvctQaC%2FN6wf%2B%2BweT72nIlxttJDSQeeln9KvYrCCSsEp%2BM64VZQD5JJPbh94E%2F%2B8%2B9LEZ9kOSw6kONaRJGuBY4oBh%2B1t5HG%2F9cIksy7nufwVF3%2B94PHvYDYmJ%2FWjBgBn8nvZitRSPYcU8rIfPkqbONO%2FXdH4HTsCiKi6fhA0fWr%2BBt%2BMwRfNDnZRVTlLPt5WyCodEALF7J53POtd4UltRzSD9H4yiAgDyF6kpE4T92IJ1RETSXYzi0VcLEvzKRK%2FcKSQ4AjnfkpQs9pKv2dT9mQh34EWMA3H6DWRo1zdAPV7uwFJbrEzKZoR7mTGsobpox%2FwT1ZNhlf6lRaVVfv7jaoaCesDOciKqNLDgHMd07vmJO3vYcolF5l3nlnhgTClufbRBjqkAcb9zMZYLU7s05E9ayNZKhO43eC5rHEc69OlDpSRZb6sG%2BXg4%2Fot%2FTAh8j8k1yPpemR0i4PIspYL1NNhpr0hdowrcgwN%2FbChBKiud%2FPimD8a3pwL%2F8Q9I0q7N3MsEltjtxD%2BrrW0GZGgnVjQtvUC%2F4Pu9SvLw6sofQhx1sfsPbwIw10L3asdlbvsdcKxlvlJVHP1DBRfcKNXwibDhZ9YlsYiKAMB&X-Amz-Signature=7b9b6a588c542bd175bde9f8748fdc574062dda6bd874860bea08aeecf3c2384&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFP7W3II%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCTE2RAu7I6ixhvXxRz4AkwQsRxvs4K8yPWp3%2FJDN9VggIhAMFmI%2FZUr4dZDRHAd1lOXidMFtRKlZanND%2FxqpVZ7DMFKv8DCFcQABoMNjM3NDIzMTgzODA1Igxkaze0gTgHskm2rNkq3AO2ZFYrIJw9A9GU6W9arV9dyej4BRRx6Tzh9VkRsyHPhZwwxVdyf3dQtfvCLFQhNMagKS8sbA6%2FCB2jeP0OWOCUzuhkFWs7TXnLvyW8g3jjvPjXpIwNMbJ%2Fsge6cz4bWO8TLaQF0g1VVMlXlWkNTEEytArFaKIY6Fv0kvPp0InfVV6v0Xq4jRj32IJOCZKay%2FQ4WBIdEEwC4FNtU8srRgpUKRKRZjJaLnyWzlGQs7BL9F9uOywUjeZX2ecBKiVMUvctQaC%2FN6wf%2B%2BweT72nIlxttJDSQeeln9KvYrCCSsEp%2BM64VZQD5JJPbh94E%2F%2B8%2B9LEZ9kOSw6kONaRJGuBY4oBh%2B1t5HG%2F9cIksy7nufwVF3%2B94PHvYDYmJ%2FWjBgBn8nvZitRSPYcU8rIfPkqbONO%2FXdH4HTsCiKi6fhA0fWr%2BBt%2BMwRfNDnZRVTlLPt5WyCodEALF7J53POtd4UltRzSD9H4yiAgDyF6kpE4T92IJ1RETSXYzi0VcLEvzKRK%2FcKSQ4AjnfkpQs9pKv2dT9mQh34EWMA3H6DWRo1zdAPV7uwFJbrEzKZoR7mTGsobpox%2FwT1ZNhlf6lRaVVfv7jaoaCesDOciKqNLDgHMd07vmJO3vYcolF5l3nlnhgTClufbRBjqkAcb9zMZYLU7s05E9ayNZKhO43eC5rHEc69OlDpSRZb6sG%2BXg4%2Fot%2FTAh8j8k1yPpemR0i4PIspYL1NNhpr0hdowrcgwN%2FbChBKiud%2FPimD8a3pwL%2F8Q9I0q7N3MsEltjtxD%2BrrW0GZGgnVjQtvUC%2F4Pu9SvLw6sofQhx1sfsPbwIw10L3asdlbvsdcKxlvlJVHP1DBRfcKNXwibDhZ9YlsYiKAMB&X-Amz-Signature=976875925366cbf7dae43c2967dbb89bd76541489bb6d77155eddd8b632bbd0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFP7W3II%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCTE2RAu7I6ixhvXxRz4AkwQsRxvs4K8yPWp3%2FJDN9VggIhAMFmI%2FZUr4dZDRHAd1lOXidMFtRKlZanND%2FxqpVZ7DMFKv8DCFcQABoMNjM3NDIzMTgzODA1Igxkaze0gTgHskm2rNkq3AO2ZFYrIJw9A9GU6W9arV9dyej4BRRx6Tzh9VkRsyHPhZwwxVdyf3dQtfvCLFQhNMagKS8sbA6%2FCB2jeP0OWOCUzuhkFWs7TXnLvyW8g3jjvPjXpIwNMbJ%2Fsge6cz4bWO8TLaQF0g1VVMlXlWkNTEEytArFaKIY6Fv0kvPp0InfVV6v0Xq4jRj32IJOCZKay%2FQ4WBIdEEwC4FNtU8srRgpUKRKRZjJaLnyWzlGQs7BL9F9uOywUjeZX2ecBKiVMUvctQaC%2FN6wf%2B%2BweT72nIlxttJDSQeeln9KvYrCCSsEp%2BM64VZQD5JJPbh94E%2F%2B8%2B9LEZ9kOSw6kONaRJGuBY4oBh%2B1t5HG%2F9cIksy7nufwVF3%2B94PHvYDYmJ%2FWjBgBn8nvZitRSPYcU8rIfPkqbONO%2FXdH4HTsCiKi6fhA0fWr%2BBt%2BMwRfNDnZRVTlLPt5WyCodEALF7J53POtd4UltRzSD9H4yiAgDyF6kpE4T92IJ1RETSXYzi0VcLEvzKRK%2FcKSQ4AjnfkpQs9pKv2dT9mQh34EWMA3H6DWRo1zdAPV7uwFJbrEzKZoR7mTGsobpox%2FwT1ZNhlf6lRaVVfv7jaoaCesDOciKqNLDgHMd07vmJO3vYcolF5l3nlnhgTClufbRBjqkAcb9zMZYLU7s05E9ayNZKhO43eC5rHEc69OlDpSRZb6sG%2BXg4%2Fot%2FTAh8j8k1yPpemR0i4PIspYL1NNhpr0hdowrcgwN%2FbChBKiud%2FPimD8a3pwL%2F8Q9I0q7N3MsEltjtxD%2BrrW0GZGgnVjQtvUC%2F4Pu9SvLw6sofQhx1sfsPbwIw10L3asdlbvsdcKxlvlJVHP1DBRfcKNXwibDhZ9YlsYiKAMB&X-Amz-Signature=fd3505b0208385c3cf939c63d9fb350802b17e61d1ec2e43e41ad095157079c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VFP7W3II%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222934Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCTE2RAu7I6ixhvXxRz4AkwQsRxvs4K8yPWp3%2FJDN9VggIhAMFmI%2FZUr4dZDRHAd1lOXidMFtRKlZanND%2FxqpVZ7DMFKv8DCFcQABoMNjM3NDIzMTgzODA1Igxkaze0gTgHskm2rNkq3AO2ZFYrIJw9A9GU6W9arV9dyej4BRRx6Tzh9VkRsyHPhZwwxVdyf3dQtfvCLFQhNMagKS8sbA6%2FCB2jeP0OWOCUzuhkFWs7TXnLvyW8g3jjvPjXpIwNMbJ%2Fsge6cz4bWO8TLaQF0g1VVMlXlWkNTEEytArFaKIY6Fv0kvPp0InfVV6v0Xq4jRj32IJOCZKay%2FQ4WBIdEEwC4FNtU8srRgpUKRKRZjJaLnyWzlGQs7BL9F9uOywUjeZX2ecBKiVMUvctQaC%2FN6wf%2B%2BweT72nIlxttJDSQeeln9KvYrCCSsEp%2BM64VZQD5JJPbh94E%2F%2B8%2B9LEZ9kOSw6kONaRJGuBY4oBh%2B1t5HG%2F9cIksy7nufwVF3%2B94PHvYDYmJ%2FWjBgBn8nvZitRSPYcU8rIfPkqbONO%2FXdH4HTsCiKi6fhA0fWr%2BBt%2BMwRfNDnZRVTlLPt5WyCodEALF7J53POtd4UltRzSD9H4yiAgDyF6kpE4T92IJ1RETSXYzi0VcLEvzKRK%2FcKSQ4AjnfkpQs9pKv2dT9mQh34EWMA3H6DWRo1zdAPV7uwFJbrEzKZoR7mTGsobpox%2FwT1ZNhlf6lRaVVfv7jaoaCesDOciKqNLDgHMd07vmJO3vYcolF5l3nlnhgTClufbRBjqkAcb9zMZYLU7s05E9ayNZKhO43eC5rHEc69OlDpSRZb6sG%2BXg4%2Fot%2FTAh8j8k1yPpemR0i4PIspYL1NNhpr0hdowrcgwN%2FbChBKiud%2FPimD8a3pwL%2F8Q9I0q7N3MsEltjtxD%2BrrW0GZGgnVjQtvUC%2F4Pu9SvLw6sofQhx1sfsPbwIw10L3asdlbvsdcKxlvlJVHP1DBRfcKNXwibDhZ9YlsYiKAMB&X-Amz-Signature=917983ddd3c037d2e01be4b2f219293080d67df54a21398e0214807b0a75e253&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
