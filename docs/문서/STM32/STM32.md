# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=a7cc1176306a60e916270adc1a4b5d48ce604c4cfd1ebcf791ecaf3edb0ad042&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=a131f3599f9f4107cde4547931042c8f8a663e12e915079368014f408d75088c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221703Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=691771194870f8350fd7ae586b91a734395967853090451772e0b55238a2a790&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=4d1855cdf593849738d9e157d442e791179d1cf18df6a1835f24444c10955f2e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=9da0eec5778cfe91ae3d5995c958d6c7d2d0c13d6739f63590f46776dc810b64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=1d126363cea79ba226ef8a9c111a7318169a1bbbe70e01e856ead64c38ffe6eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=10bb6f047b49dda72ba195ed23aacde91d891f6892385f17367bff852d76dff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=b16a8c0d2a98c76dc332020cc8e4cf586c1380bf5456b70a910ed4236103ca69&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=c62ad18735b791498ff26a13ef50c3b4fd3b43d45505b77751daaaed21275790&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=74378389149b00028dce68c9c866f5337fb484136442e7fc6f9b306a314bb659&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=65a2e76d4da3bdbcd703615e8e6af9969d815c87416277f8e0dbbcbdc4e6b1c0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=f3ed891511956ec1c7d75873489832a2fa7f4203206007f3514113789597f921&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=bda2fab1c27661ab0af4c8f0abcfc324d47d7498780194c9a8f2eff07ecfd052&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=c28e611c17ed478b52ff7ce2d41a48b7cd37f6524176e9c4838b591f800a95ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=ed9f3c76b4c0a9c1a0d58a7ee4b74bccbf0187c9143af2bb212868683bf50595&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=290a462cc0315dff350d5a21f2e378f7b9e8b41cdc7a63d408536bcc7184dea6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=6a186d9c5ec16bc2ab7c89e39de4f4a368ace5d1d774675b44248ecc1069ca61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=f0ae1b0ed3474453638979519f712126d29c2b32437fea0aeb859f7b5dd89452&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=acce4e33411ca7db9d4096387c6f367c31e09b861ae895bf1c8ad3f8644af0a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=6884449d29188a7d7dd85f4eeaf055de9271f8a21084c5b435024a1985a81ff8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=a51e6c2fbef42332dbda824f5602e263290cc02e04d65e3e251933dc936a9bb7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=bb45d6722b30097557ad16644e0282208461036c1124eef662acee5f3e81f9a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=134c50c2c5b4d52d1e1a69c6c11c97a17cdca91e6b5b8652341754f6df47456a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=b011b4101ae3c1dd7f814f860d5fea9200cf82cee66716aa7047af8c22b13d7e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=d14f5b7dfb11454cb06eb3934753d55745acfaee788963ff0ddd9e8f44ea499c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=468400d10d78c345c9f62242f26a42204c6deb27d8d145ee1f3519b7379695c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466VSX4T5D5%2F20260624%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260624T221704Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEHYaCXVzLXdlc3QtMiJHMEUCIQC51jtDpZ56gZS1mORBzE6E8ClPS2BJyYYPMVXllVMR4gIgaOk9%2FuCe7zwbFJFuQ669hzC%2FBT7qFQR%2FOZdTQTFZm3Qq%2FwMIPxAAGgw2Mzc0MjMxODM4MDUiDHntvx0QSRWTh6n1YyrcAx8dbrNQxkgjzF9KCdsSrnwDtu1GqMTT2QkFM9H1qSEEL%2BTjtDpuVhWpeVjQrgTUS3SXfM6mi%2FREy9fToAzc5WSFeJcR1WEDnh2BIFHjJtXDX9slSZgnf8DioZD0kNOpVzxNg%2FvxzihQAu0Lid4cUsU8k5AHFqNptuJKxvrq7TLyT8uRC0xVu4H%2F5iWnTxnBSygI69CVd0gp3pJt1NR%2BsR35Ko%2FCTu%2FbHQAFEuB0kPtNyPuS0VBDwQO87O6iWcozVpqxC4KJzrJ2q3PeF0MlOzCJktKllArKdaoVXSWQuGz0QW3n6M57yAamOwZuUWqd3pBHz8XfAAPTIyyjWhsoK2pTuPjgOdxeaKfonXNdxslbte7I3op1UiO%2Bg7A10oQ29cUFDUwTn1slsSg%2FniQU13W6m0CNVMrsARTvtRAzPZZYTwAWC8Kk%2B%2B3n8%2FztdgDD0lKQfJmvyMQ5WRk8KzmN0X86MvAVl8NqgfwUM6Nu0syfhYXLtkMmVdb6CbQZZ8lz23%2F5Imc%2B3BlQ3ZwImbvvwHc1RDx6pBko6garj4PPk8cJDunJSSBC1t3aHpuEL6GCzUaoFcoEQoNSBc%2BHQcXFSdW2C21GGyqzc9lZ3TmeutlOt7qr9BTHJ8RW3R5qMJ2g8dEGOqUBJlXkDvNlkGQF5B5H2jfvlJ9nK1bI2ywdtZEHyqCP6hUNAyAoSZdBOkJI07Yq5dijVlVMzDl0isbGY2eVD1%2F605xfjFo0olPWthFuIoTxjTuUU%2FD3pNANS2yIfDB8dzfeRljDJ8Yv7lBmscmH2LYzDzZjn%2BUPigcCR%2Fl5faZlwmcKNIs7N1SbLRyZtYWlKgMB2mE3jfwA9yF4h7CTsZgRlHEXI9bu&X-Amz-Signature=ae881904034a3b4e6e374f41781e96f86520c5592ac56f768087bb46a04bb106&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

