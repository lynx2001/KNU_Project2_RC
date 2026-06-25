# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=3571d415f3140f0e918cb89f66c73651c5b439d150ae99890c376f738889a381&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=5579f1da80e2bf40bb0648c049b0825984c2d02bf9efc849aee7d9565782442f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=747bbbd21ba76826cab6b1224d73bb87990216503b8d0deacb2e3ac0d220bda5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=ad205ea51378e05c3e244a02f77a9e912df0ddbba2fd9a56c43d5bf1bdfc2f11&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=8a0ec7da325a02c6f9136f1afe61ef7ca028347fa7f26323300a61d3047f3f16&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=3e3e0e5fcccaf4c9668ff0f3f38fc962997d1119a8c9484426d1a50010d7d8ef&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=d9e44c712207a2c34a39159a8862f44a32f1925213b9ea54601d3d8f7b2c0ff1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=ef8a0de673d983d5031ee38922631b7cfa1dbacbcae3a459ee12540269e83f93&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=43cdec96ea349a81f8f63dbe8a376791f67775eaad001cfc9d25a29bcd3e740d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=d29284c9a02c29b78da482fff01bae2f6841398e40e716c94a1221d9ed876bfe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=e640548a5a88d00d05dd0e24752b92b1f19481b35a69c8aca8c596dd388356bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=81bacacdea9cdca6f21e9556b415fb0a67c57e93353ed6e64c780da9d0d0f30c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=a06ac2f6030ad71e46dbc508002825dcf71c76af0a47b9a563a0d75ddf7a651b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=9608316cb90e4ae97984e1febaf4a8e9ea9be227cee6be882ceabea0621bde12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=9002cadaac0a90345649a7d2477047b4d7dadb99087c786fd30e06f7a344c2c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=9137762fe65c9a13066b1fbabff34ea7dcc2a83255fd2e042d25631a5967f28e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=747d3a50bfb511c9ece9c1d68b24bb58fa26337071fe5dbd215e795e0cd0b70f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=3f0618a584b0c184090d3a0b734f7859343d640622682cd4910b5a2c5d13666c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=86f87c14a462aef5ecf3b4fdf882ebb5db5ca7777816417129e210a14bc38c77&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=e0298ad5dede8be1734872fa52edcdf68e0c2e4b50521ace66cabc0e88e886ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=624dff9adfc6d1f1194bcd90f2e9ba6bc046a88378c3bf712280eb54a432ec31&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=9c056c74497fa2f5c50ebc8bf9b585ba972a6f9cb58b87dfdb9be44dc5e90262&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=54d75e353f594710d571c8441b1e76b3f6ad11327f63835fd87d1fe2de276f07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=66dd344d2d495a0facfa72701b7a1b43adc5ca9f68f09fab3a3283302a19d492&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=6c471da582edb4feefc0bfd280acb50424077a753375b56fd1a5017f8ebcc3ad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=f7bb0a65d5785ce5299964c0f5d3949625c20fc9c1b6d54014e677e11c171e55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466TEYGU4VX%2F20260625%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260625T222437Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQC8%2FzjHs9P3p74%2BLdqexNyPuHu0H45glJzsv7vzkY5u7wIhAMfJLwXZXE0buFZ0UgtMRQa2LFr907aUW9wz46tLZtHGKv8DCFYQABoMNjM3NDIzMTgzODA1IgwVYGzSByTchWgqwawq3ANetyC76WlAmJF2ULiZ5haNQ0hJEI3cg3xf6smrx3hy2D2ngBiZzxYazZEsC4Oi3LvVM8jM5TgtbY6rkhdVH793Ewq26EFm0s%2FVqesubcSDu5L092lfTlStgRgEEfdDzrKi77KqTBK0N7HNzXqlaMYYolcRL3NBNut2kpAnuhhSsV5GBTCjP9GtiJVNNuazi5bdvJa47Efc6ltHcDP6QvRMuOEmkrZr2O5Iq39nqGkkfIh00qXLlPYEAxg0wRcA9e4V5uvQy1GPU%2BPcy6mxPYMqKYo7CWDaL9BaCpNrxZK0cmE0k7%2FaIpGVJeBHS4hFx5ugnd1gmFnUZcxllztjdXLq0qInRrGPo6Vj%2BqMRJJQNTMmIjyerKvm0AAaZFMRVyTOeOxt1MHdOO3ApH5Z9NsKGHyQtFbryoxYluuzbl8cWnzYX7zw894z%2FXrUcrHd7YsKEspYSOpJiXU%2BaGR4KW0hdFbr6tQPuXbC7gMBIvLPVA9EASkcsCQ3CLnfGlpHtjL0AAZmRa6o4bh2oR1WU3mV7IhFmsbme38UMz1YFYB6o7%2FJZjeoXFwkThF%2BJiMtCHIXC04Mq8pezM%2BgYApnrmJjX3IOwK5p4KkLf6wPKIHjXTVppfIzt9JiLdcKwwzC4uPbRBjqkAQJOWHqxj75UhU%2FAYYvWjlKA9EQ5dXHE9Lz3NT%2FFcUDxrMuQSvFgoUBffTPuMcBpFk5YF2rNJyZ2fB3vD3E71VgAsq1pddG0Gt48NfdpLInv6O%2BRnlVzYUd8tlKwH1FHSIC5lWfUXesEwv8HCi0nUVURFshJ5FeZJiTmlRokxo9e1qVKMwhQBIna0HnzNwiA9V2kxUZRQZlr3qgDElCcNzxzI3i1&X-Amz-Signature=6dce9dfe1c834397fb33599b340cd763b3e86b4fb4c162dc8aa7ffb115cd9f4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

