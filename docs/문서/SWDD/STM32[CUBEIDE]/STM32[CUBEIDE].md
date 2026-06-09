# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDLRERMA%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIFdrG0vjpwARQCjpB%2FEIBntzXvPr%2BpK3%2F7UNELue52b%2FAiEA5noxoVChjZNl3ZfiMwJhYPXSlm57ZK8fNFaVIfAabhEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMtcw0TxZbwi5M2LDSrcA9xZxV2ITdH8M4sIb8fZeiO2zpo6wEHoJXXJZN0ptG8%2Fy9gCLxAdpKxp%2BgOP3gN7%2F2gh5%2BsVW7YhI907Mxd7s9bm1WrHjDwq9EiAky%2F0sAJqUAQ8SyRyVeO8pV1t0vtluyPFmYA03bmvwKOGKXAU6mDk0zPs2REQ%2BXN1tLKygIZro9ov5J7%2FeCxvHpcbKKuUA9YysrKXWifXWTNFyr9MLpT%2BAS6XrueQFRN8LtfU905yfzdrmWGb9LD39j%2BukCu7Qbqr3G%2FbhwwXItDjgliBruTph4%2BGxlMFEd86VQ9HfbCqZPIkdoV%2BR0CXrnmtU9OMwirsOs3r6kA2SytpdI5sc1yQ1oRQR8C5QlCvmqq5YClFsPxsseW9604F%2Be48ule41XU%2B9538o4H%2BHDaobX8XnpuROy7id0y7WqVMxCIBbydID2uFCI5n2g36U%2Bduv74CAwpFQca%2BF4cN%2BoM5GwC109egVSj1t0DVEONXNbA1vqh7rAniNNVISOaKpglcSYxo7f6Pc1SfBMUsDWaQU9s25VIEfUc%2Fg8CgNeAtUzUX5WLDN1%2FfcJ0pouxAma9quDtV9DRGJvCe5CtMhLNl6YirwihIPJt%2B71VnlXbM5%2B3DZORuQlYfSgWHYe9W%2B7%2BGMK%2BlotEGOqUBUXuk1sbD2QQ2LrCiONPXGvwnSUxuDmBd33Pljmz0RaP9zfavgo2hy6b2ziU7Wa5lyrFdTuiaSojkHeBE%2Fty8WT3LkdGiV7ErYKmktX88BFmBsTtqS2aiK77yaKkdOYSW0mBYRsSz1PARNeg1UFcx6xd888poiOiAPGnHggUcpFwjeADbgV3rUzqlEVePlU9VfHhwak7A6i910%2BhpUYJ%2Btqek%2BxRQ&X-Amz-Signature=e3d2604a74e2462577f54a929c17e2b605e09d43d092b2001a46d35bd95f6f9e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDLRERMA%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIFdrG0vjpwARQCjpB%2FEIBntzXvPr%2BpK3%2F7UNELue52b%2FAiEA5noxoVChjZNl3ZfiMwJhYPXSlm57ZK8fNFaVIfAabhEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMtcw0TxZbwi5M2LDSrcA9xZxV2ITdH8M4sIb8fZeiO2zpo6wEHoJXXJZN0ptG8%2Fy9gCLxAdpKxp%2BgOP3gN7%2F2gh5%2BsVW7YhI907Mxd7s9bm1WrHjDwq9EiAky%2F0sAJqUAQ8SyRyVeO8pV1t0vtluyPFmYA03bmvwKOGKXAU6mDk0zPs2REQ%2BXN1tLKygIZro9ov5J7%2FeCxvHpcbKKuUA9YysrKXWifXWTNFyr9MLpT%2BAS6XrueQFRN8LtfU905yfzdrmWGb9LD39j%2BukCu7Qbqr3G%2FbhwwXItDjgliBruTph4%2BGxlMFEd86VQ9HfbCqZPIkdoV%2BR0CXrnmtU9OMwirsOs3r6kA2SytpdI5sc1yQ1oRQR8C5QlCvmqq5YClFsPxsseW9604F%2Be48ule41XU%2B9538o4H%2BHDaobX8XnpuROy7id0y7WqVMxCIBbydID2uFCI5n2g36U%2Bduv74CAwpFQca%2BF4cN%2BoM5GwC109egVSj1t0DVEONXNbA1vqh7rAniNNVISOaKpglcSYxo7f6Pc1SfBMUsDWaQU9s25VIEfUc%2Fg8CgNeAtUzUX5WLDN1%2FfcJ0pouxAma9quDtV9DRGJvCe5CtMhLNl6YirwihIPJt%2B71VnlXbM5%2B3DZORuQlYfSgWHYe9W%2B7%2BGMK%2BlotEGOqUBUXuk1sbD2QQ2LrCiONPXGvwnSUxuDmBd33Pljmz0RaP9zfavgo2hy6b2ziU7Wa5lyrFdTuiaSojkHeBE%2Fty8WT3LkdGiV7ErYKmktX88BFmBsTtqS2aiK77yaKkdOYSW0mBYRsSz1PARNeg1UFcx6xd888poiOiAPGnHggUcpFwjeADbgV3rUzqlEVePlU9VfHhwak7A6i910%2BhpUYJ%2Btqek%2BxRQ&X-Amz-Signature=6660d182e5f512d43ec24cb2ce68df1768818558651c4c55a5f30715178bea6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDLRERMA%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIFdrG0vjpwARQCjpB%2FEIBntzXvPr%2BpK3%2F7UNELue52b%2FAiEA5noxoVChjZNl3ZfiMwJhYPXSlm57ZK8fNFaVIfAabhEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMtcw0TxZbwi5M2LDSrcA9xZxV2ITdH8M4sIb8fZeiO2zpo6wEHoJXXJZN0ptG8%2Fy9gCLxAdpKxp%2BgOP3gN7%2F2gh5%2BsVW7YhI907Mxd7s9bm1WrHjDwq9EiAky%2F0sAJqUAQ8SyRyVeO8pV1t0vtluyPFmYA03bmvwKOGKXAU6mDk0zPs2REQ%2BXN1tLKygIZro9ov5J7%2FeCxvHpcbKKuUA9YysrKXWifXWTNFyr9MLpT%2BAS6XrueQFRN8LtfU905yfzdrmWGb9LD39j%2BukCu7Qbqr3G%2FbhwwXItDjgliBruTph4%2BGxlMFEd86VQ9HfbCqZPIkdoV%2BR0CXrnmtU9OMwirsOs3r6kA2SytpdI5sc1yQ1oRQR8C5QlCvmqq5YClFsPxsseW9604F%2Be48ule41XU%2B9538o4H%2BHDaobX8XnpuROy7id0y7WqVMxCIBbydID2uFCI5n2g36U%2Bduv74CAwpFQca%2BF4cN%2BoM5GwC109egVSj1t0DVEONXNbA1vqh7rAniNNVISOaKpglcSYxo7f6Pc1SfBMUsDWaQU9s25VIEfUc%2Fg8CgNeAtUzUX5WLDN1%2FfcJ0pouxAma9quDtV9DRGJvCe5CtMhLNl6YirwihIPJt%2B71VnlXbM5%2B3DZORuQlYfSgWHYe9W%2B7%2BGMK%2BlotEGOqUBUXuk1sbD2QQ2LrCiONPXGvwnSUxuDmBd33Pljmz0RaP9zfavgo2hy6b2ziU7Wa5lyrFdTuiaSojkHeBE%2Fty8WT3LkdGiV7ErYKmktX88BFmBsTtqS2aiK77yaKkdOYSW0mBYRsSz1PARNeg1UFcx6xd888poiOiAPGnHggUcpFwjeADbgV3rUzqlEVePlU9VfHhwak7A6i910%2BhpUYJ%2Btqek%2BxRQ&X-Amz-Signature=b62bd1a7f9fb35bc862b559708ccdc8a64dd75883343c1a37063681038d49be3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDLRERMA%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIFdrG0vjpwARQCjpB%2FEIBntzXvPr%2BpK3%2F7UNELue52b%2FAiEA5noxoVChjZNl3ZfiMwJhYPXSlm57ZK8fNFaVIfAabhEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMtcw0TxZbwi5M2LDSrcA9xZxV2ITdH8M4sIb8fZeiO2zpo6wEHoJXXJZN0ptG8%2Fy9gCLxAdpKxp%2BgOP3gN7%2F2gh5%2BsVW7YhI907Mxd7s9bm1WrHjDwq9EiAky%2F0sAJqUAQ8SyRyVeO8pV1t0vtluyPFmYA03bmvwKOGKXAU6mDk0zPs2REQ%2BXN1tLKygIZro9ov5J7%2FeCxvHpcbKKuUA9YysrKXWifXWTNFyr9MLpT%2BAS6XrueQFRN8LtfU905yfzdrmWGb9LD39j%2BukCu7Qbqr3G%2FbhwwXItDjgliBruTph4%2BGxlMFEd86VQ9HfbCqZPIkdoV%2BR0CXrnmtU9OMwirsOs3r6kA2SytpdI5sc1yQ1oRQR8C5QlCvmqq5YClFsPxsseW9604F%2Be48ule41XU%2B9538o4H%2BHDaobX8XnpuROy7id0y7WqVMxCIBbydID2uFCI5n2g36U%2Bduv74CAwpFQca%2BF4cN%2BoM5GwC109egVSj1t0DVEONXNbA1vqh7rAniNNVISOaKpglcSYxo7f6Pc1SfBMUsDWaQU9s25VIEfUc%2Fg8CgNeAtUzUX5WLDN1%2FfcJ0pouxAma9quDtV9DRGJvCe5CtMhLNl6YirwihIPJt%2B71VnlXbM5%2B3DZORuQlYfSgWHYe9W%2B7%2BGMK%2BlotEGOqUBUXuk1sbD2QQ2LrCiONPXGvwnSUxuDmBd33Pljmz0RaP9zfavgo2hy6b2ziU7Wa5lyrFdTuiaSojkHeBE%2Fty8WT3LkdGiV7ErYKmktX88BFmBsTtqS2aiK77yaKkdOYSW0mBYRsSz1PARNeg1UFcx6xd888poiOiAPGnHggUcpFwjeADbgV3rUzqlEVePlU9VfHhwak7A6i910%2BhpUYJ%2Btqek%2BxRQ&X-Amz-Signature=3a9594e53d1ba5329ec89520a3d2ffb5c12f80e09c0e53d6d0ef6897f962db91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDLRERMA%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222959Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA8aCXVzLXdlc3QtMiJHMEUCIFdrG0vjpwARQCjpB%2FEIBntzXvPr%2BpK3%2F7UNELue52b%2FAiEA5noxoVChjZNl3ZfiMwJhYPXSlm57ZK8fNFaVIfAabhEqiAQI1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDMtcw0TxZbwi5M2LDSrcA9xZxV2ITdH8M4sIb8fZeiO2zpo6wEHoJXXJZN0ptG8%2Fy9gCLxAdpKxp%2BgOP3gN7%2F2gh5%2BsVW7YhI907Mxd7s9bm1WrHjDwq9EiAky%2F0sAJqUAQ8SyRyVeO8pV1t0vtluyPFmYA03bmvwKOGKXAU6mDk0zPs2REQ%2BXN1tLKygIZro9ov5J7%2FeCxvHpcbKKuUA9YysrKXWifXWTNFyr9MLpT%2BAS6XrueQFRN8LtfU905yfzdrmWGb9LD39j%2BukCu7Qbqr3G%2FbhwwXItDjgliBruTph4%2BGxlMFEd86VQ9HfbCqZPIkdoV%2BR0CXrnmtU9OMwirsOs3r6kA2SytpdI5sc1yQ1oRQR8C5QlCvmqq5YClFsPxsseW9604F%2Be48ule41XU%2B9538o4H%2BHDaobX8XnpuROy7id0y7WqVMxCIBbydID2uFCI5n2g36U%2Bduv74CAwpFQca%2BF4cN%2BoM5GwC109egVSj1t0DVEONXNbA1vqh7rAniNNVISOaKpglcSYxo7f6Pc1SfBMUsDWaQU9s25VIEfUc%2Fg8CgNeAtUzUX5WLDN1%2FfcJ0pouxAma9quDtV9DRGJvCe5CtMhLNl6YirwihIPJt%2B71VnlXbM5%2B3DZORuQlYfSgWHYe9W%2B7%2BGMK%2BlotEGOqUBUXuk1sbD2QQ2LrCiONPXGvwnSUxuDmBd33Pljmz0RaP9zfavgo2hy6b2ziU7Wa5lyrFdTuiaSojkHeBE%2Fty8WT3LkdGiV7ErYKmktX88BFmBsTtqS2aiK77yaKkdOYSW0mBYRsSz1PARNeg1UFcx6xd888poiOiAPGnHggUcpFwjeADbgV3rUzqlEVePlU9VfHhwak7A6i910%2BhpUYJ%2Btqek%2BxRQ&X-Amz-Signature=742a41c926c372e5191a07dfddf55e019e4126eb20d62b3424c7415050595f8b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
