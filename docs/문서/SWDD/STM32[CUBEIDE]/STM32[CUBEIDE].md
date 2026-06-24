# STM32[CUBEIDE]


### MX (.ioc) Project → IDE Project로 import 하기


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c0186458-dc11-44d1-937b-c921624c4506/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GQEISJF%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T222133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQDOgs3S7Jos2lIDgNZ%2Bzgo8G9Y8Qpgo3N0kMXwo%2BlUprAIhAMVOxrPbaHatwDV46H3rmxpETzK7ni5NpPdkrVCWpWLiKv8DCD8QABoMNjM3NDIzMTgzODA1IgyCaBT%2B7RHIHR79b2gq3AOhm8qMyIEZOsIG%2F1FTWIaTjXe1pk6F0GMEMBOL2sJadgQjYREk%2BYiXGNfFlbEBvi9qFBDSJHPJ4iE7ZbmmMDs3APFEgFenU%2BuFYwfVai2l1DcxSUgZ7rgmR9qRlt338pgpJNCJLvkJ0D%2F2m4WNDhSqbv39dZbzJXf%2Bkl4DYBcaHhWZUJM3iGqtvpiP7NnszWA%2B32l36pAtk8urAuitcWXdJWoffigBC3L24w7UiD1eKPbSkLl0FkLIlIYKdSqjeMFTBd9B%2BcUjJgRb5XEdKPbedglEEqTzYNYCsKC%2FXh8OnRsE4udNQlANplUDIK0d7%2FhHKddQCJh%2B6aizw1N%2Fd9AD4AR%2Bxx46pxnBE%2F1ndN3D7Or6LGaU9kkPsX5zzeTXczXQc9VyUNVOFqroPZnmdwFNWBG1Bz%2BwWiVwCU3x7EulgfEJJAs4EQj62%2FmZYyVq0xbBQO%2BYTL7xF78sGaesZ2%2FGRoSaiImNx8c1EPM8tPRfUvL1DzGRhVJqn0SzLVghTp2EmGtq0qNUXPck7PVTdYLmMHgouD%2FIArze0tuKEPsA6tlhZHKhALXQgySHH%2BzZZfYxlbftAqph%2BtYVsc%2BPw4JNkis9M74V6OYrv6ZU0Yo0U0aJfpkmbJ72l3J0bDCuofHRBjqkAc5J5UNn80ha8NPaHlzOikgl3yWJL8AWI5jhfzqLstk74me19KTnDZWLDiRGiXzfmAm%2FYHnk7VzBCSpCt47OjlbyedSY9fQ96vCnG9n7Pomt4hK3FdpU5NX7yEfAfQ0aJhHKo%2FJ%2FwMTybPOo9k2UvFFUYSojf0xoMrb7p4DauILnv5FPan1mAc8LCeZKejuZGKKuURNvOS7XECPhHE2Vh3%2FVmWvN&X-Amz-Signature=4ee2cb303ff622d8c9f7e18a999ccec51e48ab63886427265baf8431f3dbd075&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 새 폴더 생성(MX project 폴더명이랑 달라야함) → 해당 폴더 선택하고 Launch

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e714622e-b13a-4380-862c-e26b573e5af8/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GQEISJF%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T222133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQDOgs3S7Jos2lIDgNZ%2Bzgo8G9Y8Qpgo3N0kMXwo%2BlUprAIhAMVOxrPbaHatwDV46H3rmxpETzK7ni5NpPdkrVCWpWLiKv8DCD8QABoMNjM3NDIzMTgzODA1IgyCaBT%2B7RHIHR79b2gq3AOhm8qMyIEZOsIG%2F1FTWIaTjXe1pk6F0GMEMBOL2sJadgQjYREk%2BYiXGNfFlbEBvi9qFBDSJHPJ4iE7ZbmmMDs3APFEgFenU%2BuFYwfVai2l1DcxSUgZ7rgmR9qRlt338pgpJNCJLvkJ0D%2F2m4WNDhSqbv39dZbzJXf%2Bkl4DYBcaHhWZUJM3iGqtvpiP7NnszWA%2B32l36pAtk8urAuitcWXdJWoffigBC3L24w7UiD1eKPbSkLl0FkLIlIYKdSqjeMFTBd9B%2BcUjJgRb5XEdKPbedglEEqTzYNYCsKC%2FXh8OnRsE4udNQlANplUDIK0d7%2FhHKddQCJh%2B6aizw1N%2Fd9AD4AR%2Bxx46pxnBE%2F1ndN3D7Or6LGaU9kkPsX5zzeTXczXQc9VyUNVOFqroPZnmdwFNWBG1Bz%2BwWiVwCU3x7EulgfEJJAs4EQj62%2FmZYyVq0xbBQO%2BYTL7xF78sGaesZ2%2FGRoSaiImNx8c1EPM8tPRfUvL1DzGRhVJqn0SzLVghTp2EmGtq0qNUXPck7PVTdYLmMHgouD%2FIArze0tuKEPsA6tlhZHKhALXQgySHH%2BzZZfYxlbftAqph%2BtYVsc%2BPw4JNkis9M74V6OYrv6ZU0Yo0U0aJfpkmbJ72l3J0bDCuofHRBjqkAc5J5UNn80ha8NPaHlzOikgl3yWJL8AWI5jhfzqLstk74me19KTnDZWLDiRGiXzfmAm%2FYHnk7VzBCSpCt47OjlbyedSY9fQ96vCnG9n7Pomt4hK3FdpU5NX7yEfAfQ0aJhHKo%2FJ%2FwMTybPOo9k2UvFFUYSojf0xoMrb7p4DauILnv5FPan1mAc8LCeZKejuZGKKuURNvOS7XECPhHE2Vh3%2FVmWvN&X-Amz-Signature=517fdf65573be7020594f2be46cc6c2aaec5eca1271581aba6c17cb3196b7545&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽 메뉴에 Import Projects

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/324f3c5e-b7bd-4363-bb71-bf3220636be6/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GQEISJF%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T222133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQDOgs3S7Jos2lIDgNZ%2Bzgo8G9Y8Qpgo3N0kMXwo%2BlUprAIhAMVOxrPbaHatwDV46H3rmxpETzK7ni5NpPdkrVCWpWLiKv8DCD8QABoMNjM3NDIzMTgzODA1IgyCaBT%2B7RHIHR79b2gq3AOhm8qMyIEZOsIG%2F1FTWIaTjXe1pk6F0GMEMBOL2sJadgQjYREk%2BYiXGNfFlbEBvi9qFBDSJHPJ4iE7ZbmmMDs3APFEgFenU%2BuFYwfVai2l1DcxSUgZ7rgmR9qRlt338pgpJNCJLvkJ0D%2F2m4WNDhSqbv39dZbzJXf%2Bkl4DYBcaHhWZUJM3iGqtvpiP7NnszWA%2B32l36pAtk8urAuitcWXdJWoffigBC3L24w7UiD1eKPbSkLl0FkLIlIYKdSqjeMFTBd9B%2BcUjJgRb5XEdKPbedglEEqTzYNYCsKC%2FXh8OnRsE4udNQlANplUDIK0d7%2FhHKddQCJh%2B6aizw1N%2Fd9AD4AR%2Bxx46pxnBE%2F1ndN3D7Or6LGaU9kkPsX5zzeTXczXQc9VyUNVOFqroPZnmdwFNWBG1Bz%2BwWiVwCU3x7EulgfEJJAs4EQj62%2FmZYyVq0xbBQO%2BYTL7xF78sGaesZ2%2FGRoSaiImNx8c1EPM8tPRfUvL1DzGRhVJqn0SzLVghTp2EmGtq0qNUXPck7PVTdYLmMHgouD%2FIArze0tuKEPsA6tlhZHKhALXQgySHH%2BzZZfYxlbftAqph%2BtYVsc%2BPw4JNkis9M74V6OYrv6ZU0Yo0U0aJfpkmbJ72l3J0bDCuofHRBjqkAc5J5UNn80ha8NPaHlzOikgl3yWJL8AWI5jhfzqLstk74me19KTnDZWLDiRGiXzfmAm%2FYHnk7VzBCSpCt47OjlbyedSY9fQ96vCnG9n7Pomt4hK3FdpU5NX7yEfAfQ0aJhHKo%2FJ%2FwMTybPOo9k2UvFFUYSojf0xoMrb7p4DauILnv5FPan1mAc8LCeZKejuZGKKuURNvOS7XECPhHE2Vh3%2FVmWvN&X-Amz-Signature=f512162a927578ab6abb79ecd378f65cdd636208e9fd2593de58a0f896abd073&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- General → Existing Projects into Workspace

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e079d0f9-8677-4f99-a27b-e6c86dd8e239/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GQEISJF%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T222133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQDOgs3S7Jos2lIDgNZ%2Bzgo8G9Y8Qpgo3N0kMXwo%2BlUprAIhAMVOxrPbaHatwDV46H3rmxpETzK7ni5NpPdkrVCWpWLiKv8DCD8QABoMNjM3NDIzMTgzODA1IgyCaBT%2B7RHIHR79b2gq3AOhm8qMyIEZOsIG%2F1FTWIaTjXe1pk6F0GMEMBOL2sJadgQjYREk%2BYiXGNfFlbEBvi9qFBDSJHPJ4iE7ZbmmMDs3APFEgFenU%2BuFYwfVai2l1DcxSUgZ7rgmR9qRlt338pgpJNCJLvkJ0D%2F2m4WNDhSqbv39dZbzJXf%2Bkl4DYBcaHhWZUJM3iGqtvpiP7NnszWA%2B32l36pAtk8urAuitcWXdJWoffigBC3L24w7UiD1eKPbSkLl0FkLIlIYKdSqjeMFTBd9B%2BcUjJgRb5XEdKPbedglEEqTzYNYCsKC%2FXh8OnRsE4udNQlANplUDIK0d7%2FhHKddQCJh%2B6aizw1N%2Fd9AD4AR%2Bxx46pxnBE%2F1ndN3D7Or6LGaU9kkPsX5zzeTXczXQc9VyUNVOFqroPZnmdwFNWBG1Bz%2BwWiVwCU3x7EulgfEJJAs4EQj62%2FmZYyVq0xbBQO%2BYTL7xF78sGaesZ2%2FGRoSaiImNx8c1EPM8tPRfUvL1DzGRhVJqn0SzLVghTp2EmGtq0qNUXPck7PVTdYLmMHgouD%2FIArze0tuKEPsA6tlhZHKhALXQgySHH%2BzZZfYxlbftAqph%2BtYVsc%2BPw4JNkis9M74V6OYrv6ZU0Yo0U0aJfpkmbJ72l3J0bDCuofHRBjqkAc5J5UNn80ha8NPaHlzOikgl3yWJL8AWI5jhfzqLstk74me19KTnDZWLDiRGiXzfmAm%2FYHnk7VzBCSpCt47OjlbyedSY9fQ96vCnG9n7Pomt4hK3FdpU5NX7yEfAfQ0aJhHKo%2FJ%2FwMTybPOo9k2UvFFUYSojf0xoMrb7p4DauILnv5FPan1mAc8LCeZKejuZGKKuURNvOS7XECPhHE2Vh3%2FVmWvN&X-Amz-Signature=4246894b3ad2cd0b9a1600d5609b342906953c15edd94a0d76d1efa24a90e0c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- Browse → MX에서 만든 Project 폴더 선택 → Finish

