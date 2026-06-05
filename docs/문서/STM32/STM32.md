# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=6c04897f785cd840ab2f344a5e3b36cac3551b5e0f619202324233b0b0805b97&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=1b166256374b64b888a1cad958772219ab2f3148ad9dff697b24e5a71799abb4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=f4a4429f4fa3c7f2b293723dffe68e4571f2952efea99193b5f6be571d5d8e22&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=a012b69feb271c7389880dfa23d668e27bc12fe9525e9b9bea67937e31ba774d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=5f6871e2ec7bae070bff734930fa4c71e1a03f3d636caf3e1a5eb4e43563bdea&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=4af3e2254f9eaa57c49083fef58b05f57b0828bf1840b0cc165d00e7aff33259&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=592da1803810a0f9b5ff6470157cdaa5ca9a6df577c5dce02b15a6616dae230a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=802ff30dfb88c232b4ae123b512df66033bce3fe892a68a5e44e5d2b0c4e7500&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=245dfbb0cb7ba26341b7c9f7985dd35119369ccc4695cb6d38d1544589e6b47b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=914b528588eb62452975e790924315617c63af77ab378321d7d48a897f8db2c7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=afbce380d93e698de5a2368ef9d5ebcd393c868b26fef60abfc345416007cf17&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=202a0679c100b212801e97647dc4463e0f2b348b1962f0923f368d7ea6cfa1a7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=a58d360826dfa050d8de61de152abc0a0f3aa05efea05487a77efc20fbe9e364&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=7e9b952c59d6b4c4b02747b4863fda1724cddc4afe6f7a4d1803d220eab8a818&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=5eddc7fabb14b3658cf969759e5846a92990d5dccddf7adf478fb7d0314db8ca&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=2c06ab138a22da8b012003df9f31409f4958a1af35908ac7064037d93e9f32ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=2ce9081b0c02969ab24adaaf62991a6c7fbe5502824cd3985b442b881f5a35d8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=2e25ca7039b9dd90ef7c23fccc9f72a399a0544560f55aca35948ceaa587709e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=7e44876017b415ae0d5c1ea267ee32aec58bf0f7083031c2a6eb63d615dbe8de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=37d38b976fb5321a0043d1e44a493c6fd8dbdcf7a0c51226f0824bf744e1b929&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=52e9cf53be927943268226d5705a8c6161af37012d5542ae2f2e6bb821159703&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=c7234ed1662508df26db2c0a268805011ab0e9fd93f2c6becfb17a644f02a4fa&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=8d951e7e3326ec5592e04d7f1606e25fe51d95922b5a7af02bbacb6ff75c2555&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=140692085e4055cdd93cc27051c9b69d11a34079ba7eabb6cbd02e13026a1f77&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=e3360393c204e105f6a6f695f143b01c60bede59b69bcd44bfe0524b0ec630f8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=bf1785e42267a614b21dbce75f32f6cc8e35b74e7c1d610db696f98d7ac160e5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466S4ZXGIDJ%2F20260605%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260605T045818Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEJz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJGMEQCIAeO81mrT679rX4aoaGiI5S8Ak2MdEgfliHOrpGpT%2BAyAiBUR%2BI7Wp3dVRP2hOwQsNCiXCdbVbb%2Fe4%2BfPZaMIAW72Cr%2FAwhlEAAaDDYzNzQyMzE4MzgwNSIMRqMSOWCwNMbrF0D1KtwDBNd3QhTE9aq4tQwHxmixqE3bwS1j%2Bppqz%2BYZxpbHLIBTTENA4Hn14QTBvV%2BTt3tYf3djxdmOziCPUPAmiMt3zhvSxRpWi%2FsJJzgZ93enyiEJruFJo7XAcjrtIQ6dhHUQmW5eN3nzvrbp1Wt7k76zzzjBarxWnbBP4%2BMdG3KQad3AnAA46n9btudZmS%2Bl9uPFLakl9PL0tgq8Mcuck580I4flMsnm27Fc6lUZ5yTsqZBRQf3YLLyXFFDHy1m0Y9d4mQHJcby5fWALpgYQWZSfbyuno4pp23h8gO0V0I9QtJwLHktaL8rjhZuHL16F8%2BDmcXbKvPnFbwyLwvNpZ5XJHtsTUAgA1tzkBR8tZ5nnqqMHfp%2FQt%2Fa5zzoYVQNrUeCeWrs2kk0V1dQiU7JXtG3%2Ffj1hdrxZ4UBvHAuZqjTOToHXKgUsZEY3Nt2Y0fgDuBwwIKf2cAmvHNEd%2BM7wI5Hg1KRB6lrdEViDDO93vWJYXeds0i9Sonbp2%2BnYL04ZHL%2FuzTM2hBLmhX5rSGxVEvJCnpGfJ5364u94EjFp5s7YHpWRRPN3r4vqFHoZ0NtWGmBWTQJy2NXiwfcnY9eNy9H1pyulFg7uzZgYXD8sEVRSoBcgmJGYDSLFPNMIhFEwrY%2BJ0QY6pgF6mRs7EAcDXPN8MsnY0PPbWAd%2B2P%2BOKEh71rb6RLeQJSOTJW733FMkmaCeFNyCLUlP6zqpHazXI%2FzIdAktRrdIlGVRA0j6N3lyDbavcLE2V%2FInABbLq2lAGLaRIKuLrSGZeCV0yjx6HLrwx77RjEWfF9froreJ7QDwCcp3jEYc4S6j6ovq6hH2dUozc5%2Fxe2qY8y5GZjbaAykv2RsW%2Bo3ZAY5LwYqG&X-Amz-Signature=00d556d8e715d32ff9233ead4ecfd842b1bb5d89952587effdf17816f5a31362&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

