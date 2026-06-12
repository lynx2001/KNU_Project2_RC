# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=418b660ca054b62a0276ae6a364cc504e40b2209b6e7a40fed5eb36577c04ade&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=97be8d2c4c302cc28f7a9073d63d9961c740a439371673816d9d2fadb5adf9cd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=80cad3593cb4470d37901d24b25c4983bc2c654febe82ee380eefa821424ca5b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=c96f0b28404b7e8ea039644c7542b8dbae6fd2307daca489fec1c5f612faa335&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=086a157c77e165a59df08062f74c1f6f1da65493e3d04f99210225172d0a1606&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=55d9646be72483b04e7e7cd20e419b05bea1f28d1992060cba0f8a83a2bc3088&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=b30a4eb3bb6114b596e0d6a3c13742ebe2b72d68b0a7338494c8108975a331a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=d7b540f768a8a937a5ee49e76aaff44c212c12a44e275a7fae2361192072e63a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=ce4b6de0fa5b68180e4f28f46afd3e73337b259e6f12b8c0639736d40322ba67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=903b65401172214f48b28c0eea02d93f4b9019d1238792fa5d705676b21e439c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=b220b46a615a667e2855531831307c96df8f9bac2312e2ad518845d4adefdc92&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=4f733b062505a5bc8089cef03f1140e7eada29e4a5d6e1af111cb5d068d0a9ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=5d7b0768db847ccf97aa85129dae7c4b983f3127e0c27ae38c0e3d97ab39e994&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=2e67fde52a3d7ff361fe2ea6d7e15ae4c1ccf3c55282e8c99fe6205c1b2b6a77&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=5bf8b55a3deb067fd81e1b4edfc3be8a8f31b89bb5740b7848f484d8c081a1f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=01d4bbe6e5ee5c5672cf135c991ba118249fca3e92f80ac3a9da68fc3e5cefea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=551a9ad33f55437ef0e9827d170cc202cd34c0f4c2bb0244619c2a15ed1a6376&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=a6d1cadad82df4d9b80172729561017a72d81b5c80e97611c7e66e900b0cafbf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222547Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=0e36ce92499d660a5e16111763255ecf1ecc59d79b75c2c7ac4648c845579e45&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=324d0aaa51e42a3f38d03a2b80821275379843206e97c9c382309d1baf7d49ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=03a6e6f6282c656e57c68ca008d48b72f11a2c0de54e49aa1beb2764c936452b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=7c1a92de87b5c00b104b4045fde3fddabc1d37449cb72c6340360ab4815bc991&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=f3cfe02a9d451d6b180a327b8402ad4095285a1e3e7c63e47892e07d9f4bbd01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=cd92e588d1058a7dbf0819a90e7d14cf2c8ae79d427be7e221839e37d3ff3c14&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=de061d4012c53bcc900b16f086ee05fa0f2504bb2f56ee294c7266657dd69f0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=5b39d6933d2432b10525a37651c9a64c8a75b1c2e44fa0f308fcf0893b776bf8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4663ZC2PANW%2F20260612%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260612T222548Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFYaCXVzLXdlc3QtMiJHMEUCIQDVgy%2Br4vHUYCFvQLyH0c4VkVHAJX3frypyuc7B8MfwgQIgT9lmFKknXMP5grqY1aWxhQt05xCgbbnG1U%2FPApcABCsq%2FwMIHxAAGgw2Mzc0MjMxODM4MDUiDN1oqWkHAOS38OAaqCrcA9VmXNWb%2B6QBI0txRyioudRSQJ688GrVCd%2FP%2Bvcwjo%2BoCySKongwICtLc41ZIr%2FOcdJzHkNalTU9a2JYdf8Y4ss5JPPyTk9M5a1WSSMx2Y3jDbF9LzpLOI84dFbwxNghcMu9XOfPyDJHAcD9I7gF8ucaM8NJCm278ZfrvoKf9aHf5vt1d0ndsXaB59TEl7TGgKk35J0fWU9V9xMoHPQsJV%2BUDXXbVzwS6px1T62J0Xth3nhwHedEw0ZLYLiZ1mEpsv8mDZMdcQ0A0VPf8Cg9A1R1GRmBwYfSMloE%2FEDqfDuJb%2Be0r4Dpz5bn46sdnExrqv34BNKav4sKbjzUyhiKktuuG0%2B10HvI9N%2FvbVNcjK8wsg3VYB7TvVh2Goqa%2Fem4NT6sHYVGm4ZK2OAtYK6jALHgIG4SGpRXzhbQFRsndfWtp8wLz%2Ff%2B2W4EBNoaEP7%2FaF8M0tt43%2FHR%2FbnaS7r9%2FaMe3mZO8O3BEAPljA%2BufAEify7Yd26CFFOJqEyX%2BPuKWRq59R9JCubbGenxYLXkmZofq%2F0kuJBpeVkZQTkAB4LfdbsSYGitgre95GqpeORKnsD1GOSenpJX7igjrUJ3UbDr%2BrfAY%2BC2V%2FaE8Ll9eZW2rJ9wF157cTcGHEDAMNP6sdEGOqUBJYVKiIdq8wYfkVlsXsoYDdCQ6Mou8SofPQw2RlVdXokkUaQmk0%2BlbZuTs1BiW9uYwfFa6tvzzOKKP%2FxonT%2Bd2a%2BrmBBQc%2BSMysFBr%2B%2FnMMNMOSIIkAip9k9sTyhNM%2BdJaQ3iPp5SS%2F1YZ4I0KFbJPQ6000eetAiI%2FoCUkpMppyFLmPgMQ6KuSxOpcIrfpmIKU2nqGZnWoBaVOqgTaox16j9fe2vR&X-Amz-Signature=a6630c7f0fa81faf15f3109f2919f19878df5bb1157857af57b0711fbd15aadf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

