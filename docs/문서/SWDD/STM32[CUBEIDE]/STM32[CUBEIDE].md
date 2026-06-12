# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW2U2HKT%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T223031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCID9%2BWTrPRN7aN08gRRyOOF%2BQkTPNOyTCgflNmAZC5%2FjFAiBQOMP45DpK6P2S4CBKMMmSRydeWzz7oulaFYt%2Fs7JdKir%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIMws8%2BI1ug0snEkyr7KtwDuWS3lj%2FwC9rOAAxFtETJmgTyabToQBEtSqxjXe7o8H0EMnGVtFwyEhxVaWkRhHDGtF8njYCvO%2B5QKGYTT0%2BRarX1pUKnesgHqs3oXwTHOzMoSwfsGaUEcLsHIvcpxnKIpzv992Kpvp5ClK8r6AoqV0dQqzoZ6AHibymIeeCrR0iyJRN%2FxHKBGocOBKqagXqLOVIHfP8Um3z6at02LeI6H9qRCsprWZD%2Bo%2F7LrLCI4XNQ7jdT1fIkBK9DAA5AX9bj%2Bd4NI9qfxer3NOmig41xZHyOVzqXGc5MkAnuelXlE7MtwFFa3l7I4ZG6Bzq4yJyvmO%2F132pW8CLdTDgznYilyaCecvlf0MhVthHZR5jAiCYOpUelPJuRGYU%2BgOQXWTj7oNIpEEXdLAs00s0%2Bi8Su3fCdXrqI42CGavmT20ukdyKMt01R6lkjE6xay5oAzIP%2FsNdQV8v8j8fW%2BPPsmBwfgXPJPa%2FIgtFwRPwqeTiwJ5KNhWS0wKpJp4Pp2dsPCWJQkphOcA%2Bt%2FqHlddifUAlTS6HeRNmZY5dYSEfqRtHPzj9Jz9Moxa1sZMArXWCdqhU9rs%2Fb5WhIewo2%2FnpAKieHUzSErFlVi1oG%2BHcCJ4VAyaGOLMBR%2FgGtK2LWIN4wwvix0QY6pgFjDINgxLshzIIiXlFbnU8I7s3WPgJkKxxwh3B%2B3UXf6%2FDLJAnMW0%2BLgI4y8nzq8ugnm%2BN49UrMUq0Pq5oeN%2Ftfi5pLWgiHiyRE8Uk%2FyzNTfYt7CEvZTSPQqREoZ4saqLBIVh0npyeeHWVbhtOp4kf05D%2B%2BalFGtmD6ULBf2%2Ff8Ec2B9b8CaYVQbWAkHX3Uq96Xq98L%2BUg5AgAegDHKOVnrmQGMlL1r&X-Amz-Signature=2e2414df4816f84e0e4fb7e7115c2ea41b1e59f10a523e8227f04654c6125a89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW2U2HKT%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T223031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCID9%2BWTrPRN7aN08gRRyOOF%2BQkTPNOyTCgflNmAZC5%2FjFAiBQOMP45DpK6P2S4CBKMMmSRydeWzz7oulaFYt%2Fs7JdKir%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIMws8%2BI1ug0snEkyr7KtwDuWS3lj%2FwC9rOAAxFtETJmgTyabToQBEtSqxjXe7o8H0EMnGVtFwyEhxVaWkRhHDGtF8njYCvO%2B5QKGYTT0%2BRarX1pUKnesgHqs3oXwTHOzMoSwfsGaUEcLsHIvcpxnKIpzv992Kpvp5ClK8r6AoqV0dQqzoZ6AHibymIeeCrR0iyJRN%2FxHKBGocOBKqagXqLOVIHfP8Um3z6at02LeI6H9qRCsprWZD%2Bo%2F7LrLCI4XNQ7jdT1fIkBK9DAA5AX9bj%2Bd4NI9qfxer3NOmig41xZHyOVzqXGc5MkAnuelXlE7MtwFFa3l7I4ZG6Bzq4yJyvmO%2F132pW8CLdTDgznYilyaCecvlf0MhVthHZR5jAiCYOpUelPJuRGYU%2BgOQXWTj7oNIpEEXdLAs00s0%2Bi8Su3fCdXrqI42CGavmT20ukdyKMt01R6lkjE6xay5oAzIP%2FsNdQV8v8j8fW%2BPPsmBwfgXPJPa%2FIgtFwRPwqeTiwJ5KNhWS0wKpJp4Pp2dsPCWJQkphOcA%2Bt%2FqHlddifUAlTS6HeRNmZY5dYSEfqRtHPzj9Jz9Moxa1sZMArXWCdqhU9rs%2Fb5WhIewo2%2FnpAKieHUzSErFlVi1oG%2BHcCJ4VAyaGOLMBR%2FgGtK2LWIN4wwvix0QY6pgFjDINgxLshzIIiXlFbnU8I7s3WPgJkKxxwh3B%2B3UXf6%2FDLJAnMW0%2BLgI4y8nzq8ugnm%2BN49UrMUq0Pq5oeN%2Ftfi5pLWgiHiyRE8Uk%2FyzNTfYt7CEvZTSPQqREoZ4saqLBIVh0npyeeHWVbhtOp4kf05D%2B%2BalFGtmD6ULBf2%2Ff8Ec2B9b8CaYVQbWAkHX3Uq96Xq98L%2BUg5AgAegDHKOVnrmQGMlL1r&X-Amz-Signature=b880bc2ae292e986f737aea0001f730dd3c0720ec81909aac8c8a4af476fb89e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW2U2HKT%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T223031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCID9%2BWTrPRN7aN08gRRyOOF%2BQkTPNOyTCgflNmAZC5%2FjFAiBQOMP45DpK6P2S4CBKMMmSRydeWzz7oulaFYt%2Fs7JdKir%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIMws8%2BI1ug0snEkyr7KtwDuWS3lj%2FwC9rOAAxFtETJmgTyabToQBEtSqxjXe7o8H0EMnGVtFwyEhxVaWkRhHDGtF8njYCvO%2B5QKGYTT0%2BRarX1pUKnesgHqs3oXwTHOzMoSwfsGaUEcLsHIvcpxnKIpzv992Kpvp5ClK8r6AoqV0dQqzoZ6AHibymIeeCrR0iyJRN%2FxHKBGocOBKqagXqLOVIHfP8Um3z6at02LeI6H9qRCsprWZD%2Bo%2F7LrLCI4XNQ7jdT1fIkBK9DAA5AX9bj%2Bd4NI9qfxer3NOmig41xZHyOVzqXGc5MkAnuelXlE7MtwFFa3l7I4ZG6Bzq4yJyvmO%2F132pW8CLdTDgznYilyaCecvlf0MhVthHZR5jAiCYOpUelPJuRGYU%2BgOQXWTj7oNIpEEXdLAs00s0%2Bi8Su3fCdXrqI42CGavmT20ukdyKMt01R6lkjE6xay5oAzIP%2FsNdQV8v8j8fW%2BPPsmBwfgXPJPa%2FIgtFwRPwqeTiwJ5KNhWS0wKpJp4Pp2dsPCWJQkphOcA%2Bt%2FqHlddifUAlTS6HeRNmZY5dYSEfqRtHPzj9Jz9Moxa1sZMArXWCdqhU9rs%2Fb5WhIewo2%2FnpAKieHUzSErFlVi1oG%2BHcCJ4VAyaGOLMBR%2FgGtK2LWIN4wwvix0QY6pgFjDINgxLshzIIiXlFbnU8I7s3WPgJkKxxwh3B%2B3UXf6%2FDLJAnMW0%2BLgI4y8nzq8ugnm%2BN49UrMUq0Pq5oeN%2Ftfi5pLWgiHiyRE8Uk%2FyzNTfYt7CEvZTSPQqREoZ4saqLBIVh0npyeeHWVbhtOp4kf05D%2B%2BalFGtmD6ULBf2%2Ff8Ec2B9b8CaYVQbWAkHX3Uq96Xq98L%2BUg5AgAegDHKOVnrmQGMlL1r&X-Amz-Signature=d81a0863120f21930d5cdef6ac1a4c099ee07cd5e162acf0a280bef4a1608bfe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW2U2HKT%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T223031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCID9%2BWTrPRN7aN08gRRyOOF%2BQkTPNOyTCgflNmAZC5%2FjFAiBQOMP45DpK6P2S4CBKMMmSRydeWzz7oulaFYt%2Fs7JdKir%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIMws8%2BI1ug0snEkyr7KtwDuWS3lj%2FwC9rOAAxFtETJmgTyabToQBEtSqxjXe7o8H0EMnGVtFwyEhxVaWkRhHDGtF8njYCvO%2B5QKGYTT0%2BRarX1pUKnesgHqs3oXwTHOzMoSwfsGaUEcLsHIvcpxnKIpzv992Kpvp5ClK8r6AoqV0dQqzoZ6AHibymIeeCrR0iyJRN%2FxHKBGocOBKqagXqLOVIHfP8Um3z6at02LeI6H9qRCsprWZD%2Bo%2F7LrLCI4XNQ7jdT1fIkBK9DAA5AX9bj%2Bd4NI9qfxer3NOmig41xZHyOVzqXGc5MkAnuelXlE7MtwFFa3l7I4ZG6Bzq4yJyvmO%2F132pW8CLdTDgznYilyaCecvlf0MhVthHZR5jAiCYOpUelPJuRGYU%2BgOQXWTj7oNIpEEXdLAs00s0%2Bi8Su3fCdXrqI42CGavmT20ukdyKMt01R6lkjE6xay5oAzIP%2FsNdQV8v8j8fW%2BPPsmBwfgXPJPa%2FIgtFwRPwqeTiwJ5KNhWS0wKpJp4Pp2dsPCWJQkphOcA%2Bt%2FqHlddifUAlTS6HeRNmZY5dYSEfqRtHPzj9Jz9Moxa1sZMArXWCdqhU9rs%2Fb5WhIewo2%2FnpAKieHUzSErFlVi1oG%2BHcCJ4VAyaGOLMBR%2FgGtK2LWIN4wwvix0QY6pgFjDINgxLshzIIiXlFbnU8I7s3WPgJkKxxwh3B%2B3UXf6%2FDLJAnMW0%2BLgI4y8nzq8ugnm%2BN49UrMUq0Pq5oeN%2Ftfi5pLWgiHiyRE8Uk%2FyzNTfYt7CEvZTSPQqREoZ4saqLBIVh0npyeeHWVbhtOp4kf05D%2B%2BalFGtmD6ULBf2%2Ff8Ec2B9b8CaYVQbWAkHX3Uq96Xq98L%2BUg5AgAegDHKOVnrmQGMlL1r&X-Amz-Signature=553d4e0c0ba2abd8ea433160ba7ada0c12f6ae53379f00bf68f6214e3de91f05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RW2U2HKT%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T223031Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJGMEQCID9%2BWTrPRN7aN08gRRyOOF%2BQkTPNOyTCgflNmAZC5%2FjFAiBQOMP45DpK6P2S4CBKMMmSRydeWzz7oulaFYt%2Fs7JdKir%2FAwgfEAAaDDYzNzQyMzE4MzgwNSIMws8%2BI1ug0snEkyr7KtwDuWS3lj%2FwC9rOAAxFtETJmgTyabToQBEtSqxjXe7o8H0EMnGVtFwyEhxVaWkRhHDGtF8njYCvO%2B5QKGYTT0%2BRarX1pUKnesgHqs3oXwTHOzMoSwfsGaUEcLsHIvcpxnKIpzv992Kpvp5ClK8r6AoqV0dQqzoZ6AHibymIeeCrR0iyJRN%2FxHKBGocOBKqagXqLOVIHfP8Um3z6at02LeI6H9qRCsprWZD%2Bo%2F7LrLCI4XNQ7jdT1fIkBK9DAA5AX9bj%2Bd4NI9qfxer3NOmig41xZHyOVzqXGc5MkAnuelXlE7MtwFFa3l7I4ZG6Bzq4yJyvmO%2F132pW8CLdTDgznYilyaCecvlf0MhVthHZR5jAiCYOpUelPJuRGYU%2BgOQXWTj7oNIpEEXdLAs00s0%2Bi8Su3fCdXrqI42CGavmT20ukdyKMt01R6lkjE6xay5oAzIP%2FsNdQV8v8j8fW%2BPPsmBwfgXPJPa%2FIgtFwRPwqeTiwJ5KNhWS0wKpJp4Pp2dsPCWJQkphOcA%2Bt%2FqHlddifUAlTS6HeRNmZY5dYSEfqRtHPzj9Jz9Moxa1sZMArXWCdqhU9rs%2Fb5WhIewo2%2FnpAKieHUzSErFlVi1oG%2BHcCJ4VAyaGOLMBR%2FgGtK2LWIN4wwvix0QY6pgFjDINgxLshzIIiXlFbnU8I7s3WPgJkKxxwh3B%2B3UXf6%2FDLJAnMW0%2BLgI4y8nzq8ugnm%2BN49UrMUq0Pq5oeN%2Ftfi5pLWgiHiyRE8Uk%2FyzNTfYt7CEvZTSPQqREoZ4saqLBIVh0npyeeHWVbhtOp4kf05D%2B%2BalFGtmD6ULBf2%2Ff8Ec2B9b8CaYVQbWAkHX3Uq96Xq98L%2BUg5AgAegDHKOVnrmQGMlL1r&X-Amz-Signature=f34625a7a6bcbb5fcdcd6a7c460f9d5e0ef4a1694421268af4c8d1644a40fb46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
