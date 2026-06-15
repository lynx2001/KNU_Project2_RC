# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDQLC4AC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T231242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDASj8x%2Bmh%2FwmvFde0NPKyEW0Ex4r%2BQKsqCWLVVnGBJ1AiEAw77leYecCqVnFIPjzgeyAyl8gCSSfsGA4esRqMxRJosq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDAlxUeoGkgjs4snc3ircA1Zdl1TEzNzOSzEzzuRzEjUSzy7IpATJq7%2Fqav3389B6bE9yIZq5DzfOxChHrONYvGxdAxO6cz93TpQ4aBXtxiAdGWMAG9Ca3C6hbkj3Ya%2FtJpzENRTcpqLld0hT7WASQLN9%2F1Go97wQnT9PHvAkkuv8jFG7pv4w1Ksj0ICQzQ%2Ft3dYA2Q13OwvXNgo0tZgYgYKKe25R0gUQcp4Dz4KJCj87rdNASS4iHLTwCmZ4ZFGJD7rPB7o%2BNpIJRmCuwtq9e3NVk1Fb%2FdITpKtp%2BqAcy%2Frbri%2F8X3jZPJogZM8uymY9gwkZfHR9dZajd3ryatJYkn6P1exOq8spU9WWClmsLNUdlpX%2FB4oXadjP%2BjHUTn7hPvjG%2F2L%2FmC4f0kvgqPqCnJRkIO83GEs3VfzWdEO9vU1d2120spcoqr6Kk0sLdtMslLC0kIgB1lBIqakvGrMI1QctoEyfXVwcTvRXvUvLI5t3cvSDgdNG33VPe%2Bf6v%2Foz9Xm7wI5%2F%2BFo1w5M6lyzZR%2Bw%2B%2F5EToWr4rtHUVkCDXhtdmRdhSNeDln3BCsooaqrwSEp6SawPXQUVqYCahjOavp2GVZR9tSIsXWDlFLT1zu49n5FZ0TK9s37c43dlUrdvm%2FNx4rd1ImTNmVlzMLPowdEGOqUBN5160S21JsSkZuRr6D9%2F4BmBQwpp%2B0vVsdve0D7sUhDezwyYjXfRuVLSJfkDwTL67gr2TChiEKN8ImBszS%2BajnTyvFhxNSdiWwBHsXkgGx1pi8KvpO7PIHJjCunN8Ov5k48U42l7db9LBY5wTGc7smgTGybVxG6qAp2tDSEqJ0GWMFnrkUC6MsTv4jc1T%2B5zPWj3PH%2ByqRyDhDrtjG4ilmz9WKmX&X-Amz-Signature=8fbd4d4a69d0a4f8b5dc19247109dd2ee313e9ce64143475fc63c35939c5a6a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDQLC4AC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T231242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDASj8x%2Bmh%2FwmvFde0NPKyEW0Ex4r%2BQKsqCWLVVnGBJ1AiEAw77leYecCqVnFIPjzgeyAyl8gCSSfsGA4esRqMxRJosq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDAlxUeoGkgjs4snc3ircA1Zdl1TEzNzOSzEzzuRzEjUSzy7IpATJq7%2Fqav3389B6bE9yIZq5DzfOxChHrONYvGxdAxO6cz93TpQ4aBXtxiAdGWMAG9Ca3C6hbkj3Ya%2FtJpzENRTcpqLld0hT7WASQLN9%2F1Go97wQnT9PHvAkkuv8jFG7pv4w1Ksj0ICQzQ%2Ft3dYA2Q13OwvXNgo0tZgYgYKKe25R0gUQcp4Dz4KJCj87rdNASS4iHLTwCmZ4ZFGJD7rPB7o%2BNpIJRmCuwtq9e3NVk1Fb%2FdITpKtp%2BqAcy%2Frbri%2F8X3jZPJogZM8uymY9gwkZfHR9dZajd3ryatJYkn6P1exOq8spU9WWClmsLNUdlpX%2FB4oXadjP%2BjHUTn7hPvjG%2F2L%2FmC4f0kvgqPqCnJRkIO83GEs3VfzWdEO9vU1d2120spcoqr6Kk0sLdtMslLC0kIgB1lBIqakvGrMI1QctoEyfXVwcTvRXvUvLI5t3cvSDgdNG33VPe%2Bf6v%2Foz9Xm7wI5%2F%2BFo1w5M6lyzZR%2Bw%2B%2F5EToWr4rtHUVkCDXhtdmRdhSNeDln3BCsooaqrwSEp6SawPXQUVqYCahjOavp2GVZR9tSIsXWDlFLT1zu49n5FZ0TK9s37c43dlUrdvm%2FNx4rd1ImTNmVlzMLPowdEGOqUBN5160S21JsSkZuRr6D9%2F4BmBQwpp%2B0vVsdve0D7sUhDezwyYjXfRuVLSJfkDwTL67gr2TChiEKN8ImBszS%2BajnTyvFhxNSdiWwBHsXkgGx1pi8KvpO7PIHJjCunN8Ov5k48U42l7db9LBY5wTGc7smgTGybVxG6qAp2tDSEqJ0GWMFnrkUC6MsTv4jc1T%2B5zPWj3PH%2ByqRyDhDrtjG4ilmz9WKmX&X-Amz-Signature=e23a9b7089ffee895cb353a2e043984520971def2fb42280d6df97573d358199&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDQLC4AC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T231242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDASj8x%2Bmh%2FwmvFde0NPKyEW0Ex4r%2BQKsqCWLVVnGBJ1AiEAw77leYecCqVnFIPjzgeyAyl8gCSSfsGA4esRqMxRJosq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDAlxUeoGkgjs4snc3ircA1Zdl1TEzNzOSzEzzuRzEjUSzy7IpATJq7%2Fqav3389B6bE9yIZq5DzfOxChHrONYvGxdAxO6cz93TpQ4aBXtxiAdGWMAG9Ca3C6hbkj3Ya%2FtJpzENRTcpqLld0hT7WASQLN9%2F1Go97wQnT9PHvAkkuv8jFG7pv4w1Ksj0ICQzQ%2Ft3dYA2Q13OwvXNgo0tZgYgYKKe25R0gUQcp4Dz4KJCj87rdNASS4iHLTwCmZ4ZFGJD7rPB7o%2BNpIJRmCuwtq9e3NVk1Fb%2FdITpKtp%2BqAcy%2Frbri%2F8X3jZPJogZM8uymY9gwkZfHR9dZajd3ryatJYkn6P1exOq8spU9WWClmsLNUdlpX%2FB4oXadjP%2BjHUTn7hPvjG%2F2L%2FmC4f0kvgqPqCnJRkIO83GEs3VfzWdEO9vU1d2120spcoqr6Kk0sLdtMslLC0kIgB1lBIqakvGrMI1QctoEyfXVwcTvRXvUvLI5t3cvSDgdNG33VPe%2Bf6v%2Foz9Xm7wI5%2F%2BFo1w5M6lyzZR%2Bw%2B%2F5EToWr4rtHUVkCDXhtdmRdhSNeDln3BCsooaqrwSEp6SawPXQUVqYCahjOavp2GVZR9tSIsXWDlFLT1zu49n5FZ0TK9s37c43dlUrdvm%2FNx4rd1ImTNmVlzMLPowdEGOqUBN5160S21JsSkZuRr6D9%2F4BmBQwpp%2B0vVsdve0D7sUhDezwyYjXfRuVLSJfkDwTL67gr2TChiEKN8ImBszS%2BajnTyvFhxNSdiWwBHsXkgGx1pi8KvpO7PIHJjCunN8Ov5k48U42l7db9LBY5wTGc7smgTGybVxG6qAp2tDSEqJ0GWMFnrkUC6MsTv4jc1T%2B5zPWj3PH%2ByqRyDhDrtjG4ilmz9WKmX&X-Amz-Signature=5f185fb51140b3a8b44e955fa8677e45d1c8eeda1ebdf043b510fe09099c62e9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDQLC4AC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T231242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDASj8x%2Bmh%2FwmvFde0NPKyEW0Ex4r%2BQKsqCWLVVnGBJ1AiEAw77leYecCqVnFIPjzgeyAyl8gCSSfsGA4esRqMxRJosq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDAlxUeoGkgjs4snc3ircA1Zdl1TEzNzOSzEzzuRzEjUSzy7IpATJq7%2Fqav3389B6bE9yIZq5DzfOxChHrONYvGxdAxO6cz93TpQ4aBXtxiAdGWMAG9Ca3C6hbkj3Ya%2FtJpzENRTcpqLld0hT7WASQLN9%2F1Go97wQnT9PHvAkkuv8jFG7pv4w1Ksj0ICQzQ%2Ft3dYA2Q13OwvXNgo0tZgYgYKKe25R0gUQcp4Dz4KJCj87rdNASS4iHLTwCmZ4ZFGJD7rPB7o%2BNpIJRmCuwtq9e3NVk1Fb%2FdITpKtp%2BqAcy%2Frbri%2F8X3jZPJogZM8uymY9gwkZfHR9dZajd3ryatJYkn6P1exOq8spU9WWClmsLNUdlpX%2FB4oXadjP%2BjHUTn7hPvjG%2F2L%2FmC4f0kvgqPqCnJRkIO83GEs3VfzWdEO9vU1d2120spcoqr6Kk0sLdtMslLC0kIgB1lBIqakvGrMI1QctoEyfXVwcTvRXvUvLI5t3cvSDgdNG33VPe%2Bf6v%2Foz9Xm7wI5%2F%2BFo1w5M6lyzZR%2Bw%2B%2F5EToWr4rtHUVkCDXhtdmRdhSNeDln3BCsooaqrwSEp6SawPXQUVqYCahjOavp2GVZR9tSIsXWDlFLT1zu49n5FZ0TK9s37c43dlUrdvm%2FNx4rd1ImTNmVlzMLPowdEGOqUBN5160S21JsSkZuRr6D9%2F4BmBQwpp%2B0vVsdve0D7sUhDezwyYjXfRuVLSJfkDwTL67gr2TChiEKN8ImBszS%2BajnTyvFhxNSdiWwBHsXkgGx1pi8KvpO7PIHJjCunN8Ov5k48U42l7db9LBY5wTGc7smgTGybVxG6qAp2tDSEqJ0GWMFnrkUC6MsTv4jc1T%2B5zPWj3PH%2ByqRyDhDrtjG4ilmz9WKmX&X-Amz-Signature=b8d8d2a6389dc9999b022404860f00dafa433deb938a918b919e18fb96eb0af7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TDQLC4AC%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T231242Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIDASj8x%2Bmh%2FwmvFde0NPKyEW0Ex4r%2BQKsqCWLVVnGBJ1AiEAw77leYecCqVnFIPjzgeyAyl8gCSSfsGA4esRqMxRJosq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDAlxUeoGkgjs4snc3ircA1Zdl1TEzNzOSzEzzuRzEjUSzy7IpATJq7%2Fqav3389B6bE9yIZq5DzfOxChHrONYvGxdAxO6cz93TpQ4aBXtxiAdGWMAG9Ca3C6hbkj3Ya%2FtJpzENRTcpqLld0hT7WASQLN9%2F1Go97wQnT9PHvAkkuv8jFG7pv4w1Ksj0ICQzQ%2Ft3dYA2Q13OwvXNgo0tZgYgYKKe25R0gUQcp4Dz4KJCj87rdNASS4iHLTwCmZ4ZFGJD7rPB7o%2BNpIJRmCuwtq9e3NVk1Fb%2FdITpKtp%2BqAcy%2Frbri%2F8X3jZPJogZM8uymY9gwkZfHR9dZajd3ryatJYkn6P1exOq8spU9WWClmsLNUdlpX%2FB4oXadjP%2BjHUTn7hPvjG%2F2L%2FmC4f0kvgqPqCnJRkIO83GEs3VfzWdEO9vU1d2120spcoqr6Kk0sLdtMslLC0kIgB1lBIqakvGrMI1QctoEyfXVwcTvRXvUvLI5t3cvSDgdNG33VPe%2Bf6v%2Foz9Xm7wI5%2F%2BFo1w5M6lyzZR%2Bw%2B%2F5EToWr4rtHUVkCDXhtdmRdhSNeDln3BCsooaqrwSEp6SawPXQUVqYCahjOavp2GVZR9tSIsXWDlFLT1zu49n5FZ0TK9s37c43dlUrdvm%2FNx4rd1ImTNmVlzMLPowdEGOqUBN5160S21JsSkZuRr6D9%2F4BmBQwpp%2B0vVsdve0D7sUhDezwyYjXfRuVLSJfkDwTL67gr2TChiEKN8ImBszS%2BajnTyvFhxNSdiWwBHsXkgGx1pi8KvpO7PIHJjCunN8Ov5k48U42l7db9LBY5wTGc7smgTGybVxG6qAp2tDSEqJ0GWMFnrkUC6MsTv4jc1T%2B5zPWj3PH%2ByqRyDhDrtjG4ilmz9WKmX&X-Amz-Signature=20f353baa1eee2d0cb9bb76cb4f8f2aa973a5c8d637aefef821a52a8f5bdc5dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
