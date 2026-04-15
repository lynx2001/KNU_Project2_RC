# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=85e6f93598840320e7e336e08e6f57f273103167a36ef33f518132ff20a58fa2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=53273f00187109c1f9914b6c609ef1d6adc66abc2d9a61530a330602228cd947&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=280306f10df8e82673c89124d7865524889c42b6efa7d1ba3e207a8f4d4f239a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=c5f29edf0f30e69db005b592fe673f7e3b5454a13ad0ea4c20935e261dece95b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=eea78f72475edd17573db3feeef1fcc7be770198a4ca1fce46816a3fc84ba4db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=8649afa41077c249e363a2867839b364e8858cbf1813d1c9e872c587990cfaef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=442bd9662cd39f6ab22b6ae99ec2b57f114a73f4bf4a00cc685d0bf50b9459da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=dbe8b0e7af6e01502b557ec412ec237a104c6abe1d95f1413d53e97e7c3ae95d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=d1d2290f32ca1c7c76c449956c3477a8b5b3f89cc6043b163d3a132787c8540c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=4c56f8b65af96a14184f6c0f1ee220ef040ff84d8c0cbc04faf357c567efc0be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=17233e5ac418e7aae333f7cdc12c6a06bfb5d02b6449c687ddfcb9a65bba0ed3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=cde3e863c0bfe12d74386f05fb27bdf618d45c6761af336013e683d865546d52&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=198ac6fb11bfe73d2917e3ea85b243e1e776547d0c1c7d501d53beb6e76400e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=fb409d400e6d34b2d7e0a76b7db838d6a67bf7f10b94201f51cc855ae68452a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=28703760af17bdb6bbebc9c9080fb040b44c1859026091c129b41366e0b2eccb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=cf8de5095e67fb77b059bda0e1a2abf052644d186601dc3d45c6063d3ad396af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=c78849bf1fc44aae81ffff1f371ebb4dba98be50d513e53bbec359e585371f7b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=2922db5d1d844a0e37dd7b687ba3159264aa5ecb60ed41a193a63007e0d71410&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=b6e4fcf8c58bfb9483888a77e2c2402fb3bd3e20d239d4275e01b173e524613c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=ec63aa1092445d3dae43660396079a16d98da9b92d16e709e2cf55da40938559&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=7d70c86655b6869b3b48cb9a6e430d9f44debd8380beb49ca54aca4024064366&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=c0349b534c0f3efbb33e9d2dfb4fa62d9f444c096331f5db8ae8e47d77745d64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=54ac566c785539ff018f3966572d7eb8b0db2168fab0ce37ba0ef81f82728394&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=865638af9d819304826cdc8d8f4079088dd6ce3c2886876f0cba58296a227eb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=edb2dccc7ee0da8b7d373358f676013f45ae07544f0ea12f60e481dcce24f5ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=cb5c8cd9afb7f3bf6faaa432fc23080d89f76b018793cf7687529f6bc8ef8449&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VZALPMKK%2F20260415%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260415T214912Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC77gXohq8%2FIBDmh70aMXP9KKcSLrEUk4RHpfhJioqWpgIgHghbmeTneHysN609vltcg%2FM9cESUFkjMJKilulkEyUUqiAQIrf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFx4%2FFBd2WYJutshPyrcA23mqNR%2FIsvchI4c%2F7oHnIiQ%2BTf2prSDKw92hieSDdysB6M3j5DeV%2FNiXqMuM6t1Sdnc6aY%2BFKib10fAIrFXBYT1rkJeGTuYxoUBRdVkjQq%2FfaU%2BGq2UmfsHX5wYb7u1WUCg4hHYblcEjaHKqcQGFkCObu9%2FCregPnQopVSuYlLROWH8hpDXcnz1xE1ZvVH00%2FLtUPsDcYY4ygD92VxLPXOkEdmAcHyhwKpxufTDX%2Fogz0K7Emke6Gxuo8hDTYUcU0CVze%2BxJ7s1F6yJUbcePzd2zUJRAKNxIFkhupKEdsQrZ%2Bbt12ppc7kPzJ5F4TsFuccU0ZyvdJuBtwkwI2jggNqvEHR%2BsJK22NsBgQ7oJ7Fe3YRtu50SXC6D4iV%2F0LvGrcbZEgWfFzLHtGfBpBw9QEuGVED15uEYI0ly4GlXdiVHI9tNQZdg2IR48H%2FRm0vM2ZVo8Ei%2B7dxRy%2FiMra0YrDL9y5hXzD1v6U%2BFAqOW2hAEc9yUv7CccPPR7p6XaYclvTGxMKxQ5AVgYLl6%2FdAAl%2B6IH9FxSrKQqCFAYMUPBDP7tBJyWWZadxnO2fYg5ldZLoWoNzciX3HVS3Yy6nQ2gUYAU2WXV2Ef6HEPRJpF4AeXH3urKi7%2F6JsE83bUMODT%2F84GOqUBnZuNR%2B7SuLhjrXNIEHTzIcXSLEr0FpJ86n21yz8CQlGPIAdj4vYw95RBLiS3vm8uBq2yUtYn7jEJzkpyatkpwi5Pz0MeJgk8Xw0v2G2v8k%2FYP31xLm6%2BBr7q8Dgy4Jg1EyxywcUXgnl4xh9DwOBVSSfg0gGVnYlgMpmmvGfMEBDzcxqcBaDw3e7TZ0LTpdmHoRwwvCsbKnfE%2BSIv3DZIGqYRCwcJ&X-Amz-Signature=2838e6286bb54455c6e29c1f7759b42a1b14306a241bbe563e3b0a4c0d13c07e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

