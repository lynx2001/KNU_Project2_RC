# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=61a43162ceaa53a803169f64e83cb3bd7feeea913b951fb5530083711eacdaec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=813be24c4aa0b3b7aaddfbe5e70089ee6f4c14b8b0589718376d7ccdec635c57&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=f7db9f8d197209acfc777b72c4f605ade75b2301b13cf2194651ac38df0cf086&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=25b13dde9a6db935c39352c8069f4fff6b750c0146e150ba327b49d94749a710&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=af6f41933d1970f8a08de65ff848b30dcd0cfd4c8cadfca78caa820f8c8363f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=53abcb0f4f0cec0f9be7b27e0a595bad9bbdeec5a38b4979f5e9f9ba2a5b1778&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=5791816f2d8f48b233d07a5bb2589b21b0bead695bb90fd7284e08bb574d66ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=71aee46009ca9d7d14fefb755169d186a61e01dce64780abacd3d585363cbf2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=91219e3d8568ef258528e86db1fac12734d431be568fb6282defdfe0b5566d74&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=74ac2205e8b72b1a61f99142966fcfa105d0a9635a253122e545e8ccb4b1866e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=a5b8bc54ac674a4a9277ca8287801cb8e8737850102b6c886b281dba9cb31d96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=febbafab5c83fb423fb3f00fdd019e600cb9d965e6ea568cde1d9cd7aceaa511&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=c3888faa029b294ce29be8f5cd75efa8d5398d5edf33c8bbb040d645e41e60ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=13a7d4b009f3030a848f7ce3aa62d5207ad5d3a21dfba49e0b091ccce9557f03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=30d9dc3d9a4a5c7dee7b73f17d7df248dc1a5d0b96c4bfd9d1b94698017b0910&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=2f45b8c29875d4bc79b9c8f4ad250fb4165d385c64a9fa17827851a887ee4569&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=a80b24d2283beccf3688cdddf557bcc25a124e152a3fcec2352bd2a45d806b05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=e4f34dc3a53c8953929aa5292c621d39a357a4081dda9a36e4ec4defda0fe7ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=3f3efd196d2958b1b7946d006f47f3b098fde5c091999ca089872ae0c8528994&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=23c2881073f00043a14c06ff6b4bf2712fa4900764979acdcc0dcb0451ff25a9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=d697e979a9ad650afef8b476023d89f61298f69e026b05fb88a59638b5967642&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=3410e0b2b8634d25bd44a3b85d29575c5666b11f47d34176b18972b7a4dcd53d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=6951d861e8e34985e9667c8ef4209a9203da968045128ccec6985854431b790e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=dfb00c082a7a58d617abf36c82bae7c2b2119819fc65d9903ca72fe877f1745b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=61edb89668ac986877af8d6b7d61a8daae47d7d09ee3fcedd366cd5e7b98eb71&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=f31fa46e54285e776ccc1780a9dd855542cfebc671b23463afb6395358f363b4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663XGMMOUD%2F20260622%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260622T224911Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJHMEUCIBuUhbWzlbKHW7t1a6fVgcNI0fQN0C3UIeSA%2FFfMCGaIAiEAqXnYgMl%2B%2BvqeJ5UJAOwrwAiwbPKkl2HwV7Maz9k1J90q%2FwMICxAAGgw2Mzc0MjMxODM4MDUiDINBPh6EqsfYgxbOYyrcA02%2FzwVcmvGdKqleZc9ORRmmRZnvSHGoXfwV0I77BZRue%2BXLUFSPTaLldI2urlpmkZ3oWp0IzHatZPn85YI%2B1Z2%2FUdnTsTwustxxnxS0UGhi6VtSVIXBuCxRf9hBaupRniAba8uDPej40ZRLrjUagF3Da0LFrF3eYGyMC3XmeGCBbYITPezmRmylW7VMb8RhCAAOmFXU1NYbiHnY4uiLUAAbvsh6dEJ2gDNRdsFDIglb%2FvRwGeGyjukAFmjAwrS%2BVjlK2kIn7TXwuO50icBJMm8akkY8c54BTJkKAnIKFJ3XiJ%2BKKiaFfUG94vCwvzbhyZzJ%2FNtey%2FpQTOTlR338L5lPEWnwMYYdFvYgKpAGYsApSLsfIeY10EzV0Zr7rmmvmAsLFp0JFk4NuUxyFRxHKUEdBG35yLer6OvQl7%2BSxOGIHwHliwbmSQgBSvxZNceEI%2BAOL3bVGxyL10RNOaJoAkV%2FX4S1yxCneLLIiXR5criLQDm1n8ODjPyujw3cb6MJakM6KeqP9n9sQmXJGqzNIjoxl9kvjUV2dS%2BLEees65DoOvdIWl10LNPMRWUBNGn%2BDKQ8RtBepbq0pYg5tGcNdIZJzSlKpRBuWb%2FEcZrWEawRnssfp8N%2Fh8rtEilOMKP75dEGOqUBmddxx952xgZ8V0rTFCge1BHKO9jjSN%2B5YQ9N00wGeXMlTHbKTqKnQJoF5Wk7i%2FQd8K8smaRmBLOG5TZCT3b5gRDormV9e0ZfCb6kkxxQDvoCDx4ZSs5pQLXfOBCLAWg3LWSVXT%2BF1MdM7%2F1mZwuWVKxo9qCH5GQeTzFIs9nYdxTwFVDLcAuuKACuYHc4pFDrwx02Q2gGYr7tV8x%2FOyuB8TfK%2B7cN&X-Amz-Signature=f9a3f3e4e1074b9560bcd72716ada5856110914a82712d584ab8b9f56840b155&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

