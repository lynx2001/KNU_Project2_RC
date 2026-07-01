# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=66451101156d54da44bf7a50fb855025d13365134ac837923faa79278a07198b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=c7164aa5481d82627475a6732e8eb689b221d492f39e7bf4914893809383107f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=e73ada13beba06649be335afbbfee788fcf1df39f7799122404ddc861425acfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=f80ca1881751c9105af5a658b92cff9126f01dd7d944544a6767f97b708db62b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=68479d1adfc151dcb54aa8b5a5c572e4a7aa8a9ad86fe3a354147027913ae8eb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=ce9d4008ec47805527ddd2e90110cf74debd08e4b198d8bb2107e95dba9b81a6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=fc9f786dbfff72210f53406f0e59e737088c968d01bff248e1cd95765ac6abfd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=f7b9b29d3ca298dc57618589ba53277fba528f6cf46d2bebbf2a65e029208b83&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222122Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=5b8724855602bed666426908b05731b7fe6cf0f37c38e43ae8a19dfa342a5385&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=1a5980ab1092c5f627aa2454c25c486fb4d3a11d453d5dcd1c150c79e53ad76f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=6a67922732f46d8cd61b3758e7dc6d78ef2552426c066e5bd7967affad7afa44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=b2038083568d558f7cf4d506a4789504276910a65d85e15f0f3b99170a3b8ba2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=fa4cd4af4f3a780f3ad8a89c85f1e6959dceaea9deb090c78c9c30d344078172&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=ff7cc9600b9d93ef1d33f157cf75ba09fde9f50c5c4a682e618c37d36389f696&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=958915283f4d7c71654cfd70019607d17675de90f40861cefadb6d7c3f638cfa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=f3bcbb2d94463836730c4bbe05ec0474d1985c8f6a2448bc04bc3cfd5761542c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=daf7815caf9cc5c5d1415d81fc316305875af74f06a5efe958f81b1815d3d6e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=7be9a89cae9682e823709b36ce8b5a104a1c744aacf638484626bd441acde840&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=e100289c231cfcd9383e66732d9af2576f5cb1fe2e45f7dae6585c2fb4d3c798&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=4920a9f1ad84972e9061bc12e5ca00dd746bf6bd0f7d15529f5b9750c5db3e91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=b0125f0dde209a982c1b44560059e0abd762e4017ba5fdeba40a6d843179bb22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=936694bca11a2690cdb4f005d228055ef32614a2002bba1b64f0963d3f045318&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=517fd0a3ffd3bc6592e8e5483081921e2f9e56755ff409ddd6f36207b742cbab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=3a5ebd2db5993001aa16f5749ce99834b48d2969e66ba67a3b4da5e3b1325ee4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=5c304441ab4216e2f91670c4901aad95b1d25b6916ca1811a0dec7c20faea61a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=e528e4f96aab015cda7fa8667bc1a1ccc523880c3a77c28a3d4f86b7becfe7bd&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YO4SL7TG%2F20260701%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260701T222123Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB0aCXVzLXdlc3QtMiJHMEUCIQCbyNJa9SW%2BynnmH6zUCaFjMNkQozxHoTFfm00lH88sfgIgIKAv0McdlvkOQtvZmoIPICh4HlZMxcL8NMSDxOaarJEqiAQI5v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJzitoYDKlcnjauVQyrcAxV%2BKT8Mu6dKWx9Kx%2BZsTg%2BaMlnWWo5ytZ0Hqrkr%2FEVcc16GYH8EBPevmlwmP8VLcFuH4P8JjQgNJYYAn%2BJAMRZ2lIG%2FeLca00knaOpjGsB4Zz3uYaWvksozwEF07BNnju9Oa2r5IBmbY0PevG9oIbbHF57EFKM5irk3LdLimMgOcEJRlTj44HwOpeJ3m0LS0gLWU%2BMez5n%2Fx9qUqqG5loBu3Mw%2Fpo5QPE30fWshr1xpfRfUetfZuVPICSSVgY90Nx5zAIRHHzXN%2BfaAaeg7usjkYdPkkfwKu06CTuG7jRlb1oLcUEbBmnmxGlWRgfVhUQzS0vjwStjEEAptOWPgHdo51dhM0%2FF%2Fdtm3c%2FmaiAw8NeuITWnITOjvQd5eElZP0XpEss9DWdkGb5nsLsrJkcazlww1RXYJj7f%2FDDmAfyeEXDBbA8rUXTZZYlariesgZTOTmcMZ0Hf32jtUTZD6Ot6Do3%2FsJW5dmKOnPRLXrHPsw9fSNWoHltPg7EhSffW6Exh6ozfEnxYTW2O%2B03KvHz61FFzewmIPs9NZvC4EYVY0sx%2FQcsWveT20AxdgVZF6Bf5gyKsuDtX1gCdw8yhIz5VuZ1nS1pkrhu%2FgVo2f82YNL%2B1vU8sYGbbpJaw9MLqCltIGOqUBnnabHKco8ULzYQTorAypwsMU1%2FmeK8WCKrs4hv0jW9Do7dfnCEIa7slrVriHmU4nrhDVF1tZOvkLS8FFnjH%2F0zmLHOAHLmIxZyNGPW7b%2FiNptheDukv0o7H6%2FC4GEY7t3WeMil0K5Tk6dzF4Kakn9KLVkfaDlyZIsOx5pUjONJfQ6UDw3VhNMBgNRVhA5OuSg4ttfU6yoXHPJjvGdWVsJareTWu7&X-Amz-Signature=7c0e5d0a3ebb9c8de4194cefa35938297c91f4b721b87a46897b245ece0ec548&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

