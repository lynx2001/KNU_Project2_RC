# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=42ea595a6724b3b18f6267d45d8245dd6494f18e4b450861b00f0b3fbc025de0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=e3c7f3a0869cbe047e2fa0691b792653e0135bf3dc876e51e122c2715cf75d1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=d67a4fc36a498fb7a670d99e3e5f7eeede577fa2d76e40915389547ac2aaf771&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=55454410cc3458770a085b11305d1eb8de6d4f2effb04d0b1079cac8492e1a6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=7efe7fd3811ffa9891f389d74159d99ddfa3fcb1a497c58bd3b08dc34b341138&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=ec86aec8adb7716d6bf9cec6d0d84bfcaf1f5abe0519fe3168e3d4844cab9672&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=079ecc5edc41971e5301bf21845535e9c4cfad2788bcd6cdce09e6b563eb1182&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=f214b44aaaacc57ac32863c8ca84b1c71cf06b77a10a830d47451392ddbd6273&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=0439ce3e3b2a9a6bae9fc0bb867ab42e2cd6db2a8868b7c5e56830838c2aa8fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=559babac3187b518a2bf59fac272859f9a3344811d06668fabc4a307e6ff7c43&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=72a149e40d207129c33e9374e551d23445b7fe1cc5f6c054f159b620bc100431&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=fc6e2a5b7419dcb92c906a9274c4e1fa0220899a7689dbc5323bfa9612f1dca1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=e0b8b67e79cf93875d5dedd35893ec83808477995c2496b90a351750d4a0a515&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=17276619aa15bc055166d944c49579b796d5e0c3fc2fbecd6d51a5adcbae8ba0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=82acbd5517d51b66b475771081511ba8fed81bd83205f19450cfc73def0da160&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=880b9913b86359c3c1c0bac597094578e16d62db824849c4eac0c6787012eb45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=af327c4e4d3dc124e493aa582f5fd71a8582790a2eabb8ca6847dd93e63a25f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=ed6c6cdabff666fd8ee6118bb6f2543974336b84ad5692baf4f528e79cf32a32&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=6ab3afc6ffa21a08908a2a322baf05000285c004d9b692846b96d51db56dadd2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=a2c80b15288ffefec8b0a01f984174cd2e6b91086f0bdb18c238156874a35315&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=5cf24879dc2e31e18edd8a5dd08b2049c120d54eaa2687a06a1ccdceef5440a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=cf488afa488346d3c5f0053d7adf2dd62944ecf31b4ada3d5efc1945e21e6639&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=c1b7a638c5a575b79e21a227ac7803891296b59e37b643a49a6471d437e2a33b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=6edcfbf0f9d311649e4a5272185464e6d11717574da94b07fddfa4cca205311a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=bc4fc581da2019983a6701c4783c32c10993382a233dc117a1c69bc69fcb2fe2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=1bc176ac64188fb97f77c97c2342fb1499ad884042acffac4907907f71c772cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YBSG6XNW%2F20260628%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260628T220322Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIBRCaRwHb9P88e5zxJfNkWL9q%2BtGgnMuAXXdIK1UqgCSAiEA2gJe1zG0M19g8NElJNRM7rOHZozJDvYxRM0CVb9HSCkqiAQInv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDBXBOfP5jf9Rjp5GlircA0rMuRp6ga3SRW7tDpwORmd%2BZW2Kfjj%2FgjSjoWacG0RUICMuG%2FCDwW%2Byv8ZTjvCxRttZeVFqzmAbwIkndicqwnfd5QLUYRhZLoggoekv4gufmJ89FaIyGdYidKAmXYntlJ81IFMcDdH5gsU35Ykem%2FIX%2Bnn4zChKxj7ygAbLMIddDnaELREAJtvhLUUCz4t4XspZEWLYGKkoiNCdhAjcJl1TvHJiS3rQEY3KgslTIKXNTcrgefpp7Wmg8fMG94NgVx9VxMmhINfcwyK%2FoujDLpJi3Fct0a2R0YCsA5%2FEsFBsZtBVmlVr3IdU5cMa0xF1rZ26pTix0DWJq51b%2BbuJf0%2FW1J6Z5mhYHfPbdcfV9FlGuwY1ko3675L%2FTmUq8gf2VNrCeeaE2KKxesBL4BPmg%2Bo8Osv2OKvf1audQrJXgcqjLxZYF10xkWeJB%2B99ABA2to1PItoao1rFPwtkeR24V8eAwbeiefXj%2FF4LuMIr68dtJyvdNSt%2Ba8oQZtNGGEDBhT5qqWiZnaK%2BhPZ4ewSnPa5t50i4s9IPWvr1KM8WGBfwvaq8zdAHqHPnaifk3%2FssGN3kCwd3rvz97AAsKUuSHZ%2Fwtf4gaqLGsIsLWvCncIiXYx8CpbDCrDxOr5TLMKWVhtIGOqUBgX06ml6b59AobYJrMrjay0G8TugHBrQWUbszJWi7aKIAN6OgD6B%2BtP61Hz8c0AXLzIJ0Y9edaL69RCuEJjv7DnM7zQNNsEiQ6KhGgdCDDBPDr%2BrAoPaDACn%2B1mVRc8c%2Bwbh8uwAxdjexqClqjZHzRx1ucPk9plPnmGKWnnmi9wi3mf4S7QOJH%2BFLw5xwmX8lHxmjecypWQOauKKVOj2fwZ2sHsU1&X-Amz-Signature=7372e5b14ca0ba50b3a176d2378195d27b4e0dfb8fd7a4cfca6be48f3799bf6b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

