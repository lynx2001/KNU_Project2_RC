# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NUWYEHL%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T230215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGX%2BjjvhnOFOT4QJ2LrBZ5ZxAS%2FemVwAqi4Wgqe6n5XZAiAUpeLmqh5D22sJLZ4d1TVZCEZ4xMbEEzDPw26OdfGHSSqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv%2FSQ%2B2jEHc9%2Byt40KtwDAzWuR%2FNEWbDmXD59TnR9jW27pP8xxp05eDaeH6CJSgvrmXT4fgiP7xaSSodaNDnXuCh4RJqPUFoiDDwMY7x5d4QkoUnYMQpPfaQroE71Ky3jxCx%2FeYskRLSdXcjAZBjvtgxWDf1f0XJ4Jz6s%2BFnwNf%2FQcEr7Nxd4e5Tn65WROmXRVBHH9oVglI8yn8m01%2B%2FqQ32t3Hw%2F3ZA0ihSXuL1t5b4cKdeUlu5hTEof8s5TnBGsIwqhx2ky%2FM%2BTy4AdT5Ql%2BBLWeSNuMawPI3ydXAUHEtRyokYbqGK7owPAVrtE5H99r4a3gPbHKeVCrNbMe7JgVgLuLn8WQgP4wMKAN%2FGaJzXxMAEn7I4FhRz7xIh7qmo0CK9fGfGhhGZ1SXR8eFJhangWvJHX55jKhxOu9H2G91s%2B3UqrccHioKH4RCBfY0vRnmLZXqMK0Jnpe8Tl4ltpkjSplEjVQVo%2B36%2FV9C9af%2FSU35EzlI04kY18uwIlXko1Sq6t0NYtzXf%2FbilduDlqDTYHgiO%2Bn7dMn8gzh%2B9MmHuAyluL%2Bsw8Tt6yUhAoLmixtAAYjPUeglhNhVFDlaEQx%2FNLml9bbZW5UXqbYUHhl65Z%2BvT6mmi8TvBf9zK6qIG3GIqURnoGTtg9Viswgr%2FR0QY6pgFBzl0i8%2FTkpnYhUbQF0mGs3a14ZeIF43ReNtjPDJvyueUjPLJkKsjRbcNQ%2FaIFBdWo%2BpJ5Zh8P6LauxjCXGR%2FIT189MLUpoY1iNCIv%2FaXyPMLIj9qcl7koSrwy391U%2FEoY%2BC84FRBqxzGNHT2i7gn3it0rzphLSokzGmeExzAw1e2g2lMbcjlN0gJX6O66FU6gHB6BYOjlGSnTEMHG58KYTecZcIo%2F&X-Amz-Signature=b2c94721fefd246cfe057839ae74b6305963c00aff835a4ffcfb1dc3c89ab768&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NUWYEHL%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T230215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGX%2BjjvhnOFOT4QJ2LrBZ5ZxAS%2FemVwAqi4Wgqe6n5XZAiAUpeLmqh5D22sJLZ4d1TVZCEZ4xMbEEzDPw26OdfGHSSqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv%2FSQ%2B2jEHc9%2Byt40KtwDAzWuR%2FNEWbDmXD59TnR9jW27pP8xxp05eDaeH6CJSgvrmXT4fgiP7xaSSodaNDnXuCh4RJqPUFoiDDwMY7x5d4QkoUnYMQpPfaQroE71Ky3jxCx%2FeYskRLSdXcjAZBjvtgxWDf1f0XJ4Jz6s%2BFnwNf%2FQcEr7Nxd4e5Tn65WROmXRVBHH9oVglI8yn8m01%2B%2FqQ32t3Hw%2F3ZA0ihSXuL1t5b4cKdeUlu5hTEof8s5TnBGsIwqhx2ky%2FM%2BTy4AdT5Ql%2BBLWeSNuMawPI3ydXAUHEtRyokYbqGK7owPAVrtE5H99r4a3gPbHKeVCrNbMe7JgVgLuLn8WQgP4wMKAN%2FGaJzXxMAEn7I4FhRz7xIh7qmo0CK9fGfGhhGZ1SXR8eFJhangWvJHX55jKhxOu9H2G91s%2B3UqrccHioKH4RCBfY0vRnmLZXqMK0Jnpe8Tl4ltpkjSplEjVQVo%2B36%2FV9C9af%2FSU35EzlI04kY18uwIlXko1Sq6t0NYtzXf%2FbilduDlqDTYHgiO%2Bn7dMn8gzh%2B9MmHuAyluL%2Bsw8Tt6yUhAoLmixtAAYjPUeglhNhVFDlaEQx%2FNLml9bbZW5UXqbYUHhl65Z%2BvT6mmi8TvBf9zK6qIG3GIqURnoGTtg9Viswgr%2FR0QY6pgFBzl0i8%2FTkpnYhUbQF0mGs3a14ZeIF43ReNtjPDJvyueUjPLJkKsjRbcNQ%2FaIFBdWo%2BpJ5Zh8P6LauxjCXGR%2FIT189MLUpoY1iNCIv%2FaXyPMLIj9qcl7koSrwy391U%2FEoY%2BC84FRBqxzGNHT2i7gn3it0rzphLSokzGmeExzAw1e2g2lMbcjlN0gJX6O66FU6gHB6BYOjlGSnTEMHG58KYTecZcIo%2F&X-Amz-Signature=6ecd9be195ce6a6049b0a2a407a5cbe747d55d7bafbc604cd3fde828c99ac463&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NUWYEHL%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T230215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGX%2BjjvhnOFOT4QJ2LrBZ5ZxAS%2FemVwAqi4Wgqe6n5XZAiAUpeLmqh5D22sJLZ4d1TVZCEZ4xMbEEzDPw26OdfGHSSqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv%2FSQ%2B2jEHc9%2Byt40KtwDAzWuR%2FNEWbDmXD59TnR9jW27pP8xxp05eDaeH6CJSgvrmXT4fgiP7xaSSodaNDnXuCh4RJqPUFoiDDwMY7x5d4QkoUnYMQpPfaQroE71Ky3jxCx%2FeYskRLSdXcjAZBjvtgxWDf1f0XJ4Jz6s%2BFnwNf%2FQcEr7Nxd4e5Tn65WROmXRVBHH9oVglI8yn8m01%2B%2FqQ32t3Hw%2F3ZA0ihSXuL1t5b4cKdeUlu5hTEof8s5TnBGsIwqhx2ky%2FM%2BTy4AdT5Ql%2BBLWeSNuMawPI3ydXAUHEtRyokYbqGK7owPAVrtE5H99r4a3gPbHKeVCrNbMe7JgVgLuLn8WQgP4wMKAN%2FGaJzXxMAEn7I4FhRz7xIh7qmo0CK9fGfGhhGZ1SXR8eFJhangWvJHX55jKhxOu9H2G91s%2B3UqrccHioKH4RCBfY0vRnmLZXqMK0Jnpe8Tl4ltpkjSplEjVQVo%2B36%2FV9C9af%2FSU35EzlI04kY18uwIlXko1Sq6t0NYtzXf%2FbilduDlqDTYHgiO%2Bn7dMn8gzh%2B9MmHuAyluL%2Bsw8Tt6yUhAoLmixtAAYjPUeglhNhVFDlaEQx%2FNLml9bbZW5UXqbYUHhl65Z%2BvT6mmi8TvBf9zK6qIG3GIqURnoGTtg9Viswgr%2FR0QY6pgFBzl0i8%2FTkpnYhUbQF0mGs3a14ZeIF43ReNtjPDJvyueUjPLJkKsjRbcNQ%2FaIFBdWo%2BpJ5Zh8P6LauxjCXGR%2FIT189MLUpoY1iNCIv%2FaXyPMLIj9qcl7koSrwy391U%2FEoY%2BC84FRBqxzGNHT2i7gn3it0rzphLSokzGmeExzAw1e2g2lMbcjlN0gJX6O66FU6gHB6BYOjlGSnTEMHG58KYTecZcIo%2F&X-Amz-Signature=9488c60b5423a46517fc8b4f9c49878cb61528d2ef34a75ec1a352995317bdfa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NUWYEHL%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T230215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGX%2BjjvhnOFOT4QJ2LrBZ5ZxAS%2FemVwAqi4Wgqe6n5XZAiAUpeLmqh5D22sJLZ4d1TVZCEZ4xMbEEzDPw26OdfGHSSqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv%2FSQ%2B2jEHc9%2Byt40KtwDAzWuR%2FNEWbDmXD59TnR9jW27pP8xxp05eDaeH6CJSgvrmXT4fgiP7xaSSodaNDnXuCh4RJqPUFoiDDwMY7x5d4QkoUnYMQpPfaQroE71Ky3jxCx%2FeYskRLSdXcjAZBjvtgxWDf1f0XJ4Jz6s%2BFnwNf%2FQcEr7Nxd4e5Tn65WROmXRVBHH9oVglI8yn8m01%2B%2FqQ32t3Hw%2F3ZA0ihSXuL1t5b4cKdeUlu5hTEof8s5TnBGsIwqhx2ky%2FM%2BTy4AdT5Ql%2BBLWeSNuMawPI3ydXAUHEtRyokYbqGK7owPAVrtE5H99r4a3gPbHKeVCrNbMe7JgVgLuLn8WQgP4wMKAN%2FGaJzXxMAEn7I4FhRz7xIh7qmo0CK9fGfGhhGZ1SXR8eFJhangWvJHX55jKhxOu9H2G91s%2B3UqrccHioKH4RCBfY0vRnmLZXqMK0Jnpe8Tl4ltpkjSplEjVQVo%2B36%2FV9C9af%2FSU35EzlI04kY18uwIlXko1Sq6t0NYtzXf%2FbilduDlqDTYHgiO%2Bn7dMn8gzh%2B9MmHuAyluL%2Bsw8Tt6yUhAoLmixtAAYjPUeglhNhVFDlaEQx%2FNLml9bbZW5UXqbYUHhl65Z%2BvT6mmi8TvBf9zK6qIG3GIqURnoGTtg9Viswgr%2FR0QY6pgFBzl0i8%2FTkpnYhUbQF0mGs3a14ZeIF43ReNtjPDJvyueUjPLJkKsjRbcNQ%2FaIFBdWo%2BpJ5Zh8P6LauxjCXGR%2FIT189MLUpoY1iNCIv%2FaXyPMLIj9qcl7koSrwy391U%2FEoY%2BC84FRBqxzGNHT2i7gn3it0rzphLSokzGmeExzAw1e2g2lMbcjlN0gJX6O66FU6gHB6BYOjlGSnTEMHG58KYTecZcIo%2F&X-Amz-Signature=20eea9b3ff8e03023742a0a65c51c81173ff4ff3b5fe4385ae781cd0b32dfb0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4662NUWYEHL%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T230215Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIGX%2BjjvhnOFOT4QJ2LrBZ5ZxAS%2FemVwAqi4Wgqe6n5XZAiAUpeLmqh5D22sJLZ4d1TVZCEZ4xMbEEzDPw26OdfGHSSqIBAiu%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMv%2FSQ%2B2jEHc9%2Byt40KtwDAzWuR%2FNEWbDmXD59TnR9jW27pP8xxp05eDaeH6CJSgvrmXT4fgiP7xaSSodaNDnXuCh4RJqPUFoiDDwMY7x5d4QkoUnYMQpPfaQroE71Ky3jxCx%2FeYskRLSdXcjAZBjvtgxWDf1f0XJ4Jz6s%2BFnwNf%2FQcEr7Nxd4e5Tn65WROmXRVBHH9oVglI8yn8m01%2B%2FqQ32t3Hw%2F3ZA0ihSXuL1t5b4cKdeUlu5hTEof8s5TnBGsIwqhx2ky%2FM%2BTy4AdT5Ql%2BBLWeSNuMawPI3ydXAUHEtRyokYbqGK7owPAVrtE5H99r4a3gPbHKeVCrNbMe7JgVgLuLn8WQgP4wMKAN%2FGaJzXxMAEn7I4FhRz7xIh7qmo0CK9fGfGhhGZ1SXR8eFJhangWvJHX55jKhxOu9H2G91s%2B3UqrccHioKH4RCBfY0vRnmLZXqMK0Jnpe8Tl4ltpkjSplEjVQVo%2B36%2FV9C9af%2FSU35EzlI04kY18uwIlXko1Sq6t0NYtzXf%2FbilduDlqDTYHgiO%2Bn7dMn8gzh%2B9MmHuAyluL%2Bsw8Tt6yUhAoLmixtAAYjPUeglhNhVFDlaEQx%2FNLml9bbZW5UXqbYUHhl65Z%2BvT6mmi8TvBf9zK6qIG3GIqURnoGTtg9Viswgr%2FR0QY6pgFBzl0i8%2FTkpnYhUbQF0mGs3a14ZeIF43ReNtjPDJvyueUjPLJkKsjRbcNQ%2FaIFBdWo%2BpJ5Zh8P6LauxjCXGR%2FIT189MLUpoY1iNCIv%2FaXyPMLIj9qcl7koSrwy391U%2FEoY%2BC84FRBqxzGNHT2i7gn3it0rzphLSokzGmeExzAw1e2g2lMbcjlN0gJX6O66FU6gHB6BYOjlGSnTEMHG58KYTecZcIo%2F&X-Amz-Signature=9f1b2a593cd80a43b09ef2c0836574efdbfdce9a12a7ad66df2a608fa1d6a458&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
