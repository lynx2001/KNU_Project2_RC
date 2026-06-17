# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TYCH6UUC%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T225236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICktyJE%2FE%2BPy32N4wEqfiwOSCr%2BcJvvMXbLCPHN2mTa2AiEAvBIrD9nihja%2F0doyTVm5uTFi3kW%2BBDfbCZKLf3XD%2FX0qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNXhU716EMbDwK8L4yrcA6rgViGcBYLY5UPKPeZJEQldGVL7%2FCiXUie7gi1azQW8UY4X8lCncjiROOa80CW1Wd4ld%2BAaST4IL7EUpSQUMEwzLmEgyp91OLq5uxPQHE0yvCH45P4%2BRnUISdL6WsI9ETB25Wiwu9DZZ27HJMW7oTbmpBmVVpf3F7Uw13S3hmKJtMNM8bpjXCCIJvwwkqKlRYeo9NFrdF5R2RIf9kgkDBZ5kp1mJGMfUrpsPWEQMRc3muPHVtVM8zCkVBXHccFHYJrzRJ6k36RC5n7NsKR%2B%2FmVQ%2FUEb0XUkLC4L5SvmpS6F5cU5%2F9qQ03CkOC1WOSH40D4CXVtC9LBJCTDztA3WSSeljp%2BrHCbv4BTkonaau44j%2Fte51e2LlBElxabb68V02Q%2BhBOhuBcuXOK7jtc%2BfW6ChrmR865OLHJEcIhLDmsVG9AXZY9mzA9snbsHnT4nhk1eavyGTkHpBlUHd0X9fNtWEovqohyQQSBtRXAwHl7dDV9r%2BGaBH%2FzV11AtG8VviZepcoEpjPvipqBaF%2F9MP7kkRLTBLPUaepz7Uvr5upDLmwkL%2BCWBx0JZMHcy8k0%2BddSUlVGKxlq3T3QIc9RJxRIFHaz8E25umDynRAFJRNZiQ11%2FQoeqhmYh7w2zCMM%2BUzNEGOqUBQrnAKUq4QqXRGx0tWD48Fj8cjBMQXkNg1JWZt67iXBBoE44TBuhdnN5ToWKM2PvJCBQOEz0nwcLhl74zUwJBH5nBy4mTBTERQ3D83tvTuGhmvmfCoz0WQ66PBSVfsrMJUCS4mcozAJQNZfjh0iiyWqyTxy36GGk2dkRABuTo4a7oRNiBmuQVsKZnnkMDAe0P8SYGKxa%2FkNsAtzZidX%2BfvUZE0wxc&X-Amz-Signature=f7fac34d4ad2366e8b0e3bae24cc58d2154784e0797cf027b792287cf3b86ac6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TYCH6UUC%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T225236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICktyJE%2FE%2BPy32N4wEqfiwOSCr%2BcJvvMXbLCPHN2mTa2AiEAvBIrD9nihja%2F0doyTVm5uTFi3kW%2BBDfbCZKLf3XD%2FX0qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNXhU716EMbDwK8L4yrcA6rgViGcBYLY5UPKPeZJEQldGVL7%2FCiXUie7gi1azQW8UY4X8lCncjiROOa80CW1Wd4ld%2BAaST4IL7EUpSQUMEwzLmEgyp91OLq5uxPQHE0yvCH45P4%2BRnUISdL6WsI9ETB25Wiwu9DZZ27HJMW7oTbmpBmVVpf3F7Uw13S3hmKJtMNM8bpjXCCIJvwwkqKlRYeo9NFrdF5R2RIf9kgkDBZ5kp1mJGMfUrpsPWEQMRc3muPHVtVM8zCkVBXHccFHYJrzRJ6k36RC5n7NsKR%2B%2FmVQ%2FUEb0XUkLC4L5SvmpS6F5cU5%2F9qQ03CkOC1WOSH40D4CXVtC9LBJCTDztA3WSSeljp%2BrHCbv4BTkonaau44j%2Fte51e2LlBElxabb68V02Q%2BhBOhuBcuXOK7jtc%2BfW6ChrmR865OLHJEcIhLDmsVG9AXZY9mzA9snbsHnT4nhk1eavyGTkHpBlUHd0X9fNtWEovqohyQQSBtRXAwHl7dDV9r%2BGaBH%2FzV11AtG8VviZepcoEpjPvipqBaF%2F9MP7kkRLTBLPUaepz7Uvr5upDLmwkL%2BCWBx0JZMHcy8k0%2BddSUlVGKxlq3T3QIc9RJxRIFHaz8E25umDynRAFJRNZiQ11%2FQoeqhmYh7w2zCMM%2BUzNEGOqUBQrnAKUq4QqXRGx0tWD48Fj8cjBMQXkNg1JWZt67iXBBoE44TBuhdnN5ToWKM2PvJCBQOEz0nwcLhl74zUwJBH5nBy4mTBTERQ3D83tvTuGhmvmfCoz0WQ66PBSVfsrMJUCS4mcozAJQNZfjh0iiyWqyTxy36GGk2dkRABuTo4a7oRNiBmuQVsKZnnkMDAe0P8SYGKxa%2FkNsAtzZidX%2BfvUZE0wxc&X-Amz-Signature=3a28691696b5835649f3799dd4617e1a20b0fbc8c45339937b672bc4ea0146ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TYCH6UUC%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T225236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICktyJE%2FE%2BPy32N4wEqfiwOSCr%2BcJvvMXbLCPHN2mTa2AiEAvBIrD9nihja%2F0doyTVm5uTFi3kW%2BBDfbCZKLf3XD%2FX0qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNXhU716EMbDwK8L4yrcA6rgViGcBYLY5UPKPeZJEQldGVL7%2FCiXUie7gi1azQW8UY4X8lCncjiROOa80CW1Wd4ld%2BAaST4IL7EUpSQUMEwzLmEgyp91OLq5uxPQHE0yvCH45P4%2BRnUISdL6WsI9ETB25Wiwu9DZZ27HJMW7oTbmpBmVVpf3F7Uw13S3hmKJtMNM8bpjXCCIJvwwkqKlRYeo9NFrdF5R2RIf9kgkDBZ5kp1mJGMfUrpsPWEQMRc3muPHVtVM8zCkVBXHccFHYJrzRJ6k36RC5n7NsKR%2B%2FmVQ%2FUEb0XUkLC4L5SvmpS6F5cU5%2F9qQ03CkOC1WOSH40D4CXVtC9LBJCTDztA3WSSeljp%2BrHCbv4BTkonaau44j%2Fte51e2LlBElxabb68V02Q%2BhBOhuBcuXOK7jtc%2BfW6ChrmR865OLHJEcIhLDmsVG9AXZY9mzA9snbsHnT4nhk1eavyGTkHpBlUHd0X9fNtWEovqohyQQSBtRXAwHl7dDV9r%2BGaBH%2FzV11AtG8VviZepcoEpjPvipqBaF%2F9MP7kkRLTBLPUaepz7Uvr5upDLmwkL%2BCWBx0JZMHcy8k0%2BddSUlVGKxlq3T3QIc9RJxRIFHaz8E25umDynRAFJRNZiQ11%2FQoeqhmYh7w2zCMM%2BUzNEGOqUBQrnAKUq4QqXRGx0tWD48Fj8cjBMQXkNg1JWZt67iXBBoE44TBuhdnN5ToWKM2PvJCBQOEz0nwcLhl74zUwJBH5nBy4mTBTERQ3D83tvTuGhmvmfCoz0WQ66PBSVfsrMJUCS4mcozAJQNZfjh0iiyWqyTxy36GGk2dkRABuTo4a7oRNiBmuQVsKZnnkMDAe0P8SYGKxa%2FkNsAtzZidX%2BfvUZE0wxc&X-Amz-Signature=01d1b6c7bb71cd144fa075ad84874074392397c4bfb299bc39a2a5db3cbc2d81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TYCH6UUC%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T225236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICktyJE%2FE%2BPy32N4wEqfiwOSCr%2BcJvvMXbLCPHN2mTa2AiEAvBIrD9nihja%2F0doyTVm5uTFi3kW%2BBDfbCZKLf3XD%2FX0qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNXhU716EMbDwK8L4yrcA6rgViGcBYLY5UPKPeZJEQldGVL7%2FCiXUie7gi1azQW8UY4X8lCncjiROOa80CW1Wd4ld%2BAaST4IL7EUpSQUMEwzLmEgyp91OLq5uxPQHE0yvCH45P4%2BRnUISdL6WsI9ETB25Wiwu9DZZ27HJMW7oTbmpBmVVpf3F7Uw13S3hmKJtMNM8bpjXCCIJvwwkqKlRYeo9NFrdF5R2RIf9kgkDBZ5kp1mJGMfUrpsPWEQMRc3muPHVtVM8zCkVBXHccFHYJrzRJ6k36RC5n7NsKR%2B%2FmVQ%2FUEb0XUkLC4L5SvmpS6F5cU5%2F9qQ03CkOC1WOSH40D4CXVtC9LBJCTDztA3WSSeljp%2BrHCbv4BTkonaau44j%2Fte51e2LlBElxabb68V02Q%2BhBOhuBcuXOK7jtc%2BfW6ChrmR865OLHJEcIhLDmsVG9AXZY9mzA9snbsHnT4nhk1eavyGTkHpBlUHd0X9fNtWEovqohyQQSBtRXAwHl7dDV9r%2BGaBH%2FzV11AtG8VviZepcoEpjPvipqBaF%2F9MP7kkRLTBLPUaepz7Uvr5upDLmwkL%2BCWBx0JZMHcy8k0%2BddSUlVGKxlq3T3QIc9RJxRIFHaz8E25umDynRAFJRNZiQ11%2FQoeqhmYh7w2zCMM%2BUzNEGOqUBQrnAKUq4QqXRGx0tWD48Fj8cjBMQXkNg1JWZt67iXBBoE44TBuhdnN5ToWKM2PvJCBQOEz0nwcLhl74zUwJBH5nBy4mTBTERQ3D83tvTuGhmvmfCoz0WQ66PBSVfsrMJUCS4mcozAJQNZfjh0iiyWqyTxy36GGk2dkRABuTo4a7oRNiBmuQVsKZnnkMDAe0P8SYGKxa%2FkNsAtzZidX%2BfvUZE0wxc&X-Amz-Signature=e7827c22aad943712f9952221d418abd6d48e5452b30eefacf860870daa12fef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TYCH6UUC%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T225236Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCICktyJE%2FE%2BPy32N4wEqfiwOSCr%2BcJvvMXbLCPHN2mTa2AiEAvBIrD9nihja%2F0doyTVm5uTFi3kW%2BBDfbCZKLf3XD%2FX0qiAQIlv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNXhU716EMbDwK8L4yrcA6rgViGcBYLY5UPKPeZJEQldGVL7%2FCiXUie7gi1azQW8UY4X8lCncjiROOa80CW1Wd4ld%2BAaST4IL7EUpSQUMEwzLmEgyp91OLq5uxPQHE0yvCH45P4%2BRnUISdL6WsI9ETB25Wiwu9DZZ27HJMW7oTbmpBmVVpf3F7Uw13S3hmKJtMNM8bpjXCCIJvwwkqKlRYeo9NFrdF5R2RIf9kgkDBZ5kp1mJGMfUrpsPWEQMRc3muPHVtVM8zCkVBXHccFHYJrzRJ6k36RC5n7NsKR%2B%2FmVQ%2FUEb0XUkLC4L5SvmpS6F5cU5%2F9qQ03CkOC1WOSH40D4CXVtC9LBJCTDztA3WSSeljp%2BrHCbv4BTkonaau44j%2Fte51e2LlBElxabb68V02Q%2BhBOhuBcuXOK7jtc%2BfW6ChrmR865OLHJEcIhLDmsVG9AXZY9mzA9snbsHnT4nhk1eavyGTkHpBlUHd0X9fNtWEovqohyQQSBtRXAwHl7dDV9r%2BGaBH%2FzV11AtG8VviZepcoEpjPvipqBaF%2F9MP7kkRLTBLPUaepz7Uvr5upDLmwkL%2BCWBx0JZMHcy8k0%2BddSUlVGKxlq3T3QIc9RJxRIFHaz8E25umDynRAFJRNZiQ11%2FQoeqhmYh7w2zCMM%2BUzNEGOqUBQrnAKUq4QqXRGx0tWD48Fj8cjBMQXkNg1JWZt67iXBBoE44TBuhdnN5ToWKM2PvJCBQOEz0nwcLhl74zUwJBH5nBy4mTBTERQ3D83tvTuGhmvmfCoz0WQ66PBSVfsrMJUCS4mcozAJQNZfjh0iiyWqyTxy36GGk2dkRABuTo4a7oRNiBmuQVsKZnnkMDAe0P8SYGKxa%2FkNsAtzZidX%2BfvUZE0wxc&X-Amz-Signature=09f55e69f3aa61191576dc72c1253a381a16948f3d58fe3e6893025eacc13f9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
