# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=b9b51776495640229cbd3b3ec6f04029fd0930c0aef183a96ce494906f4d63c6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=81869f148bee6a0bde23157b2cd31edd3a9127bb718034f7c8671a175fb5f89b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=82acecd13bd536448edc1e490942af9be56349c49413bdca1e8c0095dd1cf7d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=69da6d69cf77244c9e3a1eb1b95cdfb6a07582e12714c9811ccbf3adfc170b47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=c0a9b62c4fb9d085098fe8b02a02e2659169e0ea55dc1f01c081c3b0c3b89ea2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=ed422cd5310441521c93df1f292c2f075ffeb97352bf3e75af855e2b9c6c1626&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=3563858969e7043d8689a15004d33629ed112704280ccb339cd1d050cd98b594&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=e1da62a830db76609003bdbdb5a56af8506507ba757e0e88d9f3abb0de9c416e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=8ea1f6507ebaeecbc72ef13555ffbfe6fc227085619b15f56db9818463f47e8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=1726426ba161d38a82eaac3d8cb7690459b443d019bb42e73c7f5ae55252990a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=e27ad2648ce0a0f1e395a5d58dc8d7795ebb6776078081a4094ac685e3778a32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=22bdfb4e4dc42beadb361a55a028dc0434ed516a960ac80b0056c3f45e78fbf6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=1374faaa5b01c67f5cde8ccda33270e4222a8a0390c5481f7fed378c55cb8349&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=e7a9fd6d3881db8db547326d50025a21668519cb82a05539f9f935e33f587089&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=1c7f61a532f2cd4d62069740a66c2cff7f647b7f6109c30646280a6751cb848a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=14b81d5f8e006ba5d196b492da262250198f438a402de3a924d7ce5ced7dae5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=b08b53e89a9a595a9bc987bc19c8472e3a10e4fd3ed274be24d432d25da0ee24&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=18eb30eaaca835e92f27d831ae0cbbb7488d595f5a2366d02813dd442bdb982e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=843a1711f7dcca8b747e10e89b1f9fc82e2bf3f1849e982f95ba03e763e3aafa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=0c810e76bd62edbea958290dbb95f8d1d62d852b2bf1d395bb7e299c568d5911&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=d691807bca99924f7f12f577ad99b98e2c37d38507a527f7c7b99dc133c15e2f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=d3cdc775a4b4bfdc63be8c9ce4b7cdc4e2d41aa997c23f84f794a4dbc3684b10&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=926cb57ec3891441e6246017345b99da9f6864b12ca13930c418794af5940854&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=e5d8f4ea7b0c40fc1fc959b709c0f5742dc9b15b5f51cc2d6ae8ec1e8b7d2f90&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=ee30738414be4e644f541bb53352043286b0ae2eafddf65a6962c970e065db26&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=a0c9e7fe01c2cf5b9ff14bb6b7befb4b3f323fb5637f1edc447c9462a0dcf44c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665OC3257D%2F20260414%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260414T214632Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDKhss8y7eK6BtghFPVjZdp0hZ4VDA07orjXyJGiMh%2BGAiA3fmzI5lqtxCVrW7oUygv6ZUal8we7TkI8WbmNVKPX5yqIBAiX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMSEQANpm%2Bf1ORweddKtwD4pq%2B9dLGMBUMzDpOUn%2FefLpvsP2lGgkQ16ZXNoYeSvg9jNXA1W2OuzOmI5bJPO2mJvLFiA4Ilz51020isa19d0EInwddV8Fs47y9ZygpUEH84wOtZUC7NDFxRhFRjVekhLBiTXVSLqShIaqi7B6oPZ1oYIW1jFIyIa0VDnV1td8PXVqOZXTl9ZQ%2BlssVYp8r1si1NGwpF2Nd1Jfh1Vo9KIY9XH%2BKYdmIk31%2BpvOXDVarPlDxE4zdgRvVqW8pImF%2Bia4V7X6aulbYwvLvNGNnn%2FIWIfQ23zcmRI2Yikr3MNiyRr6Rb3ZUpg5XWE6Oqtj7xkjt7zo8xpboN7w9SGovQSj4z%2BpxFZCqedF8Gqj9UWTx3DCyhUn4wfxNhKcbq63zDGBKXlt%2BXzSquVWdfqqig%2FPfd7SMwy3znkBzDZQFif7r2oVICg7yet2RZ9Elwq%2ByZhFPvshbeFW0i5wInbQv6q%2B%2F1m6m0JX8wR7y2XI0K62piJr8HwuLQPC9mOn%2BX6BmpxWeyim6dlLd3xhVFfi6UO3vHy2qCVFU5WFNjsgQuddGMjjRUPg8R%2FU3%2B%2Briwv32pN%2FTH352yhcZRyV29zgwqGqGTAMVKcbi5o%2BXMFF4gHmqSCQGpCZ04VIgjnUwtuX6zgY6pgERn7Z4CcD4bJ5zgVy2KnBf%2BSdRmvfb8H5ne70K3qTwFqxRr7crgqnaHgYThngoeD%2FVfhcJjNm7eyvY11CVXuk3QOzeOEMo%2FrkIBrC4VgKT3vQfCj%2Bdl4z3%2BimhxKP4zX12VBSb880MydH%2FBeRfuOLIVjr5I2toNioPmUeGZ5rPzFt8NNgnjM580Bt64fpLLNqigJkchedt1dSy9W8Od%2FE4z32Wg9X%2B&X-Amz-Signature=549923020b762335027d629196e1bd21f11bb0bdac88783a17d5f950872f4aeb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

