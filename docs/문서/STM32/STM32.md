# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=b6992a2d6c410e567e13c44c9b256f0f59003d1152c2a9e82b9f068f57e469d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=48ab0ff8cd9721f827893470cf54c6cac0582df089553b0629f545588b937cd9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=3ed983e0d0268c23e63b5299aae16fa8c996cff8ca149225aa0f92981c2282a2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=0828883afb3b7ceed5d03333d2574dd85c5c83b6ad6c15a7731711af130641e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=680056dc262a1f9ae8079c758ad714c2aec2f8b1be1a153315a297580e50258f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=ee1c754c737a917579dfd2dcc992d0485af727e6a1586cf25165dea0297998b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=5e3cbd36fc84aa02524997973ddc23894b83829154b971494ad8b939e9c2ad87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=3147e5684c220fe19529c8f372296fcefd3b56dcbd843be94787ab6de8630ce1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=50475022cfe653fad408c8c2f27096dff7f6992341785c2729b5e38452d1473e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=651c1aaf7fee96e62b3321ad4de66bb2d00fcaf1820b5842c1198d9d5a2cff87&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=b0fec75320a43537260df35fab4a67fe344e6c6335ac07cf24fe1fe54fb5455a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=9293a20fd94c48c298f1fea65d0b5980248e581ebe30f769f86eb1aa8173a112&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=617894c2ec7eb22a1171a86dad1c7af08ff0e584f0766f9fccf20ffb1806e04c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=9d8a9b90bbf815fdf7476effdf21e915cbdccaf4ca51106600d4b32d9c6a5349&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=ea320ef42017eee668ca9c59e0bb0ab3af68e39c1a2cb206bb7897d0875310c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=319c912ca906c43c668d8b4457b08226dba9595d3829f15454437b2f3cd0b928&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=9922b03e2e044e409ea7186f643c9e4d79aea9c3eda665406eee3ffd758d22fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=094c5e6b32955cd6cff0465bd97f4f4601ea562dca79f7d96255c956568bd03f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=c5537266d81bf2faf0ffa909861519483f87cd5e8e51635e8cef3ba09247e2f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=64caa2663e2b533190c75aebb0e84a6c2971c83210d9f5607b54a038cd9afb68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=df2497a2d86156c76a487b51ff16ae8cf56a21f096fd520a2d5d74c6b722fa18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=fb97d6ba1eb8a8b90cec0b18f427d496c202f5306ac69bdc7831cf1c99248471&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=f5d6a587c4080ffc96a8ff32ad9c54ec83320a5e6163ebfb8adf71541726fdaa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=6a24a08d69e39a6262f4a967e38e13fac3843db295ab92cf2a408677747c793d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=a47795a0a75057dc4615bf34162135c77945bcec526d36ed609f1859da7ea322&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=246eaeb5f6e68f6ebbb31d441adb157850f82c7fce4ec1a6a849551e4addbb44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663E5BDDNY%2F20260416%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260416T214035Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCv%2BZRY%2BlTEs5LxtCPEl54E3Q4ayAl0dVNyvDIRxN3MUwIhAJb44zhjcxwWBHlY%2Br5NwnjYa7fSxoDRViZRnj5y4MTxKogECMX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzDIhn5grNnrhO5QREq3ANrFmTCM2GnIvInfeDJOzQsIzQSqlJ0KcUZmCf%2BBiazzXfQtNDZvMU6xej%2FWTKaM48raMRZvLvyxea4Ae6PNiTQREGaUvh9aEfmRpJN6%2FzsY9DVTebczWzeg5FiVTd%2FSqhB9ejuRtHk%2BQ9ISUjbrJc66PxhwjBUB%2BLnwz2QPIwhAsJyJ%2FXCNOOTCWv6rvM9%2FakGSYm3iHZK1IhmLN1a1yU8i3LW%2BTxZmKZnQrMdzSCmn38YIkWPeANchGOBBPMZsPiH2xIEzDqkreJ61NmyQGlRqTOFTOUK9SIAyV8cM%2BAMAqYGhgOsqTxn6pjTmAILBukipw03ryzLTzfsfKaAElmwDt8hDY4W5NqDh%2B%2FJVTR84MuKgTYm0bksC%2BPyaX0qQRig%2Fjm4gMDtAx1ryuI1MNAGZSglY0AMxrcvod959un8M3h1o558%2FxdvaHxUhsLEkqzgAkK5hY5obFL9uUv%2Bc9wMArn6YK4lNumdjFHH3wf0qBrioo3gTihygID8LydswieMD7Sp26BXbsZkQDvWEBwIrESpgVLUuP9PZHPmuiqk%2BEPVy1B6uaFj7MdrWGYGdEKt6eZnTrCC40%2FYoNdSEySJ%2B717CXj7E9neFzVEit0sgNXbf4IMkpI%2FbrBngzDc%2BITPBjqkAYBXuLwRDlOoCJ4Wdeyb23qUQs1nkC%2FieueLTWEA5TGZ4cVxRbifx3uDcQUS61JcSDxc8xTmaaeCpQzuWpF0BSK%2BvQTOm85SFIKMelyIJUOu1NVezwG9mHKpIYZFR%2BZ%2FRp0QFJO9qdTVljtFk9%2FmPYn8HXbtgntIdfoqqhAteK2yatMTzv7MrdhWd4u4z6Yv1nuZzbWMhzhzakR7k%2F84mtUYyvkm&X-Amz-Signature=943ef87fbdb5cfd60949a2c5f922c26c420d29ea2c3714685d4ac37d4b6c6aa3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

