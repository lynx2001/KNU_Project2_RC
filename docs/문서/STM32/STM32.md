# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=11da1d9962c7103cf1d73f86abffa5c54754dab9e0f6b34f6e204f6195b9b202&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=8bce7d7d679a601b4d28fb936d3c758875a45df3e170205355ab680743bc5c91&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=f1b762fb157de428c5178aacc6cf7fc231ff11a214bec657f996f818072fa4d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=888234d3295de74c410ef7ce6f779c6b93f962381c6e8ed727ab0f0bd28d3a13&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=a424ba502854565e35ad89c5ee6875e12110d0640903cac5ca1359f65119b839&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=c6c080b4f9ae96b4d08c1eb39df81b4168f8f4bb0b181793238c00599e74a05e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=6f21d43226da547c570a212ebbd9740d0dd832c06b7256e116a1977c2e124a0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=15b3f88a3cb04c98fd3fd8c9acad3bed315704ae504087d30daf545cd7fc42f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=83d474595dc0dfa582716b6b78ea932c5200895f288d72e22faa901165075376&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=abc9b0973e999b41d04a55d4b512cb3c964227563073820c0150fb394ae4345d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=1fa5e80784b77cbb1f60aafc41b6550b8040fa11c43575791400ec4495d59c68&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=882d510ba9a8374a46f25ef4d9457fb414672e691af4c034855b35a0dcc40c47&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=5bfe2d6d98c589b0b3d576ec45fda01ef81542071f32b784fa85e4bdccdd03fb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=d5037b8ff036e16a419d9a9df9b617932c7d79772312f966dedeef6bf645c5a1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=4bf6b0c74ae3e518325e9ddf03270e2229814e625e42ab816e2f8005866d48e3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=7867325b8444b6ddff2e78f375c0030102c0aebc7dbac32f85b560e87bb51bbe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=c58b5ce19ce4c5c62282babc63296fabce5ecc47b4b0a6bd7c7df3d2586981e0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=2927da176beb3ebd9c36334ee231d0c5e93d0aed3e5edd5b85236a17d8a82761&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=80d763787c1bf0ef8c85f5a3ed2432f3e41b34862b0eefd8beb2fd6bc8384cce&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=3641a774644cb4ebcc6ea51d4a4d8e4e4244eb7b6a28aa6d09262e2de0703ef6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=6779d55f9cde3b93e297e74f4d05c70c4b160d2bcf91bbf20857f48fb6840d4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=b71e21ec7be4e2c9b86c93758a1777ad5bbfea0222872d948714af16fddadb8e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=415c99be066248f903865b4a204e81ae48c0af0873732c77d616ada7eabd3c95&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=f343e2c7370ffcb6e5525e717eee18ae62e704a93d6d8a60d0eac355c4d21b9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=8e8d4fde4adba1a836f38639e8249bc324bb39b1e540506d720b074e9449cea9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=71e779cd8fb131b81d7d51579207d35b5063e74d228770345c81817d449a11e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4665JYXHBEI%2F20260623%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260623T221320Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEF0aCXVzLXdlc3QtMiJHMEUCIQCUGpt8JIwQWiapb9k%2FfrwFsIBJhWbfavgXbE%2BnStmkfQIgdv9qKBULZ0ATXfX5C%2B0keCj8qhDRxXvsiioi%2B5ROm28q%2FwMIJhAAGgw2Mzc0MjMxODM4MDUiDMUe5et8S%2B2qtYUpeCrcA39%2B64fygDjgRKZXlkwFn5IfMRN6wMj5jtiCDtaGPQt98%2BFoCH86xieLR1VN7X1ka8PuUtm8PUCVhgRpWskToFMJAOYcQgOWzieMRDEfW7byTYVvxJphqeY847UR3%2F2WY2SpPbn61lkG7wp%2FikK0955TjhOlQAsTXQx0wPsWVLG4AJDTAzI9objGswxht2oCfNxdVFUabg2u6qBnGwMUp27w8Zb%2FV7GX8rVMhBvqwiBl7%2Fu50xNrcUxfg2utP0KpoewPjxBUmdISy%2FM91RCumxdNB%2B1Mx7Ux7iJzUnYmRFCUkcYK0sTmxY2xX6hPlskT6AYXKmkZSGhH7EcJcg%2FrZw9ixFHl1oaspSN5MVtxbxf4PdTcujaZlkMC2Nmsz5nsSRf6XsYZjgGgHGyYEeBuKokFRajpl4mWocxeqhay6RSIDuuows1w%2BUz8z2iRdppLyVrGIW%2FsgJPpmdQ81tYsuEqtcN9n0DmY2bpL0CV7Or4TOlv%2FAEe%2B4A9cDrHAeOiU0k%2FvuJepDPpVUsGbFyUNosqja3dz0IdW0KdQa58HR5n8IFsv8APAjX2sxU14B9YA6v8I6YyaRJUTi03lLIWqOYJQqxeG9Nzs%2BCFoNx4iQQmxOjTEVgoxsikHcF34MKzu69EGOqUBlGL1Huak3sW663hDJs2XWSVjYw89op0ey%2FGaSHDrKKWg%2BiAvl%2BOPspOqzXLnb6LdrJmBw5aJwBpnHEUyIDGL74Uc2iWoD2tlpvB737PueVuhDwoasYZznDlpPWmMCYumtaJG7JZnKIPgK0WGXcXLlmBNZFLaSATzIyZ%2B%2BCsvlCX7EUBNrykJ1FJxJoxgp5QmMVb7BBOOcxizap8vW6K9F8YHdk5W&X-Amz-Signature=5124fdf177d6a8bbed47cc42a0ced12a3b5be2460bad12b5d9fe7de55ed3bdfe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

