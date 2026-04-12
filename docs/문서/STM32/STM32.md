# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=6123e135ae55212feaf7a67b30ed9b1c6932c5559f5c5461f55a7fbce1e83d76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=13c21e87208f694352c1a595dc8556f521d7807238b7045ccb2828ca3457f346&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=9354aaa1259ecdaefd4437d006ed5ef77880c9e2762deeaf53a7bd262acbb69c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=f1c800fa9d1393579eb43fd37c822fb03c77cf3e95a164c3f89f9f5ba2492321&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=4cc9de8e61787918de05140ea270d67332825120e6245f5603593780c737b00b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=cc64918693d5824367a04ee3a995561839d678278a36fbebdb3a858c715cef54&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=115cb71ab9307d426296d7d7fb23c14858ad96e0b878120ce4973333e5635840&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=600ca77e8e392fd01e87a711d209504cd6e4679f91255c044d498942279b8636&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=00a3a34bb1b4b35c683e6352ff8ca48faa0da268d6a699fd759016229aacaa7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=7af0238659dcb086b31cb9a23085bc0923a02f5dcee3f8ccd0003eed7a15015c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=9961a7cc7e6f026e8f6968ba2ad4fb3f3ffc3e9006ffa3490aa179bcf9c61751&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=0800fe7b457bf6ca391680b588e782e2ceaf9fdbb7e9a500c144c344ef2a37a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=62156e08a8299e83b64107efaf8452f90059f34f2076044f459587d8d94471ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=d57262344857e8578c7a33647bb32839d8b870cf27a61e6f976a99336ee9e130&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=f7253f3298e4754e0e6e1953f37fdc606ae5cfdc18b6e7deec4009049ecee39b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=580ef36e232e21304cbbef4765179aaf61f4b4b71fc9d5c99dd29b2eabff621f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=fbf8b7e5d8908f43525089e3f0aeac73aa6e41253caebfe31502c8619c45187d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=d34a3688baa9a321d1390708444cba684ea208961346fc225ec80dcaed805679&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=cbd95b123947f5c0d481d7ba08d722e009c82e264c8fe50207bd27e52fcc8c33&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=bd02ebf5394bfe2d1d1cfa16dd11ea280316da00971777fabb37cdb2a3890f94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=0a10e0c3305ecdc5da20095e4ce158d820ca523c597b1007e7f9fa29e2d66b7c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=c28e77f3b3a4ccad4840a60d25ffa28efc4d4cd5126da8bf6a1c3aedcfed9bb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=746c3aca624fd9d778ea9437de0b7f9808af7b02f8c3c5b3d6a87bcdcfe8fc3b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=c5a9d8337c65582c039bcca22fb4ddef0036e17a88e9a33622e18c55f907191b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=95fe52867f0538ddc24902889b491ce45cd0a1b5fd3876370cc5fa63922d2ab2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=965717614ff3e490801f3b1345d5ed99fcd57479502c901de81e3865613229c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2FZN2XV%2F20260412%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260412T213019Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCusJpc3wnNC4GAxC0vsaZu60vGa9DYD9BUGmrM9JvqQAIhAJ4geoLaIMNGMYEiGrZ0Xjw9lKaVQt2PPJHZAF8KcxV%2FKv8DCGYQABoMNjM3NDIzMTgzODA1Igy0wbJn%2FBoSIm20rHIq3ANjQVpNc4yAcM0Jbw24YdDO%2FoCWBQBsfS3tkFytcBMBB1YylYxCpTTb%2B%2B2AWxC6agei3PZHyzU8%2Bwe2sPYUdEJvZTyAywIyi2%2BC5VxbB33ssz%2BI6GoLFH0hGtzEDJfZdgNM0vO70pYBBGpNmCX1yi9RTAkVoOO8z0v%2BztJM4a3axKy5dIBWG3HENt6q6nl8ZyNeEadyCXcSrDgdh0UtpmPgvHB5EdCM6nI6e%2B9D0dd5pIgYedPOAYBsLaBw1EXnqalX0pTtaS9JaVJ%2BygBIko%2B9LR0Hvr5lOJwmNHunX1LDol9dbyfjlR56IXmRBbgVigVlWbxsuDLNw4johRbAJhcwl5CKeeS2G1URbMQxqhGuD74HjpiaDn4Ch59nX7MuPBCTDG%2F2fTGRwibTsNwM8F%2FDEGYfsHR21AZH780m1%2FaMc4yJ1TBLtkUHAiYc%2BKeXlPqQDKS0D3bM8RCnXWJX0FRalVclc%2B60wIng2sLgp%2FPkewmW%2B%2FTDKROolNAkVXx9HL81O03f8cheU0F7Iq%2FxLbP1Egt%2BqOymRdyb83w%2BwiXXt7A%2FO71Xk1lujqkudfEnww99e7X4eG%2BG0NkVbpwo7ryZ8gf3fipDKY3kqwGTqmjzMquWOpSN0RjynjrRmTDQmfDOBjqkAaWQVuU55V0wq%2BYUnvyF8IlooTHan4vVU1MxpL%2BJolMesXNcASFvVisctLLECDplWe0gTETW73gHrkphxJqTJzm611LsUD%2F8jv6IGxZbs9OQ1A42TB47ZTX8rnQU7bkmsqjEHhk22vWR5hvfL5nRNLmzKHUWmdm%2F7YtEfuqiA4p4eu0csTjRB0c3zCwGdgw52rzck7d%2BthIR4wgClkjvbIawv%2FhZ&X-Amz-Signature=b724fb3bb1dd7d8c9644b744431fed8e99077958b4f54bd6b7df5d78f948d2b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

