# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=a3b67286d78efaf61220f4e8d09fa2dd2ae554e64efe93ba243d5e6a133ea7a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=55d8bee91120f9448b3dafc65964ff0aca6a7df17411c3d49a1d776c675ea1f3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=33ec642c445ddada9288d1ac8e0f869486a433899c84b2444477c1cf8231c8fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=4e32b9017dd7dc09ce0e2af3637efd7a92670baf9fe34df1b00910d98effde98&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=175d65228736b7f7f13075d9bcc2954342b408c9bf1e6f9d01b3de08e0b77337&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=e24b800702e8ab147fdd0548ea1a84228392b04a379f78567f8231b874e64b1a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=4652bd3efe661fcf7c1efb1e53a4fb83530086a8811067a784f8152dc9db930a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=20c68571cb97cc1e42d0adc44bd7dc0af60134cc3a72952be289c0f2560e66dd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=a400615087b6e2f888fd551ff0c26087b359d0f99cd1405521004c786eab73fc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=ea5a44923c7db13380ea84eb2ca7880477303cda38f33f34c8aa1694313aa62d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=312ce30c2074d3ff04264fab5b66f9925a8283a7140747891a08dd2f0417e4cc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=2fde6844b3d1d04a52a9d1c7282c0993938879d28fbe9b3fdc766dd70840131f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=9a563a646901184842575194cb1c125790766fbbc2a02f9fbacd888aebd22b83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=28dea2631fcd4d9e333d8e51f070e1db73fb61d8efc32ee6b5fb57bdec591322&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=1cee64c8586db7c3d35314b1f5f5718e8195f2298ebca9986a2c2b3bb567060b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=c44c6d219b99c95f31b42194bbc8a3f5b63e89e3ae17a9008b1aa815386ea58d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=2d54628aaaaa48bbecfa282626d3367f7568aea97bb56bab37e7cd42fc6ca4fd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=2bc3827320ac748fe7cdfc94ccdd135a6721afa28a4344eb9667a9cef353f96e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=c678d481fccbb590ed24efa7b18c5af97f7e24d6c927de42c3b41927544a34b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=abc9bee7573686e1b183497a4aea89bb62695c4a82106c22a57a2b5acf74800c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=8054df75c6c589d87cbe69f38d3d677f5ba38ff9e779d45f259d510552cfc86f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=f5b32746b5d9c243b0f4ab735726a30d048e56523a30dbaffd6b2df77aeb4f6b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=e42fc4ace64a1ed9149dc6e490c485e5f232fe4160b8a79eba40c7f60481ce06&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=bd682eaf5df84a81b7df755007c8ce39f52ecd0e59b959716861a5f7290b9dc8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=6e0c85eef83853e52b423908b25a3713e1c28288105fe4a90ec569d03b107c62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=8475bbf7a55de82986d85f2fdfc496099dadefd8d560cc5418c03da795325a2c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RMEDDCDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T221726Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIDvvspsdgftN8HdzYmbSCq%2FTvIlDj85vbHWoBIw7H7wqAiAu4IM%2FPRvHNgSZEXELRr7WJVpvULHOZGmW3cXHsZ7vpSr%2FAwh0EAAaDDYzNzQyMzE4MzgwNSIMX2CODoap1YvzUjTxKtwDN4EOJYYwlVkgkjyif2MdqeIwfNTtIF1GfVd%2BDIvpgzupbsp73vLgFwIW%2BkQcFtM9n8lHCnmjHXiPGTb68s1f35PdYHhoe%2B%2FyMxBLekMmM%2FHeLbAHKdnJ0UyUUMujbCx7afIKxVdZD1Og5NA1bdeDOxaaeTSoGvNO%2BLylkDWNXdTY%2FyG6x44y5KJAjwRDCe0xhlPu%2B0cSIeWS0nwG4F57wx2xKl2IFdG%2FhpDJ2Vc43ooOsTY4tLBtXTc%2F7pL8z%2B5cjQSpO12NsHm2cJxhQE8UMHjVx4pfypwvTYUJU8WUg9Zwb1NYMhXQzyvxqSqzoPNiGxHo5YtEZLzO%2FX1ewcOEsRy5XoYXCha9D4OkmkcAJEka5TG3nMLvVtbL%2B8HAahlfTRj52ZcPjMLKAbFOnlZWGf5BW%2FtNPoFPmHxjN8eB0m1PUQNCwlZOh2dnd1UY3QjOcdIdG7%2F%2BsOhYeAoW%2FIOUOM2gDm8FSiiizRDfjbSbJyNn7kHaLol5hLYLeVaaz2TnjqhA91pj2WBvLhykOvhjEIzu8c6jHSkqyghVq7CIdzULvVBjKm9Juo3oG2v4qHRfTvS15%2FEJyoJfuY4xiiDNsgyP73pxapgP%2FYSX19FBvZ3LjTH7sBFEeIHOaNMwvbGM0QY6pgEGWuBa6DpM1JqczEpaofka9JUhC6T8VO2ED8C1CNeETsDqgdLpxSI7LfYRB%2BAbNDVPSL1oin9yexILmnNtvBfk4MUyJNTJ%2FbEKa9iwwnx7Q1T1D8otFS1DbJFbkQiLbS0UB%2FB9BicHOdgtRXMY4RmICD5aX5%2FZMNaKjoz1%2F%2BZmymvdOa5swuU1%2BZktoPjsqKLuvKnJjCiBzzLpT0SoIxJ1hDKRlb2W&X-Amz-Signature=b9c73c9d9c6fdf901d363fc4d36a875c65989542de902706926aedda2948e758&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

