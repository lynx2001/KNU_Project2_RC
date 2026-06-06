# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=34d45eef0cf610bd178359bad0dcd7c701ab7047298fc4ca67d321b88316c410&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=652df55b9f303d783598e91746e1ccdc71c8f0d71376b78a88b06254ce71bbe6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=dfb7fdbd5d28980371622724c9b8e126cf2e0f54dfa34ea08bee40032ed32959&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=c67647e560bd3c25fa7aa679701f118786097b13763a7bfadfad42bb52abf453&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=032e0b9c0f318431a2d97ea958e3440cbe2bde5f5e38e582aafef8549313bdd5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=3ce3ab50e6823606c141de4b99570f40b45ce2e43ea32774124b6d204fad4a58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=7bab2a3fcd24471ffe3d945a07fa16c2de0c82d69f03e3495a265cd4f9158feb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=1e500632560ccdc974ce2cc6ebeeac2b684067870440a4ca18234cb628f7f692&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=99f0e407c4c423ded56dfb9a8a34766989f262fe6051f67ea9163c7bad3f0824&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=5b836b74be7bd03ae279a7265eb9a9c137115c0cd21bd971cbacde54dad021ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=372b5e600bad36f1ac4d6807bd7e11564c65f0dbb1b3f4d6c46893a30b4aabec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=d598c45b7f9ce117b69d99d1187ec72a4b68342a8ef21707e82b5d7c14c79fa4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=ab40b7ed769f04017d8a8d524e015b4a810bd50c029fb720d17627fe35763a38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=d26d30220e9f37bc4232d108194c4e1b8d46454fcec0fdd6cd612337f0b39ea9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=0c85fe819d38507907618263a0acf6f9d9039f48b24885cd01dcaa804e5ed723&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=e412d6dd531599c001595f8ea3dd90aa9253e2953d6dc9bf7465f2e2f86aec41&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=2bb145b7e13bdae56846c7ec3ecd3dde04ee02fb3d090d9dd284a62886c70de2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=c72082dc11a4158dee565573069ed550d44fafd404cf96a353751210a73de1cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=6b0e5d895bf9d3a1358083a6dc3ced0246e71cb425b8cceb8480d2fd5711c9a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=ca5b7c84c9629f3e1b4d0661f0662660443539bc31e0d65e750bfcb911615351&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=a830ffd32fe09ca50f4010c0f82a27f692e7f5e9c82cea39cfe8d9373e8d0a7d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=70e143374c28d950213fb46b2ca5f37342c8b14b6d35d77b38925f3351cadf35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=fd51830c588d4d73a5a804d00f21654616994280dadb9d4c476fc66e514d996b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=45cbf4577dac9aa2ddc5571001086a97adb7c63b9c169554807b4723bad65969&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=9128a4a7da61e16904010e3bc4bb73b4aad2d1f329ecc632f654c743066d14a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=26f67fb2b4994b42733248767ba15a03a88a110cc32027221ff51913d583250c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V5XC4XTI%2F20260606%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260606T220526Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCj37JjtJYKZR6D2gDucrTRkXF7Ljdhu152daZYeKg%2BvgIhAN9XjSjciAAwIR8f7t2JiJcblGv2Io%2Bxp17QuJYJnTcEKogECI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgwoN6jAq1p1Uc3sG%2Bwq3APbwJGUy8h%2Few6J28xz2QuBPbfIXmaQ85toExtD%2FiNG0ab71MSS7PIHntTtJinhpJGbqpkx56Wl7dy0hwhQstqeLJhMYAsG4mBnprBPttE9q1%2BsuJeUuEWgfg%2ByHK3ubBLBqAUxSFTSzfJ1ozQs9gKP%2Bcfu%2BvJG15CvkiEm4bBPIooT5t7tMS0TEYeITm53vUbP1JQw6NtWdL5u5fnkm3hVBBK6356vPbRMff4357N2icyGHgyEltGuLEjVSSz4YjczM5NXCv7G5RSK2RLW4Gb0F2mVkfSGP%2BlIHld%2BvCW%2BmMzohg%2Bos5hZak5n84lFrpvNCCPBjYAxS8WpG9Hwkp8ofbnhssqYKHWp1%2BLNlj9PX9FwUKN0sAdLr3nK%2BaG2cvKrFG5ovmBfbV8aSBvHZc0q5hq1e6qFM7akND%2BGN%2FjOVkAh4VwYSK%2FhcyIUdq2YaxjbflHvoqSGu1jE8w4xv7Jk9eA4yRhTF7piyKb2qvruEcKz8uS4X80w5c3Wxrzq9QY2UEHkb7pauhfwT%2BdFPy80DaPSn%2BQNp8TNSKPybWie5cyCwW%2B%2F910A%2FeX6wGxl9T%2F4HvLNOWRLdnzU48LUzgHIExmUOtZ85HVBsjSSzNGTBxlcJPkbUdC2ngfxUzCbiJLRBjqkAQLHKvnmrKmvtXU6qASci8ie3dI5t3bVfckt9bXoKqkGFfk1Yh9ySBe4Mebcf9%2F%2Fz3DXOxYMURDZpFns5QZX4e%2FO5J%2F7XK5Sp7yw51TBM3wc1DoXN4rCvSAzfOq%2BsIMJU2rpmzvgeyqJFzNnGzfO7w%2FxiOrN%2FU%2Fch7Vuy4lUsYQr5xUGHH0cCmeJR1Bi0aeGz7%2BqnuosRCfr0SDtTg6WQKqKPg%2Bu&X-Amz-Signature=0012605d992ccad190e67b6ae0557a72184762779b01aa4f2738ee85dab7f35b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

