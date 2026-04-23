# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=5c9f1078728ee5954c5941d61de67a0084ca22adb6f9a3fc8ead91c3f4cf0c01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=54240c323073b11769b4537fb8569efc1ca27fc88024bbef76366aac6519a244&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=189ff2e3b71fa288c2a0296f5f240e3cbeb1b757866b4fd31bf7bf006b8ab2da&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=948a65ab1268af5a8b57d7381b2ddd76efaa3d26a192ff711b9068b95dc76c3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=5a569f179c78a759d34425d146430a7d7ef264d84c6fc462b3b35ace38bda47e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=b80d5af5825119a11dcf7351e3a2258ef5f25c9d1b6ce46bc474920adf027671&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=a1deefdcca9a83ce80b0a875cd86a538f2e7c6135bac587e1e311fa660c2fe3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=513581fe76f980a1328e1b6cc45f2104aeba65877ef414d10e7f590b3b7fffa0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=d164a72c5de87ceaba80d67e6fc070d62c12c9ad23232c043debf108736568b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=020cc4653c11368bcfa357c448e12b626b94b15fa8ef4de5026d9381c545ab16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=53282f93242b191c8eace66b945014a1a8b69427bd300a5cc6f8a6195638638b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=3cb9b2c93476cfcc2e3d9a637fa5920159def86e70a680b62015a585ccced908&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=2d800a1ae5fa24189953f3c487ec23db222d57e3b2ffe61eabf2f3277a2c86e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=c08eb1b1ba3186afe8c3790b71103384aec9c0b79aae233faed3821abc1e324e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=7d03411ffdaffd19d5e34a0a24927ddea77dd907e6645e7860812502353b074a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=337260a15dae3eb06ba5cea421bde0c9375a9bbe6a23dd87a84e507599f03238&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=b53cbc8041846235996698eebe56a4ce44a3d19a5c850114f109721cd0b82978&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=06891f1091ff99c349ad569fbb3699e1ffdf9be344154cb6262e9e163a02ceed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=b0d0b7386cc2cff405486c2c6dba10da4ee33c750ea54ae97b07445a6ff95781&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=29b18595b9bee2e5cdc0ca2fa32ba91b05a15372fa262087580613292e8a34b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=f38937af6a3e5d0aec37da134a3d62eea86cf997c054af8db7c7e94f9273facf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=ea3c8da204a534cc4fc2ce000e821304c6e63d16410c05426d567b62580564fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=7a575230f19a4fb95c9518c80b394a8fabf68249e00f492287262458f593cfef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=779ae112681f8a1977ebd6327bde7e79bfab961684e54a751c61c8cf662ab02f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=54c85f93f25c845d69721ec7acc2d6b0bb3d7c167fcf9028bbcfc1b702710e91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=f494b19024a5fc0037ac4fe096c13a5acb5b8d151f83ba49331b17a55f417470&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VXHQIKN5%2F20260423%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260423T214124Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBKNVJ2toxGqn0qkjVGAEbk4m0q4O%2FIUmViGXSe%2BJpWsAiEA57XOsxy2wzp8recHjcCJgIP94vAmI3KYs4CAmFOxJP0q%2FwMIbhAAGgw2Mzc0MjMxODM4MDUiDBXZbWXoEOqlG12L9yrcA%2BMkbgiWiHxIBLw6KQCjvXsXzjlkxPXzv%2BSfGEegsx0LBRTog1JJsDDL8gWOxWNJlHZ6ZiAV7Gim5qaVRxbEgqJTCNZ8f7o%2F4fekS3gxu2WtbX0y4pAhzT7Tv37NYu0jZDhf6nrG2KWRzTpw%2B2VLhn8YozT65PBpnk6zCwRYLh3WqEFrBl3Wt3p0ucg2gVX%2FALv26KOX2qK%2FADsK5ixanFtCvOGupDpALgvOx2SfYdTnA5%2FsI2N2c3eRM0czPgFEPZ%2Fxo0V8JpMYotglNdIptG3Jc%2FohZF2g5yEbZKp7h4dtmjjv330HS8atQOhEAGHsD6kHbKA4%2BdyQw6UEaFOOn9bIZylyhgk6%2FMTXCcPqp40cSRUUlVzHsNonGRhxc%2FnfIwaMcNvDTHKX%2BLJ83VtFKkwBvVzDUswdBI3EtCgaE32yNUU5%2FnFUlY2yDhbfiCyFd1%2B2YU4JRNS1yPjAFNOeo4NLxigeAqbfov%2BB1WYNyoWWFusfNhDU%2BRej13wVRd6v6fm%2Fc9J9iVtQQcwzytFUBaEAIxFJJCea95LsSvcFSK%2BNP34dTEL3OLDjNS1anKMp56GGYl%2B8bbafTcEdJl0tF41bH6%2BJPuLhbZ7%2BvxusokgIq46tdJLyJvWS6Jt%2FMOKVqs8GOqUBdpnHdINry0lNGkV0dDqk%2FdSUgxayuOiB7FcWiMXVpdJRVFO0lnZWnybSGbsCM1MDJ2slZb6f9ptd38A2SEyF79eXE0z%2B9IxgT422wGRlWLyh5fEuucJbO7ZMOpakWcCerebUnhc%2BmMeGQnM6fKGMzpukYSjxRFa4iuGpu3WgmzcQFN5X27UGOZuB%2B94j23YKQCrBhLK1UqNLncr8PpQxfT705D6s&X-Amz-Signature=3891bb96ac3ebd83a96764b2553501cd76cfa10f20c8c1601b70c4f9fd142eea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

