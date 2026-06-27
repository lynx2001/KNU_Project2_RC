# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZRAMUWA5%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE%2BvmvYOEKhIzBFH4vZPlWllO8BUUWpdHletHzgBfAW%2BAiEA37Kj8dICHSw215Dsvtx4MhGalUaqi7S%2BeBxaQ%2BQAwWUqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNPpK1Ogj5uoEj1JXyrcA09Xx3LQMQQluIFhIwuhSMWDBwAdss8pPYsR8YLM6G8nQ1Y1nJuXWQoEL09TV0rtQa9MJCqsgo4FZKmSwCWOJk7rmdIsRnd4XhCMbq8OTnyp8lvGs0qmmy84VucxtguQ0B9XaQV0XJueO4lgpeaCmAq4g1gUavO9GCCTtJ2Ag2gdOLm2JVEDBGpokvabB3KCsIcivK3cisM3QPjBW2J2pRt%2BWgwFNQHu4YmgLyTYZs47kZWpL7zOMOWDq2Fr2jXWvxWCc5twtuq0g9e%2FgaVzIzHoyWUvMLCvqY09Pee9oHr4uTUmVLiJ6iRZcKXxKLfBdEJ847WBMncrjr6KA9iQJrcQEuzcRQ6L5yymSAK9rmG9zGgJDZK5KVsaizCV3Z%2BhKp1I3bb%2FOUfK5qQ6UTyIj6svVmdZdkxBOvjtohS0e6cC%2F8hksCk%2BEWgg%2F1hsdWq1dG8KiDfTkJ0i2IfkBTYRMZh8IZbXeg%2F%2Brc5oJOJUdiFkgchRtY%2BdlsdE7LEe2oYMvfgQOtPYyqE2MhEcD3en1J7IEJgGqN9x3MnRTlTDCDqrIybYy9g7Yqopcc8ku0XmsSviXf5Ge%2FPUTISulXzrWstY%2B%2BMBxwizZyWetDoJWLMi1RC07CMUyqCkQGbOMMCIgdIGOqUBNiin%2F9WKtk6va0b1D%2FcJPMpAb%2FsNLb%2FD%2FGOHThztxfJ6EzgABaIvipK8b9fFxmwvTC3In4IHQmuHp6K2TU8dnf3ilAkmTtzg9b18yQ9Z2xQo6kfWjHU3M3XQFshB67fA%2FSICcl6n70oCVrVsktQzpX3GMNQaApkG9n6l%2B4tH4QwWogrEDOLmDJxMUY6wNNUXHQgbQ03h7LzHzIljjq%2Fh9%2F43xrRq&X-Amz-Signature=63a6d712e1c94e53e9cecc50153eca75dbd6487f7535de9bdbf6626cdb0179d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZRAMUWA5%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE%2BvmvYOEKhIzBFH4vZPlWllO8BUUWpdHletHzgBfAW%2BAiEA37Kj8dICHSw215Dsvtx4MhGalUaqi7S%2BeBxaQ%2BQAwWUqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNPpK1Ogj5uoEj1JXyrcA09Xx3LQMQQluIFhIwuhSMWDBwAdss8pPYsR8YLM6G8nQ1Y1nJuXWQoEL09TV0rtQa9MJCqsgo4FZKmSwCWOJk7rmdIsRnd4XhCMbq8OTnyp8lvGs0qmmy84VucxtguQ0B9XaQV0XJueO4lgpeaCmAq4g1gUavO9GCCTtJ2Ag2gdOLm2JVEDBGpokvabB3KCsIcivK3cisM3QPjBW2J2pRt%2BWgwFNQHu4YmgLyTYZs47kZWpL7zOMOWDq2Fr2jXWvxWCc5twtuq0g9e%2FgaVzIzHoyWUvMLCvqY09Pee9oHr4uTUmVLiJ6iRZcKXxKLfBdEJ847WBMncrjr6KA9iQJrcQEuzcRQ6L5yymSAK9rmG9zGgJDZK5KVsaizCV3Z%2BhKp1I3bb%2FOUfK5qQ6UTyIj6svVmdZdkxBOvjtohS0e6cC%2F8hksCk%2BEWgg%2F1hsdWq1dG8KiDfTkJ0i2IfkBTYRMZh8IZbXeg%2F%2Brc5oJOJUdiFkgchRtY%2BdlsdE7LEe2oYMvfgQOtPYyqE2MhEcD3en1J7IEJgGqN9x3MnRTlTDCDqrIybYy9g7Yqopcc8ku0XmsSviXf5Ge%2FPUTISulXzrWstY%2B%2BMBxwizZyWetDoJWLMi1RC07CMUyqCkQGbOMMCIgdIGOqUBNiin%2F9WKtk6va0b1D%2FcJPMpAb%2FsNLb%2FD%2FGOHThztxfJ6EzgABaIvipK8b9fFxmwvTC3In4IHQmuHp6K2TU8dnf3ilAkmTtzg9b18yQ9Z2xQo6kfWjHU3M3XQFshB67fA%2FSICcl6n70oCVrVsktQzpX3GMNQaApkG9n6l%2B4tH4QwWogrEDOLmDJxMUY6wNNUXHQgbQ03h7LzHzIljjq%2Fh9%2F43xrRq&X-Amz-Signature=26d2808ae0c47431289efb7097629d1d454fe87c7f619f48193f426fa2e8da05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZRAMUWA5%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE%2BvmvYOEKhIzBFH4vZPlWllO8BUUWpdHletHzgBfAW%2BAiEA37Kj8dICHSw215Dsvtx4MhGalUaqi7S%2BeBxaQ%2BQAwWUqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNPpK1Ogj5uoEj1JXyrcA09Xx3LQMQQluIFhIwuhSMWDBwAdss8pPYsR8YLM6G8nQ1Y1nJuXWQoEL09TV0rtQa9MJCqsgo4FZKmSwCWOJk7rmdIsRnd4XhCMbq8OTnyp8lvGs0qmmy84VucxtguQ0B9XaQV0XJueO4lgpeaCmAq4g1gUavO9GCCTtJ2Ag2gdOLm2JVEDBGpokvabB3KCsIcivK3cisM3QPjBW2J2pRt%2BWgwFNQHu4YmgLyTYZs47kZWpL7zOMOWDq2Fr2jXWvxWCc5twtuq0g9e%2FgaVzIzHoyWUvMLCvqY09Pee9oHr4uTUmVLiJ6iRZcKXxKLfBdEJ847WBMncrjr6KA9iQJrcQEuzcRQ6L5yymSAK9rmG9zGgJDZK5KVsaizCV3Z%2BhKp1I3bb%2FOUfK5qQ6UTyIj6svVmdZdkxBOvjtohS0e6cC%2F8hksCk%2BEWgg%2F1hsdWq1dG8KiDfTkJ0i2IfkBTYRMZh8IZbXeg%2F%2Brc5oJOJUdiFkgchRtY%2BdlsdE7LEe2oYMvfgQOtPYyqE2MhEcD3en1J7IEJgGqN9x3MnRTlTDCDqrIybYy9g7Yqopcc8ku0XmsSviXf5Ge%2FPUTISulXzrWstY%2B%2BMBxwizZyWetDoJWLMi1RC07CMUyqCkQGbOMMCIgdIGOqUBNiin%2F9WKtk6va0b1D%2FcJPMpAb%2FsNLb%2FD%2FGOHThztxfJ6EzgABaIvipK8b9fFxmwvTC3In4IHQmuHp6K2TU8dnf3ilAkmTtzg9b18yQ9Z2xQo6kfWjHU3M3XQFshB67fA%2FSICcl6n70oCVrVsktQzpX3GMNQaApkG9n6l%2B4tH4QwWogrEDOLmDJxMUY6wNNUXHQgbQ03h7LzHzIljjq%2Fh9%2F43xrRq&X-Amz-Signature=6ffb2ea78ce29d5077d9e1bbe92b27b806a0c7ac5460e14019d6e2235bbb2847&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZRAMUWA5%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE%2BvmvYOEKhIzBFH4vZPlWllO8BUUWpdHletHzgBfAW%2BAiEA37Kj8dICHSw215Dsvtx4MhGalUaqi7S%2BeBxaQ%2BQAwWUqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNPpK1Ogj5uoEj1JXyrcA09Xx3LQMQQluIFhIwuhSMWDBwAdss8pPYsR8YLM6G8nQ1Y1nJuXWQoEL09TV0rtQa9MJCqsgo4FZKmSwCWOJk7rmdIsRnd4XhCMbq8OTnyp8lvGs0qmmy84VucxtguQ0B9XaQV0XJueO4lgpeaCmAq4g1gUavO9GCCTtJ2Ag2gdOLm2JVEDBGpokvabB3KCsIcivK3cisM3QPjBW2J2pRt%2BWgwFNQHu4YmgLyTYZs47kZWpL7zOMOWDq2Fr2jXWvxWCc5twtuq0g9e%2FgaVzIzHoyWUvMLCvqY09Pee9oHr4uTUmVLiJ6iRZcKXxKLfBdEJ847WBMncrjr6KA9iQJrcQEuzcRQ6L5yymSAK9rmG9zGgJDZK5KVsaizCV3Z%2BhKp1I3bb%2FOUfK5qQ6UTyIj6svVmdZdkxBOvjtohS0e6cC%2F8hksCk%2BEWgg%2F1hsdWq1dG8KiDfTkJ0i2IfkBTYRMZh8IZbXeg%2F%2Brc5oJOJUdiFkgchRtY%2BdlsdE7LEe2oYMvfgQOtPYyqE2MhEcD3en1J7IEJgGqN9x3MnRTlTDCDqrIybYy9g7Yqopcc8ku0XmsSviXf5Ge%2FPUTISulXzrWstY%2B%2BMBxwizZyWetDoJWLMi1RC07CMUyqCkQGbOMMCIgdIGOqUBNiin%2F9WKtk6va0b1D%2FcJPMpAb%2FsNLb%2FD%2FGOHThztxfJ6EzgABaIvipK8b9fFxmwvTC3In4IHQmuHp6K2TU8dnf3ilAkmTtzg9b18yQ9Z2xQo6kfWjHU3M3XQFshB67fA%2FSICcl6n70oCVrVsktQzpX3GMNQaApkG9n6l%2B4tH4QwWogrEDOLmDJxMUY6wNNUXHQgbQ03h7LzHzIljjq%2Fh9%2F43xrRq&X-Amz-Signature=15465301d74a3f7fab2247e8432ab016be1c63bb9b8cf56835f0f715238eea9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZRAMUWA5%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220815Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE%2BvmvYOEKhIzBFH4vZPlWllO8BUUWpdHletHzgBfAW%2BAiEA37Kj8dICHSw215Dsvtx4MhGalUaqi7S%2BeBxaQ%2BQAwWUqiAQIh%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNPpK1Ogj5uoEj1JXyrcA09Xx3LQMQQluIFhIwuhSMWDBwAdss8pPYsR8YLM6G8nQ1Y1nJuXWQoEL09TV0rtQa9MJCqsgo4FZKmSwCWOJk7rmdIsRnd4XhCMbq8OTnyp8lvGs0qmmy84VucxtguQ0B9XaQV0XJueO4lgpeaCmAq4g1gUavO9GCCTtJ2Ag2gdOLm2JVEDBGpokvabB3KCsIcivK3cisM3QPjBW2J2pRt%2BWgwFNQHu4YmgLyTYZs47kZWpL7zOMOWDq2Fr2jXWvxWCc5twtuq0g9e%2FgaVzIzHoyWUvMLCvqY09Pee9oHr4uTUmVLiJ6iRZcKXxKLfBdEJ847WBMncrjr6KA9iQJrcQEuzcRQ6L5yymSAK9rmG9zGgJDZK5KVsaizCV3Z%2BhKp1I3bb%2FOUfK5qQ6UTyIj6svVmdZdkxBOvjtohS0e6cC%2F8hksCk%2BEWgg%2F1hsdWq1dG8KiDfTkJ0i2IfkBTYRMZh8IZbXeg%2F%2Brc5oJOJUdiFkgchRtY%2BdlsdE7LEe2oYMvfgQOtPYyqE2MhEcD3en1J7IEJgGqN9x3MnRTlTDCDqrIybYy9g7Yqopcc8ku0XmsSviXf5Ge%2FPUTISulXzrWstY%2B%2BMBxwizZyWetDoJWLMi1RC07CMUyqCkQGbOMMCIgdIGOqUBNiin%2F9WKtk6va0b1D%2FcJPMpAb%2FsNLb%2FD%2FGOHThztxfJ6EzgABaIvipK8b9fFxmwvTC3In4IHQmuHp6K2TU8dnf3ilAkmTtzg9b18yQ9Z2xQo6kfWjHU3M3XQFshB67fA%2FSICcl6n70oCVrVsktQzpX3GMNQaApkG9n6l%2B4tH4QwWogrEDOLmDJxMUY6wNNUXHQgbQ03h7LzHzIljjq%2Fh9%2F43xrRq&X-Amz-Signature=e5d45e31a761cfa3f87a77a1de2dfc6055763addbc896362aeb5db78f07db3fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
