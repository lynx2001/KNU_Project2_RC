# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=70a0c9158064289be071b5c16d6c68082f1b689f6766936780c5eb380c52be5e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=54f92293a0fcdcbff05c5b8ce3bef0b4b0796644233a25f4e84b097243fc90be&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=6f6c1877b28e19cd837022f1468cfe1d8a0b12437d45ee196ff43e486d09a082&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=32e5ab1f0629fddc029512c6479d9e5ea77d45fa56bf98d06085d385443bd5ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=8078f70afb2419c81d48961317aa44b727efbf64de08133396de10082bee151e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=3af0b3d54caafd1b91ddb6163afb8e4cfee30dd8a51e5de57ee9df88631503b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=6081e60a20c778857ad71b1602eb0e3a1084d48a12ff40acd0943bf6c581242e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=518c21a4dc1dffb140f71bacb58ad5d73460463b109d64bafe38bfcaeb737ba4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222807Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=dfb441ba8295fc09506e09df387616455154af33f2afbf9d9e43410a726ec98d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=e77639b6afac37e5458a8ceac111c7d63f30db6197cab2dab2e5e363fc3633ae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=59eef03560f32c3ead2cc82af3e3f87705a11bfad5e1e4a09e339808ae4e7d3e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=98cfa6d27079e1c1f040c2060155f8210d6ff7cf102534dea3e175f3510e75a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=0755fec3cd27cf7c9cad486b9dc978a4e49950934fed5f8cf7fb201a44237827&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=78e7a82b40a0a04f7c222ef00b2869276b1da91608a5d9f2aaaa659272fd39fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=d2a29381972bfe671be1eefe77153f3f6ecb8c74eea1abf463f5585323f6cb45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=f974807c5a0828cc51423bf6c72778342aa876090f97be057e737fec749dcf8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=96ad11edcb837522f96c74fda2f3364e26a43d15923c93775890138d2e99f704&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=d07aec09ab52f9a1f5ed7f119aaf1cb23ea9f3698e3db44b3edbe42fb7e5ed8f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=d9b693403e532e82178d783da4d58f785ba73df5e24bb9cda2b4bcc6b7fde479&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=d766f08b275de0da718fac9c2198b308fb3c41d55685c75d8abb46160d5f5d86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=6bf069862d6c8351c3da98b118adcf70ca360d4beeb42953ba8084b3bb343cd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=6aaf98a92091aa10b799c5541e074cd8b04a59d3d4823d35d3a6c2c8121af533&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=22e7fb92db4f4e45bdc920e9da00bb9b4e45a5a0d9b082c5991bdf5e1b87669f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=bdb881418da988790148cd30459568212fa39899ddd56773c5a89e12621e207d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=bcfaee03b3d924b9d01d5ae954c41de260889cd79659c146b742396a4b366907&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=6d5d42e19540c485f7f1ad0d9a43468611847df41740fcc6b850a90c96d565d4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7QM6MSD%2F20260608%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260608T222808Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIFaSdSpnLnq99VUTQQ1tyR243dGD9tBNZ7SztoyIHa6BAiB0QNUsEMcfS6WBJp8wZ5Ts%2F5o7WY9caxEzcGhMsJEo0CqIBAi8%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMG5FVUqCLlxq2D7%2BfKtwD7y%2BjDhAakzj944O9VhGMkGOKcb0WTphLwp42GTcRiLwgHHD42BIm%2FdFLMv2q%2F0hIR4GlbzCFcqT7qmDgIZup9Wp%2FxFZlm7bwCGU8rASKQcd5SWu2BTPMNwyUC4wrKt7HyErsvCWuLIe4Og77AFPL9v21ElSAZNkc7j4%2BGwL9riEak9In2tBUpn5V6uKgajb9fvQ41r5lBMDAUi1QMUOVVjFFHAF0GYbCNWLaKqCwpD1Qndfd%2BQXozwMRneg6YlxP5f1IRgSvPnsxxz0v%2BkhjZoV%2B9HcoWKmJk6Up1x%2FVTa%2FQMyVQIJIqaeY3Lxs%2BkCl6agFrpfoxAhZOkcxMfhoHxJfEkonkQdLEX3rI5avS8wWm1RO6QkdMly1RmVNYDn6OHRSei7GrVvZ3FelPhYPJdxODUe8P6aQ9vTOYFl6KXqacoCn3CTs7HUfOn3Ycpey%2FbNmfz8s6xMi74M6qwmjHmSQi3%2FA4HmWEQ1Aa8E7VnZZrvGot5pZ1tP%2B466wqqJTozteKp%2Fx1ESnSPZbEQlcuHknxqJy36H1hE2i8nJgekoRvYi5quDXSrPSc1lFOtiDK5u31%2BqQ%2B%2FDgYuheQ0S0EX8cH7VULHQIlhv7BSvzkPiDKJ%2F5mQS2jC96Zva4w6pac0QY6pgHEkdsN0xiXANWPAfGR4M2cKSXuEcZ1duIuP5dQKv%2BJUhcGvhuYnkkGiI5PV1uALCICiqTgG2dTfaLcm8DZZl40QhUIlXdGKDyDw8UYwpmm4ITTJUdMQoyiEqnQKEqdM5XBQ4c6dNwiV5TUrx9kT%2FEM6yZFhhsFeCp7cpSBg9o4dqzPJP8jY3evccrFxEMUVYseS4pZATZ4xBHRUg3gf4dgqkRDCZdv&X-Amz-Signature=05a191f8afd3461b44c64d67e60df418a8d5b4b60d645c7fb4b40827c8384ac6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

