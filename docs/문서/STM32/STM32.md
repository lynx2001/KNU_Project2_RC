# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=61fb8891ed64833e62fa9b3f849cdb6d9b14e03c6ba3137e76248ae74c55be05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=0931b582eef3ee350e30a056c5065608492543bf3854e07e30a59aabcec47274&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=0035036fbe8480231df97756412f9cab8c9b7436142717b819b139bd6f5f2203&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=db4a53c3419b1ca040a88c59ff2b4fe18a11ef2f3eceae7e8bdbba2038824744&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=c32ae8fb8fe1dfe0d66c17f6a1877641185aeb70e4c1008e82dde8a66f5ef24b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=9259460371c43ca24ce95190bbfec37500797cc79acbfb0530a3bb86e5a93136&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=3da0eabc036c8d0330a3f8a48ebd836a386c3f5ea55bacc113483e43c89a97f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=847ff11658e9e8e971e95e79c274119b02aaf5a1346f2168d680d1a4604c2699&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=12392ab3f2f0fb115e5d695f84a7c70c116096381cc71876fbb2f47696842439&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=cea0666b023abff23909de2c14cfba22c6afb3882cf79a59454850364b5bd032&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=c7240fca7cfe2af5040ac1b45ca9163abd5941ff9e1c9b5dabbef2650ae1b316&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=9433c59a538ee568c571172306a2f8a46b057f324d6f9e284e0cf852690503a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=300f726a7a9320cf41c6ba6f8b71f60cae16eb92ca34643ffc6cae86d4a69f3c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=850c691a7dcd386ba82434aef661719676cb08d898865a82ad18267da583bae8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=86bdcf793236679d818e1d795c3f800cd8ab20b932b4c3c67bdae4636831b092&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=b3ff1e657cea9915e3cd9e5b6eaf7bd9373bfeaddfceb4a11e8f9a91b9c47d2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=b50a1be99a9997f3c6e2dcb12c1c2c34e04b122dfe5a062d69020c7b18145b46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=49720a74ba994c41d87af4fa18f66e8d3e433c83b2805849194bd25497054ce6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=ace054f94f53266b907c6018bb5ca0100914238d5d9edeb7734f3a0beae317cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=09032265b771452c23030df6aa6ac11717b3120d625812d9926fff611abbd541&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=f02f007c53f295635447de22a6131d8676d17ed639bb3c2790d70eb9f58ab4ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=c7e58da1272e524f02ee4feb66c5f1358e5bc2878fd26be819954cba9ea49a94&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=c11c3e489cd7727f14e697c4ccaadcf02412bf55e284cb1b20a962649f8f0de9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=d063f0c99f526fff0b7630a2fa059df6d2f8047fb8e95970929f97b6076397ed&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=8877664d3082488f723cd4b6f9d86866bc93f2eb8f5edcac154a0adf1a6dbb8d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=e17dbe115c1f32aab0efa90d819445db6df046a5c99615a1b4240f4b82859e40&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB46675PPX7PE%2F20260424%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260424T214353Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQDLIbgl6qOyB6HFdOXUv4zeu9XnhtjHc4dX%2FEbHyrtnKQIhAIm5XkmsHdOGptQWbt0FsnykH%2BQU3AiBgt16vJ1jM8VQKogECIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgxsnshEI7NUwpxv0ycq3ANCMXBN6TFAU5%2BuNx22F6ol4IwO2b5%2BBAimdand4Y2qoFjxLlHy9CVweTBR%2FzcqUMN1i0rKXL%2F8yFz2KLlflGjqqexT%2BqNhve0N4cWuiv0jSBPKbKsa2k%2BcjXAVVMyJrUXDMhdwIJsIqp9dBv8e68Du7ci0Zm7MyEkFAfCmCdvDbZH1FOrwRzmdzTiE0Q1JVVxFQVa5eIQTJo%2Fn%2BAMGZWci%2FYj%2FcL0ALHIRn0WMtcunZ7dj0DD0bRSTzjIbeGon39U%2FUbj8bssD9Zg%2BUPWEhL%2FgeQQQSBp7yV6WHmk2veF8gecNriLqKHz8Rg5QNRwXHhOZmVELDojBjToXeRFtyyoYgzNJLSipcRsSOUwpsPIJq1m8OGgrC5bCYT7m7KEpbkqW7Qj6iTKQLv0azp53PgN%2Bo8xSo5Ue8%2BkUjUv0nci%2BOj9yktdzr0p3BB4DrzfcurWEkFea4o1080dofjy1r4KzmS37tRZlbk1Oq9E6d189XrYXGlgjJqHDxtjtn97ysj2UdLtcL7m6bBZsXo8eIUkw1xsLYdvcM9g7RcqG%2BlEWPtwmyYeC3LC5K%2BR%2B0F47iRNb1CIhurGQ7txm18e9AsCwSgwZOHaF5c914rtR9Or5qEsptvAmlY21k2p48jDIvK%2FPBjqkAYZIrEJfbiQnggLNlVKcADMsHgyEKFSHF7GKdLJJZVDTLw8A9DiXfGge%2BRQgbXbMnZsbYU0CBVZiTzx%2FhZiRckw8dJz8nLx%2FEfwyA5X8voEwvq0lCMTLzynIAyOsmGaW1M3j2wWVvAQTZkX%2BVn9dMraKP88wiIM2Pi5D%2BHWY3wHHNDAYwL8MPWxWoc%2FI7FzC6xrGqYKlJ9sDyWLurU56JHwnHpFK&X-Amz-Signature=26de994f6816863da599b3245b83669271f21d93bda07d077457c2ca5a158533&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

