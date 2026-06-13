# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=7b8bb85aaf6d88a2031175b06ba91e9ed559f7e0801ee6ef4e045bb21af5056c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=cb454b6bf8c6762a88941318e4c6a61943aee4a69dbb6d3f25b1078f37f386d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=69d12c01ab8e31386720ffe1075023b824945086d50227a13134a410b0e5080c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=7f26d6178665533b25eeb58ab4754d4f10da55876f188e92925e8f8380dbc467&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=341f1571809a75627b5a085870be5f4cce08af5690188a751ccd3b90aa9b7ee0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=0fcf93a46bda31bd41f1de814fb2483d5b0dc229e76095046b8949c9e3266703&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=2961dd1c10b11b8f31b6094548907beb236425e20dd5ed6b124c3f6419b4fd1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=b30a9a00e2bbacf181f39de5b5d83369336263fb82984cdc910d6f065a2cd191&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=fcef792af78feaaf51f42dfb347a0cffec3290a21f9ece8db8142dc976fea99c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=1d3b6cad0349f7525d68b4c04e1ab45ed491dd1289ba584d0b34f6e0be104942&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=c21916ce60a5d821034e02c5758de897b021f92c9ddb7418c58f2805ac14cb89&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=d23ef61c3287e19502bdcab22c052930fa438c88ebcf19961efc8d10925d3429&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=32ea680231049b29e302c99b7ea1728104a5543c80c13fad13ca810114889d12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=821abcdf7b60cf7a7ef9c16ba37c96ad1b8bda8f7ad59cd26242465ffb6b0189&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=c50de3337e961aac76f344f5573f664329441b9f2270faf25518eec64bbade9c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=d29347c13da0229a2d00e607dcfb05d41bc2de35dcfcb1101c99851b7587d89a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=ed81f8ce8099df6687030b23336fa5d75082b2cf986aa1e1df665a7b9d40299e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=93b559bb0d48587bbf47a2d25704cec035adb162b07d4fa92c87c6826b589a46&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=ef7626dc19202b252734d04b193219ed0610e0b1551523024b02d44b8f4985ea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=a8aed2190dd3f9fdd7e913e5584aa53f83838ac06710c8db7dc3b337076b613f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=6021c39af09318955edfeb78757c71460d43c3d867a50aecd073cd01a2cf1889&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=f26e848f221f33c4e6393e0bd4cd390ee5421f578f72eb4a21ca905419979e55&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=beeb70fa369d6598aab5b601b633438c03bc813e3478d05cc9f3ad6b10990db7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=e9e43df2e9da3624467968ed1a98bec1e7e3e260457004e8989a7c0275a402db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=fd7b211be37edab6cd1dee871da4e270bce65453888d5a0268c906845450d4c4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=a5f5c6bbe0239a069ff402caa4f09e8a9438bc701c00e53c07837a4ea8afeee6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466WZMFS6EF%2F20260613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260613T220432Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEG0aCXVzLXdlc3QtMiJGMEQCIG6kIq%2FYT0HpINt9yCIduUSHYTvPHZFbLY7rz%2BcytQrRAiBBv2SY%2FgRXpZzND0knA3xb8OmJvbwPiGGiVktmhrHKSSr%2FAwg2EAAaDDYzNzQyMzE4MzgwNSIMbKP77l7AXjZmSxXMKtwD9OdoElOb4YgiqPZi7q80AF3m5ltZuAuS83J8ka0pYAmnS3awLFyoyIs50%2B9mK4277E4Xth5v1JaFPgGMOfCeSnygBXo3K4J%2FIz3TyFroYDrqt%2FxhsgX0%2BWa87BKuhrFMqPgehHQedX%2BCQT1ubr4pS2S%2B5W8MeegVHT6iyvvj99cqhm8Uc9twpzyAqv2ymvWxateGkrjDLMg0BKTJM0c%2FJBcBu%2BHGiK%2FBSGkVhPTo7yJJQMAxYHl631im9ynJICRKyE%2BzF1lSSwtpy5xk1XnBRhAIEO0%2F2CoVejA1FeTvpSOrX1R5ktsH4%2F6imykHoa%2FO6WQLJ%2FOhZwfIDfxWdGphYZwWbXODgEoOzsLUG5vvS%2BtJoy6cCWvr7mglUa0ogmoTEKIa6BsG6w9JTr0rT7QLDXf6jwYmWcfxT%2BOmsomUXM2fHEAVms3j3vfvbV38BsFJUjnpuIAtcT6j9azD8hpMspEXSTFSSi6FB%2BE8h4js2RtxVUZMmY%2F%2BUvWoJ4qkZAb%2BEGz6UjebHJOlzWYeaf3TuxnZ01OlSSALV%2B1v7JeivVEWUCmcgXE29j%2Fx%2Ftpqfpd0A7HcRsMiBJCOx0q3hcdnFJuc7ezhTCB60%2BBlVXbhB%2Fceh81rbHQFHHCu20Uwg4G30QY6pgFQYqA1EcvCwZAt7CWR6GSFSpqJQlunyxS8meZnK3QsAEcgvmkwLA0ZQHZdLRxIiTmYnB9r2nNsVJrlG%2FlnST4A5tCnwDJDh6AbsCVG371jOy%2BVlA%2Fj5Vht6ejWXdAc8P%2BcoIwMDn7g8hramF07NVF%2BTDNJ0In5oAV2%2FpWBetdD5pscgVNN7iZzT25BASqAfgjFRDub7cyZDxU4%2BiHXHwymhuhon3VL&X-Amz-Signature=079560c7c373cdd1b78d394594f02ad6b28cf0d19572cb0ce98a21154e96bb84&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

