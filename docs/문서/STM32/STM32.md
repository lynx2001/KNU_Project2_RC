# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=b22b4665e225603b189eb9eee38255a1961ce0e627bfd4883882ba5783bf7393&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=be08ac1431e437339d74e2b3b47583345e70db1c910510b053c3db35a22e79eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=7efbed37a7fe8f18d736301b925e605e840a4611a1fb974affe47eccea115717&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=25b31af0711f32657d894d715cd6de7cf80902d7940611f76ff2f01243fd7e8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=b90e4b5f955f78f82bfbf368bc8b8b01eecd85f70a0ab7cc59d8c460055905cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=49ae58d129f2ea7240b57d0e246545409681cc3c863639a8501e8b5aa6a30aa8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=3a4b4b7f54f949bc328a735fd35c2d753d39ba6c15685493019555d381802bcb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=754ec0acc87459fe9821586b88e3ac310c1c26a8ea99a54a0a79d3fc4e0fbf92&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=013dbefa6e4fa1b2b0f93c24eea27cc0c33d10590a54ebe449463beff2e4bfb0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=3359f6ef0ff9ac1c56dfcc0708d26385d93e52ba5d1bb45e7f6025665657fd17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=fe2058016aad341364db929be10f4cfa53096be1941667657c097679e5a55c08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=d00acdd300d70e3b9c5f38b5332952d029939d01d55290bcf646372178c9aae2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=29f8a221ce7e4a3f66a10fa8751a5ddfb836178a34f9e0add9164be2b5627262&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=9b38b6b18f147048af6a5ad4522133139925b4f9d22f11956ee51ecaa1bf8206&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=571bb9ab098a3d425700814e88536d735be5bbc897e71369cfcc583ab35e5f1c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=d2d81f233575bf74b7473e1da906bd6e4d81b0a49f0e064685d586a7b3079d42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=7561e3e0a355108f4338b56ce6d6362d93fc2aae9f1473d4e963608a06d68901&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=60587f68ca824be83acb3408e5441cd06c41762f705272bb6a2c0ca11bc75036&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=33029b80243eb7b6daa3862fd7b59186936eb8c764fbcf6450e3df86e79a7c69&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=0b6a137ee2fe23f262a32c6ad63b49645a5e071970b03111334a278c7f74cb94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=be4d127a4c4ea2dc1f4af8a9a7f5516903798e78a7a8dc6e19b81ac4cc426b30&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=6f87a14b9f116b0752c641a908c7a994d53b580f44ee1bfa39fe4e723c804e44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=c9740e759507a0955d14f3b900bec6d1e511b75b4713df882c9e03632764d8e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=d51f3b01ade03cae57a5d1e1c6f2e705fce46558dd9ee759e567d4d7ff878da2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=964a978ea949d46dbdb4a2597946f97983c26284082386d6cca4d933b7eece4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=bc72f42ad4626c23d741b5c46856f7eaad10389c0853a091b20f1c8d6e1ecdff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466427EAHLM%2F20260618%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260618T225752Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAC3DNLHjm30Hw4F2aOlShcRBEMVzAqpnuxn8%2BWuzpqIAiAJo0IBtkvfwNN3dXXYCwJNNudF%2BvTjLMT%2BwwbT7Sj36CqIBAiv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMbf9m%2BfdWqPJwPJl0KtwDZG0GQUfUu%2Bw2wwwfaBQztRIL93Pa%2B3zLG%2BX2DBuOTUjukXxok4T0VJy1DGzUGyUgJ6aUYIa37k0yLzA0nHT57Xrf0Qj6Zg7FWM1Zf0Mbkx2rebZOQKypL3lzqPhXCRD5%2F6YSA7kJhT9%2FwVa%2BnPrh1tRF4Q69DkWvhqEpjUcIqDWQVrmUf9X6ogOps6NRHSY6urR0jBe%2FXIMVLCoOlLHqpJnHVGrcXdym6F7pVOJEd5VlyXfkCeaPPd2APl4RkAEdRocvNKFe%2Fgl51vT0%2FPhuObA1E05HK5pbkAjSUzI11ZnzudrIqlqjB%2FfJZoXbf0OmjrGZeXCyyvR9zFx7s%2BlHwCSfQAI3uV8eA4riG9uPmYoY2Rywksi%2B9be2oKcM%2FmP2noMPSZBa%2Bf1NicZ8uj0wsxPhK8Tvim1dTrNiXo7drV4DiZk0zcznE%2By%2FV0KCsM7VgEnaj%2FiedVcvbAk4RwsbDmplMILfHwKEBd%2BIVaNtOwQafkpJ%2FXFRvF4c0BoVkM%2Bf3xILHBhawDjgluK6SOrXSdUrjBvxDQX2Wq89V3%2FpCinl58qQD%2Bscdj6c4BcqPcrusno%2F6C%2BlVYwZfSPlxb8fJwDYdP6%2B5%2BHPXy0FXcjg1MrpWscsaIg2RWRzrFww%2BcPR0QY6pgGpSwZWCOE57KPllCCVwvoLznYD9CmzTrjnw%2FAKdUPLPZzCQayFEQXWN35ylWvpAMuZ6nVfj1Nse6Uf4RDpC%2FLbHcpuehK15Naplu%2BY7wOEUzXVTsgD%2FRBNT1s91egs9%2FzM3SrPoUwpe0M9Yxa%2B6PR3lM%2BERNMRJGZEwOmmgKeclZWDG7JPgOoo7jRUz9ecNPn%2FM0OEe1rrgHp0HMGRIbskfW2QKIUU&X-Amz-Signature=0df69a057e7eac6857d87fec4f4b4064cc5a4258b3a7d72ffe73d5f0212db298&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

