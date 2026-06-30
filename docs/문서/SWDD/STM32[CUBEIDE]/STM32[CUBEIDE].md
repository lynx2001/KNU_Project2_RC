# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOKDXV2M%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222442Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQCsMok1q%2FecreWUIOk5XGuxN5O0Ob%2B%2FdPRcjl6tzgqtgAIgbl54AnZXO4RsB%2FCx0LkXyLfcxe98Zc9JqVAq2ci3wcgqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOk4gG8tiasXdqIDpSrcAzbE6ILxMg9uqjk1xxxIfekVe%2BdzzFtP%2BFg2Ch1L6eTZFaYRYc7wZqb4vzuU5AFadkLUqzsMgjCKImWwxUpMZk4MoS5t8wz%2F0%2BYCdv%2FmTFGDe4kfKWXvh3gnW%2Bs0ziKIeo3wWIt3VvwTEm9HOsPiq3oQ1n0fedFadY3fMvs6grj5lH0LWYgPy9OUscOYW2u2FrraiqO38j1%2BHRIuwW1mqLmf7aKfmhjI5a081Aa1pjDm02b18hRo1zUwJKJUgjBN1lCLuPCygovCFuk%2FBhx9zYfuy6VTyVuBIsL%2BaHnvbpd%2Fk1228VLnkvc0vkosF7IOqfTu0EZK18RKHqNbVmM8QrLwx%2F199Gx6GaVXQhb61dWc5rkxU9g3e%2BimQ8QRxo2eEuY6LAdU%2F0PPmhrgVKlpGjq2fv79FwTs7IXHlwxwTUQfnW1OxGXwI7Pu9txYwdE5CqppOSRbdnO1sThCjksvXEmtNpStXDPZvMldegUKVaROHQdhro6h%2BjJzk2DhEvKm8qcPKusGLYOAvlwVO3AEDUrKCLJRZ46CZsKW4OD1jalej8UtC7AAi4edOUq5qOxDVmr%2BFrmfQXpRhnGYDuGMZdW%2F4rLIsykRN0mERfEm1ggz%2BaEayLZdbyCMyE8MMOPmkNIGOqUBw4hGnaPMpT9bZ5buMYiK1qlnmoviY3PF9D1IQL9wWZU9WEfUAjcVK8nU4mjUbAiM9YVBdcHmZH%2F4Kw9h6yoPU7eZ8YmIjCHN3soBX7fWtbGFAt6pJAW8dQX%2Fu7gi6v7lr9TI2wdsP0b8DCBLRhLKZuZ4m%2FwaPyOtx5K%2Bo61GSI%2FhjseCvOHEOivrkMo830Sb88pI0ZJ8ndfmv5WQMFcRzLPViU21&X-Amz-Signature=e2e24c5fdce17f9f361ac752d6bf79216e934a1ccc0672fc0330bd690a50f38a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOKDXV2M%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222442Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQCsMok1q%2FecreWUIOk5XGuxN5O0Ob%2B%2FdPRcjl6tzgqtgAIgbl54AnZXO4RsB%2FCx0LkXyLfcxe98Zc9JqVAq2ci3wcgqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOk4gG8tiasXdqIDpSrcAzbE6ILxMg9uqjk1xxxIfekVe%2BdzzFtP%2BFg2Ch1L6eTZFaYRYc7wZqb4vzuU5AFadkLUqzsMgjCKImWwxUpMZk4MoS5t8wz%2F0%2BYCdv%2FmTFGDe4kfKWXvh3gnW%2Bs0ziKIeo3wWIt3VvwTEm9HOsPiq3oQ1n0fedFadY3fMvs6grj5lH0LWYgPy9OUscOYW2u2FrraiqO38j1%2BHRIuwW1mqLmf7aKfmhjI5a081Aa1pjDm02b18hRo1zUwJKJUgjBN1lCLuPCygovCFuk%2FBhx9zYfuy6VTyVuBIsL%2BaHnvbpd%2Fk1228VLnkvc0vkosF7IOqfTu0EZK18RKHqNbVmM8QrLwx%2F199Gx6GaVXQhb61dWc5rkxU9g3e%2BimQ8QRxo2eEuY6LAdU%2F0PPmhrgVKlpGjq2fv79FwTs7IXHlwxwTUQfnW1OxGXwI7Pu9txYwdE5CqppOSRbdnO1sThCjksvXEmtNpStXDPZvMldegUKVaROHQdhro6h%2BjJzk2DhEvKm8qcPKusGLYOAvlwVO3AEDUrKCLJRZ46CZsKW4OD1jalej8UtC7AAi4edOUq5qOxDVmr%2BFrmfQXpRhnGYDuGMZdW%2F4rLIsykRN0mERfEm1ggz%2BaEayLZdbyCMyE8MMOPmkNIGOqUBw4hGnaPMpT9bZ5buMYiK1qlnmoviY3PF9D1IQL9wWZU9WEfUAjcVK8nU4mjUbAiM9YVBdcHmZH%2F4Kw9h6yoPU7eZ8YmIjCHN3soBX7fWtbGFAt6pJAW8dQX%2Fu7gi6v7lr9TI2wdsP0b8DCBLRhLKZuZ4m%2FwaPyOtx5K%2Bo61GSI%2FhjseCvOHEOivrkMo830Sb88pI0ZJ8ndfmv5WQMFcRzLPViU21&X-Amz-Signature=3ade9a829c9f02e45bfe52d69427f0104f597aaa711c3e3da329aeba1707f72b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOKDXV2M%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222442Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQCsMok1q%2FecreWUIOk5XGuxN5O0Ob%2B%2FdPRcjl6tzgqtgAIgbl54AnZXO4RsB%2FCx0LkXyLfcxe98Zc9JqVAq2ci3wcgqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOk4gG8tiasXdqIDpSrcAzbE6ILxMg9uqjk1xxxIfekVe%2BdzzFtP%2BFg2Ch1L6eTZFaYRYc7wZqb4vzuU5AFadkLUqzsMgjCKImWwxUpMZk4MoS5t8wz%2F0%2BYCdv%2FmTFGDe4kfKWXvh3gnW%2Bs0ziKIeo3wWIt3VvwTEm9HOsPiq3oQ1n0fedFadY3fMvs6grj5lH0LWYgPy9OUscOYW2u2FrraiqO38j1%2BHRIuwW1mqLmf7aKfmhjI5a081Aa1pjDm02b18hRo1zUwJKJUgjBN1lCLuPCygovCFuk%2FBhx9zYfuy6VTyVuBIsL%2BaHnvbpd%2Fk1228VLnkvc0vkosF7IOqfTu0EZK18RKHqNbVmM8QrLwx%2F199Gx6GaVXQhb61dWc5rkxU9g3e%2BimQ8QRxo2eEuY6LAdU%2F0PPmhrgVKlpGjq2fv79FwTs7IXHlwxwTUQfnW1OxGXwI7Pu9txYwdE5CqppOSRbdnO1sThCjksvXEmtNpStXDPZvMldegUKVaROHQdhro6h%2BjJzk2DhEvKm8qcPKusGLYOAvlwVO3AEDUrKCLJRZ46CZsKW4OD1jalej8UtC7AAi4edOUq5qOxDVmr%2BFrmfQXpRhnGYDuGMZdW%2F4rLIsykRN0mERfEm1ggz%2BaEayLZdbyCMyE8MMOPmkNIGOqUBw4hGnaPMpT9bZ5buMYiK1qlnmoviY3PF9D1IQL9wWZU9WEfUAjcVK8nU4mjUbAiM9YVBdcHmZH%2F4Kw9h6yoPU7eZ8YmIjCHN3soBX7fWtbGFAt6pJAW8dQX%2Fu7gi6v7lr9TI2wdsP0b8DCBLRhLKZuZ4m%2FwaPyOtx5K%2Bo61GSI%2FhjseCvOHEOivrkMo830Sb88pI0ZJ8ndfmv5WQMFcRzLPViU21&X-Amz-Signature=2e20cf74245e38deaa1442d0c37275e521a34bf1b3fd1e908a8144e23fe13572&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOKDXV2M%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222442Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQCsMok1q%2FecreWUIOk5XGuxN5O0Ob%2B%2FdPRcjl6tzgqtgAIgbl54AnZXO4RsB%2FCx0LkXyLfcxe98Zc9JqVAq2ci3wcgqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOk4gG8tiasXdqIDpSrcAzbE6ILxMg9uqjk1xxxIfekVe%2BdzzFtP%2BFg2Ch1L6eTZFaYRYc7wZqb4vzuU5AFadkLUqzsMgjCKImWwxUpMZk4MoS5t8wz%2F0%2BYCdv%2FmTFGDe4kfKWXvh3gnW%2Bs0ziKIeo3wWIt3VvwTEm9HOsPiq3oQ1n0fedFadY3fMvs6grj5lH0LWYgPy9OUscOYW2u2FrraiqO38j1%2BHRIuwW1mqLmf7aKfmhjI5a081Aa1pjDm02b18hRo1zUwJKJUgjBN1lCLuPCygovCFuk%2FBhx9zYfuy6VTyVuBIsL%2BaHnvbpd%2Fk1228VLnkvc0vkosF7IOqfTu0EZK18RKHqNbVmM8QrLwx%2F199Gx6GaVXQhb61dWc5rkxU9g3e%2BimQ8QRxo2eEuY6LAdU%2F0PPmhrgVKlpGjq2fv79FwTs7IXHlwxwTUQfnW1OxGXwI7Pu9txYwdE5CqppOSRbdnO1sThCjksvXEmtNpStXDPZvMldegUKVaROHQdhro6h%2BjJzk2DhEvKm8qcPKusGLYOAvlwVO3AEDUrKCLJRZ46CZsKW4OD1jalej8UtC7AAi4edOUq5qOxDVmr%2BFrmfQXpRhnGYDuGMZdW%2F4rLIsykRN0mERfEm1ggz%2BaEayLZdbyCMyE8MMOPmkNIGOqUBw4hGnaPMpT9bZ5buMYiK1qlnmoviY3PF9D1IQL9wWZU9WEfUAjcVK8nU4mjUbAiM9YVBdcHmZH%2F4Kw9h6yoPU7eZ8YmIjCHN3soBX7fWtbGFAt6pJAW8dQX%2Fu7gi6v7lr9TI2wdsP0b8DCBLRhLKZuZ4m%2FwaPyOtx5K%2Bo61GSI%2FhjseCvOHEOivrkMo830Sb88pI0ZJ8ndfmv5WQMFcRzLPViU21&X-Amz-Signature=d98576b9b43d35432ef5d3d605d858f694cf2226b74400808ab3eb61031a0437&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XOKDXV2M%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T222442Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIQCsMok1q%2FecreWUIOk5XGuxN5O0Ob%2B%2FdPRcjl6tzgqtgAIgbl54AnZXO4RsB%2FCx0LkXyLfcxe98Zc9JqVAq2ci3wcgqiAQIzv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOk4gG8tiasXdqIDpSrcAzbE6ILxMg9uqjk1xxxIfekVe%2BdzzFtP%2BFg2Ch1L6eTZFaYRYc7wZqb4vzuU5AFadkLUqzsMgjCKImWwxUpMZk4MoS5t8wz%2F0%2BYCdv%2FmTFGDe4kfKWXvh3gnW%2Bs0ziKIeo3wWIt3VvwTEm9HOsPiq3oQ1n0fedFadY3fMvs6grj5lH0LWYgPy9OUscOYW2u2FrraiqO38j1%2BHRIuwW1mqLmf7aKfmhjI5a081Aa1pjDm02b18hRo1zUwJKJUgjBN1lCLuPCygovCFuk%2FBhx9zYfuy6VTyVuBIsL%2BaHnvbpd%2Fk1228VLnkvc0vkosF7IOqfTu0EZK18RKHqNbVmM8QrLwx%2F199Gx6GaVXQhb61dWc5rkxU9g3e%2BimQ8QRxo2eEuY6LAdU%2F0PPmhrgVKlpGjq2fv79FwTs7IXHlwxwTUQfnW1OxGXwI7Pu9txYwdE5CqppOSRbdnO1sThCjksvXEmtNpStXDPZvMldegUKVaROHQdhro6h%2BjJzk2DhEvKm8qcPKusGLYOAvlwVO3AEDUrKCLJRZ46CZsKW4OD1jalej8UtC7AAi4edOUq5qOxDVmr%2BFrmfQXpRhnGYDuGMZdW%2F4rLIsykRN0mERfEm1ggz%2BaEayLZdbyCMyE8MMOPmkNIGOqUBw4hGnaPMpT9bZ5buMYiK1qlnmoviY3PF9D1IQL9wWZU9WEfUAjcVK8nU4mjUbAiM9YVBdcHmZH%2F4Kw9h6yoPU7eZ8YmIjCHN3soBX7fWtbGFAt6pJAW8dQX%2Fu7gi6v7lr9TI2wdsP0b8DCBLRhLKZuZ4m%2FwaPyOtx5K%2Bo61GSI%2FhjseCvOHEOivrkMo830Sb88pI0ZJ8ndfmv5WQMFcRzLPViU21&X-Amz-Signature=eca8d692f55003d8a88ea70d5d44593476b4cc3b549cf1d22cf343ad8e273b6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
