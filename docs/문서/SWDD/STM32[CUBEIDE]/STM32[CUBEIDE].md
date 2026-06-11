# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCQYGDF2%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQC7%2FLqp5e0zVYgIJelWqkuiGjWmfBN12S7S9Y1nGXO57QIhAJozVZHjZf8rBMPOnIKvbeOyQiZnNxmlA1mh3zTaj3atKv8DCAcQABoMNjM3NDIzMTgzODA1IgxXpXMACHnHiXWFx0kq3ANekurW0mPq9Nj3yr%2FsfZkoarkFac406RAyVQtz8KkKiCZ464bcLyYp%2Fah%2B3GtTZGYlX9Ap0edtxrjPnb2Yur6iXDDvt9K%2BAucnStv9fnDMPjZ5s04YSb%2BpJBH0LT1S%2FnUndIdxmZkFrgygdjkK01tA%2FwNNCIlbttRrLt9tsTkwFOEd3yn4kItuI4Qqs55Isv6qqkRr5mYM%2BH5Na2YivnlwFKoZIAR5hdtM7Hecq4NIkPHfpYO6rJ0VVkry3F1PAtXQ4x7lqCYcoup3qe1Se%2BLu6DB5Aek54Jx%2BaIl9lQvmpVapaliiS9G8Hqt32vTcTf%2FWmNxvaDVjgOxd4KTrthqBy3Z6FcUfnkT9q8WANp5vje8r0Ao0GoiGyicLC5K2BKqAzTnLAOw0wt0LMywnG9MUbySmzZTEBySMzjKHS8yimH6yjRkC1aNqGnTqaufpQb7gaF3PsX6zUvFQxaJb4QOsZmNuDVxad4TqxRoFIoPlEVr7x9fhm6CZmfAwUFmp7Nia6gUyul6ykFJ8C740rJ9%2BfLkl05gEsZjfAf5ISZjW6c6YRpysE1Y0s%2B1uuSr0Ka7%2F2HzG3S3bCNstbnp1d%2FVJBefRxKCpj4e%2BkBmr3oI%2FX04akFKn7UXrwcG6OjCL5KzRBjqkATeT9tBmOiTycyfDp7ONkcc9JEGFlKM9hAKxCD5QnHjOX0oux3miwdcTRy%2BvTALwp1iGZicpX70TyQEfy%2FnpHUhoZPSBurKEIMIy4YG9lb72ieUllg4oGhgMtMYtCpF8QQSOyfFZFDiF996u3VRU4C9MfZjQiXr0RNalNnboshxEMJVPtTpPCuhDlb%2FImtYfZNaZat6FNyW0OMq2cjpgvI%2FUb%2BQA&X-Amz-Signature=a10f22867eff404e19a5a3b6f4b59d9610ad6eb98fe645d1b3a731987c0113d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCQYGDF2%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQC7%2FLqp5e0zVYgIJelWqkuiGjWmfBN12S7S9Y1nGXO57QIhAJozVZHjZf8rBMPOnIKvbeOyQiZnNxmlA1mh3zTaj3atKv8DCAcQABoMNjM3NDIzMTgzODA1IgxXpXMACHnHiXWFx0kq3ANekurW0mPq9Nj3yr%2FsfZkoarkFac406RAyVQtz8KkKiCZ464bcLyYp%2Fah%2B3GtTZGYlX9Ap0edtxrjPnb2Yur6iXDDvt9K%2BAucnStv9fnDMPjZ5s04YSb%2BpJBH0LT1S%2FnUndIdxmZkFrgygdjkK01tA%2FwNNCIlbttRrLt9tsTkwFOEd3yn4kItuI4Qqs55Isv6qqkRr5mYM%2BH5Na2YivnlwFKoZIAR5hdtM7Hecq4NIkPHfpYO6rJ0VVkry3F1PAtXQ4x7lqCYcoup3qe1Se%2BLu6DB5Aek54Jx%2BaIl9lQvmpVapaliiS9G8Hqt32vTcTf%2FWmNxvaDVjgOxd4KTrthqBy3Z6FcUfnkT9q8WANp5vje8r0Ao0GoiGyicLC5K2BKqAzTnLAOw0wt0LMywnG9MUbySmzZTEBySMzjKHS8yimH6yjRkC1aNqGnTqaufpQb7gaF3PsX6zUvFQxaJb4QOsZmNuDVxad4TqxRoFIoPlEVr7x9fhm6CZmfAwUFmp7Nia6gUyul6ykFJ8C740rJ9%2BfLkl05gEsZjfAf5ISZjW6c6YRpysE1Y0s%2B1uuSr0Ka7%2F2HzG3S3bCNstbnp1d%2FVJBefRxKCpj4e%2BkBmr3oI%2FX04akFKn7UXrwcG6OjCL5KzRBjqkATeT9tBmOiTycyfDp7ONkcc9JEGFlKM9hAKxCD5QnHjOX0oux3miwdcTRy%2BvTALwp1iGZicpX70TyQEfy%2FnpHUhoZPSBurKEIMIy4YG9lb72ieUllg4oGhgMtMYtCpF8QQSOyfFZFDiF996u3VRU4C9MfZjQiXr0RNalNnboshxEMJVPtTpPCuhDlb%2FImtYfZNaZat6FNyW0OMq2cjpgvI%2FUb%2BQA&X-Amz-Signature=3f0ba60f5f1d9e4628288b3d488f4a5c5e8612fdf7bf6ac6a142ee84f71f99b2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCQYGDF2%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQC7%2FLqp5e0zVYgIJelWqkuiGjWmfBN12S7S9Y1nGXO57QIhAJozVZHjZf8rBMPOnIKvbeOyQiZnNxmlA1mh3zTaj3atKv8DCAcQABoMNjM3NDIzMTgzODA1IgxXpXMACHnHiXWFx0kq3ANekurW0mPq9Nj3yr%2FsfZkoarkFac406RAyVQtz8KkKiCZ464bcLyYp%2Fah%2B3GtTZGYlX9Ap0edtxrjPnb2Yur6iXDDvt9K%2BAucnStv9fnDMPjZ5s04YSb%2BpJBH0LT1S%2FnUndIdxmZkFrgygdjkK01tA%2FwNNCIlbttRrLt9tsTkwFOEd3yn4kItuI4Qqs55Isv6qqkRr5mYM%2BH5Na2YivnlwFKoZIAR5hdtM7Hecq4NIkPHfpYO6rJ0VVkry3F1PAtXQ4x7lqCYcoup3qe1Se%2BLu6DB5Aek54Jx%2BaIl9lQvmpVapaliiS9G8Hqt32vTcTf%2FWmNxvaDVjgOxd4KTrthqBy3Z6FcUfnkT9q8WANp5vje8r0Ao0GoiGyicLC5K2BKqAzTnLAOw0wt0LMywnG9MUbySmzZTEBySMzjKHS8yimH6yjRkC1aNqGnTqaufpQb7gaF3PsX6zUvFQxaJb4QOsZmNuDVxad4TqxRoFIoPlEVr7x9fhm6CZmfAwUFmp7Nia6gUyul6ykFJ8C740rJ9%2BfLkl05gEsZjfAf5ISZjW6c6YRpysE1Y0s%2B1uuSr0Ka7%2F2HzG3S3bCNstbnp1d%2FVJBefRxKCpj4e%2BkBmr3oI%2FX04akFKn7UXrwcG6OjCL5KzRBjqkATeT9tBmOiTycyfDp7ONkcc9JEGFlKM9hAKxCD5QnHjOX0oux3miwdcTRy%2BvTALwp1iGZicpX70TyQEfy%2FnpHUhoZPSBurKEIMIy4YG9lb72ieUllg4oGhgMtMYtCpF8QQSOyfFZFDiF996u3VRU4C9MfZjQiXr0RNalNnboshxEMJVPtTpPCuhDlb%2FImtYfZNaZat6FNyW0OMq2cjpgvI%2FUb%2BQA&X-Amz-Signature=67adf5528c1f5e10a46a2a563ba2dd7f838b890c4ced81fd3ef0e35a221d03cb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCQYGDF2%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQC7%2FLqp5e0zVYgIJelWqkuiGjWmfBN12S7S9Y1nGXO57QIhAJozVZHjZf8rBMPOnIKvbeOyQiZnNxmlA1mh3zTaj3atKv8DCAcQABoMNjM3NDIzMTgzODA1IgxXpXMACHnHiXWFx0kq3ANekurW0mPq9Nj3yr%2FsfZkoarkFac406RAyVQtz8KkKiCZ464bcLyYp%2Fah%2B3GtTZGYlX9Ap0edtxrjPnb2Yur6iXDDvt9K%2BAucnStv9fnDMPjZ5s04YSb%2BpJBH0LT1S%2FnUndIdxmZkFrgygdjkK01tA%2FwNNCIlbttRrLt9tsTkwFOEd3yn4kItuI4Qqs55Isv6qqkRr5mYM%2BH5Na2YivnlwFKoZIAR5hdtM7Hecq4NIkPHfpYO6rJ0VVkry3F1PAtXQ4x7lqCYcoup3qe1Se%2BLu6DB5Aek54Jx%2BaIl9lQvmpVapaliiS9G8Hqt32vTcTf%2FWmNxvaDVjgOxd4KTrthqBy3Z6FcUfnkT9q8WANp5vje8r0Ao0GoiGyicLC5K2BKqAzTnLAOw0wt0LMywnG9MUbySmzZTEBySMzjKHS8yimH6yjRkC1aNqGnTqaufpQb7gaF3PsX6zUvFQxaJb4QOsZmNuDVxad4TqxRoFIoPlEVr7x9fhm6CZmfAwUFmp7Nia6gUyul6ykFJ8C740rJ9%2BfLkl05gEsZjfAf5ISZjW6c6YRpysE1Y0s%2B1uuSr0Ka7%2F2HzG3S3bCNstbnp1d%2FVJBefRxKCpj4e%2BkBmr3oI%2FX04akFKn7UXrwcG6OjCL5KzRBjqkATeT9tBmOiTycyfDp7ONkcc9JEGFlKM9hAKxCD5QnHjOX0oux3miwdcTRy%2BvTALwp1iGZicpX70TyQEfy%2FnpHUhoZPSBurKEIMIy4YG9lb72ieUllg4oGhgMtMYtCpF8QQSOyfFZFDiF996u3VRU4C9MfZjQiXr0RNalNnboshxEMJVPtTpPCuhDlb%2FImtYfZNaZat6FNyW0OMq2cjpgvI%2FUb%2BQA&X-Amz-Signature=2bd7074249f2c0d56346e0430517974ba6068d4c841a0e8f3ced670167e73a0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WCQYGDF2%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJIMEYCIQC7%2FLqp5e0zVYgIJelWqkuiGjWmfBN12S7S9Y1nGXO57QIhAJozVZHjZf8rBMPOnIKvbeOyQiZnNxmlA1mh3zTaj3atKv8DCAcQABoMNjM3NDIzMTgzODA1IgxXpXMACHnHiXWFx0kq3ANekurW0mPq9Nj3yr%2FsfZkoarkFac406RAyVQtz8KkKiCZ464bcLyYp%2Fah%2B3GtTZGYlX9Ap0edtxrjPnb2Yur6iXDDvt9K%2BAucnStv9fnDMPjZ5s04YSb%2BpJBH0LT1S%2FnUndIdxmZkFrgygdjkK01tA%2FwNNCIlbttRrLt9tsTkwFOEd3yn4kItuI4Qqs55Isv6qqkRr5mYM%2BH5Na2YivnlwFKoZIAR5hdtM7Hecq4NIkPHfpYO6rJ0VVkry3F1PAtXQ4x7lqCYcoup3qe1Se%2BLu6DB5Aek54Jx%2BaIl9lQvmpVapaliiS9G8Hqt32vTcTf%2FWmNxvaDVjgOxd4KTrthqBy3Z6FcUfnkT9q8WANp5vje8r0Ao0GoiGyicLC5K2BKqAzTnLAOw0wt0LMywnG9MUbySmzZTEBySMzjKHS8yimH6yjRkC1aNqGnTqaufpQb7gaF3PsX6zUvFQxaJb4QOsZmNuDVxad4TqxRoFIoPlEVr7x9fhm6CZmfAwUFmp7Nia6gUyul6ykFJ8C740rJ9%2BfLkl05gEsZjfAf5ISZjW6c6YRpysE1Y0s%2B1uuSr0Ka7%2F2HzG3S3bCNstbnp1d%2FVJBefRxKCpj4e%2BkBmr3oI%2FX04akFKn7UXrwcG6OjCL5KzRBjqkATeT9tBmOiTycyfDp7ONkcc9JEGFlKM9hAKxCD5QnHjOX0oux3miwdcTRy%2BvTALwp1iGZicpX70TyQEfy%2FnpHUhoZPSBurKEIMIy4YG9lb72ieUllg4oGhgMtMYtCpF8QQSOyfFZFDiF996u3VRU4C9MfZjQiXr0RNalNnboshxEMJVPtTpPCuhDlb%2FImtYfZNaZat6FNyW0OMq2cjpgvI%2FUb%2BQA&X-Amz-Signature=b3b2b9f65e5e6364b111e205b1c47e5ad2e4fa46281d1737fff9b03dc16bac62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
