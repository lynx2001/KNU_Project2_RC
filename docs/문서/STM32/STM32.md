# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=2e53febeb1a2144b770c277669d3645bfb54a37d02072c50ba55df0afda771fe&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=9f2398470f69caaa75514236e13810c40a5d3b08c324ee89b8c8fbbf5db87750&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=6605bed52fa3cf4eb7b2412ea11bc29552ef378a52f914287c43fe67b2b59632&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=1010916b519e74ba84a2f869a08090cab6a69124200b3e2fd8e5d930f1940840&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=eab99291f3ac6801fe609b2f81e4d150cdfe66195e36274b5ab66404b127588e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=89427399d4d764fd82c938731ca7338d74ba738157c14e5c7d4925383b2321ba&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=46cd65f16cfcc452650ec1e316c92252ee584251069df07d08db6652e10392f9&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=33a140516d5374140fe0418ede65239a9a8175baa1f64e524e272b54e830d8e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=be2cbeaa200f91f17e38091ae0ccd9d5176d1d3b06fc628b55f6b18192625053&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=8c66210ce72b617edef931cd10851231321bdff8b32388c46fb220dacaf9d219&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=3f14979bcc8bb0918ee78081de138950c8514237317789b4971e32d7e1d284e1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=d939fbe851ee317489335013b0d041dbd264f2a0886c3c037ed639599e8113b6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=3d229f18ba47ada2e6e27e7b7074b2cf1e7fd6cb2713320c4b3d2be72f348a86&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=b6249442fed421a594e0e856955de8464611028e65aee1091d188706903d3080&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=2be7972987442fa81ecc72d92eaa02e6075462e14efe32f37cf8c87f19c7c3f0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=73f0c5f688043eb1c99fc29d79f8485a228926c92cce5206504b866a8229f8ac&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=b2a59af93f1d8822fe6508a50886be80e9d3924e58a6e704e0e86bbd5344af35&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=770d4e401c6f0b7156e5aca9c8b904e8655fec65ad3b1f7d697ab90cd0aadb4c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=626662be22e00d1cacd1dada0c6e37415d4aca10928629a13687b66799bbab6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=577589843e145b9456f065e2498b2e984abc277db5a8c09bab6763a04d9e33f7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=25e7db5084d5d18313803891959a3adf33920adccdb69614846c80ac94b841e6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=33edd6a0bfe8d3fbad64c93ba13b6b5ff8c9394869f29f93e4abe0a816515703&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=de6c1cf06bf589c4f84038e4d36a8fa5d98d109a3e6e3f3b7c1ccf0bfafac758&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=00f3e7a293e323e7c42e7c302aa358f9961baaf287ced50fab32ef526a8ed607&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=d540e6f72413e2c90a2cd81e2dc45ff7932b61f6f2c0338ecccc7c7182a772b1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=f561f179035c3c6e888e8e7d9fabfd81f48867be2247ca213fd08510d0291af7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466RWTJ4A2V%2F20260704%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260704T215753Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEGYaCXVzLXdlc3QtMiJHMEUCIB%2FR%2BNn2aZ61DC1wBAc7RUZZ06pMqXaA91%2FDedw%2BGnr2AiEA7l3gf3NVhEM4Iuima%2FbCKXOqZ1m%2FalKmeGXeg7%2BJm9Uq%2FwMILhAAGgw2Mzc0MjMxODM4MDUiDIuEaGVWJkj%2BTc6KGircA9Sil%2Fn%2Fclkmj%2F%2Bp3pLLXHMqZBIFOMfivHGQW8LIvAx0ce3RJi0a4j0QboilxzC92%2ByCVI5hmnintRw%2B6YGFHQ5C90lymF6scLQwxAXACvqiKafyLB1mNA4515ynnalgc%2B0LBko%2FQ20U2upLl47TWsSw7SVPZDjErPc9mx8iAhs1D%2BX%2BybV9D7LFskkDFCPYT6PVOcwsAWMAO3bJ3BXd9cr6vvSOvL1zEcelmjy4xb%2F8EKXdtP28vdG5ARnMnr%2FumMGKfQlbuYMexuRbDB8nCOERmy550%2FPlDi18%2FBlI2JDeioAewf%2BA%2FxYWMbC2QnKl17H20x1RhyLzIlLNrxfKdUaRmdVTP3HbCtfryB0f4KJwkiFNYytQWX8dCXwmWsR8NHu5gy1fAtHuyY7Qulp5GIEY8Ag6ehz%2F9eaobzCJ%2BcZ7nZ2M%2BjPeBs6rVc%2BSy0BLv3tF9j5xztuQFhUtvEPihn1OwOSTjKlm%2FOTL8%2Fce4sQk7s%2BFd4cX2aUFZZuIV32wrvxddAw8kBHMje5BVA3WvhDJuJbKNcF6f7VfrK1aHSoRGTkIf2mq7owVVBfjteAby1qQ3JBMAcAacsqDiJ6Xu%2Fp93QfzH%2BcqlXpe%2FqsNIe1iYYCffraTlwY29R7tMNv0pdIGOqUBdagZzkP8dp4VoOCDVguOJCVWbpbVgKdFaeQZpUzxsHVnLLZ5xxmLwRaPQEpqJNYJXNLuPTXJYuVvZ3BVP1TSGSZBABYHq7wuBw0yQpJPzjTrPbaIdV8pG1bY0W4TOnMV%2BG7HylcNK1nYsFQQld03%2BwP%2BM4xC2yIZYYjsRHOakXjYrQurpxROduDaIAbxOeEpjFu8htNuUVheLiNsK1As7jw%2F7qCl&X-Amz-Signature=9a2055b74ec3e713da5626a31640399e0841a40da5abe50b5a6bda440840e50b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

