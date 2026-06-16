# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q23DGOIW%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T230243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXFhTHohboyiAh%2BDG%2BqYrApBc2EGpQHII%2BUsYITcevHwIhANAayDgRNoRvcpLh5YYjqiKbqbydR0mOTgxSbTiPlnjpKv8DCH8QABoMNjM3NDIzMTgzODA1Igyp%2F5%2BluGMVQRY77Mcq3AMEFqiBq0RdNv8%2FzeQCeEiHW8MwpLDFWER30wcipXlU%2BAWlqzN0sAeU6FJauGOxF3kme2jbV0Hxi14QhoyK3Nb5Z2R6fqckX5ChPYhdKfEpFqPfRPs%2Bb9XLoCKs9RFrcgpVqQ9THaD%2F24PNpJZ41EDaNIpPZynqbBso4oBfXi6jWXQCAl8FE5YgMl%2FLb3fo6WytRni3IhV3qay2F9e2yGtojwlR2vdpjl3MfTl54RtSKreTqQHATzUYGKov%2BGT1aLHcFRNI36mCqChjkd9wqeBV54cHAdwqI3DILMCsz0DezZ8ygqwOc8UxoApO9Wq5e1lGLTnI85AgiVQZLmWc3XGrOr1T7BPkCzkZF1fgE6HCbBXeqPAEcGeW%2F3HRQ%2FcFCw%2FRVtGolMxFYF3jKhAxQUeqcGcZkrughwwT02YGKzolcHlbEo%2FGddeeCxTOOynCElB6GEJG26VQBn4AULFVAqRZ%2FdRC%2FT677TH6J2WClvL5p7VpPJsn7EjUK9Hw%2FWo%2FouFxyIEl%2FsSBj0FNnZHvxTTepcPj9R1Z8b5CwkcmXAdyiGOk6XPlAvHUllYalLR8gjQjpVKoHzGc181dDOsLRf5iwr7EMeZX6kMsDOAY6bMYaZvGMBF%2BhZN1k5%2B6XDCOmsfRBjqkAR%2BZWW3w0170kWeHiChnFogg%2FyuByOmJaiIf71r%2BJy8DluFKWpdWgLM011pBTF1QNwUyxCCxpk9l6V4ttKlz30YqJwk9hsfltLUOb1vQEWjFeqRJDaefBTM5sNQK%2BStpqvEbtG%2F2h02ypH9oqLvah%2BCouBXhqhPSWkfcks2q4N49FIZf6nJbQoI14nSDKzeCIs4dw5sFYvV3LjHZOiOVqTDhgjSK&X-Amz-Signature=73677546296eeea588e381c51f6551d48799055681eaa280cd23a61b93c15c1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q23DGOIW%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T230243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXFhTHohboyiAh%2BDG%2BqYrApBc2EGpQHII%2BUsYITcevHwIhANAayDgRNoRvcpLh5YYjqiKbqbydR0mOTgxSbTiPlnjpKv8DCH8QABoMNjM3NDIzMTgzODA1Igyp%2F5%2BluGMVQRY77Mcq3AMEFqiBq0RdNv8%2FzeQCeEiHW8MwpLDFWER30wcipXlU%2BAWlqzN0sAeU6FJauGOxF3kme2jbV0Hxi14QhoyK3Nb5Z2R6fqckX5ChPYhdKfEpFqPfRPs%2Bb9XLoCKs9RFrcgpVqQ9THaD%2F24PNpJZ41EDaNIpPZynqbBso4oBfXi6jWXQCAl8FE5YgMl%2FLb3fo6WytRni3IhV3qay2F9e2yGtojwlR2vdpjl3MfTl54RtSKreTqQHATzUYGKov%2BGT1aLHcFRNI36mCqChjkd9wqeBV54cHAdwqI3DILMCsz0DezZ8ygqwOc8UxoApO9Wq5e1lGLTnI85AgiVQZLmWc3XGrOr1T7BPkCzkZF1fgE6HCbBXeqPAEcGeW%2F3HRQ%2FcFCw%2FRVtGolMxFYF3jKhAxQUeqcGcZkrughwwT02YGKzolcHlbEo%2FGddeeCxTOOynCElB6GEJG26VQBn4AULFVAqRZ%2FdRC%2FT677TH6J2WClvL5p7VpPJsn7EjUK9Hw%2FWo%2FouFxyIEl%2FsSBj0FNnZHvxTTepcPj9R1Z8b5CwkcmXAdyiGOk6XPlAvHUllYalLR8gjQjpVKoHzGc181dDOsLRf5iwr7EMeZX6kMsDOAY6bMYaZvGMBF%2BhZN1k5%2B6XDCOmsfRBjqkAR%2BZWW3w0170kWeHiChnFogg%2FyuByOmJaiIf71r%2BJy8DluFKWpdWgLM011pBTF1QNwUyxCCxpk9l6V4ttKlz30YqJwk9hsfltLUOb1vQEWjFeqRJDaefBTM5sNQK%2BStpqvEbtG%2F2h02ypH9oqLvah%2BCouBXhqhPSWkfcks2q4N49FIZf6nJbQoI14nSDKzeCIs4dw5sFYvV3LjHZOiOVqTDhgjSK&X-Amz-Signature=1ad1a41d399a26fd7f59c97c4d89d19fe49f05bf50f62e84cc1f6269bcdcf275&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q23DGOIW%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T230243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXFhTHohboyiAh%2BDG%2BqYrApBc2EGpQHII%2BUsYITcevHwIhANAayDgRNoRvcpLh5YYjqiKbqbydR0mOTgxSbTiPlnjpKv8DCH8QABoMNjM3NDIzMTgzODA1Igyp%2F5%2BluGMVQRY77Mcq3AMEFqiBq0RdNv8%2FzeQCeEiHW8MwpLDFWER30wcipXlU%2BAWlqzN0sAeU6FJauGOxF3kme2jbV0Hxi14QhoyK3Nb5Z2R6fqckX5ChPYhdKfEpFqPfRPs%2Bb9XLoCKs9RFrcgpVqQ9THaD%2F24PNpJZ41EDaNIpPZynqbBso4oBfXi6jWXQCAl8FE5YgMl%2FLb3fo6WytRni3IhV3qay2F9e2yGtojwlR2vdpjl3MfTl54RtSKreTqQHATzUYGKov%2BGT1aLHcFRNI36mCqChjkd9wqeBV54cHAdwqI3DILMCsz0DezZ8ygqwOc8UxoApO9Wq5e1lGLTnI85AgiVQZLmWc3XGrOr1T7BPkCzkZF1fgE6HCbBXeqPAEcGeW%2F3HRQ%2FcFCw%2FRVtGolMxFYF3jKhAxQUeqcGcZkrughwwT02YGKzolcHlbEo%2FGddeeCxTOOynCElB6GEJG26VQBn4AULFVAqRZ%2FdRC%2FT677TH6J2WClvL5p7VpPJsn7EjUK9Hw%2FWo%2FouFxyIEl%2FsSBj0FNnZHvxTTepcPj9R1Z8b5CwkcmXAdyiGOk6XPlAvHUllYalLR8gjQjpVKoHzGc181dDOsLRf5iwr7EMeZX6kMsDOAY6bMYaZvGMBF%2BhZN1k5%2B6XDCOmsfRBjqkAR%2BZWW3w0170kWeHiChnFogg%2FyuByOmJaiIf71r%2BJy8DluFKWpdWgLM011pBTF1QNwUyxCCxpk9l6V4ttKlz30YqJwk9hsfltLUOb1vQEWjFeqRJDaefBTM5sNQK%2BStpqvEbtG%2F2h02ypH9oqLvah%2BCouBXhqhPSWkfcks2q4N49FIZf6nJbQoI14nSDKzeCIs4dw5sFYvV3LjHZOiOVqTDhgjSK&X-Amz-Signature=8d5b9af6d8b4e74a7764d3d07bf0e1fb058ab0edfb841e6ad4c887ceaffdca65&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q23DGOIW%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T230243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXFhTHohboyiAh%2BDG%2BqYrApBc2EGpQHII%2BUsYITcevHwIhANAayDgRNoRvcpLh5YYjqiKbqbydR0mOTgxSbTiPlnjpKv8DCH8QABoMNjM3NDIzMTgzODA1Igyp%2F5%2BluGMVQRY77Mcq3AMEFqiBq0RdNv8%2FzeQCeEiHW8MwpLDFWER30wcipXlU%2BAWlqzN0sAeU6FJauGOxF3kme2jbV0Hxi14QhoyK3Nb5Z2R6fqckX5ChPYhdKfEpFqPfRPs%2Bb9XLoCKs9RFrcgpVqQ9THaD%2F24PNpJZ41EDaNIpPZynqbBso4oBfXi6jWXQCAl8FE5YgMl%2FLb3fo6WytRni3IhV3qay2F9e2yGtojwlR2vdpjl3MfTl54RtSKreTqQHATzUYGKov%2BGT1aLHcFRNI36mCqChjkd9wqeBV54cHAdwqI3DILMCsz0DezZ8ygqwOc8UxoApO9Wq5e1lGLTnI85AgiVQZLmWc3XGrOr1T7BPkCzkZF1fgE6HCbBXeqPAEcGeW%2F3HRQ%2FcFCw%2FRVtGolMxFYF3jKhAxQUeqcGcZkrughwwT02YGKzolcHlbEo%2FGddeeCxTOOynCElB6GEJG26VQBn4AULFVAqRZ%2FdRC%2FT677TH6J2WClvL5p7VpPJsn7EjUK9Hw%2FWo%2FouFxyIEl%2FsSBj0FNnZHvxTTepcPj9R1Z8b5CwkcmXAdyiGOk6XPlAvHUllYalLR8gjQjpVKoHzGc181dDOsLRf5iwr7EMeZX6kMsDOAY6bMYaZvGMBF%2BhZN1k5%2B6XDCOmsfRBjqkAR%2BZWW3w0170kWeHiChnFogg%2FyuByOmJaiIf71r%2BJy8DluFKWpdWgLM011pBTF1QNwUyxCCxpk9l6V4ttKlz30YqJwk9hsfltLUOb1vQEWjFeqRJDaefBTM5sNQK%2BStpqvEbtG%2F2h02ypH9oqLvah%2BCouBXhqhPSWkfcks2q4N49FIZf6nJbQoI14nSDKzeCIs4dw5sFYvV3LjHZOiOVqTDhgjSK&X-Amz-Signature=e9ecf9d9a5e673f9697cf4cf527f25212b7ef2d8305316bb261060a24d8f8551&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466Q23DGOIW%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T230243Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCXFhTHohboyiAh%2BDG%2BqYrApBc2EGpQHII%2BUsYITcevHwIhANAayDgRNoRvcpLh5YYjqiKbqbydR0mOTgxSbTiPlnjpKv8DCH8QABoMNjM3NDIzMTgzODA1Igyp%2F5%2BluGMVQRY77Mcq3AMEFqiBq0RdNv8%2FzeQCeEiHW8MwpLDFWER30wcipXlU%2BAWlqzN0sAeU6FJauGOxF3kme2jbV0Hxi14QhoyK3Nb5Z2R6fqckX5ChPYhdKfEpFqPfRPs%2Bb9XLoCKs9RFrcgpVqQ9THaD%2F24PNpJZ41EDaNIpPZynqbBso4oBfXi6jWXQCAl8FE5YgMl%2FLb3fo6WytRni3IhV3qay2F9e2yGtojwlR2vdpjl3MfTl54RtSKreTqQHATzUYGKov%2BGT1aLHcFRNI36mCqChjkd9wqeBV54cHAdwqI3DILMCsz0DezZ8ygqwOc8UxoApO9Wq5e1lGLTnI85AgiVQZLmWc3XGrOr1T7BPkCzkZF1fgE6HCbBXeqPAEcGeW%2F3HRQ%2FcFCw%2FRVtGolMxFYF3jKhAxQUeqcGcZkrughwwT02YGKzolcHlbEo%2FGddeeCxTOOynCElB6GEJG26VQBn4AULFVAqRZ%2FdRC%2FT677TH6J2WClvL5p7VpPJsn7EjUK9Hw%2FWo%2FouFxyIEl%2FsSBj0FNnZHvxTTepcPj9R1Z8b5CwkcmXAdyiGOk6XPlAvHUllYalLR8gjQjpVKoHzGc181dDOsLRf5iwr7EMeZX6kMsDOAY6bMYaZvGMBF%2BhZN1k5%2B6XDCOmsfRBjqkAR%2BZWW3w0170kWeHiChnFogg%2FyuByOmJaiIf71r%2BJy8DluFKWpdWgLM011pBTF1QNwUyxCCxpk9l6V4ttKlz30YqJwk9hsfltLUOb1vQEWjFeqRJDaefBTM5sNQK%2BStpqvEbtG%2F2h02ypH9oqLvah%2BCouBXhqhPSWkfcks2q4N49FIZf6nJbQoI14nSDKzeCIs4dw5sFYvV3LjHZOiOVqTDhgjSK&X-Amz-Signature=dd23829e36defcc2f0b9cf41ff78850b9c017ac5fd5afb7a3705b0ec581be1fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
