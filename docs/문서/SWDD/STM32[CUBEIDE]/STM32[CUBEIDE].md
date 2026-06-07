# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAPKT3L%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T221158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDEMiCcQqv2JIyPKQnz6eDt1ynIkM9CKMysqrwdJJaHFAiEAqda38Bu2h4VSEUmpRVHUsKtWdo3VF3qzJnJN%2FoAqKdUqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGAl%2FJqRZUFhn9tXYSrcA10M7BLoVafLBsuO5piw6HoSGSYsvf0c4LQ6BxyPPE%2F9T2WwDes8hUS7NEfwmAgvrlRRiwdyJSNw3ax1t5QSHketCvFd%2BmWgu1d4IgpO%2F4gP2iJjYX10yQesrQWmBa1eH%2BQ12qZHO8q1vlJuHT%2B9%2BpbL84dra6XUcrBX8ix%2BUGQf81l7Le0%2FilvfoatLkAkg2wXZ1Hw%2FNJ6cXUCmNJekgSkMGIJ%2B0QcU9KEBiENdNyjaSFz0rEznmLtf%2BPA88EquBBFF%2FDUlPy54OmuZmXKflzORC%2F4%2B3fxVJG7ALboBCMCDbPHL9P9dE%2BIETPdbmbOOtmr2%2F2RaU9nlSIUjBmrigJBw6s39y2hxACWgQv5VfSzg8%2B41jhQdhRJ%2Bj59spKHvaoyhY3d2a%2B5fzshu20132Wn1g1j%2FuLzBuhpbTWlc%2BEQo1sKvsJgKRrkNg4GD1dW03l%2BnJEleOyC5wPW63KAidHcA5dlAG8nAnk3566SkabXX6jHmMTHe%2FJCioylz%2B1j97jkNgTpEKrUkvDUmfOpmeiSJzjXB6j7mfM0iwu2%2BQU9WdF1Ius2vULT4ipAU6L1%2F7k7XYia1ZFFLabJwL0nQUFtgr3g%2FKuBc9uVXgzdsRjXMLrJMU3j%2B6X5Cs0NRMO%2FVl9EGOqUBZkJEib0B9KYMDMqx14JmEeip1NgoNDT8bLwuHCXalvaGMazplxBMmFKioaJNKgZS6RsFlpRQBchxpoKfFDhYrGqU4AhLNNi7AwSWBA3dHBvfRJp%2FFSP1K2qTfS52ohSt1%2BKu3OpsjTNEgBiC0fugZ2INmt2JukbsbT%2BcyvA0Unu4cdfLtbc2RfVGant3c%2FCe12RapcFc6Ek5xxH9j8O7oPsq540p&X-Amz-Signature=69c3982eddf8c0f5cad306f4ea4996bfe482387a4fea97fcdd3c74f77dff432c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAPKT3L%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T221158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDEMiCcQqv2JIyPKQnz6eDt1ynIkM9CKMysqrwdJJaHFAiEAqda38Bu2h4VSEUmpRVHUsKtWdo3VF3qzJnJN%2FoAqKdUqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGAl%2FJqRZUFhn9tXYSrcA10M7BLoVafLBsuO5piw6HoSGSYsvf0c4LQ6BxyPPE%2F9T2WwDes8hUS7NEfwmAgvrlRRiwdyJSNw3ax1t5QSHketCvFd%2BmWgu1d4IgpO%2F4gP2iJjYX10yQesrQWmBa1eH%2BQ12qZHO8q1vlJuHT%2B9%2BpbL84dra6XUcrBX8ix%2BUGQf81l7Le0%2FilvfoatLkAkg2wXZ1Hw%2FNJ6cXUCmNJekgSkMGIJ%2B0QcU9KEBiENdNyjaSFz0rEznmLtf%2BPA88EquBBFF%2FDUlPy54OmuZmXKflzORC%2F4%2B3fxVJG7ALboBCMCDbPHL9P9dE%2BIETPdbmbOOtmr2%2F2RaU9nlSIUjBmrigJBw6s39y2hxACWgQv5VfSzg8%2B41jhQdhRJ%2Bj59spKHvaoyhY3d2a%2B5fzshu20132Wn1g1j%2FuLzBuhpbTWlc%2BEQo1sKvsJgKRrkNg4GD1dW03l%2BnJEleOyC5wPW63KAidHcA5dlAG8nAnk3566SkabXX6jHmMTHe%2FJCioylz%2B1j97jkNgTpEKrUkvDUmfOpmeiSJzjXB6j7mfM0iwu2%2BQU9WdF1Ius2vULT4ipAU6L1%2F7k7XYia1ZFFLabJwL0nQUFtgr3g%2FKuBc9uVXgzdsRjXMLrJMU3j%2B6X5Cs0NRMO%2FVl9EGOqUBZkJEib0B9KYMDMqx14JmEeip1NgoNDT8bLwuHCXalvaGMazplxBMmFKioaJNKgZS6RsFlpRQBchxpoKfFDhYrGqU4AhLNNi7AwSWBA3dHBvfRJp%2FFSP1K2qTfS52ohSt1%2BKu3OpsjTNEgBiC0fugZ2INmt2JukbsbT%2BcyvA0Unu4cdfLtbc2RfVGant3c%2FCe12RapcFc6Ek5xxH9j8O7oPsq540p&X-Amz-Signature=5319d1367011d7627099dceeecbf3cdcdec0174a9d46125a883127730642c6ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAPKT3L%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T221158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDEMiCcQqv2JIyPKQnz6eDt1ynIkM9CKMysqrwdJJaHFAiEAqda38Bu2h4VSEUmpRVHUsKtWdo3VF3qzJnJN%2FoAqKdUqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGAl%2FJqRZUFhn9tXYSrcA10M7BLoVafLBsuO5piw6HoSGSYsvf0c4LQ6BxyPPE%2F9T2WwDes8hUS7NEfwmAgvrlRRiwdyJSNw3ax1t5QSHketCvFd%2BmWgu1d4IgpO%2F4gP2iJjYX10yQesrQWmBa1eH%2BQ12qZHO8q1vlJuHT%2B9%2BpbL84dra6XUcrBX8ix%2BUGQf81l7Le0%2FilvfoatLkAkg2wXZ1Hw%2FNJ6cXUCmNJekgSkMGIJ%2B0QcU9KEBiENdNyjaSFz0rEznmLtf%2BPA88EquBBFF%2FDUlPy54OmuZmXKflzORC%2F4%2B3fxVJG7ALboBCMCDbPHL9P9dE%2BIETPdbmbOOtmr2%2F2RaU9nlSIUjBmrigJBw6s39y2hxACWgQv5VfSzg8%2B41jhQdhRJ%2Bj59spKHvaoyhY3d2a%2B5fzshu20132Wn1g1j%2FuLzBuhpbTWlc%2BEQo1sKvsJgKRrkNg4GD1dW03l%2BnJEleOyC5wPW63KAidHcA5dlAG8nAnk3566SkabXX6jHmMTHe%2FJCioylz%2B1j97jkNgTpEKrUkvDUmfOpmeiSJzjXB6j7mfM0iwu2%2BQU9WdF1Ius2vULT4ipAU6L1%2F7k7XYia1ZFFLabJwL0nQUFtgr3g%2FKuBc9uVXgzdsRjXMLrJMU3j%2B6X5Cs0NRMO%2FVl9EGOqUBZkJEib0B9KYMDMqx14JmEeip1NgoNDT8bLwuHCXalvaGMazplxBMmFKioaJNKgZS6RsFlpRQBchxpoKfFDhYrGqU4AhLNNi7AwSWBA3dHBvfRJp%2FFSP1K2qTfS52ohSt1%2BKu3OpsjTNEgBiC0fugZ2INmt2JukbsbT%2BcyvA0Unu4cdfLtbc2RfVGant3c%2FCe12RapcFc6Ek5xxH9j8O7oPsq540p&X-Amz-Signature=a203abb16c65e6b6d8cfe9cc85a00a9402e16d2dc79341c4d720d4a9e051d640&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAPKT3L%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T221158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDEMiCcQqv2JIyPKQnz6eDt1ynIkM9CKMysqrwdJJaHFAiEAqda38Bu2h4VSEUmpRVHUsKtWdo3VF3qzJnJN%2FoAqKdUqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGAl%2FJqRZUFhn9tXYSrcA10M7BLoVafLBsuO5piw6HoSGSYsvf0c4LQ6BxyPPE%2F9T2WwDes8hUS7NEfwmAgvrlRRiwdyJSNw3ax1t5QSHketCvFd%2BmWgu1d4IgpO%2F4gP2iJjYX10yQesrQWmBa1eH%2BQ12qZHO8q1vlJuHT%2B9%2BpbL84dra6XUcrBX8ix%2BUGQf81l7Le0%2FilvfoatLkAkg2wXZ1Hw%2FNJ6cXUCmNJekgSkMGIJ%2B0QcU9KEBiENdNyjaSFz0rEznmLtf%2BPA88EquBBFF%2FDUlPy54OmuZmXKflzORC%2F4%2B3fxVJG7ALboBCMCDbPHL9P9dE%2BIETPdbmbOOtmr2%2F2RaU9nlSIUjBmrigJBw6s39y2hxACWgQv5VfSzg8%2B41jhQdhRJ%2Bj59spKHvaoyhY3d2a%2B5fzshu20132Wn1g1j%2FuLzBuhpbTWlc%2BEQo1sKvsJgKRrkNg4GD1dW03l%2BnJEleOyC5wPW63KAidHcA5dlAG8nAnk3566SkabXX6jHmMTHe%2FJCioylz%2B1j97jkNgTpEKrUkvDUmfOpmeiSJzjXB6j7mfM0iwu2%2BQU9WdF1Ius2vULT4ipAU6L1%2F7k7XYia1ZFFLabJwL0nQUFtgr3g%2FKuBc9uVXgzdsRjXMLrJMU3j%2B6X5Cs0NRMO%2FVl9EGOqUBZkJEib0B9KYMDMqx14JmEeip1NgoNDT8bLwuHCXalvaGMazplxBMmFKioaJNKgZS6RsFlpRQBchxpoKfFDhYrGqU4AhLNNi7AwSWBA3dHBvfRJp%2FFSP1K2qTfS52ohSt1%2BKu3OpsjTNEgBiC0fugZ2INmt2JukbsbT%2BcyvA0Unu4cdfLtbc2RfVGant3c%2FCe12RapcFc6Ek5xxH9j8O7oPsq540p&X-Amz-Signature=bf95d3983ad35020fad12e48e2885fb4103252161398fd5d30875b83558dccb5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QAPKT3L%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T221158Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDEMiCcQqv2JIyPKQnz6eDt1ynIkM9CKMysqrwdJJaHFAiEAqda38Bu2h4VSEUmpRVHUsKtWdo3VF3qzJnJN%2FoAqKdUqiAQIp%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDGAl%2FJqRZUFhn9tXYSrcA10M7BLoVafLBsuO5piw6HoSGSYsvf0c4LQ6BxyPPE%2F9T2WwDes8hUS7NEfwmAgvrlRRiwdyJSNw3ax1t5QSHketCvFd%2BmWgu1d4IgpO%2F4gP2iJjYX10yQesrQWmBa1eH%2BQ12qZHO8q1vlJuHT%2B9%2BpbL84dra6XUcrBX8ix%2BUGQf81l7Le0%2FilvfoatLkAkg2wXZ1Hw%2FNJ6cXUCmNJekgSkMGIJ%2B0QcU9KEBiENdNyjaSFz0rEznmLtf%2BPA88EquBBFF%2FDUlPy54OmuZmXKflzORC%2F4%2B3fxVJG7ALboBCMCDbPHL9P9dE%2BIETPdbmbOOtmr2%2F2RaU9nlSIUjBmrigJBw6s39y2hxACWgQv5VfSzg8%2B41jhQdhRJ%2Bj59spKHvaoyhY3d2a%2B5fzshu20132Wn1g1j%2FuLzBuhpbTWlc%2BEQo1sKvsJgKRrkNg4GD1dW03l%2BnJEleOyC5wPW63KAidHcA5dlAG8nAnk3566SkabXX6jHmMTHe%2FJCioylz%2B1j97jkNgTpEKrUkvDUmfOpmeiSJzjXB6j7mfM0iwu2%2BQU9WdF1Ius2vULT4ipAU6L1%2F7k7XYia1ZFFLabJwL0nQUFtgr3g%2FKuBc9uVXgzdsRjXMLrJMU3j%2B6X5Cs0NRMO%2FVl9EGOqUBZkJEib0B9KYMDMqx14JmEeip1NgoNDT8bLwuHCXalvaGMazplxBMmFKioaJNKgZS6RsFlpRQBchxpoKfFDhYrGqU4AhLNNi7AwSWBA3dHBvfRJp%2FFSP1K2qTfS52ohSt1%2BKu3OpsjTNEgBiC0fugZ2INmt2JukbsbT%2BcyvA0Unu4cdfLtbc2RfVGant3c%2FCe12RapcFc6Ek5xxH9j8O7oPsq540p&X-Amz-Signature=caf5ebdb693e60519a299c8eac77d16adaf195b5d7aa1cd6cc72f5ab19c4246e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
