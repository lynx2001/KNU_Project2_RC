# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJZVX2UY%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T220216Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCUfcKbI5V45ZFe6HEyht0pbj5t82NJops5luDtci%2FT4wIhAPZhivSUexafzHtoDA87bBteBnZ%2FMZrvChCq9zVmIeHBKv8DCC4QABoMNjM3NDIzMTgzODA1IgwGl0%2B2UxYw0nYqpzIq3AO0tAdgVCqd3vyROOgvTzDfZbAESZh2P%2B9VF4gI9N4hvxI%2BLe1tvqyLVtJM9kIvipNlPtyY7nD%2Fhm7%2BiqS4gQw6yaabIQ9uFJZyPTntC9eaAWxoGL46DyaQjJAxq%2Fz0fhvdHrDG3Mjc6tUrznRYDRFoxvhckUR6IBv0NWf8r3VIJ6ulmwhehKn3yKw3IdxqIODxIwLQdYckKaYZb8Q2sAdyd3ihwxTEp04EsT7%2BfKolz0%2F9UAbpk%2BYJ1X5xAcSJ6yF%2BJZv02S%2BYCs7IxJsTvkk5%2BoWgNn1Kd3KSGntKjuUzMdcQjmpFUxZa5QUe09CCFW07sK0Tun727ph%2BO2V1X4ZTffAU3sH4mnkD2b15y1OElRwyh%2BibvqEcxyeADQtj6%2B%2FiHdlIYsaTT09pwZX8EpFelVlLItZak%2BO2KDC2n29tB9ZYVyWKhHmuPdZaMnYl5T%2FpM6Vmji%2Bh5jUtwS59BAyMl6gPMGcFEWiKmXgFzFemmQ3gM201BgsoY%2BvPGvwT3iZiF6IOGZeHBRNtt6W1kpzpdpuo4mxX4SxiQGC81Y9cZcP%2BKq3BXer1jyLCipLkmtdERZh4Sg979hzQzLrVSw%2BTs1AfozOQ4xdYbtvbe0ptHIHbQMa1qfQbk9OmLTD48qXSBjqkAYGD%2BzHd3sRk45NhqcoNLZ7Ah5zMEAef8o12OJ5U4c%2BkSz7HaaYnnHwvGNGrKbD5RCvGdESr2BmfJriMVh0IyynIMCwPHd4KNmXId5e4sS14ZFTahwaGWu3RI0AG%2FKMAKfmaGcmL3Gi6qglD6tShWkTq%2BC3rNBCBpBtIpth%2BEFTTyhrmX9BG94xWfDoH8fdvjLUS9MIPK21Y2ffieHHMa8LDrrcU&X-Amz-Signature=339223a2b209e4ab02ce3755b7c572d0c16b0c7f94c21a41ab8631c5cefb4341&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJZVX2UY%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T220216Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCUfcKbI5V45ZFe6HEyht0pbj5t82NJops5luDtci%2FT4wIhAPZhivSUexafzHtoDA87bBteBnZ%2FMZrvChCq9zVmIeHBKv8DCC4QABoMNjM3NDIzMTgzODA1IgwGl0%2B2UxYw0nYqpzIq3AO0tAdgVCqd3vyROOgvTzDfZbAESZh2P%2B9VF4gI9N4hvxI%2BLe1tvqyLVtJM9kIvipNlPtyY7nD%2Fhm7%2BiqS4gQw6yaabIQ9uFJZyPTntC9eaAWxoGL46DyaQjJAxq%2Fz0fhvdHrDG3Mjc6tUrznRYDRFoxvhckUR6IBv0NWf8r3VIJ6ulmwhehKn3yKw3IdxqIODxIwLQdYckKaYZb8Q2sAdyd3ihwxTEp04EsT7%2BfKolz0%2F9UAbpk%2BYJ1X5xAcSJ6yF%2BJZv02S%2BYCs7IxJsTvkk5%2BoWgNn1Kd3KSGntKjuUzMdcQjmpFUxZa5QUe09CCFW07sK0Tun727ph%2BO2V1X4ZTffAU3sH4mnkD2b15y1OElRwyh%2BibvqEcxyeADQtj6%2B%2FiHdlIYsaTT09pwZX8EpFelVlLItZak%2BO2KDC2n29tB9ZYVyWKhHmuPdZaMnYl5T%2FpM6Vmji%2Bh5jUtwS59BAyMl6gPMGcFEWiKmXgFzFemmQ3gM201BgsoY%2BvPGvwT3iZiF6IOGZeHBRNtt6W1kpzpdpuo4mxX4SxiQGC81Y9cZcP%2BKq3BXer1jyLCipLkmtdERZh4Sg979hzQzLrVSw%2BTs1AfozOQ4xdYbtvbe0ptHIHbQMa1qfQbk9OmLTD48qXSBjqkAYGD%2BzHd3sRk45NhqcoNLZ7Ah5zMEAef8o12OJ5U4c%2BkSz7HaaYnnHwvGNGrKbD5RCvGdESr2BmfJriMVh0IyynIMCwPHd4KNmXId5e4sS14ZFTahwaGWu3RI0AG%2FKMAKfmaGcmL3Gi6qglD6tShWkTq%2BC3rNBCBpBtIpth%2BEFTTyhrmX9BG94xWfDoH8fdvjLUS9MIPK21Y2ffieHHMa8LDrrcU&X-Amz-Signature=a8a42afa93cba2384b287e5073f71c2a0978de9e740c8465daa5322ea13fcd2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJZVX2UY%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T220216Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCUfcKbI5V45ZFe6HEyht0pbj5t82NJops5luDtci%2FT4wIhAPZhivSUexafzHtoDA87bBteBnZ%2FMZrvChCq9zVmIeHBKv8DCC4QABoMNjM3NDIzMTgzODA1IgwGl0%2B2UxYw0nYqpzIq3AO0tAdgVCqd3vyROOgvTzDfZbAESZh2P%2B9VF4gI9N4hvxI%2BLe1tvqyLVtJM9kIvipNlPtyY7nD%2Fhm7%2BiqS4gQw6yaabIQ9uFJZyPTntC9eaAWxoGL46DyaQjJAxq%2Fz0fhvdHrDG3Mjc6tUrznRYDRFoxvhckUR6IBv0NWf8r3VIJ6ulmwhehKn3yKw3IdxqIODxIwLQdYckKaYZb8Q2sAdyd3ihwxTEp04EsT7%2BfKolz0%2F9UAbpk%2BYJ1X5xAcSJ6yF%2BJZv02S%2BYCs7IxJsTvkk5%2BoWgNn1Kd3KSGntKjuUzMdcQjmpFUxZa5QUe09CCFW07sK0Tun727ph%2BO2V1X4ZTffAU3sH4mnkD2b15y1OElRwyh%2BibvqEcxyeADQtj6%2B%2FiHdlIYsaTT09pwZX8EpFelVlLItZak%2BO2KDC2n29tB9ZYVyWKhHmuPdZaMnYl5T%2FpM6Vmji%2Bh5jUtwS59BAyMl6gPMGcFEWiKmXgFzFemmQ3gM201BgsoY%2BvPGvwT3iZiF6IOGZeHBRNtt6W1kpzpdpuo4mxX4SxiQGC81Y9cZcP%2BKq3BXer1jyLCipLkmtdERZh4Sg979hzQzLrVSw%2BTs1AfozOQ4xdYbtvbe0ptHIHbQMa1qfQbk9OmLTD48qXSBjqkAYGD%2BzHd3sRk45NhqcoNLZ7Ah5zMEAef8o12OJ5U4c%2BkSz7HaaYnnHwvGNGrKbD5RCvGdESr2BmfJriMVh0IyynIMCwPHd4KNmXId5e4sS14ZFTahwaGWu3RI0AG%2FKMAKfmaGcmL3Gi6qglD6tShWkTq%2BC3rNBCBpBtIpth%2BEFTTyhrmX9BG94xWfDoH8fdvjLUS9MIPK21Y2ffieHHMa8LDrrcU&X-Amz-Signature=10448c9a437d7bfc09671e60fbc6ca6852a800a37cd80a297d1d6819d10f852b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJZVX2UY%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T220216Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCUfcKbI5V45ZFe6HEyht0pbj5t82NJops5luDtci%2FT4wIhAPZhivSUexafzHtoDA87bBteBnZ%2FMZrvChCq9zVmIeHBKv8DCC4QABoMNjM3NDIzMTgzODA1IgwGl0%2B2UxYw0nYqpzIq3AO0tAdgVCqd3vyROOgvTzDfZbAESZh2P%2B9VF4gI9N4hvxI%2BLe1tvqyLVtJM9kIvipNlPtyY7nD%2Fhm7%2BiqS4gQw6yaabIQ9uFJZyPTntC9eaAWxoGL46DyaQjJAxq%2Fz0fhvdHrDG3Mjc6tUrznRYDRFoxvhckUR6IBv0NWf8r3VIJ6ulmwhehKn3yKw3IdxqIODxIwLQdYckKaYZb8Q2sAdyd3ihwxTEp04EsT7%2BfKolz0%2F9UAbpk%2BYJ1X5xAcSJ6yF%2BJZv02S%2BYCs7IxJsTvkk5%2BoWgNn1Kd3KSGntKjuUzMdcQjmpFUxZa5QUe09CCFW07sK0Tun727ph%2BO2V1X4ZTffAU3sH4mnkD2b15y1OElRwyh%2BibvqEcxyeADQtj6%2B%2FiHdlIYsaTT09pwZX8EpFelVlLItZak%2BO2KDC2n29tB9ZYVyWKhHmuPdZaMnYl5T%2FpM6Vmji%2Bh5jUtwS59BAyMl6gPMGcFEWiKmXgFzFemmQ3gM201BgsoY%2BvPGvwT3iZiF6IOGZeHBRNtt6W1kpzpdpuo4mxX4SxiQGC81Y9cZcP%2BKq3BXer1jyLCipLkmtdERZh4Sg979hzQzLrVSw%2BTs1AfozOQ4xdYbtvbe0ptHIHbQMa1qfQbk9OmLTD48qXSBjqkAYGD%2BzHd3sRk45NhqcoNLZ7Ah5zMEAef8o12OJ5U4c%2BkSz7HaaYnnHwvGNGrKbD5RCvGdESr2BmfJriMVh0IyynIMCwPHd4KNmXId5e4sS14ZFTahwaGWu3RI0AG%2FKMAKfmaGcmL3Gi6qglD6tShWkTq%2BC3rNBCBpBtIpth%2BEFTTyhrmX9BG94xWfDoH8fdvjLUS9MIPK21Y2ffieHHMa8LDrrcU&X-Amz-Signature=1f056d8401ba774a679171666f407dd60a7c7ce5500ce2240416ba510ba02526&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466SJZVX2UY%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T220216Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJIMEYCIQCUfcKbI5V45ZFe6HEyht0pbj5t82NJops5luDtci%2FT4wIhAPZhivSUexafzHtoDA87bBteBnZ%2FMZrvChCq9zVmIeHBKv8DCC4QABoMNjM3NDIzMTgzODA1IgwGl0%2B2UxYw0nYqpzIq3AO0tAdgVCqd3vyROOgvTzDfZbAESZh2P%2B9VF4gI9N4hvxI%2BLe1tvqyLVtJM9kIvipNlPtyY7nD%2Fhm7%2BiqS4gQw6yaabIQ9uFJZyPTntC9eaAWxoGL46DyaQjJAxq%2Fz0fhvdHrDG3Mjc6tUrznRYDRFoxvhckUR6IBv0NWf8r3VIJ6ulmwhehKn3yKw3IdxqIODxIwLQdYckKaYZb8Q2sAdyd3ihwxTEp04EsT7%2BfKolz0%2F9UAbpk%2BYJ1X5xAcSJ6yF%2BJZv02S%2BYCs7IxJsTvkk5%2BoWgNn1Kd3KSGntKjuUzMdcQjmpFUxZa5QUe09CCFW07sK0Tun727ph%2BO2V1X4ZTffAU3sH4mnkD2b15y1OElRwyh%2BibvqEcxyeADQtj6%2B%2FiHdlIYsaTT09pwZX8EpFelVlLItZak%2BO2KDC2n29tB9ZYVyWKhHmuPdZaMnYl5T%2FpM6Vmji%2Bh5jUtwS59BAyMl6gPMGcFEWiKmXgFzFemmQ3gM201BgsoY%2BvPGvwT3iZiF6IOGZeHBRNtt6W1kpzpdpuo4mxX4SxiQGC81Y9cZcP%2BKq3BXer1jyLCipLkmtdERZh4Sg979hzQzLrVSw%2BTs1AfozOQ4xdYbtvbe0ptHIHbQMa1qfQbk9OmLTD48qXSBjqkAYGD%2BzHd3sRk45NhqcoNLZ7Ah5zMEAef8o12OJ5U4c%2BkSz7HaaYnnHwvGNGrKbD5RCvGdESr2BmfJriMVh0IyynIMCwPHd4KNmXId5e4sS14ZFTahwaGWu3RI0AG%2FKMAKfmaGcmL3Gi6qglD6tShWkTq%2BC3rNBCBpBtIpth%2BEFTTyhrmX9BG94xWfDoH8fdvjLUS9MIPK21Y2ffieHHMa8LDrrcU&X-Amz-Signature=894a942706e36439b739c9dad2290d46f47e3cb73f69dafacb9e6d2a9d77bbcd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
