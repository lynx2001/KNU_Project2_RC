# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=df998b508595b66ba7fbf8b7497095d09f345cdb129fa33dfa22a36245479c4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=4d0d37503f9888362c52a6de10c3a6999758f6a7c2108277db7ae4f660cfb627&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=66615dabec1d841791c43da3fed3fc33707dc4a347dec32b4770e9934a6a091d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=ecf5dd83fd79e02d453ba0aa65c43b7a605923892e4d920d420c58e83bbc900a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=6cb4f31f3c09f620e4f54cefe783b778ec7014962ec8529795c3210ff7296ca5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=ef66c0f718968900afe0db57891031727c8c891194d5fe9f2ca38d1900544178&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=6d190c0bd3a08a1a246785929a855cda8beea26e9f863f0c4aa40d219462212b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=afd63ef906e5d262b97629e9b197786335f2df9659710d49a2071ed8bf600e0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221605Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=3be751bc2380b3632ee60825e571e6757c244ed3f6e4ae70f61937687509d37d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=286c0833fe3a18269365ae591b1ae7c15015c9ab8585a012122d0ba2bdeec99a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=cd1658aa30fbfc63fb85583016dac7feedac7db3cc2a96f33d442f871486934c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=1301ccbb1341ccc1796fc5115b61ca022853399e32ceb053619066125b71c76f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=cf8bc24f81a282b5d7012e942393fb936393eebd9d379f539c68aa470eaec3ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=a137d7f7940b4aa5c4d65856a79e3aa24adae7ab5536dd419a357bdf43274b50&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=f8cfffa17c504735bd59ed12c4db1e58fbb4e9ac80bdd25f8dec46963f7e9c25&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=48d3be6522e62b52cb1dc7c8d16d21205868f3b555ece2237f406b7c3a485693&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=b909cda120f40db61ae042313d2e6eb03db06746fbff0455e7b090f98f574244&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=550760571a3940e3d666f9606b766db798f2436f698f2e638ac4073e25bba1ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=221dc061f4edba3607176d54fbdda9c774c18d1aac64082744f21c509c9df99d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=f40910f3bc7c9a7672adb1c8b14651c531897e7e4e0791c10816c3b949bdfebf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=30916820332f11d541aadde12f5bd7d19c9e9b0417fbc14694b9ddac3c19d690&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=5809211df1ff125b15d336df2c35d3383a9be5ca08af1ba3293ec34857d3e720&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=16f117c2653db2350ea9349cae2fa73826859a802567d54dbfb47ce212d2b8a5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=185d98ec4d1dc854d0f3fd17782ff31b26e245f960b16de9f5a70d005791bf44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=4b764518ac9d29360df35848a6d49b52ff44407473a9b7b0e2394479f1346c96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=98c64411e825894fab7a9019c48c9c403677a31998b2b2018b1fe843f7371653&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663VAD6JNZ%2F20260621%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260621T221606Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjECsaCXVzLXdlc3QtMiJHMEUCIQD3RLqODMeWAE404zvjZVcmn6esRdy0j1eb0ns5%2Fv1I0wIgGl0TPKSnTpOpuydhF3I2hFRUpv5lrLOYFLIMErfSBrEqiAQI9P%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDFU5qeL6jvIFzryZNSrcAx4WCph57Ec1rsKTzTy2Xfl5saRpyyfdM%2FjrtCPTGV%2BUSSOE3nuuB2xxDshDzexH6yUFxmWVSvyDym73%2FpyskQLnip%2FeYmZAVP16UtTfR1AjVzowiwU7vC1d1ce2GZt%2FogXuOHFZzZCyEpNUMtBUuASv2l%2F7oaVsy23P1HN29NGesHnuBIxe%2Fei3E0RVy%2F8BtX2csbPkZs72PjkxTFyrlsYPP70Gh93xwH0d44Hcj4A5TIFGpGBmreZhK0pScuASH1xykvgWYZt0VVt5pef5tuRXcIbV9SysmWOG9KxOjHN818WLXuafNOXEHRd5MRLlTetg2%2BNgy1j7pvGKELICMB2r1HIDaAGVibKmho5udCzmtweWEIreta9SVf0Jn2IP2IDTgZ6WiVTVtrMy9xoA6BzVSiLeaXW0DY9f5%2FiYI5o309FnTbdR2hbxJEuaZFoe6k%2FrMj8cWn4I55fm8eycQk4G2iCPy8xWIWBboMiCUXqTOpEfNpY%2Bn715%2BU6NxM%2BdxneszGsvBQ526ntdm%2FvfDTG8AAuCT0%2Bgt91ATbqZ4eRAKnsBptCnZKo4%2BIwuIz0PJlSr02FEr080JFAi3MJLozs7ijgJFPj7nOwjk3Blrk%2BYxxIKyVfGgCkBs1vAMOTr4NEGOqUBD2FvBXCUoK%2FBK8iaJJ0zb3xU8sObVHNSpwgz1wCd%2F7qFGtt%2BAhssQYqhmi7kDuHK3YELmgy1rNhpmGD%2FOGJp6Lits21eiL50x9T5BfECRCu7b%2BpVCwCT%2BDGHDnY5cpgBLj9n0%2FEix2UalOKk%2FgJK5tmIYsSVWQtZ4sc9zCEkWrjyEyceTCe1kSKi%2FNwOPw854VPfKNOupjMCp55%2FzKxgelphyOae&X-Amz-Signature=5885a33b6944c0c3d100baa1a2f7b6f41e2d333d314bb0241ae5cfbc127fab9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

