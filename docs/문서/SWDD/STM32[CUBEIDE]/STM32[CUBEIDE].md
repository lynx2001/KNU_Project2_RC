# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBN7A32V%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQDs21JITpnSLOZEEAMSikCAI52alPS5xs0cZ85xYMYahAIhAMNyAnkaxdLtwc1UYF4bsQz3W59ppmXV%2BKCm%2FL2M4mUEKv8DCCYQABoMNjM3NDIzMTgzODA1IgzURSS3d6fLHK%2FaKJkq3APa06Pea5uY6l4f%2BoL1sbs6lrTdrmLSRwU3ru6E0bo8XN953O8asQj%2FU%2BF%2FakqHxpix0gWdbeYKrjuAH3KIFHZVrUtQ03Lo8dnwgVE1ynmdX7C3Xq1je%2FjpDDRjeRwFJwbd%2BYztE2iQ1VQgcZX2habuCg02HdkxO%2B9enwlJa6BR1%2BMaf1pYXJjV1LebNDWXU38eJ3vzv%2BpWTV%2B1FdwVWPT27qQ2zhSiYlnUhOpUl89Vn9g%2BVYldo7nxghxtSOIqmMqLyGwa3rjquIGDhMq3%2FHw%2Fo7XN94NUbjxA90tl6eUG8VbtSyqd%2Byui2QIQZlcS2DmKHrsb4mMmER4ZuPgFOxrKI3IOpA4ZvG3tbDAcGSSqpub295X6D6Gp9OPGT5N%2B0ayGRyoZ6WFjC1Bh7wgOgc%2FH04a0yDFmeo%2B1wJbBt9CfVQJ%2FfALwRWXjKaRHUg8EP1KhVI54UKxwxASXi1S2hVLmTmoyQwug2pI6r%2Fjoy7KvjEfY37HDndq81Q1WeZPG8an9Al2psRsdp4tdnqdqA2HkROjuzCBQXaUFvP2n4jUJa3uT4jO6%2Bb%2BuFyZxHdygOrg3%2B3c8PZZpfw4kSIKiQi0E%2FvXmoJa%2Fvmv12CWKse7emxTxz%2BGvWi3Bzb%2BIDjDf7uvRBjqkAQVZw7ydSWDOM5YcStsJkHUGzw7kvxcOone0GExeYdTzM2DfH8JP139r0YzWnli40K02Xl%2BseFLXZYFTfbSDaA1Jc%2BMiHTl7i4OQl1TpF5sLCOwUWLsGDRkpTRiCW5CFOUUmciaXYoFJloI9uVVo2cfAB3NIwcaTihWTtAVzvnKTqFHd4HeV1X8Vf6cSAZnRe%2BZOuv6YPcREOOv0GdmT%2F3r9h8RZ&X-Amz-Signature=ba216c858b46cf2b6cc4cad5c627c99b4da0c2e60dc304ec9f1794c137276ced&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBN7A32V%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQDs21JITpnSLOZEEAMSikCAI52alPS5xs0cZ85xYMYahAIhAMNyAnkaxdLtwc1UYF4bsQz3W59ppmXV%2BKCm%2FL2M4mUEKv8DCCYQABoMNjM3NDIzMTgzODA1IgzURSS3d6fLHK%2FaKJkq3APa06Pea5uY6l4f%2BoL1sbs6lrTdrmLSRwU3ru6E0bo8XN953O8asQj%2FU%2BF%2FakqHxpix0gWdbeYKrjuAH3KIFHZVrUtQ03Lo8dnwgVE1ynmdX7C3Xq1je%2FjpDDRjeRwFJwbd%2BYztE2iQ1VQgcZX2habuCg02HdkxO%2B9enwlJa6BR1%2BMaf1pYXJjV1LebNDWXU38eJ3vzv%2BpWTV%2B1FdwVWPT27qQ2zhSiYlnUhOpUl89Vn9g%2BVYldo7nxghxtSOIqmMqLyGwa3rjquIGDhMq3%2FHw%2Fo7XN94NUbjxA90tl6eUG8VbtSyqd%2Byui2QIQZlcS2DmKHrsb4mMmER4ZuPgFOxrKI3IOpA4ZvG3tbDAcGSSqpub295X6D6Gp9OPGT5N%2B0ayGRyoZ6WFjC1Bh7wgOgc%2FH04a0yDFmeo%2B1wJbBt9CfVQJ%2FfALwRWXjKaRHUg8EP1KhVI54UKxwxASXi1S2hVLmTmoyQwug2pI6r%2Fjoy7KvjEfY37HDndq81Q1WeZPG8an9Al2psRsdp4tdnqdqA2HkROjuzCBQXaUFvP2n4jUJa3uT4jO6%2Bb%2BuFyZxHdygOrg3%2B3c8PZZpfw4kSIKiQi0E%2FvXmoJa%2Fvmv12CWKse7emxTxz%2BGvWi3Bzb%2BIDjDf7uvRBjqkAQVZw7ydSWDOM5YcStsJkHUGzw7kvxcOone0GExeYdTzM2DfH8JP139r0YzWnli40K02Xl%2BseFLXZYFTfbSDaA1Jc%2BMiHTl7i4OQl1TpF5sLCOwUWLsGDRkpTRiCW5CFOUUmciaXYoFJloI9uVVo2cfAB3NIwcaTihWTtAVzvnKTqFHd4HeV1X8Vf6cSAZnRe%2BZOuv6YPcREOOv0GdmT%2F3r9h8RZ&X-Amz-Signature=c57b3ce295cfad96e415fd7518a4bc0342d192b18b46ea39af144f14a8cc4bd1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBN7A32V%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQDs21JITpnSLOZEEAMSikCAI52alPS5xs0cZ85xYMYahAIhAMNyAnkaxdLtwc1UYF4bsQz3W59ppmXV%2BKCm%2FL2M4mUEKv8DCCYQABoMNjM3NDIzMTgzODA1IgzURSS3d6fLHK%2FaKJkq3APa06Pea5uY6l4f%2BoL1sbs6lrTdrmLSRwU3ru6E0bo8XN953O8asQj%2FU%2BF%2FakqHxpix0gWdbeYKrjuAH3KIFHZVrUtQ03Lo8dnwgVE1ynmdX7C3Xq1je%2FjpDDRjeRwFJwbd%2BYztE2iQ1VQgcZX2habuCg02HdkxO%2B9enwlJa6BR1%2BMaf1pYXJjV1LebNDWXU38eJ3vzv%2BpWTV%2B1FdwVWPT27qQ2zhSiYlnUhOpUl89Vn9g%2BVYldo7nxghxtSOIqmMqLyGwa3rjquIGDhMq3%2FHw%2Fo7XN94NUbjxA90tl6eUG8VbtSyqd%2Byui2QIQZlcS2DmKHrsb4mMmER4ZuPgFOxrKI3IOpA4ZvG3tbDAcGSSqpub295X6D6Gp9OPGT5N%2B0ayGRyoZ6WFjC1Bh7wgOgc%2FH04a0yDFmeo%2B1wJbBt9CfVQJ%2FfALwRWXjKaRHUg8EP1KhVI54UKxwxASXi1S2hVLmTmoyQwug2pI6r%2Fjoy7KvjEfY37HDndq81Q1WeZPG8an9Al2psRsdp4tdnqdqA2HkROjuzCBQXaUFvP2n4jUJa3uT4jO6%2Bb%2BuFyZxHdygOrg3%2B3c8PZZpfw4kSIKiQi0E%2FvXmoJa%2Fvmv12CWKse7emxTxz%2BGvWi3Bzb%2BIDjDf7uvRBjqkAQVZw7ydSWDOM5YcStsJkHUGzw7kvxcOone0GExeYdTzM2DfH8JP139r0YzWnli40K02Xl%2BseFLXZYFTfbSDaA1Jc%2BMiHTl7i4OQl1TpF5sLCOwUWLsGDRkpTRiCW5CFOUUmciaXYoFJloI9uVVo2cfAB3NIwcaTihWTtAVzvnKTqFHd4HeV1X8Vf6cSAZnRe%2BZOuv6YPcREOOv0GdmT%2F3r9h8RZ&X-Amz-Signature=e06446a99dac59a767fee5736c172f36bfcf656b981ee8c094b76e991a5afa87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBN7A32V%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQDs21JITpnSLOZEEAMSikCAI52alPS5xs0cZ85xYMYahAIhAMNyAnkaxdLtwc1UYF4bsQz3W59ppmXV%2BKCm%2FL2M4mUEKv8DCCYQABoMNjM3NDIzMTgzODA1IgzURSS3d6fLHK%2FaKJkq3APa06Pea5uY6l4f%2BoL1sbs6lrTdrmLSRwU3ru6E0bo8XN953O8asQj%2FU%2BF%2FakqHxpix0gWdbeYKrjuAH3KIFHZVrUtQ03Lo8dnwgVE1ynmdX7C3Xq1je%2FjpDDRjeRwFJwbd%2BYztE2iQ1VQgcZX2habuCg02HdkxO%2B9enwlJa6BR1%2BMaf1pYXJjV1LebNDWXU38eJ3vzv%2BpWTV%2B1FdwVWPT27qQ2zhSiYlnUhOpUl89Vn9g%2BVYldo7nxghxtSOIqmMqLyGwa3rjquIGDhMq3%2FHw%2Fo7XN94NUbjxA90tl6eUG8VbtSyqd%2Byui2QIQZlcS2DmKHrsb4mMmER4ZuPgFOxrKI3IOpA4ZvG3tbDAcGSSqpub295X6D6Gp9OPGT5N%2B0ayGRyoZ6WFjC1Bh7wgOgc%2FH04a0yDFmeo%2B1wJbBt9CfVQJ%2FfALwRWXjKaRHUg8EP1KhVI54UKxwxASXi1S2hVLmTmoyQwug2pI6r%2Fjoy7KvjEfY37HDndq81Q1WeZPG8an9Al2psRsdp4tdnqdqA2HkROjuzCBQXaUFvP2n4jUJa3uT4jO6%2Bb%2BuFyZxHdygOrg3%2B3c8PZZpfw4kSIKiQi0E%2FvXmoJa%2Fvmv12CWKse7emxTxz%2BGvWi3Bzb%2BIDjDf7uvRBjqkAQVZw7ydSWDOM5YcStsJkHUGzw7kvxcOone0GExeYdTzM2DfH8JP139r0YzWnli40K02Xl%2BseFLXZYFTfbSDaA1Jc%2BMiHTl7i4OQl1TpF5sLCOwUWLsGDRkpTRiCW5CFOUUmciaXYoFJloI9uVVo2cfAB3NIwcaTihWTtAVzvnKTqFHd4HeV1X8Vf6cSAZnRe%2BZOuv6YPcREOOv0GdmT%2F3r9h8RZ&X-Amz-Signature=bd74278f868100a3b48f7ac69f1ee095b5eb659d790164e5d104e79fd656945b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RBN7A32V%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221730Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJIMEYCIQDs21JITpnSLOZEEAMSikCAI52alPS5xs0cZ85xYMYahAIhAMNyAnkaxdLtwc1UYF4bsQz3W59ppmXV%2BKCm%2FL2M4mUEKv8DCCYQABoMNjM3NDIzMTgzODA1IgzURSS3d6fLHK%2FaKJkq3APa06Pea5uY6l4f%2BoL1sbs6lrTdrmLSRwU3ru6E0bo8XN953O8asQj%2FU%2BF%2FakqHxpix0gWdbeYKrjuAH3KIFHZVrUtQ03Lo8dnwgVE1ynmdX7C3Xq1je%2FjpDDRjeRwFJwbd%2BYztE2iQ1VQgcZX2habuCg02HdkxO%2B9enwlJa6BR1%2BMaf1pYXJjV1LebNDWXU38eJ3vzv%2BpWTV%2B1FdwVWPT27qQ2zhSiYlnUhOpUl89Vn9g%2BVYldo7nxghxtSOIqmMqLyGwa3rjquIGDhMq3%2FHw%2Fo7XN94NUbjxA90tl6eUG8VbtSyqd%2Byui2QIQZlcS2DmKHrsb4mMmER4ZuPgFOxrKI3IOpA4ZvG3tbDAcGSSqpub295X6D6Gp9OPGT5N%2B0ayGRyoZ6WFjC1Bh7wgOgc%2FH04a0yDFmeo%2B1wJbBt9CfVQJ%2FfALwRWXjKaRHUg8EP1KhVI54UKxwxASXi1S2hVLmTmoyQwug2pI6r%2Fjoy7KvjEfY37HDndq81Q1WeZPG8an9Al2psRsdp4tdnqdqA2HkROjuzCBQXaUFvP2n4jUJa3uT4jO6%2Bb%2BuFyZxHdygOrg3%2B3c8PZZpfw4kSIKiQi0E%2FvXmoJa%2Fvmv12CWKse7emxTxz%2BGvWi3Bzb%2BIDjDf7uvRBjqkAQVZw7ydSWDOM5YcStsJkHUGzw7kvxcOone0GExeYdTzM2DfH8JP139r0YzWnli40K02Xl%2BseFLXZYFTfbSDaA1Jc%2BMiHTl7i4OQl1TpF5sLCOwUWLsGDRkpTRiCW5CFOUUmciaXYoFJloI9uVVo2cfAB3NIwcaTihWTtAVzvnKTqFHd4HeV1X8Vf6cSAZnRe%2BZOuv6YPcREOOv0GdmT%2F3r9h8RZ&X-Amz-Signature=ac701343615ebb6ba4640c04f393ee38b13ab878d302ea4a64c058891ad27695&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
