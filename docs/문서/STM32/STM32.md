# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=c8637ee2b7f66fe193874e38a9d413f60c8999ee7ba1f2979a12dc0348ca735e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=52e2c42536a2240b42c551d305d6f0476eef91e7b4681946437d794e496cae59&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=2f137de8689907fb35cbd236995e4d0717a059759c07913027ea14819c3740fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=72828ba78f170e116a979b6297f9697baed9687bc3faaefcaa9e3ab0f387cfdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=4fc4629c3c35f2a5f7870b5b1c2c81f6f421b66f76b0cc23cfa7c037f7320382&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=81cf71a2864dbf2c569fd99ec3fdf4295e1cabd260159d7361ec3d1b5ed3951b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=3d5df580df98f5ad74da832b99b3fe6e5386f0a28f4a46aaf884c4f76e4213ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=73ad6a3b810ac649420970d095d097e1d171c540b03350296077ca5474fa45c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=d89ab8be0fdecfeec2dfdeb24c0ca8612390617fab0ef4d76052781824c29726&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=6164b26178efc131ddfc760e79d39fad05c1780ed9cb639690b5d2f588ea04d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=571ad37239f478575f590f4ccb3b6f19be0a17783804635bea876bc64aa5a23c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=b43dc778104c57b341617063462f308640faa93ed2a4a0d7c04dd2a1203abe12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=293783467644d87c959e79280716f6245e5d11c7914be899c93be70dc4fe26fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=4211ece8148510da6280fbc308ec22d9ae193f43c1546bfbd009ece9512b7518&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=903c13ea224d653d8018a80a4cd89958c321170f7bd96eac6ae45c3764d26cdb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=8808ddd3fb596bb4faacbf08818c7408cc731151d0f4a642d3f418c9d25c4352&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=f690cfb8c1c088a5bf59c7a43db617f2c6027a86a1984da18db1ef4e581e591b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=86916d0353a1e0122f98710cd69e8a7163a08758d9d7f7663edc43bed7ef7fd2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220332Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=2be893cc7b6006cb1f2f9a7a9fe27324ff2734afd2e0427f0517b199431cb78a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=b7cf7e7a7448e04b6c2d2b6b911f31ee99b140b02586a704ecbaa64c489644ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=55180a26cf7d785408e6e030b9772050b723239f84cb0ae1dda2ebdfe36211fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=251eed62891eda1f18f2a8340774d8c7495030dc9898c079a715b272d7aca0a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=32abed60ce769c2325a34c9e5c4c8a52f8fdefb058581d308111bcc44c7b57d2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=99a7ff631d0e791194fad903b18d37253bc7ff062f817872e6f9c4170a875913&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=245a2b49b40d61f3e5a854d2e51b3dbebc5193eceb1cb3c4672bc80ea6dfbbaa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=6ca1b2f4c70c9bb49d96f4ca0afcb400d28b9e129eafb4ab66bc697fc78cf083&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466UPBCYAQQ%2F20260627%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260627T220333Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFFi6A%2F6mp6YdKeN%2FcTIX1sJU4KD4E64vED5xrzbLFV8AiBTcEs8%2FiafVN1yHw44zSC3iqfijJRbgmL%2Fp4dHHU%2BqmSqIBAiH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMTkEfWOpIxd2Gz%2F1PKtwD%2FnPvTSNG7tXJysx7QOSk4hARKqtgb%2Fq3vbZE7uOvl3r7Tdu3SKd%2FXs6wEXOg2k4f1ux8ohe%2BwSHUVHHP4xOBfVuGc3Z4TJJ%2Fxqmoiht1oFa8quDxRpc2L2ll7Rtdp8sZV3J8HyCulOt6DMV%2F7Vr%2B6EPp1h7piwf5m7Eg%2BpAZJlae0zVGwgqntI2m%2BB7S8UYiZbo3ptS%2B77e8SrWgh6eqIBE0d0G%2FF61V1IyVW7DsuVgyh3oAdXgKyhfIWcXDzlatdlmtVrjjSFt9lD4H1Y02OZEFYpz%2F662M7IUMRgY598bo9X8l9auRxyKxA62i9bgWTLrRVKoJB9ZO5e5BfOL5jpTGPdt%2FxpAFd483zyYANGpkW62E8NT5teFkdZT6joZ6%2BDsEmTjxWc4cNViDocsD7m0QXYDZg8Sdk8T0c0QXWcrvcKVX8OJx2bTuGFyOaTOvgM61%2B5cKjzsaiTqVTccjosVvh3WNMSLaeN27OKgnltpfI1YRE8ExPd%2FuCVBTMTjaCgsn84LNcN2QseDE9NZpw0rR%2B%2B3iZ9u2GEgJrlxa9UJafGW9gfVSqL%2Ff%2FqWdGz2CJsf%2FfvbvEe7C4GQP4RCzSbzxaASs1pBgEIq6gZxCvGoqkprD0x2q2FwGJTQwlYuB0gY6pgG8J6LVSWfFoVUM5XNq%2FWqyb6QxP05NTdKNedD5mJfJU3kY9mQ%2F5ye8vWmvzQQDU5M3h6gtU%2BP%2BY4gtO9aaSMwXZMHC2N7dBpv3W50TcedOTwapUyKYngD8VXCpjcXkW9Fuo%2BwZJ4N%2BVSN8jikNckb6IMPhPqxGTpWNobkB3U6%2FqvvFmzX4jrQurQUuVVL480sDoqVqgdOg%2FbfKYPSyeAfKNzE4u%2Byv&X-Amz-Signature=6987e412867c6b3be2c6c9425b20acbfbeceb18162ff67a56a2f97255d9a4d97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

