# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=99c5063de26c4e696239c42d1d3c639c5e83ab7e338c7704cad4321395fa0d17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=696cede52dbe43bd8d74b9578aa01590f12adc8e993a0cead7cc396358420af2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=c746cd9f7ddc70fe30dbadc758cbcf45472ff73e44e709e51ca48ee99abb3284&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=accc3473d04c00aa03a9ed67d16d4cab225c2c60a025d2e63624f9aa24b72198&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=247086af24db0f9257ba1a0ffb3b1efde898a1fa2f7359d409b573a3e88b83f5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=639753e683a3e0954dce89467383908b60b982e526369ef6c4fac9c2a37dda4a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=fb36c0a27533c49ab62a3460600528bfe165a5eb5b2cb733214b4046f1705120&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=cd9cf694bca15820cf83ad794a7e96095592480a8d23f4d3df2f46d720678f97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=365f51617dc36a28306c9076deb528f1174a3c78e50db2e3f91c3cc1ef06c4b3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=fb20b5b8abbb1673a9f54a6241a6077e4f052436168d610beb01bf2ed4c37b5d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=ab03596514d9b87c2569377291ee95398b3d887d0ee03899a8502970cedd93d0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=707d51ad91f3fc8a9cbcbc873c9ea51b231b59c0d2493cb218358365cd8273c1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=307b29fd1046f690cf9776437962d24b7fc673dc73519c6505ad2c8f4de3e298&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=081c818d0f92dd73b6f69a1504cf7e9691cb898319445b112065ddbd7527a2c3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=4aa466c739b05553416d6ec03e58d4a93b2865136f786aca78491c79fb158d28&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=e53a92b96f431683ec72d17d41cd8fcc843f4f4668f352a1d769e35b2e6c5962&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=a7172b987a2dc3ca874e7846a0548d42e76866feb8a76766e1e1c1f7aadb4d5a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=34e11d9e71f67775d7c0addef7ccf334c23e83dcc88f9a04bc55325175f1a41a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=da6aa67e80cb3c71a4afd797234277e14069162dcb9095a2b075668aae634e9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=a113b7568da2661a7d7002edd3746785061b3bbc0fc118350f9f14b791d3867f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=8b40a05080af87a61f0ea4348a0e80714a65bd35c8cbe5a0cde17fa6a7e811f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=5e2f6da9db0238877d7caea9877677aaf894040d66e7059ec4f6767dc1b31a2b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=8e8698fe2d90ab7a67e716d6bc67c8fd578fe4b04653fdc0e282c42787d4565b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=a1f997f394c3b2ab4c5129258dad777b3e4a736d3c41af25e1ab49b1b221ddb2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=b7316ba022abd4baed30fb54df0d6c07fd98c7d04569be8434180e8149c1c545&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=38f03cfcd8ab64c7ddb2dc54c667c1eb2bb6cfac34543b983755f7e0dbadf119&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665C2UFAL2%2F20260617%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260617T224756Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIAn4PU%2BCKHV3LyEw8Yn4zYlqoxKE5DrnOHzWKOMCDc8hAiEAyBBmvl5EZHwYM9rNVGhsVbzifs2Zu17YtUTS4UyswaMqiAQIl%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDKIjGVtSrWyMeihhoSrcA3%2BcHJUz3nZYf4VSQ6ZBuoWUqj%2FoPzryXVmxBIENBhoY4e0rH8ty9KSCx3ju1ycfFFAsqzor8EELrZOAiviljuD%2FPTvalm7AMW7KCM3t1iMHijxVJWeoKw8AD8NymvivjGcRUi26nVjsQlGgX8zodvNflMVT8O74KSacDxfDLEs0vKENAMBCcZlyGzYopjObbZ7izQ1Mq96vp9309%2BnZdVvQ4KfC8zchj2z06h%2FjRVNCu8RRRQXwaSE3nk2Lw8eM0TvDpy0yjwaE%2FKsO1owmQe7Vf0%2B7MfuVGG1h4Px771rleWRyG%2FaHU6WC8yS0JHFiZO1gtON126Sm7WFOvnJEvTs1u0r9oeU2wqRKifUH4pYWtCyBaNIAUwcgt%2B%2FjuKCIS7opd4OslpznH8S9mhlJhy4XIwZn47E15KBdAYJiV8XXq2q6%2B5OiDGL8azBWtnx4pHOCLZIe2D9UOegmorTTXSQT6H4%2F26gieVKm4BOMgiQuUt5z4NEFGpD3m9395BY1mIYrlVpHRcdvlvMiRChfSNXgkZL%2Fm2vf54HS6S0Xab9hcDWtAnhCADrr4K6j6QRPF05n%2BwrkqlojaZOaiEqmPBvrk8%2B0wApU3WoJm4gIKdKVuzHkjN7fGHGZWKyyMJKszNEGOqUBfqCSlzh%2BeVKkmnhENHLzyWZ7mBK16J2PCIjsT98RK3kGJFuU0d92r0%2Bv3CYdwM06655eNT1TiI4j%2FlRZdi%2BGl3PnGP%2FAEFEj%2FomqYMA%2Fg3SgIJ1qNjEsCv04pDW1Y%2FtHChbsTg6k5gZuKpAIQ7%2Fz4IZhxYhY%2FRcKbFPCMZcN4oM%2FH8RJxUa1Pb43lb90h5%2FsJR370740k%2BNI3hD95NSLGz9eIn4z&X-Amz-Signature=7ec8ab9b881bb5498aee5e0ab0c4ec99c29eeefa8b7425bb4ddc56f144bb2bac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