### Build and Run


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/eff60a51-b663-4418-b310-d92d1982462a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666GQEISJF%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T222133Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJIMEYCIQDOgs3S7Jos2lIDgNZ%2Bzgo8G9Y8Qpgo3N0kMXwo%2BlUprAIhAMVOxrPbaHatwDV46H3rmxpETzK7ni5NpPdkrVCWpWLiKv8DCD8QABoMNjM3NDIzMTgzODA1IgyCaBT%2B7RHIHR79b2gq3AOhm8qMyIEZOsIG%2F1FTWIaTjXe1pk6F0GMEMBOL2sJadgQjYREk%2BYiXGNfFlbEBvi9qFBDSJHPJ4iE7ZbmmMDs3APFEgFenU%2BuFYwfVai2l1DcxSUgZ7rgmR9qRlt338pgpJNCJLvkJ0D%2F2m4WNDhSqbv39dZbzJXf%2Bkl4DYBcaHhWZUJM3iGqtvpiP7NnszWA%2B32l36pAtk8urAuitcWXdJWoffigBC3L24w7UiD1eKPbSkLl0FkLIlIYKdSqjeMFTBd9B%2BcUjJgRb5XEdKPbedglEEqTzYNYCsKC%2FXh8OnRsE4udNQlANplUDIK0d7%2FhHKddQCJh%2B6aizw1N%2Fd9AD4AR%2Bxx46pxnBE%2F1ndN3D7Or6LGaU9kkPsX5zzeTXczXQc9VyUNVOFqroPZnmdwFNWBG1Bz%2BwWiVwCU3x7EulgfEJJAs4EQj62%2FmZYyVq0xbBQO%2BYTL7xF78sGaesZ2%2FGRoSaiImNx8c1EPM8tPRfUvL1DzGRhVJqn0SzLVghTp2EmGtq0qNUXPck7PVTdYLmMHgouD%2FIArze0tuKEPsA6tlhZHKhALXQgySHH%2BzZZfYxlbftAqph%2BtYVsc%2BPw4JNkis9M74V6OYrv6ZU0Yo0U0aJfpkmbJ72l3J0bDCuofHRBjqkAc5J5UNn80ha8NPaHlzOikgl3yWJL8AWI5jhfzqLstk74me19KTnDZWLDiRGiXzfmAm%2FYHnk7VzBCSpCt47OjlbyedSY9fQ96vCnG9n7Pomt4hK3FdpU5NX7yEfAfQ0aJhHKo%2FJ%2FwMTybPOo9k2UvFFUYSojf0xoMrb7p4DauILnv5FPan1mAc8LCeZKejuZGKKuURNvOS7XECPhHE2Vh3%2FVmWvN&X-Amz-Signature=a5fc6d14c777b1b62b0fb971d635068c5fdf4850c002f2e86b5fa595096ada5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

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
