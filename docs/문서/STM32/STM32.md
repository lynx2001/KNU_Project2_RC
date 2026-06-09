# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=e8802be04f598825d80997f071533e018ffeb793328ecef424fcc8e132f9fcdd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=b4a18bdaee6ae766bcabccf05e88e1cc5eaf0f06e85f0f8f23f3a4f9000de00d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=b88616a9525e4a7eb1e220b5e56f0978802ebcb7609dc352031b5c7879615a09&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=4c071b025fb5031037464de30b206e3e4f75af95c77d5b4beefdebf2924e9fd7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=cfca1afcc68aec290466cac7ea382a81967b0d01f85492532292e9eb1da04e0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=3c694d431c36c789656c33fe46b6721feec060af3fe66fbcc74e4b35361df356&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=251bfcdc7ea5844ecbf28b3fb6116d1a23431f59536e2d690e33d8ebaa32ac0a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=8b66098d5cb4b33c628d51c71f408e6b518ea3c951027496c0b661265bff1874&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222532Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=649942c2e552327e0d840c66dad9ec2aeede3b12ffd4aeec09907ab94998b42e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=5eda6cd240ebd63eb693c6d16e8e141439f14f6a751a7c003de0efd4cfa313eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=99cb93eaba4570dc6be40d8307f9480bcf0ad326e29a534ca2fc785712defe76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=ff69e2189eedb904a01af0732ae3770a39deb10e5a3bcef87d6cffa129ee53e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=638f37e87dd8556b80e9be00d16658e71897c87c7738d1609285cb6d0f0fbe2c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=9e71d6f864038177ab43ba1797f88fbc05ddbcce2cc4c396f0a056ab77a19eee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=6844d007438d519c7677cf2f7a1b12e214cd2decebe15cdce9df57598569c55c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=8e03179c3b39d54c29aa00a5f93d76d53fbec0512a17dc7e9c2a35792e2a3d1b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=df7715eecd02028de49bf905a2ba16aa22a09112b650dee4946fbcdc3c4b22e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=6920190ef3cc597dd8ef04aefbf54c8c34edf91816df2e292a86187d7a0cb2e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=cd1c785fcd10443d2a83974f3349352012874b3d97ee5e5241fd9d8d0f168821&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=9ba4021b00de8068cbb993dd65562797cb886cb92fd5fcdeaa73166bf447bcb1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=50cf90f07b6c6338dbd6645ba385149696a419f0fc099997818700f90f5b3db1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=710a7710be7ed1020e2e0290831a86ea581eef54410a67c627c3f447f6da5bbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=1bd67fd7348ee741381781039685d705b865abcd3caa29076c9b634aaa4ce549&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=18a29adc5b046bf2b03fc4dd7629cc7af33c3cedb92f06b703a5a9f4339e21df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=dbd5b5cc458d9bfda029d9fa0ca6ed384cc9129e1aa2e2547145b0c6ce636dae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=86fd3279968b93ae20b8f993a0736b6524f4a454c210f25110d507684e9ea172&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466XYEOWG55%2F20260609%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260609T222533Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEA0aCXVzLXdlc3QtMiJHMEUCIAqzyX8KPWq%2BMFOMUE83QZfAnMkR8gSvhU%2B5smN2srOXAiEA2eJP8oFbK0vkmqZgPlhvBkCQ5NWwKHSYk%2B2qn1NNbRAqiAQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDOOScvZAFUC1JI%2FkcircA5cv%2B1btY%2BHOxLK3NzW29asgIxz6o7WPd5711yKAaL%2B1NSmBcwtPcdBryReD%2B6uQqhzqTwGqVMNtOOVt3PcmkeOZ8JA10DHozV2dpBtSb9omjscc9lJDMTd%2BanikkjCw0dusRbk1%2BPB6qZfsFzpf7K9H6XQjRRiAsxmfrJE%2FHOLuDv9GLhih0Vfll%2BLbjt6nMSSvHPNlIXha5%2FLtsl%2FQS9xYKQKg3IEt7%2F6W3J9i%2FjPRzmIYUu9ghwvKRw%2BrdjYCb7gc5r6fcdttbmukqOdE4t%2Bb%2BGnbCfzhnN1GUMjpOMLFN3mI5fWQIZlv1kYbmCB0fsWDHn2NvyrkFqY5KRZnLlXfREhoknZUVw65%2BMD5fgpR96dYHQp7Nojtgg93K7aPNY7ICqeRjE065x6LXi3tOGr8fKAmyqtC63jIBMWx2c8lfuPDZ6CFD4f5%2Bl2EnScKygPU3aDhZjrTC0noGuPw%2FAnruuMRSa0v6bpHtiQ7b4sgL7%2F%2BCh2qaxDrNIkwCRomvHZhABDONAAwZLzB%2BSmyXFkWyJAdWgfkFWcLLjSpLQoMLWudEisb8TAsXTQUT4J0XJa%2BOteZ38QHZOyUDPvMuTj49WGWxEXoL0dDOVn6jO0F0BYCtBjKMiiRs4NyMNX%2FodEGOqUBFhyeBprUI1cSct3D%2FFbVBjAEjtVpRBsZ%2FFRWUdR2gtdB%2BdMqVHEKVv5aQKU1pn13LHtzv3NWbUehzpcD0yYmYGP0ZZzL1FsaVIXjH22a8oI2qvwzhsLNJRNWlnyU9T3PArN0BEeW%2BQnzgsT05Ulk2YdOAV4VgdnxP8DOdX%2B4u8ZDyQ1pMwIdReF0CnkW2eg2f1s7IJ19qfHVUIjO8rPNShkkDxmO&X-Amz-Signature=dd6b5807fb71b790f25efe083afb4f9b5ef19e59a1aed1b780b5a7d1c536faa6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

