# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=24b0f418eaf9ac4bf0b41544db97f6bf95a8b6464f850d86fc9b3381d8869e7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=d92c44f914f766b88b49d649ed4db5b2f54abbbce2d7afbf16808c7e44a77bc0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=7e4f4d110bdfebb218bd186079015a4ecf43deef60e97bb88d1e4813305899e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=c8dc430d11bd1062820e78f1162ab1db1c9f9bb603eccf8b06efcda8847a766e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=aa90e4d6d244a0ec0e030bb52f98464ac44d0c6cf043f272c31f9930c4f22938&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=140158645f3d5e59b7101dbd6845d226b480c30753990cf1f1d398a5b3d8c220&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=59dfb4a506b455a9b95bdc060ceca922e0bcd7f838fcf0ea66a5a23d4455edfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=d4457c30b53d65755192e147ea452feffc3def2a38a37512954dc967f407984c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=80855f71dd2ed8f710be6398b6909bf1d14077c1de0aca1c4f528fb64b24720b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=a1902e5fb0645a414ecf7e8ee7a61911c61cb24ba5dbfa390831d33fe6c17d02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=06e89931e011129011fddd9c504fd6372bc5f7f982ca4c8c38b161a2e1dcbd78&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=788cbe1d20394a00b97c64331e3d0ca65d190b9f18dd11256e1ef25bed01c96f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=32963f51ed077bc7c9a7e9e842526584e920c0152c03662b67522c213d524cc0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=08b5f4bb6d8b4cdbf46ade1d13eb611ba396989ccd7ac33afe61436b2eb38d1f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=9825d1d6d885a8b3e1b2cb417cfd9d6667870a38b57d057e19714e5ad012f1db&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=2fc4e6d32875ee7c6944feb21560e19fc6036fbcf2e23ecdfd7d02402a8d5ff6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=032304521ee1f6ece75ded23e1729d6860b43e8a3a3fb5f294a00a80d3858203&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=ebf15e6b4faa38e65628f1c61ccee5a65d9e7db8f9cc061d69dc4509507cfcad&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=c44d39ac6984b0032245fef73c46e69073c984169395e55e3367d45e0575f0ec&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=851e6557482fc7ab28f1c1a43058bd21f0c673cbe4c35af6b615c60ecf26ce68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=8f29d26302eca12ea598cfcd220a9de4a8544a98666072f0c143248be1251036&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=aba0231564726d118b996ff281d471e341ccb6fc5d02d445bf5b693d3495b289&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=c47acc1b606015fd889c9aa1ae97bd34509270598041e1d302c0f6fe8882f584&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=c07d06f4113f32c522b6d2abf83a6bb0b29a4083894ee13d2638fcab4e5c4f4f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=7c3532e09a6f046a1ed5d79eed1c7cfea5b95c851c05b14ca09532e084b620ab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=9dff4313d0049aa5666493ca6123c3066cdd43f7803b41d445271cce6a77aecf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466ZDVZWGG2%2F20260614%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260614T221009Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIT%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIEqsIcGXPkgO2QzFIvEP3X67sceJE6%2FIwWdG%2BNifWYQvAiA3X06iUuaEkq6O4fl6onby8yWBOM7LBrbo5gp0sfG2fCr%2FAwhMEAAaDDYzNzQyMzE4MzgwNSIMZxjmJoNG%2FkNw7yBHKtwDay8bBy5lJXzOAiQj%2Bn3jwEVsFD4jH2Z%2BcB%2BhEZPeRiYINwnzZqX0EijXOklpl%2FoQF5YxORrjc9On4qt2sNIGmuG3heJQC3avp%2Bi4EELZhgYJmjsKABghp61VEnhK%2FMHyb9bTtu5ehYhVvv%2BhtNDd5VeQXQp6G%2BpW86ibt5F4Y07LQszLIbJmF3EnztbSbrRI%2BEUZvc3W6jiFf6h8JbX42GCfCbAVCVuQpE9NocAjMCMlCJknUUBmKMAkA4ErRRx2Lq8gfHuG%2FLKIWhQhNmvqBCa2Lnp7LGFz2CJnlcSMrIqXSuk%2B%2FBL9s8iGQZYKwbSukm2KKrHW%2F2TcbRNq7G2TH2kkG3yxvjEd35JviDQY0K0oN7%2FiM0TNjp6Mc5uGfEhDJ65%2Buk1K5elk%2BglQBDcDb0IGSBlLlCVwaOzS2BhPlMx8aKvWI9x1QvV4TcewSqxx%2BIhtFJb8HER%2FZs6Qi4eOpemK%2BDKbb9IqkzTW8%2BxGTg0837ELBAY%2B%2B7PsqyVR0%2FEE0AD8EySLBjAfkx%2BdkuaCPqcBtZnsV1y%2FUi35%2BPxgYwz3srkKdpsLWwGXEfqF3TUnEjYLpSPXoADuZxm2re82h9%2FW%2F0t7WCKNqtuuvTWFUUtBowRY5KsbpJNC%2FMsw2v670QY6pgG96XKzhJTHc61cIzVg7lVy81vVMwdav57D%2BkOMccSp3IOJ04t1dXuYsbdvOLzndau3vGjqri0f0R6Kzku74dPceBX9eq3obF8Ll%2BLUnCGmvgM2Q33SFnQpF4uU64CqGy10dJgJrLqGutkETcAuRGLA0PYyeCFMpLIvg%2Bk1gl8D4bOLxsxQDHmmqvRi5leXs8WE%2BWbFX%2B1KM%2Bv8S96vtqi6%2B6RAcHKu&X-Amz-Signature=bbc5f71653251f285d7f4b27fc433c8a0335a885da04238547222ed8d421f2ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

