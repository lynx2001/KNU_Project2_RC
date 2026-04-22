# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=bda0e00167eb5354014fd899ee4c1376c5469b6e3cb57bb2ad967792588f1b3d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=804b33e30a8d88c1d1d3eaa70f243acebf739b404277be7bcdbff7f698a3ca5c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=e6bccb4ef1a98defd0d9e57e1c1278476d5ddd8643e7fa185d4da8659bb0e1fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=a20c9020bbf83e1df7e3100497f0e25ed6aeb5ed387cba4a77c4be2717f3f229&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=8b852925427b043e9fa8c21f49e30d8a1bb5bb5c07f91cf5816b38faacf2111a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=7003efbb74483c68ea992ab461b9c47a364243682e3a7a547cc02125e4f20bb0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=40bd108674d536b89144fbdfca6e237924cb31ca6545953b206e13943cccca28&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=0fd9dc8ce0a051321095aadccbddb6a6f97d3f37d9044a38daef94d4d4de1025&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=e6557c14374efbe8d3c977b14bc6263cb557ef6bf2fbe3fdb82334f6efbe74a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=cbb7839f8bb1cb8745702fcda09973e90f434cb144dba7d5bfd7d7175773b932&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=ebf80e82d48750a10fe1e394dafc7f412984a8acb9f9e4d068aea6d9ad98b756&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=40aaddad523b06ac6b8f47387f6ef6554fe5a2d5aa3a2d0580db8c7e7569f29b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=5680367e4f54026efc77e27a651596b075703b55878e25364c2d5c9a35c76551&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=8fba31a424f012cf76fdde1d11dc34a4420c607faf9b9f2cb263b20a1e4c8ced&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=4777fb5c455cd3e3931f596d989e309b33efcde592980962faef105174c00182&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=b462a0770cb59e66681753bafde11760b6bf2947e30983d4f1f282b45e11953c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=48d99fbb6d7fc7de9d2c989a35f1a79f6fc772ae5665131673b5b36c38900d13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=55355a8903efa0b1082a9c8d6d189f41d082d0207232a9ea108f6d727b16c328&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=cb013a46da7412c9a1a3b9cd990e00802a59ac989242fdc2837960cfb8807678&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=97479e591a10ec015b266947b4650a5c0f639dd5749e8b1072b1093aa8c9855c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=e366f1ccc1a924569022ceac7d0a07d86fe6714507d2543761ba84b96383bee9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=be67ad4ec83d27d5147109b969c1b0dec01f30be10979214168384fd5eb524d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=ea310a987c7a9ea9d1073474c25cbb0fa3a3b2984b615ac828f6f66e777eb896&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=954bbfc0fa0e6cbcde57f2a7651dc8328030ff4054438e88318982cefb60b9eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=2ed4a66758510bd91c0c20c39580dab7cec8d90a0ce32bbc90fc1c6b69aaaa8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214646Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=b356e1faceb672307dd37204dfbd1846f7668cce4f2d8bb2307d42b463970bbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665PR4KQLQ%2F20260422%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260422T214647Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIASpl2KKP5gZBP77yL%2BfWmgfO2maXhSWsFh41aeB2LuWAiB5gDiR4XBB%2FbF0hevwzOhEctyhFdO1yN5Wn5zP2RGMvir%2FAwhWEAAaDDYzNzQyMzE4MzgwNSIMgd5h1VqsJYZRM4g0KtwDKJ4Ykr62WP%2BDAnDbqWkMuvelpbBt596jpS6D8PS9MANLLhcatU%2FSwIQz1gk%2FqGgvokdSjPVaxGKU8A1APudJKggylgQQZLrpyajS20XBfSYQvxbzzbaDqT%2BICE8wdQlwcGqFfG28kgttLOoHogKKPIybSute7qO0JIO%2FFGCSeg0%2F%2BZiWiF2cqltVn3%2Ft%2FQL3GmwUoAlu72DqBe15vZfy7cmhZs3e6P%2FQkIkS6TXYpXF9O4BDpygvruCUHGRag32Yd5rzjNUpqoGH%2FVJ5jYXToEBsf%2Fj7RY3SyZQR7eZT%2FndnQ%2BOYFSxvIA1H1qz%2BN5iIeF7uJ2l93JH%2BQS9Cv5BMDxb%2BkzxeuWxE7Af1wNn8WbekV4arRkzktgnfkFRPI%2BdAzZ%2BGqzSpe%2F9nshIZdA%2BFLSPNI61zQH3JBJYRgV2Fvhlz7SpH1gaooMbhiXniWeiNPt2Lt8M3bYabMrdNgv69sU3Uk%2B6C7QjjmVTurrZ7HN6KFo3w%2BTpMvK%2BIRTotl5i1umuozkU0MPUeYkJkNjCJzwO%2B1cZ1dpa8Q43icEhGcXyNQOaLrTuWhrAiKEnfUhojwEOeOoqCOwQm6r1HvVrqERP2SMjkfk%2Bt8Qi09ZMm0bQ6loreSLp%2BMGvBa5Mw8uWkzwY6pgG%2FTFekADBEX3rAt2Qessh31skEIPERwF4tpiQjxPMNfWfEbtDNwGRk%2Bj5kdZL43YU98EHsyFzr50Popgl79FllFHM9iDX4cJB%2BAGFGTMMjOcqqvZPXIyuHCyEWJY%2F2ooQYCGMBaF7gEccMFZcdrToJOx8XV9QyMwPMv7nCihXVcZFbHmTSlTrEZNMt%2FRj5XQBFgyX84vHog%2BHsplYZ6Nc0xtDJFUud&X-Amz-Signature=513bd2acbbb6d444b2c3aef4fd58c2ea0cf564d1a4bd46046cd4e4e70d7f62f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

