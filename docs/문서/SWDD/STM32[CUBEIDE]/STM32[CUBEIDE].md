# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RQC4HLI3%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T221005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB6xYD%2BnXQtr7BJZKoxLdwiynZSXkWp48e7WsdNXSIXAIhAPKOWadMI%2FSDAlDw1tOwhyvgYCrK3XvhJ9f5TZm755NiKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVCBF6CtESIzASaMoq3AN3ry4NxMgft3gJQ24h%2BAXH3gWHu%2FbxAAYQQjsRiXFSRjKNWgLlREniBsnUjGcAbVuQsioksviDzGUZhQ%2BHQfBbwB%2B%2BlQXqNEiRD5dHOMFnv4Ox1LdLpaBsi08ucRVPLJYLQYRzRStfQ9QmeSld8RaUjrnf34h%2B2zBPirW3hWynGtRuTBcp3gmQcXEe3yKLbKS3gCgCnkpsMq3x%2BzmmDlJsBJ1CWBS5qeBpTOlpggZ9VxzqMN1YB9o7N8zvMpe%2FlU6tk65XeD8QrnerWygdTBZKh3mWbf%2B04Dw8cwDGPkvX%2F2trRQjhhDF1SlDvj5%2BOb09eeMuXONqVB4Xel3SZjtpOnkNIovo7JySB1dslx%2BzS10KTF7LvTXOvsQm8cvXIppKTEP3R%2Bu2xFGuyKdqUElXiND8C%2BinnHxZtREvUeBBishMyGp%2BHyW%2Fl%2FpXCSDZ8%2Bdod8rixGkHjlk%2BJ9inPPgvHmqSHa8jPlqd8KUCdrzYiOgpuZZjTP%2Bpm2saSp6kwJQQPuofjL4m0hCrRr7hfXxdTu3Orj5lpN4LRfgOTWpSc2Z%2BYiGZYRjWAbV7PhE09%2B1qfMXtpeRTtc4yI5NCTHGdGz2NMiPG03GiypoOeOI813H9me5APqm2oL3Gd%2BDC%2BiZLRBjqkAd1Or%2BQVNKVYa%2Bwl9ENwwrwvam5MGC%2BW42G5mODrZ3xAe2ht8JT6c9%2FNbL3z4bU4d9kMo9GD73lDFRREiQN4syMZIagPHTb7dIvyOy7bs8TFKHEQD3GEYr34o41aOqZALZU%2FPcKLmPYbRkHgYsOa%2F%2B9DyuWwdYcIy%2BAMgVOCI3XjTH6BHhc914QAQDJ02TXNn1TKurw2u5Ai46GuKioO%2FDA6LGRO&X-Amz-Signature=34cb2814798a6002df0926b015e1b98a6e6f428d80beac68bad15c5c3e6465ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RQC4HLI3%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T221005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB6xYD%2BnXQtr7BJZKoxLdwiynZSXkWp48e7WsdNXSIXAIhAPKOWadMI%2FSDAlDw1tOwhyvgYCrK3XvhJ9f5TZm755NiKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVCBF6CtESIzASaMoq3AN3ry4NxMgft3gJQ24h%2BAXH3gWHu%2FbxAAYQQjsRiXFSRjKNWgLlREniBsnUjGcAbVuQsioksviDzGUZhQ%2BHQfBbwB%2B%2BlQXqNEiRD5dHOMFnv4Ox1LdLpaBsi08ucRVPLJYLQYRzRStfQ9QmeSld8RaUjrnf34h%2B2zBPirW3hWynGtRuTBcp3gmQcXEe3yKLbKS3gCgCnkpsMq3x%2BzmmDlJsBJ1CWBS5qeBpTOlpggZ9VxzqMN1YB9o7N8zvMpe%2FlU6tk65XeD8QrnerWygdTBZKh3mWbf%2B04Dw8cwDGPkvX%2F2trRQjhhDF1SlDvj5%2BOb09eeMuXONqVB4Xel3SZjtpOnkNIovo7JySB1dslx%2BzS10KTF7LvTXOvsQm8cvXIppKTEP3R%2Bu2xFGuyKdqUElXiND8C%2BinnHxZtREvUeBBishMyGp%2BHyW%2Fl%2FpXCSDZ8%2Bdod8rixGkHjlk%2BJ9inPPgvHmqSHa8jPlqd8KUCdrzYiOgpuZZjTP%2Bpm2saSp6kwJQQPuofjL4m0hCrRr7hfXxdTu3Orj5lpN4LRfgOTWpSc2Z%2BYiGZYRjWAbV7PhE09%2B1qfMXtpeRTtc4yI5NCTHGdGz2NMiPG03GiypoOeOI813H9me5APqm2oL3Gd%2BDC%2BiZLRBjqkAd1Or%2BQVNKVYa%2Bwl9ENwwrwvam5MGC%2BW42G5mODrZ3xAe2ht8JT6c9%2FNbL3z4bU4d9kMo9GD73lDFRREiQN4syMZIagPHTb7dIvyOy7bs8TFKHEQD3GEYr34o41aOqZALZU%2FPcKLmPYbRkHgYsOa%2F%2B9DyuWwdYcIy%2BAMgVOCI3XjTH6BHhc914QAQDJ02TXNn1TKurw2u5Ai46GuKioO%2FDA6LGRO&X-Amz-Signature=14a88c1331dc5e65ed8f312fce19da5e82930aef161da15d1f2914805691e7b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RQC4HLI3%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T221005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB6xYD%2BnXQtr7BJZKoxLdwiynZSXkWp48e7WsdNXSIXAIhAPKOWadMI%2FSDAlDw1tOwhyvgYCrK3XvhJ9f5TZm755NiKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVCBF6CtESIzASaMoq3AN3ry4NxMgft3gJQ24h%2BAXH3gWHu%2FbxAAYQQjsRiXFSRjKNWgLlREniBsnUjGcAbVuQsioksviDzGUZhQ%2BHQfBbwB%2B%2BlQXqNEiRD5dHOMFnv4Ox1LdLpaBsi08ucRVPLJYLQYRzRStfQ9QmeSld8RaUjrnf34h%2B2zBPirW3hWynGtRuTBcp3gmQcXEe3yKLbKS3gCgCnkpsMq3x%2BzmmDlJsBJ1CWBS5qeBpTOlpggZ9VxzqMN1YB9o7N8zvMpe%2FlU6tk65XeD8QrnerWygdTBZKh3mWbf%2B04Dw8cwDGPkvX%2F2trRQjhhDF1SlDvj5%2BOb09eeMuXONqVB4Xel3SZjtpOnkNIovo7JySB1dslx%2BzS10KTF7LvTXOvsQm8cvXIppKTEP3R%2Bu2xFGuyKdqUElXiND8C%2BinnHxZtREvUeBBishMyGp%2BHyW%2Fl%2FpXCSDZ8%2Bdod8rixGkHjlk%2BJ9inPPgvHmqSHa8jPlqd8KUCdrzYiOgpuZZjTP%2Bpm2saSp6kwJQQPuofjL4m0hCrRr7hfXxdTu3Orj5lpN4LRfgOTWpSc2Z%2BYiGZYRjWAbV7PhE09%2B1qfMXtpeRTtc4yI5NCTHGdGz2NMiPG03GiypoOeOI813H9me5APqm2oL3Gd%2BDC%2BiZLRBjqkAd1Or%2BQVNKVYa%2Bwl9ENwwrwvam5MGC%2BW42G5mODrZ3xAe2ht8JT6c9%2FNbL3z4bU4d9kMo9GD73lDFRREiQN4syMZIagPHTb7dIvyOy7bs8TFKHEQD3GEYr34o41aOqZALZU%2FPcKLmPYbRkHgYsOa%2F%2B9DyuWwdYcIy%2BAMgVOCI3XjTH6BHhc914QAQDJ02TXNn1TKurw2u5Ai46GuKioO%2FDA6LGRO&X-Amz-Signature=9b01744b4b1f81de2c60b00578dfed736de51cc7037a8a785e81089e70ab928a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RQC4HLI3%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T221005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB6xYD%2BnXQtr7BJZKoxLdwiynZSXkWp48e7WsdNXSIXAIhAPKOWadMI%2FSDAlDw1tOwhyvgYCrK3XvhJ9f5TZm755NiKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVCBF6CtESIzASaMoq3AN3ry4NxMgft3gJQ24h%2BAXH3gWHu%2FbxAAYQQjsRiXFSRjKNWgLlREniBsnUjGcAbVuQsioksviDzGUZhQ%2BHQfBbwB%2B%2BlQXqNEiRD5dHOMFnv4Ox1LdLpaBsi08ucRVPLJYLQYRzRStfQ9QmeSld8RaUjrnf34h%2B2zBPirW3hWynGtRuTBcp3gmQcXEe3yKLbKS3gCgCnkpsMq3x%2BzmmDlJsBJ1CWBS5qeBpTOlpggZ9VxzqMN1YB9o7N8zvMpe%2FlU6tk65XeD8QrnerWygdTBZKh3mWbf%2B04Dw8cwDGPkvX%2F2trRQjhhDF1SlDvj5%2BOb09eeMuXONqVB4Xel3SZjtpOnkNIovo7JySB1dslx%2BzS10KTF7LvTXOvsQm8cvXIppKTEP3R%2Bu2xFGuyKdqUElXiND8C%2BinnHxZtREvUeBBishMyGp%2BHyW%2Fl%2FpXCSDZ8%2Bdod8rixGkHjlk%2BJ9inPPgvHmqSHa8jPlqd8KUCdrzYiOgpuZZjTP%2Bpm2saSp6kwJQQPuofjL4m0hCrRr7hfXxdTu3Orj5lpN4LRfgOTWpSc2Z%2BYiGZYRjWAbV7PhE09%2B1qfMXtpeRTtc4yI5NCTHGdGz2NMiPG03GiypoOeOI813H9me5APqm2oL3Gd%2BDC%2BiZLRBjqkAd1Or%2BQVNKVYa%2Bwl9ENwwrwvam5MGC%2BW42G5mODrZ3xAe2ht8JT6c9%2FNbL3z4bU4d9kMo9GD73lDFRREiQN4syMZIagPHTb7dIvyOy7bs8TFKHEQD3GEYr34o41aOqZALZU%2FPcKLmPYbRkHgYsOa%2F%2B9DyuWwdYcIy%2BAMgVOCI3XjTH6BHhc914QAQDJ02TXNn1TKurw2u5Ai46GuKioO%2FDA6LGRO&X-Amz-Signature=6c6124d4ec92905cde5bff76fc477f09ed729260a3e23b3a8192bd68a11af11b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RQC4HLI3%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T221005Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCB6xYD%2BnXQtr7BJZKoxLdwiynZSXkWp48e7WsdNXSIXAIhAPKOWadMI%2FSDAlDw1tOwhyvgYCrK3XvhJ9f5TZm755NiKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxVCBF6CtESIzASaMoq3AN3ry4NxMgft3gJQ24h%2BAXH3gWHu%2FbxAAYQQjsRiXFSRjKNWgLlREniBsnUjGcAbVuQsioksviDzGUZhQ%2BHQfBbwB%2B%2BlQXqNEiRD5dHOMFnv4Ox1LdLpaBsi08ucRVPLJYLQYRzRStfQ9QmeSld8RaUjrnf34h%2B2zBPirW3hWynGtRuTBcp3gmQcXEe3yKLbKS3gCgCnkpsMq3x%2BzmmDlJsBJ1CWBS5qeBpTOlpggZ9VxzqMN1YB9o7N8zvMpe%2FlU6tk65XeD8QrnerWygdTBZKh3mWbf%2B04Dw8cwDGPkvX%2F2trRQjhhDF1SlDvj5%2BOb09eeMuXONqVB4Xel3SZjtpOnkNIovo7JySB1dslx%2BzS10KTF7LvTXOvsQm8cvXIppKTEP3R%2Bu2xFGuyKdqUElXiND8C%2BinnHxZtREvUeBBishMyGp%2BHyW%2Fl%2FpXCSDZ8%2Bdod8rixGkHjlk%2BJ9inPPgvHmqSHa8jPlqd8KUCdrzYiOgpuZZjTP%2Bpm2saSp6kwJQQPuofjL4m0hCrRr7hfXxdTu3Orj5lpN4LRfgOTWpSc2Z%2BYiGZYRjWAbV7PhE09%2B1qfMXtpeRTtc4yI5NCTHGdGz2NMiPG03GiypoOeOI813H9me5APqm2oL3Gd%2BDC%2BiZLRBjqkAd1Or%2BQVNKVYa%2Bwl9ENwwrwvam5MGC%2BW42G5mODrZ3xAe2ht8JT6c9%2FNbL3z4bU4d9kMo9GD73lDFRREiQN4syMZIagPHTb7dIvyOy7bs8TFKHEQD3GEYr34o41aOqZALZU%2FPcKLmPYbRkHgYsOa%2F%2B9DyuWwdYcIy%2BAMgVOCI3XjTH6BHhc914QAQDJ02TXNn1TKurw2u5Ai46GuKioO%2FDA6LGRO&X-Amz-Signature=986dca8cfeb1cc17a34ea14b55e78e48e41147c344f21d8cac570df0f952d5e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
