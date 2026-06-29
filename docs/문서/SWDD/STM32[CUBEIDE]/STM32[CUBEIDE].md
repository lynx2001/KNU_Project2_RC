# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRBAZSU%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221740Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBEXuYO3ygqBIRkHysf9qC%2FOuJt6A1kBaV5KCWRcFdvKAiEA8J8jeP8eRGUzvxeLqzS6ay8lsgttdrdNIVvpHe0BIYoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCr8a1Ad6OdtJPCCircA3oqsNvIY0YhT5qQCZ3Uz9ZEWkahey7GR1yL2KTs%2FqNV9puZ9I6Wr2OCwGv03DH4WjFrp3AfPHeXSUCGd1mwKFHC97iY6W7ZeG35dbpfc1NZiP5MgwAqCq0kaqDUJsEt%2BOiSpsnDP6gsgCWuZCoJ%2Fi20Uz0TdapnFdulIJta7nJPExuxNwXy0zcXe%2BiDntQsSruQkt4OVhHpY1d%2BwJVGdSrjW%2BxHvobWpA%2BXe%2FQ69M%2BwNvVg1Yzp86KEFbeQbuynTonk9Ymd5M3yybn3v9VJgCQ5b6Ac6mrCSP66lTMoHYH%2BXb8FWPoM4Epgd0qHB22MJjI30sPWVteJSda3OgnEoZdnk7donTgfzirtNQo2%2FMENusrY0bhSWgCqEqTHytePlAfMzDhaTCj79y8MdlFAM3zp34iWLpilGW8WW%2BLeO8y4LDL7he2U6YLmONhg6TErfbsjOE%2Bw5l%2BuXaF%2F%2FZPGaHldWDbQfICvs795%2BYVG8UTH8ICWBadY%2FXIsTp9emD7e%2BrdKNFbmv04ntligZkTNwynIvSQkZMPoACoMYPBLPIB7xBh1Vq0HfkuFD0%2Fb9uz329gn%2FgZCdlFhdg09sNsM7FlgKX23dRE7iBV7dMleACcWjCKkHySatb%2FjOJ6fMNXdi9IGOqUBpuJ4fXwqsiaQ%2FqKmYgaA%2BeeBv%2BU3Mlm%2Babzz40CWcuQ11LQ%2FEbZxhvbPFooKYrMECKcW3WYQFGGcVWkb56BbeFuUG3nNXtbGrogu1ml5NQ6UsXffk7W7OZT1yEscTF2ZaoqepO39EqZczqfb5NdX%2BXvVmameROv7ZZwKZ%2BqTmz5720SCzsDjAbz2RRLcylfmgBvkjNfJzEDrVoTeFHvh4xpMWJ8g&X-Amz-Signature=98597cbf4fc2cc138ddf6aa06df2bf1a2796a879bfad65595bfee616c97dca53&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRBAZSU%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221740Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBEXuYO3ygqBIRkHysf9qC%2FOuJt6A1kBaV5KCWRcFdvKAiEA8J8jeP8eRGUzvxeLqzS6ay8lsgttdrdNIVvpHe0BIYoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCr8a1Ad6OdtJPCCircA3oqsNvIY0YhT5qQCZ3Uz9ZEWkahey7GR1yL2KTs%2FqNV9puZ9I6Wr2OCwGv03DH4WjFrp3AfPHeXSUCGd1mwKFHC97iY6W7ZeG35dbpfc1NZiP5MgwAqCq0kaqDUJsEt%2BOiSpsnDP6gsgCWuZCoJ%2Fi20Uz0TdapnFdulIJta7nJPExuxNwXy0zcXe%2BiDntQsSruQkt4OVhHpY1d%2BwJVGdSrjW%2BxHvobWpA%2BXe%2FQ69M%2BwNvVg1Yzp86KEFbeQbuynTonk9Ymd5M3yybn3v9VJgCQ5b6Ac6mrCSP66lTMoHYH%2BXb8FWPoM4Epgd0qHB22MJjI30sPWVteJSda3OgnEoZdnk7donTgfzirtNQo2%2FMENusrY0bhSWgCqEqTHytePlAfMzDhaTCj79y8MdlFAM3zp34iWLpilGW8WW%2BLeO8y4LDL7he2U6YLmONhg6TErfbsjOE%2Bw5l%2BuXaF%2F%2FZPGaHldWDbQfICvs795%2BYVG8UTH8ICWBadY%2FXIsTp9emD7e%2BrdKNFbmv04ntligZkTNwynIvSQkZMPoACoMYPBLPIB7xBh1Vq0HfkuFD0%2Fb9uz329gn%2FgZCdlFhdg09sNsM7FlgKX23dRE7iBV7dMleACcWjCKkHySatb%2FjOJ6fMNXdi9IGOqUBpuJ4fXwqsiaQ%2FqKmYgaA%2BeeBv%2BU3Mlm%2Babzz40CWcuQ11LQ%2FEbZxhvbPFooKYrMECKcW3WYQFGGcVWkb56BbeFuUG3nNXtbGrogu1ml5NQ6UsXffk7W7OZT1yEscTF2ZaoqepO39EqZczqfb5NdX%2BXvVmameROv7ZZwKZ%2BqTmz5720SCzsDjAbz2RRLcylfmgBvkjNfJzEDrVoTeFHvh4xpMWJ8g&X-Amz-Signature=3b5f8d8d6d8d18363af33d0a75be77b2eb0d09e44657a9fbe9f680208117b367&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRBAZSU%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221740Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBEXuYO3ygqBIRkHysf9qC%2FOuJt6A1kBaV5KCWRcFdvKAiEA8J8jeP8eRGUzvxeLqzS6ay8lsgttdrdNIVvpHe0BIYoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCr8a1Ad6OdtJPCCircA3oqsNvIY0YhT5qQCZ3Uz9ZEWkahey7GR1yL2KTs%2FqNV9puZ9I6Wr2OCwGv03DH4WjFrp3AfPHeXSUCGd1mwKFHC97iY6W7ZeG35dbpfc1NZiP5MgwAqCq0kaqDUJsEt%2BOiSpsnDP6gsgCWuZCoJ%2Fi20Uz0TdapnFdulIJta7nJPExuxNwXy0zcXe%2BiDntQsSruQkt4OVhHpY1d%2BwJVGdSrjW%2BxHvobWpA%2BXe%2FQ69M%2BwNvVg1Yzp86KEFbeQbuynTonk9Ymd5M3yybn3v9VJgCQ5b6Ac6mrCSP66lTMoHYH%2BXb8FWPoM4Epgd0qHB22MJjI30sPWVteJSda3OgnEoZdnk7donTgfzirtNQo2%2FMENusrY0bhSWgCqEqTHytePlAfMzDhaTCj79y8MdlFAM3zp34iWLpilGW8WW%2BLeO8y4LDL7he2U6YLmONhg6TErfbsjOE%2Bw5l%2BuXaF%2F%2FZPGaHldWDbQfICvs795%2BYVG8UTH8ICWBadY%2FXIsTp9emD7e%2BrdKNFbmv04ntligZkTNwynIvSQkZMPoACoMYPBLPIB7xBh1Vq0HfkuFD0%2Fb9uz329gn%2FgZCdlFhdg09sNsM7FlgKX23dRE7iBV7dMleACcWjCKkHySatb%2FjOJ6fMNXdi9IGOqUBpuJ4fXwqsiaQ%2FqKmYgaA%2BeeBv%2BU3Mlm%2Babzz40CWcuQ11LQ%2FEbZxhvbPFooKYrMECKcW3WYQFGGcVWkb56BbeFuUG3nNXtbGrogu1ml5NQ6UsXffk7W7OZT1yEscTF2ZaoqepO39EqZczqfb5NdX%2BXvVmameROv7ZZwKZ%2BqTmz5720SCzsDjAbz2RRLcylfmgBvkjNfJzEDrVoTeFHvh4xpMWJ8g&X-Amz-Signature=822594461edb476ed8408e3fbde13684803c770ebd644a2e217721e076e3b641&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRBAZSU%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221740Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBEXuYO3ygqBIRkHysf9qC%2FOuJt6A1kBaV5KCWRcFdvKAiEA8J8jeP8eRGUzvxeLqzS6ay8lsgttdrdNIVvpHe0BIYoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCr8a1Ad6OdtJPCCircA3oqsNvIY0YhT5qQCZ3Uz9ZEWkahey7GR1yL2KTs%2FqNV9puZ9I6Wr2OCwGv03DH4WjFrp3AfPHeXSUCGd1mwKFHC97iY6W7ZeG35dbpfc1NZiP5MgwAqCq0kaqDUJsEt%2BOiSpsnDP6gsgCWuZCoJ%2Fi20Uz0TdapnFdulIJta7nJPExuxNwXy0zcXe%2BiDntQsSruQkt4OVhHpY1d%2BwJVGdSrjW%2BxHvobWpA%2BXe%2FQ69M%2BwNvVg1Yzp86KEFbeQbuynTonk9Ymd5M3yybn3v9VJgCQ5b6Ac6mrCSP66lTMoHYH%2BXb8FWPoM4Epgd0qHB22MJjI30sPWVteJSda3OgnEoZdnk7donTgfzirtNQo2%2FMENusrY0bhSWgCqEqTHytePlAfMzDhaTCj79y8MdlFAM3zp34iWLpilGW8WW%2BLeO8y4LDL7he2U6YLmONhg6TErfbsjOE%2Bw5l%2BuXaF%2F%2FZPGaHldWDbQfICvs795%2BYVG8UTH8ICWBadY%2FXIsTp9emD7e%2BrdKNFbmv04ntligZkTNwynIvSQkZMPoACoMYPBLPIB7xBh1Vq0HfkuFD0%2Fb9uz329gn%2FgZCdlFhdg09sNsM7FlgKX23dRE7iBV7dMleACcWjCKkHySatb%2FjOJ6fMNXdi9IGOqUBpuJ4fXwqsiaQ%2FqKmYgaA%2BeeBv%2BU3Mlm%2Babzz40CWcuQ11LQ%2FEbZxhvbPFooKYrMECKcW3WYQFGGcVWkb56BbeFuUG3nNXtbGrogu1ml5NQ6UsXffk7W7OZT1yEscTF2ZaoqepO39EqZczqfb5NdX%2BXvVmameROv7ZZwKZ%2BqTmz5720SCzsDjAbz2RRLcylfmgBvkjNfJzEDrVoTeFHvh4xpMWJ8g&X-Amz-Signature=cab79333e6035283f1e4e9ae274491275e8307b182deefa00dd60474e9979881&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TPRBAZSU%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221740Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBEXuYO3ygqBIRkHysf9qC%2FOuJt6A1kBaV5KCWRcFdvKAiEA8J8jeP8eRGUzvxeLqzS6ay8lsgttdrdNIVvpHe0BIYoqiAQIt%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDPCr8a1Ad6OdtJPCCircA3oqsNvIY0YhT5qQCZ3Uz9ZEWkahey7GR1yL2KTs%2FqNV9puZ9I6Wr2OCwGv03DH4WjFrp3AfPHeXSUCGd1mwKFHC97iY6W7ZeG35dbpfc1NZiP5MgwAqCq0kaqDUJsEt%2BOiSpsnDP6gsgCWuZCoJ%2Fi20Uz0TdapnFdulIJta7nJPExuxNwXy0zcXe%2BiDntQsSruQkt4OVhHpY1d%2BwJVGdSrjW%2BxHvobWpA%2BXe%2FQ69M%2BwNvVg1Yzp86KEFbeQbuynTonk9Ymd5M3yybn3v9VJgCQ5b6Ac6mrCSP66lTMoHYH%2BXb8FWPoM4Epgd0qHB22MJjI30sPWVteJSda3OgnEoZdnk7donTgfzirtNQo2%2FMENusrY0bhSWgCqEqTHytePlAfMzDhaTCj79y8MdlFAM3zp34iWLpilGW8WW%2BLeO8y4LDL7he2U6YLmONhg6TErfbsjOE%2Bw5l%2BuXaF%2F%2FZPGaHldWDbQfICvs795%2BYVG8UTH8ICWBadY%2FXIsTp9emD7e%2BrdKNFbmv04ntligZkTNwynIvSQkZMPoACoMYPBLPIB7xBh1Vq0HfkuFD0%2Fb9uz329gn%2FgZCdlFhdg09sNsM7FlgKX23dRE7iBV7dMleACcWjCKkHySatb%2FjOJ6fMNXdi9IGOqUBpuJ4fXwqsiaQ%2FqKmYgaA%2BeeBv%2BU3Mlm%2Babzz40CWcuQ11LQ%2FEbZxhvbPFooKYrMECKcW3WYQFGGcVWkb56BbeFuUG3nNXtbGrogu1ml5NQ6UsXffk7W7OZT1yEscTF2ZaoqepO39EqZczqfb5NdX%2BXvVmameROv7ZZwKZ%2BqTmz5720SCzsDjAbz2RRLcylfmgBvkjNfJzEDrVoTeFHvh4xpMWJ8g&X-Amz-Signature=0b9d3afaab834f8c63b199fd90ba828229c1259675690d7158a9c175c6c9bf48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
