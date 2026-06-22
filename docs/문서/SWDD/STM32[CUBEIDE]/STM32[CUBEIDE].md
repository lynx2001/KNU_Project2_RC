# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QI2VOYO%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T225340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIBEPTI3nPhM%2FgTkapr8KCZI4gMdk33ud0L6l%2BwhEO2%2FbAiBartOgPKxEe1fuPCOvEUMR4WN7FYwjjtisCykHEK9kfyr%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMt9t47ZMgUOz8eTUSKtwDtSlyqy6nj4miAp2u1YeYBjMqwrkFl9mmqvdKcEu0t4jDLo%2BNgcM8hfyUU%2BmziaQv%2BuIJAYQT8ZTIOeXfBYV8xMgZ6QvNlfxIRlVypBHOoCyws9dt0%2BlJxPqlELAEJOD2XD214TpqvwAsr5D1ewIIkoPkquiBqYELskB%2FNZHX5iK3RxjSPlF6VfKE6ZoM6je4L3RCjWQJRvrPgOwF0GtuOIYMpS7L4kU5R4soMrqH0eC7VVYg%2F5tO%2BbRnSRad3QVcfZ0rEOBT3jfw4C5BW2lW52mxYNBd994QMNSiFTBPrPGXa4V2%2B9lHsoApGjTYfVV%2FOzdx%2F9CrfKOb2fnv9sJT6hRP0XAMfIxqiLwFaDQKNLuJNg8cSr8ZVRjTv62e42HJOzD%2FTaxE6qnkEiweqsqAOjVYaP5UdtUCacYAHRiSesr5ITr1CpbXOvkGX1VT0CP9OKIx9lmQtr7Oxq4kOX3aETL2mTvC4xXniH031Zy7tk9%2F6Y7%2F%2F19iL%2B2hyShfJYBhTjvpeP8%2F2hlvdD%2F%2BQ7cbJ1Xz4nnkdQSPlHFa1wvv%2B%2Fv0T%2BHTFdYl4r20fQqH6zN10gAi2UmFNhQeP8mJ3CxJiN56bpq2tVrh80pm%2BmPWSF7g6wD321lFALnH%2Fwcwiorm0QY6pgHiEy7Ywc8kgDt35L2K5krYefwPgXVHywSezFzxkFb0pMndaGh7mkZ6rDs8IzD5jfJpc%2BcIZTqSsR8EOdI7bGK4Aok1mecnFu6gr9UNmCoqVbWa3EQMUqZgv%2FmvebyIqVmUQsEl6QWIi96TL3D5IJu3QGW%2BSn8OH59GbGu5woqt76%2FwdlJrHDLOJaP3y1ONrkPrNeWbPIUDWrBbHELP0OT8HG0HinbB&X-Amz-Signature=e0cf60ee1379761593da8d9ed22b94af70c7a46dc8bffefab503ab8447a067bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QI2VOYO%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T225340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIBEPTI3nPhM%2FgTkapr8KCZI4gMdk33ud0L6l%2BwhEO2%2FbAiBartOgPKxEe1fuPCOvEUMR4WN7FYwjjtisCykHEK9kfyr%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMt9t47ZMgUOz8eTUSKtwDtSlyqy6nj4miAp2u1YeYBjMqwrkFl9mmqvdKcEu0t4jDLo%2BNgcM8hfyUU%2BmziaQv%2BuIJAYQT8ZTIOeXfBYV8xMgZ6QvNlfxIRlVypBHOoCyws9dt0%2BlJxPqlELAEJOD2XD214TpqvwAsr5D1ewIIkoPkquiBqYELskB%2FNZHX5iK3RxjSPlF6VfKE6ZoM6je4L3RCjWQJRvrPgOwF0GtuOIYMpS7L4kU5R4soMrqH0eC7VVYg%2F5tO%2BbRnSRad3QVcfZ0rEOBT3jfw4C5BW2lW52mxYNBd994QMNSiFTBPrPGXa4V2%2B9lHsoApGjTYfVV%2FOzdx%2F9CrfKOb2fnv9sJT6hRP0XAMfIxqiLwFaDQKNLuJNg8cSr8ZVRjTv62e42HJOzD%2FTaxE6qnkEiweqsqAOjVYaP5UdtUCacYAHRiSesr5ITr1CpbXOvkGX1VT0CP9OKIx9lmQtr7Oxq4kOX3aETL2mTvC4xXniH031Zy7tk9%2F6Y7%2F%2F19iL%2B2hyShfJYBhTjvpeP8%2F2hlvdD%2F%2BQ7cbJ1Xz4nnkdQSPlHFa1wvv%2B%2Fv0T%2BHTFdYl4r20fQqH6zN10gAi2UmFNhQeP8mJ3CxJiN56bpq2tVrh80pm%2BmPWSF7g6wD321lFALnH%2Fwcwiorm0QY6pgHiEy7Ywc8kgDt35L2K5krYefwPgXVHywSezFzxkFb0pMndaGh7mkZ6rDs8IzD5jfJpc%2BcIZTqSsR8EOdI7bGK4Aok1mecnFu6gr9UNmCoqVbWa3EQMUqZgv%2FmvebyIqVmUQsEl6QWIi96TL3D5IJu3QGW%2BSn8OH59GbGu5woqt76%2FwdlJrHDLOJaP3y1ONrkPrNeWbPIUDWrBbHELP0OT8HG0HinbB&X-Amz-Signature=b8703aab255d67d47b80ad1f5d88d8b84359f4fe8150f686aa80253e1efcf9f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QI2VOYO%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T225340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIBEPTI3nPhM%2FgTkapr8KCZI4gMdk33ud0L6l%2BwhEO2%2FbAiBartOgPKxEe1fuPCOvEUMR4WN7FYwjjtisCykHEK9kfyr%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMt9t47ZMgUOz8eTUSKtwDtSlyqy6nj4miAp2u1YeYBjMqwrkFl9mmqvdKcEu0t4jDLo%2BNgcM8hfyUU%2BmziaQv%2BuIJAYQT8ZTIOeXfBYV8xMgZ6QvNlfxIRlVypBHOoCyws9dt0%2BlJxPqlELAEJOD2XD214TpqvwAsr5D1ewIIkoPkquiBqYELskB%2FNZHX5iK3RxjSPlF6VfKE6ZoM6je4L3RCjWQJRvrPgOwF0GtuOIYMpS7L4kU5R4soMrqH0eC7VVYg%2F5tO%2BbRnSRad3QVcfZ0rEOBT3jfw4C5BW2lW52mxYNBd994QMNSiFTBPrPGXa4V2%2B9lHsoApGjTYfVV%2FOzdx%2F9CrfKOb2fnv9sJT6hRP0XAMfIxqiLwFaDQKNLuJNg8cSr8ZVRjTv62e42HJOzD%2FTaxE6qnkEiweqsqAOjVYaP5UdtUCacYAHRiSesr5ITr1CpbXOvkGX1VT0CP9OKIx9lmQtr7Oxq4kOX3aETL2mTvC4xXniH031Zy7tk9%2F6Y7%2F%2F19iL%2B2hyShfJYBhTjvpeP8%2F2hlvdD%2F%2BQ7cbJ1Xz4nnkdQSPlHFa1wvv%2B%2Fv0T%2BHTFdYl4r20fQqH6zN10gAi2UmFNhQeP8mJ3CxJiN56bpq2tVrh80pm%2BmPWSF7g6wD321lFALnH%2Fwcwiorm0QY6pgHiEy7Ywc8kgDt35L2K5krYefwPgXVHywSezFzxkFb0pMndaGh7mkZ6rDs8IzD5jfJpc%2BcIZTqSsR8EOdI7bGK4Aok1mecnFu6gr9UNmCoqVbWa3EQMUqZgv%2FmvebyIqVmUQsEl6QWIi96TL3D5IJu3QGW%2BSn8OH59GbGu5woqt76%2FwdlJrHDLOJaP3y1ONrkPrNeWbPIUDWrBbHELP0OT8HG0HinbB&X-Amz-Signature=1880a9772edd18c46b749f689aa6958ac3a73f19927053d0587a7507366fb247&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QI2VOYO%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T225340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIBEPTI3nPhM%2FgTkapr8KCZI4gMdk33ud0L6l%2BwhEO2%2FbAiBartOgPKxEe1fuPCOvEUMR4WN7FYwjjtisCykHEK9kfyr%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMt9t47ZMgUOz8eTUSKtwDtSlyqy6nj4miAp2u1YeYBjMqwrkFl9mmqvdKcEu0t4jDLo%2BNgcM8hfyUU%2BmziaQv%2BuIJAYQT8ZTIOeXfBYV8xMgZ6QvNlfxIRlVypBHOoCyws9dt0%2BlJxPqlELAEJOD2XD214TpqvwAsr5D1ewIIkoPkquiBqYELskB%2FNZHX5iK3RxjSPlF6VfKE6ZoM6je4L3RCjWQJRvrPgOwF0GtuOIYMpS7L4kU5R4soMrqH0eC7VVYg%2F5tO%2BbRnSRad3QVcfZ0rEOBT3jfw4C5BW2lW52mxYNBd994QMNSiFTBPrPGXa4V2%2B9lHsoApGjTYfVV%2FOzdx%2F9CrfKOb2fnv9sJT6hRP0XAMfIxqiLwFaDQKNLuJNg8cSr8ZVRjTv62e42HJOzD%2FTaxE6qnkEiweqsqAOjVYaP5UdtUCacYAHRiSesr5ITr1CpbXOvkGX1VT0CP9OKIx9lmQtr7Oxq4kOX3aETL2mTvC4xXniH031Zy7tk9%2F6Y7%2F%2F19iL%2B2hyShfJYBhTjvpeP8%2F2hlvdD%2F%2BQ7cbJ1Xz4nnkdQSPlHFa1wvv%2B%2Fv0T%2BHTFdYl4r20fQqH6zN10gAi2UmFNhQeP8mJ3CxJiN56bpq2tVrh80pm%2BmPWSF7g6wD321lFALnH%2Fwcwiorm0QY6pgHiEy7Ywc8kgDt35L2K5krYefwPgXVHywSezFzxkFb0pMndaGh7mkZ6rDs8IzD5jfJpc%2BcIZTqSsR8EOdI7bGK4Aok1mecnFu6gr9UNmCoqVbWa3EQMUqZgv%2FmvebyIqVmUQsEl6QWIi96TL3D5IJu3QGW%2BSn8OH59GbGu5woqt76%2FwdlJrHDLOJaP3y1ONrkPrNeWbPIUDWrBbHELP0OT8HG0HinbB&X-Amz-Signature=50622a8de2a11afa8dde4894774734088cbd391b42d855842d6ef6f232431510&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4664QI2VOYO%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T225340Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJGMEQCIBEPTI3nPhM%2FgTkapr8KCZI4gMdk33ud0L6l%2BwhEO2%2FbAiBartOgPKxEe1fuPCOvEUMR4WN7FYwjjtisCykHEK9kfyr%2FAwgMEAAaDDYzNzQyMzE4MzgwNSIMt9t47ZMgUOz8eTUSKtwDtSlyqy6nj4miAp2u1YeYBjMqwrkFl9mmqvdKcEu0t4jDLo%2BNgcM8hfyUU%2BmziaQv%2BuIJAYQT8ZTIOeXfBYV8xMgZ6QvNlfxIRlVypBHOoCyws9dt0%2BlJxPqlELAEJOD2XD214TpqvwAsr5D1ewIIkoPkquiBqYELskB%2FNZHX5iK3RxjSPlF6VfKE6ZoM6je4L3RCjWQJRvrPgOwF0GtuOIYMpS7L4kU5R4soMrqH0eC7VVYg%2F5tO%2BbRnSRad3QVcfZ0rEOBT3jfw4C5BW2lW52mxYNBd994QMNSiFTBPrPGXa4V2%2B9lHsoApGjTYfVV%2FOzdx%2F9CrfKOb2fnv9sJT6hRP0XAMfIxqiLwFaDQKNLuJNg8cSr8ZVRjTv62e42HJOzD%2FTaxE6qnkEiweqsqAOjVYaP5UdtUCacYAHRiSesr5ITr1CpbXOvkGX1VT0CP9OKIx9lmQtr7Oxq4kOX3aETL2mTvC4xXniH031Zy7tk9%2F6Y7%2F%2F19iL%2B2hyShfJYBhTjvpeP8%2F2hlvdD%2F%2BQ7cbJ1Xz4nnkdQSPlHFa1wvv%2B%2Fv0T%2BHTFdYl4r20fQqH6zN10gAi2UmFNhQeP8mJ3CxJiN56bpq2tVrh80pm%2BmPWSF7g6wD321lFALnH%2Fwcwiorm0QY6pgHiEy7Ywc8kgDt35L2K5krYefwPgXVHywSezFzxkFb0pMndaGh7mkZ6rDs8IzD5jfJpc%2BcIZTqSsR8EOdI7bGK4Aok1mecnFu6gr9UNmCoqVbWa3EQMUqZgv%2FmvebyIqVmUQsEl6QWIi96TL3D5IJu3QGW%2BSn8OH59GbGu5woqt76%2FwdlJrHDLOJaP3y1ONrkPrNeWbPIUDWrBbHELP0OT8HG0HinbB&X-Amz-Signature=5c990f4be200ec209c3f4ad71d6711f849a593a7d0111e6dc40de1f2d17d403f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
