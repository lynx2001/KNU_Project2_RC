# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=3589e4992746cfe413857c9b6d1f4d69fbe40bc24cfef1b47ae3f298a57b05fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=4994365480679db6f5ba2c576983dbf178e3f66ace07180cbe4e2df733d8288e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=ad251d8f460c9fd7072810976a7710a81f585321c12461150397dd777c5efdbd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=553eb5446ed495e166cc64d5d200d4757cb37dcac50bf9643a7eae80252ed339&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=56237ee1ca89a63c22b6e20957e22e9913e2e4f691ddd33eff5c4089fbf71d9d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=eae9fdf2263909bfdbf4b426abbd4fe89c167098cdae439ee9c1cf535a66b352&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=b9259e70168f362693f044c74d9cc50c642122b13d194003bf83f07360e69406&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=6c823b65fd49331b90cd5d521f162bf14c3ad36eeac14c4081435fd61b298781&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=3d67f7f2d4908bc2f040f5a431cad9c4b41eaa6768933352370034e6febe1f76&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=a1d4dcd0f460c62dd2b7963c8996314d3fbc4e98ba50109ba3428a6be7465c75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=7d434313ce738c3299718db6a46dc23ab0409ef99b4b32a3f97db2ae6ea3364c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=c0c17f59c050800cabdf8757cd92d3ba7600cd15e5806852882be4d60e69da07&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=4782ff64cf12688d296b0c0587381fe42cc396ca439e139f280c382edf0b0508&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=15fd2d83e8999d686c3769be71c6653090af723aecc8e6fa0c98ea82eafd9a54&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=d1827b1ec8899945731b5a00d7aa54ae7eed3dc5560ff18b103e152b1e50275c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=40f51c234e0dc373444a46e937849f695948edbaee469724472155412d841275&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=3d0fe3ab8633e426dbc7f82b91db22481c88c4149f255fb0013f532efcf22e39&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=fa192f59620deee010d3e3277bdbeff7c8d476f4944d4b0fbcb47a412574b447&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=4598c064c84e4216c788263be87035716227631a446bc4e6b776979a66083741&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=d4c25fbdc4fa717d0a675c5b55f258b8f5e31e888fabcf3062415be9fdcd2942&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=9645dffa2ebab9ce8c425abbcdd7784198568288476121f4befc7870473d8e2a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=485d504bc5f43309d6b60db53b2f7aa803cced901d1d0cec334c953d8a0f539b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=d7b99b310beecdda7eeffc49ef7251b431599789f1bee1068de45aea0e0a90e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=36f52f708c5920d465b35f4a218732d493aff55c7350cfccd1768d1acf9a21e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=5bdc85a5a6eb25eba523ac0d24e316039039a71916de36d1bb2a5edf140f570f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=475a57a5a28032d7a2731294879c1471ba9027e81e8a2af12642314b6e0e14a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YD7I7DWB%2F20260417%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260417T213921Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBQaCXVzLXdlc3QtMiJHMEUCID5j08P85K1OWLWAI1t5Tei%2FY3ubeNucWf2Zy%2BhuOPvaAiEA46i6Cr6WAND9zFY5RnCDuuSpmvk44Im9%2FnxqXwrFCRAqiAQI3f%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDO8efc5BCYRdwCiWFyrcA9Q3dM0M4AHHJSLLrFGr0plyZaD%2BxOzOLR%2BEi9mHlepqe0DpKlvGAlGd6ENHas%2BORSd8zVhNZvv6duVPM1aZI53RUMeGKgudAwmGhtA2V%2FQdp8LZR6utBVe8RY1qSVEEvFgTAamhJzEbuQShXo2bVFopK6UDdpC%2BJC4sOAN39HqfydIiQ9uUQZvDslWPF5%2FPDyNSc3rIGOe46TpljzzzETscMbuCCvdPlVS1b%2FU9NhUqv0KuWabu3vNty0oE2TjbsXUgwJkTAL2AkJqpaxzUdqVC6VlBXkL9ac49dnDthTZVFexSUwcaHjB1ovNZ%2F0B5axOkyZKdnphO35tHaZ6UmoTDJ7LmLWOF3f27gCv1qc9IFkreeEm8CLo3mhXtTR5koZOCx2i6VGE10tFGpTq6OlNZSGCDhzfin5jFe%2BVpxy9VidtTwvzhTzTGQZs4tcnvceDpAZTzeQPQcIoJL%2FjzOiAH2uZ83XDlxjaDIPz5Iv%2BNZhDP54ACEX%2B3BYNuMKDm1M9q9iDPGsbSDoJocfm9kp9uFBh9%2FPr%2BWMISfS8wujk%2FDoyZRhg90bWGV0LUZPlrt0WhihLoxJIzkskhT59bRotL0mTUf%2FIOULtDQWNiL3oYhaqH%2F%2FZfVOpfdSYqMLeois8GOqUB0lRZ6ejASgl1DircrPNT5vVgUaf3XiooPgTkQZCAKpOcWPqx0kbAl3zVLoGfYbR51nQplKPmOJd%2FSPIfrs%2BhiaEw7UV%2BHvErtymEWPJQbgbZ9WHch1W7hjFvUWveb9lEZz89bfV3mSnky8r70wpe0Qln5la4cHGfuhCG%2FF2hpcevhiSCmbHpsSS9TW5mrAUSXgRqrOL63bTzRbCdpKLQhjM3MdGr&X-Amz-Signature=663bec8d15d2abad450c803c9f344a53b8c49468fbb2cb506e6602ced3e52f58&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

