# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=feec89207cee3109127ebb46e155eb46179d5ff4fe8ebf8037718df6205981b7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=575ef1ce64df7d559d3404d1e0fdbef0144b4a0db3f3eb66c596d4c748f39b03&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=73107a718f8920bb74688bde3333475d3aea673edcf02c07b17c717c1f84b4fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=4c9c24efae33a26eb0eb7f1a97cf951867f461dc48c54439e1f9100d88fc8ea4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=8526e34e7836d3dbd50ba28194316c862114021e5f990aaf071f5cb30d5de917&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=72061cec99fc689033946c8979a4fb29158fdab1b0db9cb908d1f1f842682d0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=3c6ff211fcf6f3ebf429fb4e23ceb86385e672e98183e7526d78236c044ea1eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=7a9c90d606e3c325f800277a567cfa3ae80d6dfcc529acbde69d4f7eff5b4083&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=5d79ad7be48a975fc1ffd1be2a36817d1c5292ad728c11568d97714d2306b0af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=0beeed8f40ed720da360775dbe421ec209995f495028cdf602e660f1751d6ae1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=d17d6e8c187e418287484ba31e4ec38ee4590052150a95fd582268ed6b4382e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=44d9356e61a24199392415939cfefeb04341c80fd05f30612eb1facb846686bc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=fe2f7297993f766d4163f1e9684d43ecb6870725ea68734d922f076c0a2e31c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=e5dfa3718e8543731982b2cf56f2efa700c5f908a9a055e86e2cfbbf044d7b27&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=febf370407d9e4146822f37dc2194b9c6d7dcfa555aa6fb602367eef9df526a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=0a355b45418675958586baa41b097562fc7f3b7d26dbc4d213a7a004a50b742c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=7ed9119e2c933721fbb3733cb4408dd2897524f1b04697990efa1d8b0d263d5c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=800c44e3f9fd283ab36588f3b395fef2f7abe41f02d1a9012613bf7d1b03fd2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=2681a16e71d5cce9a03911c576457c64af430e17be6d3af2525a3793b193ccdc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=79b0a82dc5360fecd593364fee51df2d0ba421e1d57c2121951796dfadddd418&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=50918225407126bfed4d56c3ab65703a76cfac26a3ee0e699535845a3f1456fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=557ab8288ae05f6f7b08cb50084c8d5236b3ffca31552750f7256d3574bd1988&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=ca1f99142e2f5083f09029626f347b26b81f7ec70713250554bf41a6fbf694a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=e78f6847a4b0b472657ddf593f215edeb1e1055f30d15fdd68b9757132943477&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=db74fe76b5d21b3e790ec2ccc99afdbf0ef0fde4af6943355b1538765bc4eb6a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=1a63247f409ddce66188959ffa3e308093fadf95bfcf9ec465c615ff8175acbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4666KNOMHE5%2F20260419%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260419T213027Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEMaCXVzLXdlc3QtMiJIMEYCIQCNEusTurdfd4vGMl1AExPUpL8iYsKyB0hQkni%2BTHXDxwIhAJuUTTq7neIIElRmeXZ92x5udf4ZRmJRWZxw4RAWuDpqKv8DCAwQABoMNjM3NDIzMTgzODA1IgxRaHwZ3txKRjZyc%2BMq3AOCdC7yuxmLx91ukr2buxC4gSa2ETlaDL8HL3UHhP06fW5kem8teSwx9XLB7bBnXUxc2xSAKq3S4AYFp60%2BIR2Pf4kWJKzZv6poasN3FOABk5CUZS7p13mBTtubMs7OIyR41%2BIXZDEsPgE4ohyjJVbYX0egHLSHg34yPbL3Wd%2FR0t9UU%2FhlW%2B%2By8huKthBaYvu4gY2P9XhUsMGgop7%2BMbisRLdzeIj6QmExSrcuMfr44nr9HAPQPvHM5bWV6Z%2BANfZCxaOVexImceV4YAw6NUG2yLvcZB4yVSmGsJIoJGbfxh9BALrrZxlphRB5ir2kScPdIzlO8EkPmGwCX6tj0bGYB%2B3NmctbQOOgNmnzQUhIqnONDRMQ66ZXQjteqC4%2FI6Ywd%2BLjwoaov3xUyyHzVs8Aw0JJJphQECYyd2wQQxf%2Bf4lkagwqc0HaytkUl8SqAItT4hYifA0HxZVeKi3rjtw8TqdE748GNPZilqrwvrHR%2BkvCBl%2FExtuEzGlYbc6n%2Fzscvx0l7rrF%2FwjqQpr%2BCiYD4DVnL%2B60VpCDVAmY2kbwWKZp8GWjXvnMol4rfuwCPRA8VdPnTTGlvJtg2IV%2BGHLx3mzisR%2BeqTbSVMbitI13zP4hzp7Yr6pahztHLzCzwpTPBjqkARgWUeNv%2FJ1QxAEHOjajMVX6tlQL7bw3mpXd3Rwk9baI8JRLWPbOgh92jAVeXbYuKluDWvlzINIVJsBcre%2F8ni1P2k2RPlR2LORaEoLXxNOR2l4LLdBRzvo8D8xwigEydlZNkjw6maiGcdRKHU53UCJD%2BXxwonO2O4aKeIxdL1h5WFsBO7G%2FYJLGoZK0o7WuY1%2Bd3AjHQrQCSY4swIragzsHiHzX&X-Amz-Signature=43e07dbbaaf209849a31e12524439ca27ae72baadcf9dbb33aab7d973dc7f095&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

