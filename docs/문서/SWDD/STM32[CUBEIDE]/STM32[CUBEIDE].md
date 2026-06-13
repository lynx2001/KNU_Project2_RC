# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IMWXX5S%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQCzJh5YCPWfOS6qVeW6P9YYi8UyQ4L5gu5HcXZQokHk7gIhALZ4A5j3Y4TRQ3coAeFZaNApKjMS7DrM8ZwP1B4MN9O%2BKv8DCDYQABoMNjM3NDIzMTgzODA1IgzkMoE8GVETP9cbt7Yq3AMXsdDHDdGtl6Y7hYhIhtzCGXcIGErzkY%2BFlzvNOdUuQ6YFBA8mWcRRs8LBybQeiZRxkb25NB5fKxMm79GgyOJt2mC%2BeyXdfsqImq3WkZ%2F0f4t5cHOdMUytf%2F7ds6ca6VWoB22sijPTA8NZ2PYvdgmGU5EL1xVGxGLwQ7tDeWmhEv4l3Z2Ox6OiwyZ6hgMUm1lCjvCw6dDtAb1y%2FFkH%2BTQxbteDcDyXePwHapzRnQTwpi%2BVvCzIuOIN3xCAZQeFGYVMd5VzXOLpLzJtZbdkXR2qBhYuIs%2B1oHtUjxH8jNuytm6npLunerVvP3f0IUh%2BkfsQwGQCAp%2FTNgJ5%2FvmvvMx3biBL2bQQrSljRiIbaTlNEiqXpW7bUpPEupNvTmOxtbqhWE4dKgr8nZUEFyy%2BcjOja%2F3oiBpffuU%2B1coibwPr2sSiRwMpw1F%2BqgX%2B93Nh7Ac%2FMYiwUFK9Dx2NF1QIojXsawoQ4J2A5wtdSNIeslF7VnRhPTmYrlYpDRkfR2qWurqGLG28FeQtX3fmjkFx0wwRDKOLCa6jWFvtP6beKExJKmsb7dX1%2BkqHupOwCdcuX1zNCoV5amfKOAGCaoPtkrwXy0hs2ETTb7sWYQjEe1IUJSkk%2BW6%2F%2B43JS4TXOjDCgbfRBjqkAWtk%2Fl%2FwCCWPRCJ7hyqrXALxPTB6IVoH5qhKfs9cZ2LjHfleUjfMb6VVIZxyuzH5T2%2FoMt%2BohTH3RaixVNY4cLfWV4v2g5gULeOY9FVFGiPrxXmS2Lll1Vx61F949up9YoL%2Byyd6EhknyLca5BUbZxMaByo5a1%2B%2BYRPAJcgtHl5sRElo8EOyQoj1lSx66PgzetBvm8OXU7WGNoD3oYibofFAhbah&X-Amz-Signature=4f005672e8d8ff338276e3a9e921fa4401c6afbbfbfc8c73d5faaddda86e2dde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IMWXX5S%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQCzJh5YCPWfOS6qVeW6P9YYi8UyQ4L5gu5HcXZQokHk7gIhALZ4A5j3Y4TRQ3coAeFZaNApKjMS7DrM8ZwP1B4MN9O%2BKv8DCDYQABoMNjM3NDIzMTgzODA1IgzkMoE8GVETP9cbt7Yq3AMXsdDHDdGtl6Y7hYhIhtzCGXcIGErzkY%2BFlzvNOdUuQ6YFBA8mWcRRs8LBybQeiZRxkb25NB5fKxMm79GgyOJt2mC%2BeyXdfsqImq3WkZ%2F0f4t5cHOdMUytf%2F7ds6ca6VWoB22sijPTA8NZ2PYvdgmGU5EL1xVGxGLwQ7tDeWmhEv4l3Z2Ox6OiwyZ6hgMUm1lCjvCw6dDtAb1y%2FFkH%2BTQxbteDcDyXePwHapzRnQTwpi%2BVvCzIuOIN3xCAZQeFGYVMd5VzXOLpLzJtZbdkXR2qBhYuIs%2B1oHtUjxH8jNuytm6npLunerVvP3f0IUh%2BkfsQwGQCAp%2FTNgJ5%2FvmvvMx3biBL2bQQrSljRiIbaTlNEiqXpW7bUpPEupNvTmOxtbqhWE4dKgr8nZUEFyy%2BcjOja%2F3oiBpffuU%2B1coibwPr2sSiRwMpw1F%2BqgX%2B93Nh7Ac%2FMYiwUFK9Dx2NF1QIojXsawoQ4J2A5wtdSNIeslF7VnRhPTmYrlYpDRkfR2qWurqGLG28FeQtX3fmjkFx0wwRDKOLCa6jWFvtP6beKExJKmsb7dX1%2BkqHupOwCdcuX1zNCoV5amfKOAGCaoPtkrwXy0hs2ETTb7sWYQjEe1IUJSkk%2BW6%2F%2B43JS4TXOjDCgbfRBjqkAWtk%2Fl%2FwCCWPRCJ7hyqrXALxPTB6IVoH5qhKfs9cZ2LjHfleUjfMb6VVIZxyuzH5T2%2FoMt%2BohTH3RaixVNY4cLfWV4v2g5gULeOY9FVFGiPrxXmS2Lll1Vx61F949up9YoL%2Byyd6EhknyLca5BUbZxMaByo5a1%2B%2BYRPAJcgtHl5sRElo8EOyQoj1lSx66PgzetBvm8OXU7WGNoD3oYibofFAhbah&X-Amz-Signature=86fd11e3c6971a41141192444ef9a759e462dc13b90d8309ebfdec0563c1a6fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IMWXX5S%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQCzJh5YCPWfOS6qVeW6P9YYi8UyQ4L5gu5HcXZQokHk7gIhALZ4A5j3Y4TRQ3coAeFZaNApKjMS7DrM8ZwP1B4MN9O%2BKv8DCDYQABoMNjM3NDIzMTgzODA1IgzkMoE8GVETP9cbt7Yq3AMXsdDHDdGtl6Y7hYhIhtzCGXcIGErzkY%2BFlzvNOdUuQ6YFBA8mWcRRs8LBybQeiZRxkb25NB5fKxMm79GgyOJt2mC%2BeyXdfsqImq3WkZ%2F0f4t5cHOdMUytf%2F7ds6ca6VWoB22sijPTA8NZ2PYvdgmGU5EL1xVGxGLwQ7tDeWmhEv4l3Z2Ox6OiwyZ6hgMUm1lCjvCw6dDtAb1y%2FFkH%2BTQxbteDcDyXePwHapzRnQTwpi%2BVvCzIuOIN3xCAZQeFGYVMd5VzXOLpLzJtZbdkXR2qBhYuIs%2B1oHtUjxH8jNuytm6npLunerVvP3f0IUh%2BkfsQwGQCAp%2FTNgJ5%2FvmvvMx3biBL2bQQrSljRiIbaTlNEiqXpW7bUpPEupNvTmOxtbqhWE4dKgr8nZUEFyy%2BcjOja%2F3oiBpffuU%2B1coibwPr2sSiRwMpw1F%2BqgX%2B93Nh7Ac%2FMYiwUFK9Dx2NF1QIojXsawoQ4J2A5wtdSNIeslF7VnRhPTmYrlYpDRkfR2qWurqGLG28FeQtX3fmjkFx0wwRDKOLCa6jWFvtP6beKExJKmsb7dX1%2BkqHupOwCdcuX1zNCoV5amfKOAGCaoPtkrwXy0hs2ETTb7sWYQjEe1IUJSkk%2BW6%2F%2B43JS4TXOjDCgbfRBjqkAWtk%2Fl%2FwCCWPRCJ7hyqrXALxPTB6IVoH5qhKfs9cZ2LjHfleUjfMb6VVIZxyuzH5T2%2FoMt%2BohTH3RaixVNY4cLfWV4v2g5gULeOY9FVFGiPrxXmS2Lll1Vx61F949up9YoL%2Byyd6EhknyLca5BUbZxMaByo5a1%2B%2BYRPAJcgtHl5sRElo8EOyQoj1lSx66PgzetBvm8OXU7WGNoD3oYibofFAhbah&X-Amz-Signature=375379b597427ab2078877518c0b849531194f9542a0e6f29824b5df6b7ccb43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IMWXX5S%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQCzJh5YCPWfOS6qVeW6P9YYi8UyQ4L5gu5HcXZQokHk7gIhALZ4A5j3Y4TRQ3coAeFZaNApKjMS7DrM8ZwP1B4MN9O%2BKv8DCDYQABoMNjM3NDIzMTgzODA1IgzkMoE8GVETP9cbt7Yq3AMXsdDHDdGtl6Y7hYhIhtzCGXcIGErzkY%2BFlzvNOdUuQ6YFBA8mWcRRs8LBybQeiZRxkb25NB5fKxMm79GgyOJt2mC%2BeyXdfsqImq3WkZ%2F0f4t5cHOdMUytf%2F7ds6ca6VWoB22sijPTA8NZ2PYvdgmGU5EL1xVGxGLwQ7tDeWmhEv4l3Z2Ox6OiwyZ6hgMUm1lCjvCw6dDtAb1y%2FFkH%2BTQxbteDcDyXePwHapzRnQTwpi%2BVvCzIuOIN3xCAZQeFGYVMd5VzXOLpLzJtZbdkXR2qBhYuIs%2B1oHtUjxH8jNuytm6npLunerVvP3f0IUh%2BkfsQwGQCAp%2FTNgJ5%2FvmvvMx3biBL2bQQrSljRiIbaTlNEiqXpW7bUpPEupNvTmOxtbqhWE4dKgr8nZUEFyy%2BcjOja%2F3oiBpffuU%2B1coibwPr2sSiRwMpw1F%2BqgX%2B93Nh7Ac%2FMYiwUFK9Dx2NF1QIojXsawoQ4J2A5wtdSNIeslF7VnRhPTmYrlYpDRkfR2qWurqGLG28FeQtX3fmjkFx0wwRDKOLCa6jWFvtP6beKExJKmsb7dX1%2BkqHupOwCdcuX1zNCoV5amfKOAGCaoPtkrwXy0hs2ETTb7sWYQjEe1IUJSkk%2BW6%2F%2B43JS4TXOjDCgbfRBjqkAWtk%2Fl%2FwCCWPRCJ7hyqrXALxPTB6IVoH5qhKfs9cZ2LjHfleUjfMb6VVIZxyuzH5T2%2FoMt%2BohTH3RaixVNY4cLfWV4v2g5gULeOY9FVFGiPrxXmS2Lll1Vx61F949up9YoL%2Byyd6EhknyLca5BUbZxMaByo5a1%2B%2BYRPAJcgtHl5sRElo8EOyQoj1lSx66PgzetBvm8OXU7WGNoD3oYibofFAhbah&X-Amz-Signature=fadee6abe1621b5201b13c14766888cd7141d63e789022af1b722ea7ccfb429d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662IMWXX5S%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJIMEYCIQCzJh5YCPWfOS6qVeW6P9YYi8UyQ4L5gu5HcXZQokHk7gIhALZ4A5j3Y4TRQ3coAeFZaNApKjMS7DrM8ZwP1B4MN9O%2BKv8DCDYQABoMNjM3NDIzMTgzODA1IgzkMoE8GVETP9cbt7Yq3AMXsdDHDdGtl6Y7hYhIhtzCGXcIGErzkY%2BFlzvNOdUuQ6YFBA8mWcRRs8LBybQeiZRxkb25NB5fKxMm79GgyOJt2mC%2BeyXdfsqImq3WkZ%2F0f4t5cHOdMUytf%2F7ds6ca6VWoB22sijPTA8NZ2PYvdgmGU5EL1xVGxGLwQ7tDeWmhEv4l3Z2Ox6OiwyZ6hgMUm1lCjvCw6dDtAb1y%2FFkH%2BTQxbteDcDyXePwHapzRnQTwpi%2BVvCzIuOIN3xCAZQeFGYVMd5VzXOLpLzJtZbdkXR2qBhYuIs%2B1oHtUjxH8jNuytm6npLunerVvP3f0IUh%2BkfsQwGQCAp%2FTNgJ5%2FvmvvMx3biBL2bQQrSljRiIbaTlNEiqXpW7bUpPEupNvTmOxtbqhWE4dKgr8nZUEFyy%2BcjOja%2F3oiBpffuU%2B1coibwPr2sSiRwMpw1F%2BqgX%2B93Nh7Ac%2FMYiwUFK9Dx2NF1QIojXsawoQ4J2A5wtdSNIeslF7VnRhPTmYrlYpDRkfR2qWurqGLG28FeQtX3fmjkFx0wwRDKOLCa6jWFvtP6beKExJKmsb7dX1%2BkqHupOwCdcuX1zNCoV5amfKOAGCaoPtkrwXy0hs2ETTb7sWYQjEe1IUJSkk%2BW6%2F%2B43JS4TXOjDCgbfRBjqkAWtk%2Fl%2FwCCWPRCJ7hyqrXALxPTB6IVoH5qhKfs9cZ2LjHfleUjfMb6VVIZxyuzH5T2%2FoMt%2BohTH3RaixVNY4cLfWV4v2g5gULeOY9FVFGiPrxXmS2Lll1Vx61F949up9YoL%2Byyd6EhknyLca5BUbZxMaByo5a1%2B%2BYRPAJcgtHl5sRElo8EOyQoj1lSx66PgzetBvm8OXU7WGNoD3oYibofFAhbah&X-Amz-Signature=c69f5a2e244695c725882dfdfc03e4b2f3cc1d3044277c14403db0970332f72c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
