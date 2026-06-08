# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JQXSPRI%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T223314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGml1riFu2RKz%2BKt4Dr%2FYTQaUsZXgI%2FftwrDstf86G6oAiAtcHd4l%2B9Gqw7lXcN12UX8IOvquuP7BAEmMPfB%2B0iAHiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVVxmg3xiysqr0NKsKtwDgY%2Fzpt%2FaOvkI%2FaHfzNoehyArlSJVqQEI7w6vFBr0uaJyGdKTPIIyidq%2BMC1lB2UbLYSdT%2F%2BjjviLmbWwuN9VxxynP5VIcEn3tI0sRNLvwKbK1dKqUxJICtlALR6IVeT2GcZDvwwA79LCFhkbR5jd1jv4XksPGT7y9vr2qWG%2FmouGcBSd6z8yyHt3ewZYdJpm4Haw70PIe4wx0Jy%2BX76T1QA%2FnuU4XoAkWWvnsA2LBu04rVXmGpRWN%2F64WdQCBmS8wfE07aYtU6p4A0NGM6kArlaybVnpen3PWjoMRQclZ8Arqhxi%2BcgYggly9Pj1vx3dRwFx0vIP78oGfQid5H5Ru6SDbpOtQ2M8%2FMjjf7%2Fn3AidGeUMGiE0l5VA0f67ztlHW%2BdLJrjGmUp0iUTae27nU5%2Bl1aS0VDEZv2nOcPYPc1pdZwLei0jwLtDfeBKTBXj6iXOCUZja0XNwfO2k%2B83Tg3gpl7ikQIO3JJsYSDv2gbDRuR89ev72DGkADreuNu9Zrst%2FTLNNS%2FtLiy6vNDw7%2FJZyNd0uQxfTjf0Z0TgTkKxhI9HpkBGP3mBRbzNYZ8wGisAGT52DbPDTl685Q%2F5vY6mB0wEscOG69wi3mCoa%2BZ4pEzsE4qsEhTjG%2BtYw6YKc0QY6pgHhLpogTZM8TGY45EaMDIBa96MFbg3rJmRaH%2BNll%2BITsidJ%2FAW%2BNKvHEsas6J3sn9YNdWozWbCZhsiGiEsY3lsXBBKvYlw45NC9z0FBb3h2%2BLBg1UfmOxIdtQfYF8mZdoI%2B01TbN715%2FcnVpKD62KRTM%2BUxThctpMLB3TzGkPRrmkIWL6b4sIz%2BNtnUh2flFwwhQpX8Dak2mCep1sASnPH0XT6FMo4V&X-Amz-Signature=0b0f42733a395f54e24cc58aa705b9ed066a1d6fd39fd6bd0af5664f2e0abbf9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JQXSPRI%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T223314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGml1riFu2RKz%2BKt4Dr%2FYTQaUsZXgI%2FftwrDstf86G6oAiAtcHd4l%2B9Gqw7lXcN12UX8IOvquuP7BAEmMPfB%2B0iAHiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVVxmg3xiysqr0NKsKtwDgY%2Fzpt%2FaOvkI%2FaHfzNoehyArlSJVqQEI7w6vFBr0uaJyGdKTPIIyidq%2BMC1lB2UbLYSdT%2F%2BjjviLmbWwuN9VxxynP5VIcEn3tI0sRNLvwKbK1dKqUxJICtlALR6IVeT2GcZDvwwA79LCFhkbR5jd1jv4XksPGT7y9vr2qWG%2FmouGcBSd6z8yyHt3ewZYdJpm4Haw70PIe4wx0Jy%2BX76T1QA%2FnuU4XoAkWWvnsA2LBu04rVXmGpRWN%2F64WdQCBmS8wfE07aYtU6p4A0NGM6kArlaybVnpen3PWjoMRQclZ8Arqhxi%2BcgYggly9Pj1vx3dRwFx0vIP78oGfQid5H5Ru6SDbpOtQ2M8%2FMjjf7%2Fn3AidGeUMGiE0l5VA0f67ztlHW%2BdLJrjGmUp0iUTae27nU5%2Bl1aS0VDEZv2nOcPYPc1pdZwLei0jwLtDfeBKTBXj6iXOCUZja0XNwfO2k%2B83Tg3gpl7ikQIO3JJsYSDv2gbDRuR89ev72DGkADreuNu9Zrst%2FTLNNS%2FtLiy6vNDw7%2FJZyNd0uQxfTjf0Z0TgTkKxhI9HpkBGP3mBRbzNYZ8wGisAGT52DbPDTl685Q%2F5vY6mB0wEscOG69wi3mCoa%2BZ4pEzsE4qsEhTjG%2BtYw6YKc0QY6pgHhLpogTZM8TGY45EaMDIBa96MFbg3rJmRaH%2BNll%2BITsidJ%2FAW%2BNKvHEsas6J3sn9YNdWozWbCZhsiGiEsY3lsXBBKvYlw45NC9z0FBb3h2%2BLBg1UfmOxIdtQfYF8mZdoI%2B01TbN715%2FcnVpKD62KRTM%2BUxThctpMLB3TzGkPRrmkIWL6b4sIz%2BNtnUh2flFwwhQpX8Dak2mCep1sASnPH0XT6FMo4V&X-Amz-Signature=ce0ef2b70332f89d7ddc6ff14a868271c878532dc561f0524207502a5de46e38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JQXSPRI%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T223314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGml1riFu2RKz%2BKt4Dr%2FYTQaUsZXgI%2FftwrDstf86G6oAiAtcHd4l%2B9Gqw7lXcN12UX8IOvquuP7BAEmMPfB%2B0iAHiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVVxmg3xiysqr0NKsKtwDgY%2Fzpt%2FaOvkI%2FaHfzNoehyArlSJVqQEI7w6vFBr0uaJyGdKTPIIyidq%2BMC1lB2UbLYSdT%2F%2BjjviLmbWwuN9VxxynP5VIcEn3tI0sRNLvwKbK1dKqUxJICtlALR6IVeT2GcZDvwwA79LCFhkbR5jd1jv4XksPGT7y9vr2qWG%2FmouGcBSd6z8yyHt3ewZYdJpm4Haw70PIe4wx0Jy%2BX76T1QA%2FnuU4XoAkWWvnsA2LBu04rVXmGpRWN%2F64WdQCBmS8wfE07aYtU6p4A0NGM6kArlaybVnpen3PWjoMRQclZ8Arqhxi%2BcgYggly9Pj1vx3dRwFx0vIP78oGfQid5H5Ru6SDbpOtQ2M8%2FMjjf7%2Fn3AidGeUMGiE0l5VA0f67ztlHW%2BdLJrjGmUp0iUTae27nU5%2Bl1aS0VDEZv2nOcPYPc1pdZwLei0jwLtDfeBKTBXj6iXOCUZja0XNwfO2k%2B83Tg3gpl7ikQIO3JJsYSDv2gbDRuR89ev72DGkADreuNu9Zrst%2FTLNNS%2FtLiy6vNDw7%2FJZyNd0uQxfTjf0Z0TgTkKxhI9HpkBGP3mBRbzNYZ8wGisAGT52DbPDTl685Q%2F5vY6mB0wEscOG69wi3mCoa%2BZ4pEzsE4qsEhTjG%2BtYw6YKc0QY6pgHhLpogTZM8TGY45EaMDIBa96MFbg3rJmRaH%2BNll%2BITsidJ%2FAW%2BNKvHEsas6J3sn9YNdWozWbCZhsiGiEsY3lsXBBKvYlw45NC9z0FBb3h2%2BLBg1UfmOxIdtQfYF8mZdoI%2B01TbN715%2FcnVpKD62KRTM%2BUxThctpMLB3TzGkPRrmkIWL6b4sIz%2BNtnUh2flFwwhQpX8Dak2mCep1sASnPH0XT6FMo4V&X-Amz-Signature=30fe0f79c79038d61a44babe9e7681d8ca3b413c517cdf3c1c922b0875c6763e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JQXSPRI%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T223314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGml1riFu2RKz%2BKt4Dr%2FYTQaUsZXgI%2FftwrDstf86G6oAiAtcHd4l%2B9Gqw7lXcN12UX8IOvquuP7BAEmMPfB%2B0iAHiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVVxmg3xiysqr0NKsKtwDgY%2Fzpt%2FaOvkI%2FaHfzNoehyArlSJVqQEI7w6vFBr0uaJyGdKTPIIyidq%2BMC1lB2UbLYSdT%2F%2BjjviLmbWwuN9VxxynP5VIcEn3tI0sRNLvwKbK1dKqUxJICtlALR6IVeT2GcZDvwwA79LCFhkbR5jd1jv4XksPGT7y9vr2qWG%2FmouGcBSd6z8yyHt3ewZYdJpm4Haw70PIe4wx0Jy%2BX76T1QA%2FnuU4XoAkWWvnsA2LBu04rVXmGpRWN%2F64WdQCBmS8wfE07aYtU6p4A0NGM6kArlaybVnpen3PWjoMRQclZ8Arqhxi%2BcgYggly9Pj1vx3dRwFx0vIP78oGfQid5H5Ru6SDbpOtQ2M8%2FMjjf7%2Fn3AidGeUMGiE0l5VA0f67ztlHW%2BdLJrjGmUp0iUTae27nU5%2Bl1aS0VDEZv2nOcPYPc1pdZwLei0jwLtDfeBKTBXj6iXOCUZja0XNwfO2k%2B83Tg3gpl7ikQIO3JJsYSDv2gbDRuR89ev72DGkADreuNu9Zrst%2FTLNNS%2FtLiy6vNDw7%2FJZyNd0uQxfTjf0Z0TgTkKxhI9HpkBGP3mBRbzNYZ8wGisAGT52DbPDTl685Q%2F5vY6mB0wEscOG69wi3mCoa%2BZ4pEzsE4qsEhTjG%2BtYw6YKc0QY6pgHhLpogTZM8TGY45EaMDIBa96MFbg3rJmRaH%2BNll%2BITsidJ%2FAW%2BNKvHEsas6J3sn9YNdWozWbCZhsiGiEsY3lsXBBKvYlw45NC9z0FBb3h2%2BLBg1UfmOxIdtQfYF8mZdoI%2B01TbN715%2FcnVpKD62KRTM%2BUxThctpMLB3TzGkPRrmkIWL6b4sIz%2BNtnUh2flFwwhQpX8Dak2mCep1sASnPH0XT6FMo4V&X-Amz-Signature=ef9cf16acd10afe9fa04ce3f45d03476612a7630e7f913f8d7051fe6c60318d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667JQXSPRI%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T223314Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPL%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGml1riFu2RKz%2BKt4Dr%2FYTQaUsZXgI%2FftwrDstf86G6oAiAtcHd4l%2B9Gqw7lXcN12UX8IOvquuP7BAEmMPfB%2B0iAHiqIBAi7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMVVxmg3xiysqr0NKsKtwDgY%2Fzpt%2FaOvkI%2FaHfzNoehyArlSJVqQEI7w6vFBr0uaJyGdKTPIIyidq%2BMC1lB2UbLYSdT%2F%2BjjviLmbWwuN9VxxynP5VIcEn3tI0sRNLvwKbK1dKqUxJICtlALR6IVeT2GcZDvwwA79LCFhkbR5jd1jv4XksPGT7y9vr2qWG%2FmouGcBSd6z8yyHt3ewZYdJpm4Haw70PIe4wx0Jy%2BX76T1QA%2FnuU4XoAkWWvnsA2LBu04rVXmGpRWN%2F64WdQCBmS8wfE07aYtU6p4A0NGM6kArlaybVnpen3PWjoMRQclZ8Arqhxi%2BcgYggly9Pj1vx3dRwFx0vIP78oGfQid5H5Ru6SDbpOtQ2M8%2FMjjf7%2Fn3AidGeUMGiE0l5VA0f67ztlHW%2BdLJrjGmUp0iUTae27nU5%2Bl1aS0VDEZv2nOcPYPc1pdZwLei0jwLtDfeBKTBXj6iXOCUZja0XNwfO2k%2B83Tg3gpl7ikQIO3JJsYSDv2gbDRuR89ev72DGkADreuNu9Zrst%2FTLNNS%2FtLiy6vNDw7%2FJZyNd0uQxfTjf0Z0TgTkKxhI9HpkBGP3mBRbzNYZ8wGisAGT52DbPDTl685Q%2F5vY6mB0wEscOG69wi3mCoa%2BZ4pEzsE4qsEhTjG%2BtYw6YKc0QY6pgHhLpogTZM8TGY45EaMDIBa96MFbg3rJmRaH%2BNll%2BITsidJ%2FAW%2BNKvHEsas6J3sn9YNdWozWbCZhsiGiEsY3lsXBBKvYlw45NC9z0FBb3h2%2BLBg1UfmOxIdtQfYF8mZdoI%2B01TbN715%2FcnVpKD62KRTM%2BUxThctpMLB3TzGkPRrmkIWL6b4sIz%2BNtnUh2flFwwhQpX8Dak2mCep1sASnPH0XT6FMo4V&X-Amz-Signature=a16cf98597eb8d77a0652ffee2c5452339813c503fdd6cb5bae63bb5c8748711&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
