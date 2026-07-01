# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4XY7RL6%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIEOF%2FKnKp2H5defG4Hm%2FMRPBcPFcNXzxjPeqxCBZT9U%2FAiEA%2BLXI6rDfIkUoj51Q%2Frbdu%2BPycvg%2BR5q8SppaQJw47ywqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDER5104fnPdQQgJ57yrcA1zeyQIZcLc%2FKHzjPpZ0RxpR9JQl%2BDpZhBqa2gMkYgpE%2BbxOHdlBQ39goaOBOjLsN3BPZMuh0S8RLJry4cXSsH01lYQhlsOvrpQtd1nU%2BI%2FoQoWxfM2zNPn9pjzVaH%2BRrXu2LKHOju9gYyO4nbyjLVT4fyUkLJuP6jky0bxXJvxEFv50K7ecAjIIKtkSlb66bk%2Fdz5tteK7YdTbWY1WNH6Tp071RNkVBJzS4ZhY17g0W1TlcE497AXqlkH229WdYPZNwBUqz%2BMlXV6Q6V8FzF9TEX9afFra4KcrhVZOWrpX1XPWVWStq2s95KK%2BncXbSZSPMyyvA8mkB38w8JufX5HoG%2BYUt24V4qZVGr%2Fgs9%2FU2jGBJBCxSW1d28lUb%2FguwJqd4BTn3n%2Bk6qnyLjfeW9sYw0%2Fqp%2FhFXVSxUMtjUyYgxsf3wMZuSif1Tshj%2FVbzUfQvUVox7sTxl4MxUzigjCDDIzo%2FI2FIhNBrlphzutlr6ZWJX8FAnYNMd5JMnnam3Op%2FWDnK2jpEHqu%2Bj1UZRv2Jo8hNJkAdRqQ3jS0r6TkcIlL5ksYYfwWPY4jpmU3P6ct6tZBbpuioVKiAJr%2B2Vv0AvvpPLzJiuG%2BivzNHcJ3hS4OQc28qcouj3sJPVMK2CltIGOqUBpoCpcLnQlc81ic2ifKM9W697oBwEwu9IxRj4B9VAEZVOl0dBjDj408Gah3%2F6%2Fa415sqk7WvEe%2F7TJGTmMWbknx1tepR2bJtYK8YpTT9zKSHCWoV%2FQblX%2BH4tYNYfC9UfUUtPEDosynaZWTU5TlJ7UPzj3gXpukiza1XTWfUZwuyZD5gGJQp0%2B2qAuepHGmix5cPEfp%2FstxdUn4IH0mwJ5yh6DjXX&X-Amz-Signature=ea7e791c951f02975852ea27e684aa345c04a302275b1d0339068ac2e6cfe10f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4XY7RL6%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIEOF%2FKnKp2H5defG4Hm%2FMRPBcPFcNXzxjPeqxCBZT9U%2FAiEA%2BLXI6rDfIkUoj51Q%2Frbdu%2BPycvg%2BR5q8SppaQJw47ywqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDER5104fnPdQQgJ57yrcA1zeyQIZcLc%2FKHzjPpZ0RxpR9JQl%2BDpZhBqa2gMkYgpE%2BbxOHdlBQ39goaOBOjLsN3BPZMuh0S8RLJry4cXSsH01lYQhlsOvrpQtd1nU%2BI%2FoQoWxfM2zNPn9pjzVaH%2BRrXu2LKHOju9gYyO4nbyjLVT4fyUkLJuP6jky0bxXJvxEFv50K7ecAjIIKtkSlb66bk%2Fdz5tteK7YdTbWY1WNH6Tp071RNkVBJzS4ZhY17g0W1TlcE497AXqlkH229WdYPZNwBUqz%2BMlXV6Q6V8FzF9TEX9afFra4KcrhVZOWrpX1XPWVWStq2s95KK%2BncXbSZSPMyyvA8mkB38w8JufX5HoG%2BYUt24V4qZVGr%2Fgs9%2FU2jGBJBCxSW1d28lUb%2FguwJqd4BTn3n%2Bk6qnyLjfeW9sYw0%2Fqp%2FhFXVSxUMtjUyYgxsf3wMZuSif1Tshj%2FVbzUfQvUVox7sTxl4MxUzigjCDDIzo%2FI2FIhNBrlphzutlr6ZWJX8FAnYNMd5JMnnam3Op%2FWDnK2jpEHqu%2Bj1UZRv2Jo8hNJkAdRqQ3jS0r6TkcIlL5ksYYfwWPY4jpmU3P6ct6tZBbpuioVKiAJr%2B2Vv0AvvpPLzJiuG%2BivzNHcJ3hS4OQc28qcouj3sJPVMK2CltIGOqUBpoCpcLnQlc81ic2ifKM9W697oBwEwu9IxRj4B9VAEZVOl0dBjDj408Gah3%2F6%2Fa415sqk7WvEe%2F7TJGTmMWbknx1tepR2bJtYK8YpTT9zKSHCWoV%2FQblX%2BH4tYNYfC9UfUUtPEDosynaZWTU5TlJ7UPzj3gXpukiza1XTWfUZwuyZD5gGJQp0%2B2qAuepHGmix5cPEfp%2FstxdUn4IH0mwJ5yh6DjXX&X-Amz-Signature=b7bd741bf5988bf2b0bb2ec7039670fe63ed364e3debee77a110cbf40b6bffb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4XY7RL6%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIEOF%2FKnKp2H5defG4Hm%2FMRPBcPFcNXzxjPeqxCBZT9U%2FAiEA%2BLXI6rDfIkUoj51Q%2Frbdu%2BPycvg%2BR5q8SppaQJw47ywqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDER5104fnPdQQgJ57yrcA1zeyQIZcLc%2FKHzjPpZ0RxpR9JQl%2BDpZhBqa2gMkYgpE%2BbxOHdlBQ39goaOBOjLsN3BPZMuh0S8RLJry4cXSsH01lYQhlsOvrpQtd1nU%2BI%2FoQoWxfM2zNPn9pjzVaH%2BRrXu2LKHOju9gYyO4nbyjLVT4fyUkLJuP6jky0bxXJvxEFv50K7ecAjIIKtkSlb66bk%2Fdz5tteK7YdTbWY1WNH6Tp071RNkVBJzS4ZhY17g0W1TlcE497AXqlkH229WdYPZNwBUqz%2BMlXV6Q6V8FzF9TEX9afFra4KcrhVZOWrpX1XPWVWStq2s95KK%2BncXbSZSPMyyvA8mkB38w8JufX5HoG%2BYUt24V4qZVGr%2Fgs9%2FU2jGBJBCxSW1d28lUb%2FguwJqd4BTn3n%2Bk6qnyLjfeW9sYw0%2Fqp%2FhFXVSxUMtjUyYgxsf3wMZuSif1Tshj%2FVbzUfQvUVox7sTxl4MxUzigjCDDIzo%2FI2FIhNBrlphzutlr6ZWJX8FAnYNMd5JMnnam3Op%2FWDnK2jpEHqu%2Bj1UZRv2Jo8hNJkAdRqQ3jS0r6TkcIlL5ksYYfwWPY4jpmU3P6ct6tZBbpuioVKiAJr%2B2Vv0AvvpPLzJiuG%2BivzNHcJ3hS4OQc28qcouj3sJPVMK2CltIGOqUBpoCpcLnQlc81ic2ifKM9W697oBwEwu9IxRj4B9VAEZVOl0dBjDj408Gah3%2F6%2Fa415sqk7WvEe%2F7TJGTmMWbknx1tepR2bJtYK8YpTT9zKSHCWoV%2FQblX%2BH4tYNYfC9UfUUtPEDosynaZWTU5TlJ7UPzj3gXpukiza1XTWfUZwuyZD5gGJQp0%2B2qAuepHGmix5cPEfp%2FstxdUn4IH0mwJ5yh6DjXX&X-Amz-Signature=8479175330faba226204c7198871566015914fc0ae780cf9468231d0c500d477&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4XY7RL6%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIEOF%2FKnKp2H5defG4Hm%2FMRPBcPFcNXzxjPeqxCBZT9U%2FAiEA%2BLXI6rDfIkUoj51Q%2Frbdu%2BPycvg%2BR5q8SppaQJw47ywqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDER5104fnPdQQgJ57yrcA1zeyQIZcLc%2FKHzjPpZ0RxpR9JQl%2BDpZhBqa2gMkYgpE%2BbxOHdlBQ39goaOBOjLsN3BPZMuh0S8RLJry4cXSsH01lYQhlsOvrpQtd1nU%2BI%2FoQoWxfM2zNPn9pjzVaH%2BRrXu2LKHOju9gYyO4nbyjLVT4fyUkLJuP6jky0bxXJvxEFv50K7ecAjIIKtkSlb66bk%2Fdz5tteK7YdTbWY1WNH6Tp071RNkVBJzS4ZhY17g0W1TlcE497AXqlkH229WdYPZNwBUqz%2BMlXV6Q6V8FzF9TEX9afFra4KcrhVZOWrpX1XPWVWStq2s95KK%2BncXbSZSPMyyvA8mkB38w8JufX5HoG%2BYUt24V4qZVGr%2Fgs9%2FU2jGBJBCxSW1d28lUb%2FguwJqd4BTn3n%2Bk6qnyLjfeW9sYw0%2Fqp%2FhFXVSxUMtjUyYgxsf3wMZuSif1Tshj%2FVbzUfQvUVox7sTxl4MxUzigjCDDIzo%2FI2FIhNBrlphzutlr6ZWJX8FAnYNMd5JMnnam3Op%2FWDnK2jpEHqu%2Bj1UZRv2Jo8hNJkAdRqQ3jS0r6TkcIlL5ksYYfwWPY4jpmU3P6ct6tZBbpuioVKiAJr%2B2Vv0AvvpPLzJiuG%2BivzNHcJ3hS4OQc28qcouj3sJPVMK2CltIGOqUBpoCpcLnQlc81ic2ifKM9W697oBwEwu9IxRj4B9VAEZVOl0dBjDj408Gah3%2F6%2Fa415sqk7WvEe%2F7TJGTmMWbknx1tepR2bJtYK8YpTT9zKSHCWoV%2FQblX%2BH4tYNYfC9UfUUtPEDosynaZWTU5TlJ7UPzj3gXpukiza1XTWfUZwuyZD5gGJQp0%2B2qAuepHGmix5cPEfp%2FstxdUn4IH0mwJ5yh6DjXX&X-Amz-Signature=5703265f434f2a9f9a4819061a9acee0b53682828336931d07ff26c5802292c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U4XY7RL6%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222608Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIEOF%2FKnKp2H5defG4Hm%2FMRPBcPFcNXzxjPeqxCBZT9U%2FAiEA%2BLXI6rDfIkUoj51Q%2Frbdu%2BPycvg%2BR5q8SppaQJw47ywqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDER5104fnPdQQgJ57yrcA1zeyQIZcLc%2FKHzjPpZ0RxpR9JQl%2BDpZhBqa2gMkYgpE%2BbxOHdlBQ39goaOBOjLsN3BPZMuh0S8RLJry4cXSsH01lYQhlsOvrpQtd1nU%2BI%2FoQoWxfM2zNPn9pjzVaH%2BRrXu2LKHOju9gYyO4nbyjLVT4fyUkLJuP6jky0bxXJvxEFv50K7ecAjIIKtkSlb66bk%2Fdz5tteK7YdTbWY1WNH6Tp071RNkVBJzS4ZhY17g0W1TlcE497AXqlkH229WdYPZNwBUqz%2BMlXV6Q6V8FzF9TEX9afFra4KcrhVZOWrpX1XPWVWStq2s95KK%2BncXbSZSPMyyvA8mkB38w8JufX5HoG%2BYUt24V4qZVGr%2Fgs9%2FU2jGBJBCxSW1d28lUb%2FguwJqd4BTn3n%2Bk6qnyLjfeW9sYw0%2Fqp%2FhFXVSxUMtjUyYgxsf3wMZuSif1Tshj%2FVbzUfQvUVox7sTxl4MxUzigjCDDIzo%2FI2FIhNBrlphzutlr6ZWJX8FAnYNMd5JMnnam3Op%2FWDnK2jpEHqu%2Bj1UZRv2Jo8hNJkAdRqQ3jS0r6TkcIlL5ksYYfwWPY4jpmU3P6ct6tZBbpuioVKiAJr%2B2Vv0AvvpPLzJiuG%2BivzNHcJ3hS4OQc28qcouj3sJPVMK2CltIGOqUBpoCpcLnQlc81ic2ifKM9W697oBwEwu9IxRj4B9VAEZVOl0dBjDj408Gah3%2F6%2Fa415sqk7WvEe%2F7TJGTmMWbknx1tepR2bJtYK8YpTT9zKSHCWoV%2FQblX%2BH4tYNYfC9UfUUtPEDosynaZWTU5TlJ7UPzj3gXpukiza1XTWfUZwuyZD5gGJQp0%2B2qAuepHGmix5cPEfp%2FstxdUn4IH0mwJ5yh6DjXX&X-Amz-Signature=baa1c3f222f6f321912db41435e564000dd018883657ef65ef0ee5c7e4fcbc24&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
