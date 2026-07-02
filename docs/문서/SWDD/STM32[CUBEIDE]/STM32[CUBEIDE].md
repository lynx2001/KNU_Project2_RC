# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SRLXMZR%2F20260702%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260702T221131Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJGMEQCIDwWcsyvfAdhQdhqM9qOtCi789gCuiOY%2FyAJT02Og7yWAiAlFxjSnUJX70h2fGDkbmKILj3tb5cflMaZFsI16eULOyqIBAj%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXbbhw5Y23rpsV2R0KtwDCOsAYzM4QAWcL9DFNJ586sUkAoZ4uhHF7iS1elDTmrTBZdZDUe9rvp%2FEWELOx9o7IWBlzBinTgBEi5ndRQawOKq%2BFDoAKN%2FTDPaj55EpXf%2Fsv6ytph%2BKR28Ak6%2FRIMuKVpM01LhFhdkAptwAohOIde1oFRNItqCOGbvdjTTvD202To5a1UK4qKja4gmkcDQCJhj3kMBO65H9XGHjIQRWS1BzmT06TRRHE0CRp9noBS4fgtfCP34YGQlR2dkImtj3Nu34PqRg12bzdkYgvzIndzTzhxcJgh4JgfaphAvnJwQ1DJOd7x1npZEIaCU1s79UzyaG5tUQ8s9wdk7lfvIOgJ%2F%2Bp9sS%2B7tsf8CqbEMqQ07v2RNzmW4kDECBz2LoTsyb5r4bLMAlbiQecPW5WU5w7FocT%2B3zaMnAr%2B5FOtTg5w0pt6zwHm5Dgg5pRsK7U6LnyunuNMivBm%2BuCoqAXGGcjjHxPIlZHT93YCC%2FlKFuQjgWxBEU65OkrBVqAlMZmnrNMAyc3sbMyjEcExFu%2F1b%2F6GoUSPYY0BgtDtpGuciZnvFzPwkgCMFm8fpsLG4ucKLrnqC9ud3FkmuDvXGfdaZUcIBNk%2B2sLmvyR4hWe8p2amj65ajqQtCbwSpJ%2Bh8wlqGb0gY6pgGNCBUNjI35w3ILCaFrKVIyxh0dHGoI7g8UBfPBDj3vNo0Cg4ji1lWdpJsjAj7202sWVeKVi5ntlk4lNS7Ot2d5z%2FHASfxcVfQvS5alGTG5oAJkbgEACxdlRk%2BaOMdcEtbveGc1DdFd9jFZ%2B3TX5hbP2JlhD1a0jOFtA%2B1ZgaAMJg5Vyq8d86xCIe38xuSCNWUzSFMjZpAWU2PfsCPbQ8tNZ2Na7a35&X-Amz-Signature=3b766e921a8948b81720312d289b70163541ab516716180633e6e09d2b0aa3f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SRLXMZR%2F20260702%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260702T221131Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJGMEQCIDwWcsyvfAdhQdhqM9qOtCi789gCuiOY%2FyAJT02Og7yWAiAlFxjSnUJX70h2fGDkbmKILj3tb5cflMaZFsI16eULOyqIBAj%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXbbhw5Y23rpsV2R0KtwDCOsAYzM4QAWcL9DFNJ586sUkAoZ4uhHF7iS1elDTmrTBZdZDUe9rvp%2FEWELOx9o7IWBlzBinTgBEi5ndRQawOKq%2BFDoAKN%2FTDPaj55EpXf%2Fsv6ytph%2BKR28Ak6%2FRIMuKVpM01LhFhdkAptwAohOIde1oFRNItqCOGbvdjTTvD202To5a1UK4qKja4gmkcDQCJhj3kMBO65H9XGHjIQRWS1BzmT06TRRHE0CRp9noBS4fgtfCP34YGQlR2dkImtj3Nu34PqRg12bzdkYgvzIndzTzhxcJgh4JgfaphAvnJwQ1DJOd7x1npZEIaCU1s79UzyaG5tUQ8s9wdk7lfvIOgJ%2F%2Bp9sS%2B7tsf8CqbEMqQ07v2RNzmW4kDECBz2LoTsyb5r4bLMAlbiQecPW5WU5w7FocT%2B3zaMnAr%2B5FOtTg5w0pt6zwHm5Dgg5pRsK7U6LnyunuNMivBm%2BuCoqAXGGcjjHxPIlZHT93YCC%2FlKFuQjgWxBEU65OkrBVqAlMZmnrNMAyc3sbMyjEcExFu%2F1b%2F6GoUSPYY0BgtDtpGuciZnvFzPwkgCMFm8fpsLG4ucKLrnqC9ud3FkmuDvXGfdaZUcIBNk%2B2sLmvyR4hWe8p2amj65ajqQtCbwSpJ%2Bh8wlqGb0gY6pgGNCBUNjI35w3ILCaFrKVIyxh0dHGoI7g8UBfPBDj3vNo0Cg4ji1lWdpJsjAj7202sWVeKVi5ntlk4lNS7Ot2d5z%2FHASfxcVfQvS5alGTG5oAJkbgEACxdlRk%2BaOMdcEtbveGc1DdFd9jFZ%2B3TX5hbP2JlhD1a0jOFtA%2B1ZgaAMJg5Vyq8d86xCIe38xuSCNWUzSFMjZpAWU2PfsCPbQ8tNZ2Na7a35&X-Amz-Signature=bc4327d56773e9574043aef13ccfee1e155ab15b138af326b99bf11d7c533571&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SRLXMZR%2F20260702%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260702T221131Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJGMEQCIDwWcsyvfAdhQdhqM9qOtCi789gCuiOY%2FyAJT02Og7yWAiAlFxjSnUJX70h2fGDkbmKILj3tb5cflMaZFsI16eULOyqIBAj%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXbbhw5Y23rpsV2R0KtwDCOsAYzM4QAWcL9DFNJ586sUkAoZ4uhHF7iS1elDTmrTBZdZDUe9rvp%2FEWELOx9o7IWBlzBinTgBEi5ndRQawOKq%2BFDoAKN%2FTDPaj55EpXf%2Fsv6ytph%2BKR28Ak6%2FRIMuKVpM01LhFhdkAptwAohOIde1oFRNItqCOGbvdjTTvD202To5a1UK4qKja4gmkcDQCJhj3kMBO65H9XGHjIQRWS1BzmT06TRRHE0CRp9noBS4fgtfCP34YGQlR2dkImtj3Nu34PqRg12bzdkYgvzIndzTzhxcJgh4JgfaphAvnJwQ1DJOd7x1npZEIaCU1s79UzyaG5tUQ8s9wdk7lfvIOgJ%2F%2Bp9sS%2B7tsf8CqbEMqQ07v2RNzmW4kDECBz2LoTsyb5r4bLMAlbiQecPW5WU5w7FocT%2B3zaMnAr%2B5FOtTg5w0pt6zwHm5Dgg5pRsK7U6LnyunuNMivBm%2BuCoqAXGGcjjHxPIlZHT93YCC%2FlKFuQjgWxBEU65OkrBVqAlMZmnrNMAyc3sbMyjEcExFu%2F1b%2F6GoUSPYY0BgtDtpGuciZnvFzPwkgCMFm8fpsLG4ucKLrnqC9ud3FkmuDvXGfdaZUcIBNk%2B2sLmvyR4hWe8p2amj65ajqQtCbwSpJ%2Bh8wlqGb0gY6pgGNCBUNjI35w3ILCaFrKVIyxh0dHGoI7g8UBfPBDj3vNo0Cg4ji1lWdpJsjAj7202sWVeKVi5ntlk4lNS7Ot2d5z%2FHASfxcVfQvS5alGTG5oAJkbgEACxdlRk%2BaOMdcEtbveGc1DdFd9jFZ%2B3TX5hbP2JlhD1a0jOFtA%2B1ZgaAMJg5Vyq8d86xCIe38xuSCNWUzSFMjZpAWU2PfsCPbQ8tNZ2Na7a35&X-Amz-Signature=d5f1f6d136df20ca1ed83632072eff7a2757c0b4e0296245e940d966b6a27dec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SRLXMZR%2F20260702%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260702T221131Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJGMEQCIDwWcsyvfAdhQdhqM9qOtCi789gCuiOY%2FyAJT02Og7yWAiAlFxjSnUJX70h2fGDkbmKILj3tb5cflMaZFsI16eULOyqIBAj%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXbbhw5Y23rpsV2R0KtwDCOsAYzM4QAWcL9DFNJ586sUkAoZ4uhHF7iS1elDTmrTBZdZDUe9rvp%2FEWELOx9o7IWBlzBinTgBEi5ndRQawOKq%2BFDoAKN%2FTDPaj55EpXf%2Fsv6ytph%2BKR28Ak6%2FRIMuKVpM01LhFhdkAptwAohOIde1oFRNItqCOGbvdjTTvD202To5a1UK4qKja4gmkcDQCJhj3kMBO65H9XGHjIQRWS1BzmT06TRRHE0CRp9noBS4fgtfCP34YGQlR2dkImtj3Nu34PqRg12bzdkYgvzIndzTzhxcJgh4JgfaphAvnJwQ1DJOd7x1npZEIaCU1s79UzyaG5tUQ8s9wdk7lfvIOgJ%2F%2Bp9sS%2B7tsf8CqbEMqQ07v2RNzmW4kDECBz2LoTsyb5r4bLMAlbiQecPW5WU5w7FocT%2B3zaMnAr%2B5FOtTg5w0pt6zwHm5Dgg5pRsK7U6LnyunuNMivBm%2BuCoqAXGGcjjHxPIlZHT93YCC%2FlKFuQjgWxBEU65OkrBVqAlMZmnrNMAyc3sbMyjEcExFu%2F1b%2F6GoUSPYY0BgtDtpGuciZnvFzPwkgCMFm8fpsLG4ucKLrnqC9ud3FkmuDvXGfdaZUcIBNk%2B2sLmvyR4hWe8p2amj65ajqQtCbwSpJ%2Bh8wlqGb0gY6pgGNCBUNjI35w3ILCaFrKVIyxh0dHGoI7g8UBfPBDj3vNo0Cg4ji1lWdpJsjAj7202sWVeKVi5ntlk4lNS7Ot2d5z%2FHASfxcVfQvS5alGTG5oAJkbgEACxdlRk%2BaOMdcEtbveGc1DdFd9jFZ%2B3TX5hbP2JlhD1a0jOFtA%2B1ZgaAMJg5Vyq8d86xCIe38xuSCNWUzSFMjZpAWU2PfsCPbQ8tNZ2Na7a35&X-Amz-Signature=069fecfedeffbbe628f9a1f4c41c58a73d1ddaab60a773060a5f664ae5e031d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666SRLXMZR%2F20260702%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260702T221131Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDUaCXVzLXdlc3QtMiJGMEQCIDwWcsyvfAdhQdhqM9qOtCi789gCuiOY%2FyAJT02Og7yWAiAlFxjSnUJX70h2fGDkbmKILj3tb5cflMaZFsI16eULOyqIBAj%2B%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMXbbhw5Y23rpsV2R0KtwDCOsAYzM4QAWcL9DFNJ586sUkAoZ4uhHF7iS1elDTmrTBZdZDUe9rvp%2FEWELOx9o7IWBlzBinTgBEi5ndRQawOKq%2BFDoAKN%2FTDPaj55EpXf%2Fsv6ytph%2BKR28Ak6%2FRIMuKVpM01LhFhdkAptwAohOIde1oFRNItqCOGbvdjTTvD202To5a1UK4qKja4gmkcDQCJhj3kMBO65H9XGHjIQRWS1BzmT06TRRHE0CRp9noBS4fgtfCP34YGQlR2dkImtj3Nu34PqRg12bzdkYgvzIndzTzhxcJgh4JgfaphAvnJwQ1DJOd7x1npZEIaCU1s79UzyaG5tUQ8s9wdk7lfvIOgJ%2F%2Bp9sS%2B7tsf8CqbEMqQ07v2RNzmW4kDECBz2LoTsyb5r4bLMAlbiQecPW5WU5w7FocT%2B3zaMnAr%2B5FOtTg5w0pt6zwHm5Dgg5pRsK7U6LnyunuNMivBm%2BuCoqAXGGcjjHxPIlZHT93YCC%2FlKFuQjgWxBEU65OkrBVqAlMZmnrNMAyc3sbMyjEcExFu%2F1b%2F6GoUSPYY0BgtDtpGuciZnvFzPwkgCMFm8fpsLG4ucKLrnqC9ud3FkmuDvXGfdaZUcIBNk%2B2sLmvyR4hWe8p2amj65ajqQtCbwSpJ%2Bh8wlqGb0gY6pgGNCBUNjI35w3ILCaFrKVIyxh0dHGoI7g8UBfPBDj3vNo0Cg4ji1lWdpJsjAj7202sWVeKVi5ntlk4lNS7Ot2d5z%2FHASfxcVfQvS5alGTG5oAJkbgEACxdlRk%2BaOMdcEtbveGc1DdFd9jFZ%2B3TX5hbP2JlhD1a0jOFtA%2B1ZgaAMJg5Vyq8d86xCIe38xuSCNWUzSFMjZpAWU2PfsCPbQ8tNZ2Na7a35&X-Amz-Signature=c6fdbbf0f624f0d7e26bbc0787be133469574060e2780b51988ce28bbe4d3520&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
