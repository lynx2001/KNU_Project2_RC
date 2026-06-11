# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=2dc0840d7f43cb34d9f3bc6b0b123c330b0315d84c18944d6b9638d666ad2e58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=cb691be6479f8d596845096769c45fa165473823986120cd84aa733806778f54&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=c8dde307e064a014a35a126de03ef2c9a0c98e181b53e0741e27c60f72662608&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=a7684ee19a330c6bb7f3fb347e668043348867904f69f432982e2241625ffb62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=9da1fc5a04f1e8d639bb4af406e4cd93ac00f256c23663e134ca16368a622bcc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=34b593e06f6d90000b9b1d6e3549dfcaaab28ce472c93e7300043a0d7afcf53a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=5222e76d7298f8e9a59d98a05e173a45e5252300c687dc291c44162f2fb741e8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=2f37a333a621470faae6a309d4d8fe47c3d1c70b93417e10fe5bbe9e6d1ba95f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=d9ec4639e87dcc6b51464c2f498a3a074e6bd44ff9ffade7e42b033f846a7f1d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=eadfb2546479500385535e38b884cb2f6a272152376bde01261c7155db0dc32c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=1e56347ac945b17c16dabff66d273e48bd8abcce83a67cea46899e0745e42865&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=490f4d9d76f3cc4496bc20985ec1b4952653dce0ec9b89884c94ff079fca5247&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=c15737939a8500f4f75b7346f36b79941f9ff162507e539ac46bddb7c87de765&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=9562f023a82cce2f3c12a8a7073260a813aae42b68660b382d30998771dd6b61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=4b0afea7e510c9a074ffaa3e2f9cb57c1848acb40cf5e83beb6ee3c3c33ed75c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=df85c67fbe48080d1a855be1b88a3b5da5751236bbb25ec410781c609911581c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=deabbc4eb38b22d99b49833e5489429d8dff8cbbc07adcc274572424cc70fc1e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=aaa28f4f93a764df820eb9fac3dca481f1a1dd281ba33ed25d0f335e7eda9757&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=fd3cc996a50e633eb72ad19d3af0c466ac4b8830490a4be676923bae217393b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=b69cf508194944ad5b1f4525d78a70f9280a0b7d975c4fe3bea424bac353bcb6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=cc0ef542b7e45a62acdcf0fcceb185ca360bc4ef51d23cd70ad0f67e089595e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=18baab17663c16b079adb769bcf7b0a9496b32dc17192960360b9e0ddf1649c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=28e51371e7f18df9866b7707148b214344b1b97c92fcc06292ee8533dce8f120&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=5c6438ac5cee6cbd0ca03e6452882cecc5f90821013419d581fcb7a18d728147&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=29281ff7b3a6f2cf2382429bdba1dc10cf7456489c514fb0b6db5420723049d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=4587f65160aa36703f09afd19646e7ee4d2a9b369dc4e2c6a6aba5a2cce7083d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YAMLFLMR%2F20260611%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260611T225347Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED4aCXVzLXdlc3QtMiJGMEQCIGTHX2RT622rH0ovuMSwJZjMsbqjrTcqH6DJpgWa9Zg2AiA5z0z9en%2BZV3ms8r51ITjcdkdUGTYleR2f6rDu64Fe4Sr%2FAwgHEAAaDDYzNzQyMzE4MzgwNSIMcgwLmg1xnpMPBP1xKtwDRdgd6Qe73T4DP86sllQDkWsu2MZFmUwviinG3Dm1u7Nt5FV60E8SZhSGU39L%2Bd1zNP2QPSPFVPSidaj%2FC7UxGEa394B4AZtHLRw2WzFYtEoAZp2uTMpge4DWaK06bW66SIGY9xuPAdzxZC%2BfJYaSTjaCepMkeSwZO3%2BORO9hESk1MmgmHdlPpnGRcx89FjugwEkfLdnCywQP74UVmlJnxcpJeWkQ6s7zMHnmc1phBLMHxwihSbNLF01%2BB2efkVzZI9Sj1lhh6aKJxpEEjew3FrBTtOsU5XHRICHCIGwiA8TuP7SYSKZRKggetzAsgo3XDqkgplXnk1eoQoZDjTkNSrgAuMKeuWQXWhyHp4YgERT0KrvbE388JS8KCjarId0VFaHNV9WJm177P2uICFjaqiJpQQJ1bVw5V28jSNeGTeTifem6jgPUqswJ0jeowlSm0oECCJ2jB5gyQo9qrdcxRddb46Uh%2FH2rSRL7NBAEpjAR8KE9sdc6NpfLm%2F2hoABdvz%2Fnn74V3MH0Nmh5OpgWbCdX8sq%2BIA1RNHG0JJs5eUvAlhRsTTj8KtMkcNHptE2I%2Fzr%2BG0YqN1hxEBLHgyRYKN3BpUx1Ew5hTPds474BTrfZlodNqCIMuRDmLAMwj%2BOs0QY6pgH1%2BypgMlczWR%2BSTb9uSgmEXLBQ5y5oIz5EZEQEWObpg0XJiySJP4bs%2Bu5A7dMdABP%2FmwUQ4xZcXcNlVnkoPxW0s20wHSqCTqwv%2Fk3kCvkWmmk4WrYc1YVwy8FUiHBx2cgbeEHPwQALI5eTQ1uywf2uf50XNRMAWRxhTeMvKJVCUvVY%2BRXKA61j4dy3SmbXcebBRWjBKymu48SV%2Fm%2BZW27nn8wp1%2Fa5&X-Amz-Signature=2b4c5ccd3e30fc328d9ec773cc12168285d2e2dae0da2f6c08d78486995e8218&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

