# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=d0d3978f58aaa0ab9b6739313331bf319c3547576354227f4f90b4249848d990&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=475dad9ef055f576760b6fcc5d41ff1c6849f6d5f7ccdcd685ea978bd7919389&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=153b211d2d76f369e407ce3ee3b9b4290dda1573e470f4c1627e27a8bf9d33a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=d8553898fc2c103eeae7ffa4469fcd562eeceb3d9e7c005ef33ab373c95ce631&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=9aed04e22dbb36bbae307296030d6c32da09ae490e649bb70934bbbdfb242253&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=cf52ff9933a5160f2b2f18c915713afebb869495192c5d2fdaa3a3858c549187&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=a56ca59e2b208999414ec695198fc6bc89a166bd23ccfd6d9b41da9e47885a91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=8e32689686c8ba7e768269c4e602f810e84aab0a4cefa72c3410f148bfd66cbb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=ade619b2775cbd3c15792ffb61f85fe3949016c0f28b60b582062d86bc34bd4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=6f67333a0a2999a38271ca8be314ece5b0e82cd5fbb4230088d4b6cbb0edef0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=bd3894b385f81caea41cd128b97dc1f111e471f169a8c29cfa206ebeeb8b6a5c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=0d4b26e490620c3576491d4a09bac3087eaea59c5f78736424781b1bb2a4e807&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=9412bc91a9aebe7fb3c4e5146003060afdc40da58f9a1287dda2bbfae55bfdb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=18f142e2739dc2b9da758694029632d1718445e0afc00d74476ed2dccbaa1dfb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=aadc65542583252f163bb801a2cf49257a7944d9874b0c8a6c202794541d2f6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=7be8f9f8298174126b3b69ceb7481e368a7cb35ac3b9d6992d0980fb0f8dbb5f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=36a7803711fcd9abee37c1f3e73255b01806bca9a2aa20b8d1112d52b19bdf77&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=0ba1a148a26f71a9529266807e96c18115989a6f8c2540b8850de595e3554e26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=6b8af5a75f5894d6bd3ba667ce9ff85365308267daa59694be5b070d5d4f5d07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=4d0c91e5371b24471fee8af6ed42164c2d1c8769f1107fddae81ef9930e54dff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=33d6cf8e2ff5b8071c5cf052adb0cedd43a59d5c72e05ccfa40625bab3599343&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=036dde458c0446184dec554bb79602b7404159fcbcdef86b3fbc80c099f9c59a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=44e6aa8aaf1be5bb4bc70f89fdf4fb10538f3163839639e434bbee2fd4c07557&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=4a75cea80e1827f69e10be7217f932e52a903f12b2ddecce5e6415943b837d45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=ca832a2804544e02e684d5bb9c3f5901f49068c5cbd09d895e6c4a4fa62c9674&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=de698a7484e5da29f7f1b9443ccc31447447d6e4202d5d77932aea0cf520cec4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466X4P2XGOZ%2F20260620%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260620T220619Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBYaCXVzLXdlc3QtMiJIMEYCIQDetF6Pvz%2BRkUIv7SxvNoIMyQ6d4DBt2IxgSOmKsz1A8gIhANi5r8NTeyslugzct9hb1yhCJ67dKlZWZyCfbIaE4TFnKogECN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxiCuANcrDMSUcfAEEq3APkPXlo1HZb3MoTj48NjWkk%2FRWUeDY8bkD1JAUZtduCsFIZUy7vwlcS1JBcJn8Yr6B74jc0yVmF%2FdU2JXpEKve11aF81Q5IRLx4YpWgVlLkONIWrIz%2Fksqli6Ukwo9yZlDDhkYCRb9EzaAsVJILxt6EwpLk4W%2BktixPADbBx5jZjdDwnJOuP17NQLIvJ2HYGVhnr%2FFKSDULJXxywqrwaeQmTuer3sPkaLpooLzgWKJBj%2B2C4HspRssbumusAeTONEmX9tF67ayY6Ap8VSXR6buwVuts5Umjr7uDmxoLby%2BegRj5wkD2fXfb1PsuGGuEgwfajPVNweF0vTE5S0giYcgKGyGUI0mIqGlVC0kd%2FPFM4YOqMKxBlEDNSAKSQ2QaBr8pNT50Oddngx07ea20EI6fLXqgzSTpjqsvxMxF1%2ByTB%2F7gVeypX2DtyUWSyAdMMLjQTEvwKkeY3loqNJmwgrN9RYFPky%2B8ju%2BpZcorNKLK0tZu0zUCzOnTpxN0JPoVp8xVoRvvD89iyblSurDFMYMdndGJek%2BWi00TiLaOEal1gFk9upTmybCveoveZiVCTciYZ1xDSlS8SVTbZ6BF%2FB3tGpszDd9aIFLiguLdtEAsTi02rHcRyMpirt2mRjCrmNzRBjqkASMQ963%2FWVTodN%2FI3NJ0D50lDRZN8YdSrmTgbGZIaWvr1fSflaBBYqidYeVyrmsqbvbhqozhvNHu1M0wGIGd8yvxgT7eNZyH%2BYntws5Vdudzou%2Bj09HLuKwdKxBTDrjr2cogafmMpTayadUc6UWqB0K794KSnxyaMYcLrkhyuaoeK4ycVOZbqrXV0HsaIQr3cJPRnuzqM5W2fxwmMHaqu%2Bykdlta&X-Amz-Signature=57e6355528350035fcbdca89e614a2d95e0150b562f24510eaa94b7096421836&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

