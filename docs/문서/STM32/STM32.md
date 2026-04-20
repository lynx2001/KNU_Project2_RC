# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=4718dc04c9b98441c19c3b9368d8bb67bcf16df63a3c4b8a12c8a2a1951bf3c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| NO. | Function Description                                                                                                                                                      |
| --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Motor control switch: When turned on, the motor can move; when turned off, the motor is not controlled                                                                    |
| 2   | 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.                                                               |
| 3   | Battery voltage powered PWM servo interface x2: For high current and high torque servo control                                                                            |
| 4   | USB serial port 2: Designed for serial communication interface to communicate with Raspberry Pi and Jetson Nano.                                                          |
| 5   | I2C expansion interface: Can be used for module communication of the I2C interface.                                                                                       |
| 6   | 0.96-inch LCD display interface: For LCD display module.                                                                                                                  |
| 7   | USB serial port 1/burning download: Can be used for program serial port burning and serial port communication.                                                            |
| 8   | MPU6050 IMU attitude sensor: Provides the current attitude of the development board.                                                                                      |
| 9   | GPIO expansion and SWD debugging: Used for other expansion external modules and debugging.                                                                                |
| 10  | User indicator light: Allows users to customize LED light functions.                                                                                                      |
| 11  | Power indicator light on the board: Indicates whether the voltage of each part is normal.                                                                                 |
| 12  | Reset button: Main control chip reset button.                                                                                                                             |
| 13  | USB HOST interface: Can connect USB slave devices such as USB handle receivers.                                                                                           |
| 14  | STM32F407VET6 main control chip: Main frequency 168MHz, ARM Cortex-M4 core, Flash 512KB, RAM 192KB, 82 general IO ports.                                                  |
| 15  | Four-lane encoded motor interface x4: Can drive four motors simultaneously. Refer to the corresponding course documents for connection methods based on different models. |
| 16  | Bluetooth module interface: Can receive control instructions from mobile apps, other Bluetooth modules, etc.                                                              |
| 17  | User button x2: Allows users to customize key functions and combined key functions.                                                                                       |
| 18  | Bus servo interface x2: Can control the movement of the bus servo mechanical arm.                                                                                         |
| 19  | Buzzer: Used for user prompts and alarm functions.                                                                                                                        |
| 20  | Power switch: Main power switch of the development board.                                                                                                                 |
| 21  | Power interface: DC 5V ~ 12.6V power input, can be powered by a power supply or battery.                                                                                  |
| 22  | SBUS remote control receiver interface: Used to connect model aircraft remote control receiver.                                                                           |
| 23  | 5V power supply PWM servo interface x2: Can be used for 5V servo control.                                                                                                 |


# 1.2. Schematic Explanation


