# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=d76fb1c1315975f07dcd209fd06677a7a994f52610e9d277febb4747456880a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=8ad39a5e29bdfc3c6f1abf690cf4002e937a4c8d92e701debda9419d5e32a2b9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=169c66dd3071044cfecff9ed196ba81afd05531d632837310549b33ba0b9a2ff&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=fa1bf0ed4027ca000dcff903827a19ab1e68e8a00617ce8e96f75deee5e9b315&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=ed4fe15a208261d6b009abc86b440c9ee96e51c67b1cb0ce7f9e5eca52287ec2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=a8e44ce0547c624af40b282d78254f13fe7b39117db685bbb700dcef95d7e5ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=e00efa029f10f5d8aec9876c764123e5af0349717115ad771d49b794a2f6b9c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=cfd4f917b8a14285db126f09a2bd79b531e7b0c48b01160b5e906125ff4839e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=e29ce45cc950b5e0f799bfc9fa2dfb2db3387836776b5d969a18cca28e5d3ad9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=0e3d8aacddeba60f3a088cdfb097d2a3545f080bc737d3afc8e85b1c24eee148&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=65fb2949c628c389e1ede38b43711e9b81561c599f74080c004baf3e957788b5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=7203980118cc9c9fe3c85f067cb3b80cd672c232fabb08ddbd8ec70438e0c8eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=9a8285856601ba4bdaf7d12b2565134ccdc90853bf172623d89987d91efb0c01&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=9794b3117ecd5f17232f04ecebbe61e513f95da8f9445f593821e3a34f9cb760&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=f3ffe1aebda9ac61271fab63d8fc0f19a2e8312121d0dda0aea47e7daab20552&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=39d694043596fd9d4b92aefaf5a92a2784bfb7a12681b9a6047377c24747bcf7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=5c524109c5abbaca8bf5af12d016bf1dcdc6680569174220f9f0f3b69121d1d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=9f6d14f0414b545c8d3f7142578fa099414a5d2b5c9c3c7750a7ef46fdac05b8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=5643a07186c7c25f75d4afc9434f148a6ef29a33372ec4fd826a1862fe4d0f96&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=dd272294fbfe7c355c30e8e8eaa037ed4b2d8f69504213abb9b3713d280967c8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=06c7f9ab861a65df714654c1e19b3e759080eddb4c1d14add0dabfbf238cccc6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=4fbac68fc7cb43c1681ed05d830d024eb4692e9644d9bb98848b612682961258&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=da1e9a6d42b908b623d32884bfe17cd4b362c80c50ae01bd1c4262590480b1e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=efabbfd2a098fe9189d0d21ed86958e07911a80111bab40926b45127d6641350&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221257Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=908686fa6f8eb89337b1db16e4aa0ecad3dd3b8e127b9511e4858f3b753d85e4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221256Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=f24b4068201aeb051d8c023bc0dd0defb5035688128a92f045c6402f4ccd49e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U2UFDX2E%2F20260629%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260629T221257Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEO3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIFElY%2BYTY2rEj%2BOb29SoDVzmuOmBAiw8czQjs2KnC7WAAiEAj6jLRtFm02F%2BrAIQeTBZBgwCfiB0g%2FdgJ7w0bbVBipAqiAQItv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDCRFdXJpTu2bz8fs5yrcA9tTP1k8mxwWsAm8tonlealnCjf7QwSu%2BY8B7QUSPh7BZmniXYAhLoDIrRZH7NWEC5OrAt9SEIDGWHkGuJDOcRMXu0G0c%2BpGOlUaNPj4h0wQPiDlAd9EP35P15dWuQmBNydQZk17aPvlwKc%2B4GwvBku9y9dOPaJHgMgUQp3WC8%2FPoDz8tNflYQWDKhqTmOA4GE2hC8izrMmChTKP03KPhKs%2F2jbeUiOHu3JDJk%2B56bXPziCJpwjDO%2FD5ewO8bRdOeLRx5mfmPqNQM%2BYwj1MYH9g7eqeSVZpyNll6w7Wd4qnxIGnIPmvhFuvDET9H0pC5oRSXfoJL5XnPb12IkLMx0WaiKA%2BAqFzm35V9%2FO3VG1QgpoM5yka7Ws4TYNI%2FJBUrY4PRcqI1GTqiku7FVDT8wiU2HvhNoS1%2Bwc6%2BQuafSoHVFpOAcLuY3SWAQkrceaYdmoAs6FLlmf%2Bu0I4g1IZ0DGcM%2BMKD3%2F5aTSW4YohgRRi1%2BLn%2FRdMNL3RTosN5GL%2BcuRxXWrb9QRWxkNoQL1xzRozkF1YziYjL%2FT8cMnqse61ua4hNOEsGxkZ%2Fk41goKkmB5c2zmUCdGgH6BJO4SPBFBLGc8ms9X33K1rxtIA%2FS4YIh%2FKMY8GQI%2Br4cxX8MP7Bi9IGOqUBmEmPg%2B1LD%2BZeCcYL5Vf%2FevADXr9tr9wAz7o%2FdBqL2fCCc9liXziAtOF0cBTas84GdfXT7LmbLiCIECq6Zc%2Bw7vkwmvopAgyKsCLfOLxNFtbozbEUbSoZP%2BS9KfFzPeM0sZ1eDt3pxb80ijMgAir2CocF9V1IHwGQSdYeWtflLSw%2F2tjxA58jL2EUFH940Ccd1Uzw72cPr94Yrz54RvQ%2BXpkOadeo&X-Amz-Signature=18136f45ff88cb4a4893334d4450fa3cedfb68791d2850d8187ccce7bba1385f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

