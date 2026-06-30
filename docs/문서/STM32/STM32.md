# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=d58a72759b6ed02a8f90faf279cae209a300c6ba968a001717e47007b2ba2e86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=a29bde5aadd142b8d0bb8bc4dabd6ef0cc7725310a7b5650e85fbb984426e523&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=c8a459c65763a1337c4304effd6886d425a9a83729ea16239253ea3dd573e8df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=d43e68fc5028ac00cf5ab6552e6dae9904995c0713744164c66d268bdd88ec4b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=1e0d58cf9c6b9f7a27367dbfea96f29c630757985a564154712fd40a99b2b06a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=ca5f47dc7e1ba96d31852eed2d7af6b3208c650c7e45e7b52507d10e755569c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=e43df37310329a2d749478bcdeb085718d9c2c6177ddc078372aaf1b7348780f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=1ab400057dcff1f5728715a04d8ba430f2a191d417fe7f46f9d55577839c68c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=76c5a6ee630924e0b1530e568a707db0aa5c3bd5fa0e4646918da7341ddb0d50&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=edcc6fa51059e35ffe9a261a8fd2a14e40c58bb3b7e5f0a4409a7eacf436e020&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=2e7641c8889936d24f361e2c3fce5a1e18c724d29c156ea0c63160e2d5f75e1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=58313aa586c4c44d066583d459b73c772bbb2282ba70ea575ced17734a0ab422&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=c6edb545c1f238bdc664e71c1eaa0c1da7d276167dc0e8866c823fd10c368b6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=37057001d44fdbd145a15ac70800d91c5c5e337577af6d34acdc21e41226442e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=9d7046774f89a258341ec07f8fffbf7b4fba87f4956ec100ed76fcbf1bd65e0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=06ddc165d362efd77422f7989ec4305963850157da151996c7e9f4a5e4fc2df3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=d5e3f1a54167e18dcb39e2d27527d208ed724d3c804edd8771643622dc8bd8c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=37443383dea38ad5c31d9b232ae84fae0906d02108546be19e7ab1c714e058cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=5ce7a4e5e050a170e9a4e029465a1c1f3fc1af50633a06465540696d9166b63b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=4c6543107a89d1cb93d75d92ed9816754d981325be3c8bf46e39f9a1c8cb6ea4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=cc2f23ffcfd0c36563da43efb77beb0012fad0d2d9acafddeb7c439272c5ce6c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=73c784623f60e2da65dabd2de02608b34f07698c5830b8ecf9f152eb5946fc09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=daf9c2148f561e2284bb6aefedddd68b62e47e77209cea95ffddea50350a41bf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=ba1dfe93152c09f1ab5c6f1b832d26d8176e5dd5018c23c61338597bca85d121&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=5041dbd929d4465bc68c44b0ae77e59a8f39baab261db3f5628a8b5ffc7fb36d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=3987774d1d97f20337a3533d30e88268b5931ad0a78705e9c9ef7a47cc576be5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7R7CZO%2F20260630%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260630T221939Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEAYaCXVzLXdlc3QtMiJHMEUCIEidfOQXYQpxudDv3C87Qdt2jnXeUXS585PHXE%2BmvlUlAiEAlFrP0ppS4mUaG4D%2BVUGFiIpZinysUltjSAL26Dtnzc4qiAQIz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDNErv%2BsXj8PKymkxmircA9ajYhHnz1avO%2FJve6tbualc1B8LC%2FykwVJk8ZEIcCIiSpWw%2F7jPKGnsETupJq666ZFoHPPdv0%2BQP1k8gxIfIDcb9Q6JJNe4YAkqzL%2B%2B8nhcdD9QVaqsnEOlowOS14rYPQWHoxFjYYO6XstTzVcxDYU0OFHr6ygz2uVb0DGP%2Bu0qISV8wT4Nl4uCCjaF7ufAgAJRISRdrJXVHyPVJ9wF8y7EGTo2rctc2Oe1tWOITiYXfk2s2PbiW8HIJkVC%2F7isOz96y2O3v4HeMeJPnnoh0FZxa0DMkkOeuQK3qHjvbB0VqawPsugl5CA2dTpN2xvij8KWZbkoYd%2B1pKZ24arkrAN5vgSH5CJSBiipzuNz9844i9ewrJzHK2aGwkIBIQGLl4jYxXxUcSAByYefEErQ025IqCSm5PMznvOK%2F4x2f6sp7n0VrXS2YUq2U6YzKixNCbC5RFRnBW7l76Wi60pxGin0fElNSLeiRNcWBlXlVi7Mvc5lZ4uvtmgvF%2BHnpFnIzYTe1zacAHwf2EmQOdVYP827jW9x%2BCQfrjikhP4nrJiVMFOloxiTOAvzmkxVlIcDM2Kq7bbkAdS5rISen8dmILK3DaR9XmJMhsvJfYtWm%2BIPddkfXQwplAMEH9RUMPvnkNIGOqUB2s9Xcpm6jJs2C1O9rn4%2FFa69soDOsKWME4b0OYjX055UxrGdhbkO72bt4PW%2BjjOwnpYFoXPX31rJ6HPYaeeZ8rBKHl0QR5UFd4YoIp6uHMmlsAMHTcc1JsFih3RZ%2FgfOGUqu%2BHYcAuUAADtWL%2F52TEvSkNEbxrl5jyR%2FidkdATMp2U%2Bs42c31cBwgzCZMKFLJm7isY%2FKYAQ2KoNyR%2FhUyPQamIow&X-Amz-Signature=d5f312f761940fcc2bfeba88dfe079926a5029225b9931cc1b72b1331f30331e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