### 1.2.1. Main chip : STM32F407VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=58ae96b6758f7a2a660900fab4aa83928362146a559b3e732d98f7a9389c42d9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=b4e328b6c0d2888bc4d339b39a2bbccce3432046f55beea18a8c2929a69a42cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=fd409ba5b37cd82a0adaafb948b85d2ad1677bd4cb23cd5625922b52591b3a5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=1b767d662747c1d998cb98eedca24cd1441f1add1f5d43ff9095f9e6708646b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=bba79ce15011710662528810b06900136592d05fd5cfca3a1fa622e311d2fd19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=9b0d9274e6684dcdbb4cf0a223b762a76492fd918a7c6118b2c8548459eb7f30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=1f576cc56d4f1dac308325f0933e3a3d86e11fcfbec1a4fd3979e2b0671ea811&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=d83cc64769f0562bd8f6803660c60616138646d37fe29d86b4b08184cf378ea1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=d44df77d997997fb6df6e58a74c9274185e7a36aad495d131f32857e9c23a1ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=61b0af97e00d798bc76548e97ac465cd6b72e083d5169e304f93d7fa4baaefb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=ec418405a80fcc571253d25755ea470e971af9b28f1cbad1344a55725b7bbbde&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=2596bc9379a1e86bc1f63f7ce66fbe7cb17a04aecd8129e3abc3cc74536f0c7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=bcfbda5f00362cf993aba276870512d20da60f1a2964718169f800f1fdfa69a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=c5b8c24675f3b0c5fef451798d715f7b32f588a44b0b259a4d04a9e99352cd52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=6bdc1eb1fecf7aed37393f9e086722bc41d7f010634267afe164f92f79313fcb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=e210e6e8859dd2cabaf726d5dc07c80fba126734579eda813d915db9340feb43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=e0ae0cf965bb3664dfa34daf893f516ba301486f409f9dca0edc79205bd765f1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=0c70e4c1e58c0a24eec57ee5b0d1bd8920cdd064ae7d27853b5168badd123f72&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=bc7a1be93bb6b7ed6d77df44f25bf3b1dc3f326a9161de597fb60cf519b62be3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=9de355158c8944f976a8ed7e74e0037c40e7d6438c5f3f951ca518d0b60b89f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=795f895d939841351a0efbc75607f1a405cc674da1d193fe2618e2b839a306e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=44c6950c42932556ff9c37bba4c916ef38a301105b595cb8619300cec8540caa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=8d7e51c11cfb88c113cf3b3940f38aea05ba3f6a5df52c02b4bf1354fb950f33&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=f42a8ca64c17e4d41263a59ef5df0266be8647e202d49044bb5d4a7aaa339be1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=502ef4afc68292afbbcf31f193585daf3abed99d28631fa7bba2e9c226de9bbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RTDCDH3F%2F20260420%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260420T214226Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF4aCXVzLXdlc3QtMiJHMEUCIBUb5Mj69hOLFX4lcuWu8Lq91o6K3r9A8YsbOJKh2rzvAiEA4BeH9VAy4wvdwKKUO6bB1VsvvEpux686sY8Jv3mMYJMq%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDD1t0pAQAH3JZQNnayrcAw%2FO56BFTKFXYX9msBs%2BEn%2BnN%2F0iyXkHjXItB5%2BFpMlOtjHfXhBUI64lyuuIJsksGl8YzUOwdVu13SAH2f9SNm2hU59lyph6rVvDkoruv4pgvOZSaO3F10lRlgNeDIvQQPgSp6imM2trsLe3gSLUPiI4pXLv2dhlW1n4xjEyUQC2Ftk2Typ9kTp4rz1WuYXkfxWyKEuAQeNz9oZIhxJ9S85akaWar7gsI%2BDKURhtcwTi7qnoenO9tMLcgSoZDjXk6lwIe%2Fa0ovSFSV2fLbMlXhnO91ZbmkSHo7IOfm2PUI8dhegTE4ztbqvy43xWvlfH0pjYaj5IKWFZ5L%2BuT9ry6oRbY10UyDQM58qnGDQzpmLdI7axv9EXampiFDhKZ27NlrXYTErnFwsAEgh7R54p%2F80VGE3QAhMkkysfJZaLglKXCp8jP8x4S%2B%2B9blz9zd8Kh%2B88HNs7zoMHsa8pXGMH9sLwFN6IGiuKUE3y81pLno1Mv94chjHNcwoQ0CTZAOwqpjxfzxgHJdkPpGERGIb9Byedyg%2BHh8q0hslU4aBlCu8k0x6M5vXvZ%2FIkO7joO01w7XhALPaj3Gnj1Q3%2Fyfch5FEyBMBAHCaT78YyIv%2B1K3ukVZTYE4u%2FPrXtPiZIMLGyms8GOqUBwlagslVEIeTo1Q8nKjK9TgWqBotZiKZEeRlF3xZpNimxup8js7dfaBTcu21ukg7gVcOmmrBiMgbNv9M7ePE863zdCOu7wrDC9aiQojhYSMNKNmClhUhzuh9oKrkd%2Fk45%2FlfuZG1OCFo81UoLeRX59SUtJLCl1IsyYRTb6tBvhSKCAFdhCYkGhgu8B%2FrYo3jQ5k%2BXXbaDvqxaf1LXzHz4gX6wM8XF&X-Amz-Signature=4573c0b899cf27efa312198c93cfbaf8c2586267a1fa3a1247634b0e90e4c19d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

