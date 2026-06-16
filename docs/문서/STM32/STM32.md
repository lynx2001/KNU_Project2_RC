# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=6f12e99e6e9db39a0e7765eaccc4b71ba9e27767987c7552ab2456c1522f9cd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=b672ae51f4f106412fb7971e15b95f5370d12a1e6ae593f5e6eebac4d76d2969&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=3928e172b33490bbd114e6822c11d4a404915144b628ca2c646086a204f435a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=4d3bb1b377819e58089c73563027a8ea65e2010b4e3416c35b023aa3193eac64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=6d7dda60237b17e1d0eba3336432d9703c6b37b6fc5c15fc465c1b1649c55660&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=7f9967f2ce9499e907bac7ba6f8913bde4674ba5e65937e82eb3b87e9517a26f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=84a1f0d7f9312a41eaa8eed8a9e39528b61efa4af7b1c449df54688a4a8d3aaf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=6de68821353ce981c2ecef1a6e81f10a6ccedb9437f673bf35b1e7c8b2f79deb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=dce15ba0107ef611b288b0810a2a7ba424e750b6dd69399dcb66c946f7231ccb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=ecdb83b91116b67a603a5eef2d6fc227fc35db5b9f1fb0b51c0b8e038a1ed3df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=ac6cfd218642e9e15d4546ae47733f5abf14ac361ea31a53abab0c4a0b4f613e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=5c409e168b8835aecfcbb4b6984fd4dc34805a5a916ac83b5e6bd5fab3e5645a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=6a21283b7c328e9723282ef4f0f66de82af25656f2fc1a04e954a3258887f62e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=58f96a802a721d4b6d9c278af258b7623e59d078eb658472013db96687b0fad7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=9ef90a09a218f011d3ed03cfc32ce8bebd9c0aa9f938967e5df576b213b0faf8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=e23c960d6b183138f07b075e7e16fe972d409056aa1605846f7776d6bee64b16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=a8a3a5a326da87f4e50fd504fc956719e3af5c0d93f215f0b397c5e165422737&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=2696a2b01e15232395d12825997410e9c3932e4a8b74ccefca6162a9d3173303&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=b14c66f6088cd2be3ff023ddaf7f761f37d3c374b69651f2c5c60e71bfd80f81&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=ff89b47d3401c6a5a493a0ceb0b5fea6e6558152d24dadb7204a68011729cc67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=90ed158131ce985f34a0b39394e6bf8b7bb8320a8ae5919625f6cdf1e87d0421&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=3eb26aee43af44be5a10cc22d015606527e311d8a88f27a96b91e365ef128399&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=9dbecdaf0c49b3fd44538ee3277828452cf357fe9f2c807aa93d8b5ff72fcf7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=4de28dc6721c2d000d8377ac35fa1b00fb853b1401458c91792d379b1fe43e84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=9c0f65c42195779dd84e4f177cea5261c63f2112753f976c5ed176dbfc7134a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=991e0d6b727559dbc3e56a96d70f3d8a2e930e182b2bc2a4cb0daacdd33ef269&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XZ4PAUEL%2F20260616%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260616T225725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIE2p6ZSGlbAYQXdzGQhKhXGrTvbGZDVKxw%2BbhOI8rNRzAiEA0aNxW1ZKhhpl3M6V8W9n89Ym%2BurtJU4HQZ9gF9PSXysq%2FwMIfxAAGgw2Mzc0MjMxODM4MDUiDDfm2gZqqR61JLsoDyrcAwfo%2BiQICSCQuS6ZwfMxFvHX%2BQa83sVgzPIBiEs0KKMQAgnMZXnpdfc5AYWoWpFkvY4uKOb4QHS8f%2BA%2FRvD92H9RfNla5oDPBH9lYgz%2BgHCTrRkMGFWJ7f69t0j%2B1voC7QMlTDNKOXUqkLeGKr%2FhIOqTOPoCSTNCI42EXmLZGV0v9cYIyh5J%2FnoUqEQZJkZEToqOuqdIAJZd6cPUn2Fa9wErUElfEHEbYGULCTVO%2BL1FnCcv6c%2FI7yfAcxhGKEaNDIWuGDp8KckzQuVuEYz8lEYy3Sq5RKV6H8Sa0wBHqYIAQ8tgfqGeOPEBecT1DDtnApVC1ChJK2BvPfTRXRPbydQTnvqFI0qvfBd1HZ7LTp8WSZRSV1E2%2BLK7nPtUf%2BDeIe3wKwkYDon8FWh9pcZ4jLpUmnw2jN%2F14VuTObKSUaWccXfT8XLAYPN9B5lzQK5iUN2rwaxaL1V0bFsBHpG%2FyMr%2F8vmfxBqfucinwvc5gzTTARkQ6k9GiwOjHxZnwiAaw7nQmt3T90aOJGOnqhrpzRLKW3ZSfTr13akdYe0zjQSGrZvAsE7oxsKPPWU8v1qdgeWCwSVfC4WSNrq0ypNWhjVQlMXOGJrRluJU6M%2Bv7XxNtlterZuJXrV%2B66UYMP%2BYx9EGOqUBmuQmJw%2B9mYYIuhp%2B%2Fs5ZV1QswXsd83Y%2F0ohaEWsm0yS6ULTvivw98Yd%2BDtoBsn4vePxsXIPJry3ZPf8YZH0olEd1Zs6du41nb0Apfcl2VG5MW8qdrvDABEnYVjB4EnuDSBmPaSVPnTk%2BIF2PvydAYk1KzaFRbXwLhAj2C7TwpCzYkpGLiGs6GGa84vfa79QIeIF0H1LEjGkJcV6OjJT4POFbz94P&X-Amz-Signature=d16ae677e485b6e972bb9e2edb7c4cf21d18492ea45856f0d0f38da11a5c374d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

