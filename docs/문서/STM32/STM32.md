# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=447c5d041fa38687f328650af943adff62247e33c4dbca128983aa1e440d5a07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=49077a823b00ce57f41b4fafd3cb4735e69077a87001a98c05e661aa3d06816c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=adea422916e38209414edac680988d4e81838e242ebb4f37231946c50bff1096&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=c78ef7996333abb9b08fa0cfce39fdd6d1f75a09f873c066c896fb77a8c63a08&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=4ff96cd6703cb0bd3b1a11b4678779ec53f151846ff4d536049edce7687ae26c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=f9464ab7ea31da29b3355c64e5896e29eb67b55024a664e7c31041eab19ee573&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=f414da503b2f0e97fc06977556525db62ecf6aec6d9fdafc9dc5251910492723&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=6aff3eaa3ec1fb12070d9b27e7d38c03123aba57af21dce87e70601a29a9b71c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=cf279a7450859d647ca7db007e4ea36143981a2456af194bff5777f112725184&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=e1bb440e3d1d46dbebe5b1fe38c39924197c2ad6f3c759f3a24fcd02d635e994&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=c7d441757f41e017cb43ff7f4aa47d14939337282844f361992f996b24b8c0a4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=9bde5b051d4ebd71d8ddeb635f0ffb6016b6fe807b6ea452d8b59211d48a023c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=426c2f8ba114bacc7365bd923894a5a3ab0b1599b55050cd0ed19ecd8817976f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=b12d4f05af4fc196a2fa0d933aefeb5d7eb172484a98ea496a4636e9ade8f909&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=679e2825aeea1c9ffc405c17d321d93d60c1f61eb10c443006ce1892ce1ac5b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=40396bae21e96a758e5a63f57fd1e13e3613ecb101cdd32c70de9d6005c25da5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=adc02b7744c144da2331b537f66775bee66d42303289c65767dcf4fdf928b4fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=c0527d280971bb1fb704202edd2b3c7efdcb424e45b4156df327800ba46b513d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=27a6fbc80de540e50ec86cb7f7505d637c9403011fb52a723f93ed326c94d1c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=37cd28ea7428e90333779ea5b8e78f438b6a6695c18ec88a17365e279c4f5802&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=6a4280084256400c8a164d83bf2496e2e10c4ce53fdc17e4b5840b5ae486cf84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=ed698c52690f8e2234ae0369d82190b42efa6fbdc6f9af25f9bc9af14cb67887&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=626c19fae0f51e34cfc461c21d73d1f2b308d6d472c5a5d7c23939e885ee8867&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=5360abce1205d096112a195a7cbc5821ab88efe6c85f5da19589a4eb3c29b6f6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=58ce57e22cc71826cd76e5853430c8556128ffe1fe1a3df2d71472264330791a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=e752bf35f60474f0af8041786ec7dc318cc8aa82c8fbcdb39e2528de05129b9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665NDWORDT%2F20260610%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260610T225714Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECcaCXVzLXdlc3QtMiJGMEQCIEfiOaAEWj%2BhZcUU%2BpQJmqgwASBkASGQ1FVKqCm%2BcBQIAiApPXCHC2iAMzYZsuWMvu2t%2FT1dulFACvHmZ2fo%2FoEZxCqIBAjv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYzNzQyMzE4MzgwNSIMlagE0UHQtu4OtjBBKtwDONRpwNCN6u%2FpZZcH9aWcM%2FKan77pQX8JUn2KDsTSwVBahFxLhxWpIhWepM%2BAnJVs2jkhiiRIBmwcasb9uuh7pZhGmEsdQ5T6nqQRv9Obtidnesotf31iS%2Ba6Bf%2BICHEEoNqLQrIr%2BMO6brNa6YzGxvi9W%2FvN6NPzY%2F4Fh5wxDpQKoi%2Fs3GK8RzX1qRDOrmSMZ22OIYFiYjQYUwd6S4rYvArUaFYpDltZKfhYCrJ9Z5wX1rEepnS1bCGEV2bknR1B1PweINMZVZhXGsaxduo0LQYR%2BHNV9O%2FZ%2Fy9%2BW26ej5x3sWsZcO1yELxbK9s%2BfjY79SPD9yGtcJGpw5jBrCWE%2FvCDE%2F6RTlxroTp5ZW3glDHlXI5iYSQjBqfD4cm879jgMiil6wFmmkIT0oplknBvQZ9jwsJ4GhyiDe27Zqpqj7VzoT2vbOXrFMCIxlHa6U9D%2B6zEYmnUFDWsIXIhvpknnTY%2BZR02h1nXCvOiYIRAK9KaZgbTH0nJmEgrqQlkSD8uyurnuUwhjY7fAz7wZ8RNdOKnjjFb3ghRg8Yj384R3qY4PxFcYysNDwr0H9M3YOQ0v88m0ZLjknpM6HXlwU7bGHv%2F0zEROLRst%2F1oUFYt8Gfxw9xsh0PT7biBs8Iw18an0QY6pgGFBOpr0Bf6CCspWVbu%2F2ZqtGj8mTLt6VayLwlIPYcUi2aVMc4QbkRxbRbmM6GtvwdauAHkZf2AQXiPktqLfP0MUS8fh%2FJF4O1k3ZZJLf3J5KN642NAncEZY8su5jOL40bpdvIfUvO8qvM1cm8oXePwJ2aoON9esiFESl4BlbJ0oktIhbK7B1xpTk1UjpbwqdNyaD0XL0d5JlX27U1Zj1L2rfIIZ9S8&X-Amz-Signature=108a971c3249afccef096edcc4af3526d8e10d62d9f9e1d7a61530fb7d018f0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

