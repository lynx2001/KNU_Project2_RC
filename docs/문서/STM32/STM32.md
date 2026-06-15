# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=52a2f93d89d384bc9d025415a582941328380674afd0751f8f56e0b024ff6b0b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=b3f5fc4eb74b4c590d88eec5d65e4f2e344fca287e0ce2c470ef3eab9c7dacdf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=1ad22057cad98b7a0659397cb40c16974a7ad9e7df3113e974ee7f78fa7fa7d6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=f16715b2c26183e9f24c7788f3bd449b2bc6a5268d1ae8d5882e74c399bef23d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=8f45802af068608140bcc0c54a1725591f9615264cb72665df0b6f97b985c8b0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=3f8fdd319b1b9b9a2f155c4722a3f883ab9cdbe85346f564fd342d0b5a3f37af&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=13379cd19209e805dfaff2507df92f5a90e32de74cd7c2b1f55ffb35a8394ee4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=e472463a6c0bc0bc8b487494a112ca54aac7386afc0ca01a9f652b3df16dddea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=cd65d767b41d796d0b408ad0406b3dbd8eed593249baf6efd1c8f3576eec1526&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=800e6bbbce60b7cf6a6ca5c0d24fc7b694697a700b96a19ea87164b7b109dd37&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=cdb9fa5207915e63c15136d0528d876dc6857d6a7212f95a2dd108f588289a49&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=dca17dbbef8557e0df653220be2098b3ef49b429afe6a3f468d2f2236a95a97b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=7cce9017b02764238a2e4b3a7708689c7e2d14ece3c11257b57b983a2e356b64&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=03d3389bee66df641479f49920cb8ef1021c3f37a0d1fa1079619ef1daed1ae5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=8842d703c65c9b85f4717ba88d23630064761285becf0eb9a6daebc0ea5400ce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=3434adba16877c7bf6f5cb5d85ab4759dd2cc9a6152673131422cd737d47b996&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=ef2585697dbce177f0c37f7ac2906c354ac7981df49696813b3421f83cc53b17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=7d66c3f715cb1f0c34e14b83ee157f07fb5f23092520560ce48b757d6d04325e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=cfb2a29bafa29aa11d48fd417969c2a7701390572e9855fe45bd9d507d9978de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=8dc8169471389060b5ad5d830f5bd5a6b7a54197aba06259b63145bf11eb10d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=6d26398e4937a4f3642d419f95cf5f2187b8871f6b095b7872ba99d19dafe424&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=470a62fb0cf5c080eb1f68de774d81ff2fbaa0fc8a8a89ce6d0cd21c5fda7930&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=90e487ae3fde729b2f7c03aa3db9bff901e43c8d062e3b4f3eb5eb6264f355d3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=b88cc42f31a5b766e8feea67b36882f7c31f49c8bfec2978342edb37a0cf4000&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=d2143f425bceb7eeb058212e9adab5e72470e179f66b265eb0b44b721793b9d5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=0729c70c529424762fb0bb093c16776fe07d666e436ac8acc3a63084ff84ed48&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466V27VOX6W%2F20260615%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260615T230707Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJ7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQD%2BvqiZgt1VcsIumM2s694PMr4gmBrMcSVnw%2FWtnjEsxgIgFvghDA3PJmnH%2FU2yuhfC8iH7NSE2yQpagc4T2qpuggsq%2FwMIZxAAGgw2Mzc0MjMxODM4MDUiDGNQb6EtDifZRETWQCrcA7xITHtdvh2tBoqFZ1Djwr%2BCe6xYISLpwfV%2BOHvxApCL6mI0tHvHdEKneLdLbx9r4uoXvHmwiBW87w1LoXs3c4A18U76bmtNi9Aa3Rv46ok7n%2BLaG9m39EIxmZN3rMKqLyJDnmaUm0vPQ1ZJos1CEgkgbWk5pHut2MY3ks%2B5fRtkwKhAyepYYyRKv8FnRrtrmywpNWZ30iUsvOy1QKQXzoG36Nav1nGH40n%2B13saQ2tmlhpEIm5nMWtHO4%2Bbh96LbN6YUgvEYE8NqK40I8gNzRQeqEOkhAj1aVwrTbOY21Tr0y0A8zLqb6xEkkEmyWOByhB6m1aLV7%2BC6HTmFx2u0uS0KYyGRuQyGRCSPeiI7wniYnax0fegp%2FuGbhr45vyD8VcJPOeZY6Gu4gejyTXjdBs0bC%2FNYHrG%2BwhTeizXmt808PJRJShc9f9SA78fTZN1u94bqBL7HBb%2B93ijjKTfwO03P4MVKXYRNd1m%2F8sEyW%2BUCfIdhDFFKBiV5PENspoaMTF4ByWzo8URkHIFbolcXJAvr21e9%2Fu5%2F2mmC1jlq9cihLmAYM4fd5YKVLcAiKvxpjz3X4tjZR5Gz32yrySkZRf98cGb37kxrfv2%2FuNLozFA%2FduIuqoIJdQ1o7gRMPrmwdEGOqUBcKEb8Z7nAJVC69CV7SRWpZFwDwB0Y%2BLBDC9FBsdNpGwHajS4QjJrP7u%2FCbwR618EVffiMIca2UGkOTlBY9bVFqKWWhXVMQMxBDeiV%2BVIuqAmbt23pIzgwntOulhilvzU%2BWO1aByrskIaQ%2FUgH84eJ%2FZiZbzB0cqeHFvAHDYICq2iWconzx14RgOtU7CnRANyxP%2FkqxAI61s1TDTH%2F3WmqAab2sDn&X-Amz-Signature=b76aab7e82dd1d6604098e27c50eb0f31ce32c1d87d8e942b9d3c31b64660ff7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

