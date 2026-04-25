# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=b53962e6b5862222a5de7466c388875746943dae0030d67713a68daa06be7ec2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=0a78811361dce6951949271b708312304f4b06aa27be57651738b90b37555e75&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=8f4744475f018f12584f2cb72c16404b4b6807da495cf411bc7f4057c993cecb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=4c32c6767cbc0882f87746140b1fd56649e7e0ba9d4f92e2c47d9d2e407c14a8&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=1d5ce9d9be2aed457fe1d8e31175f5c2738e847990c8f908d065efd5c955ad9a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=21a4dc22e6379de4caa11ba05db4fddf712948a68294bf90cbd376b4e7551720&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=572f0fbe1b23b772033c66350a9944fe47028334dd3a5a272564c0c6ae586099&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=74a43982bf26708c8a1b169fce9191207b8c6093415562ce19072d6442b6cc61&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=9aa1f5a8a25883aa1bfdaab6702e27bc963270ad9c57e8bfbae9ee074d4d7848&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=e0e24aa1259c93a40e3b47414e97049bd402c7e925bc2e714eb9cae621465cbc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=7a22fe81ac49cdd5a51efa60d43a029dc122084bd8082a033165cd943c59ecc0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=bc9e1ed12a42ff26b32798e87cdd29a8923c3d8d24be4ae93ba24be2d0d26ef2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=be2ab3cd56c240d60639a018e770f0062c920112e68b0a547f87c1c002742e8c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=2a945f1c02bf106c903721f7f3374b2a48115627e7a80d3295ae18a29d405859&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=c364c9296a2bf14b01284a69dff36a019cc2085043ea537dec6bd05d231917c5&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=30341e167d8ee8705d642971462414bd2340793be734d3a1449a2f557e0d6a67&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=a1c26a0e0f27183776e8a0cb8b1b381ce7a3ea3f181822c35fa8a24a4d9852d7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=41212ce0ddc5903d06bfb9a99062752590a23c24caa3b6edcbb72ff7e268ce9b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=53f280441b14ca7e6af8d6065e3d9e9f83980eac19ffb7c05d941e831e168f51&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=abaf1ea7342493c2cad1f13ae8ff8029e4442542afc60e8369a2464bbed2ec42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=5d34eb22d8ea3acc415653f250158485356184756b5882d2cfdf5e278f48f836&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=7557283d6746f652bbb5b48438cf85682d48d34f72b01cf7686f542c833f0aae&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=e52ef4221f15c800e51f732ac90bd63847d9a6c289aa57bbfff48aa120ca83df&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=8a3e6b6666cfd41710a66b51b6ccf131eb8bf73c2daa19b5a5d6f7b21c1bfcf7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=1dcef1a4220e81ce7b45f308b438dffe9818da6d70c2094bab850a80d0af8e7d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=f3f455962865535b1286ba249604a92b346b86ef50f70a1a3ed75ad8548db211&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466YM73UXFL%2F20260425%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260425T213318Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCn1l4CG2xtshJfTrvAToFWFt7NG4ynxd%2FuuqipbW4ZpQIhAPfNL%2FAsAXhBB%2BXGIeDyHMRhzUG8qKQ4F%2Fe5Ogenn4yhKogECJ3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNjM3NDIzMTgzODA1IgzLl56xXRo8dIZl89Qq3ANL7YUsupRvmfuTQWNP%2BSMmrra1SqVfttihyZzLzui7MW%2FKCHZ7JRnnZ0hOqQ0Z4f3svzXQ5q5%2FdlDLDxkNPQ6h2PirDdOUNeYFw5dn36UleLoHhElm0JwsqaBEjaeQH1Z8npoU2ZSAT11SbwFKkP5xRvWyYMDYHqY519t3C4KFiGhsoJWBjwIyF5bEpKH9L10AXU%2BIZLX1QApE0Km%2BzXzfXTilhlP1DCQzXAh0bmDKoTcSpBriV3fiJOyrjo40AIJ1huI1jZIO%2BbLMwSNw72UnOO%2BmYiUxjR1xt0AbrMtfYCBBAkxppyZUY7AP5s%2Bm4iqRo1t7VtKfuzUlt23vHfx6tj9fQzg8f2VSv7rTjBh0yhIC%2FU5H%2BgMs%2F6dfg%2B%2FYhaElw8A6ql23oyF%2F4bhzuAS1wT0JBOdW49oNGC%2Fkl%2BD%2F8JCXFy8xA6UBRFNbIhU0I4QH0lj5CMj8VJ4ZS%2FsiRQTJTtprAekh9tKYNCScr%2B58K0VQx0rkbLWIAo00larVYg%2F28SOli6Jy3JRYHge9tu5lWdWMAG6pLKKO%2BVAUivBuIzdoEg4tV7Hhb5PdoPjuk18rHcoTcHzycMaYGdQF35r4UcF1KJVepkoWXUTvh54cwR4gU3puOdisoE75TzCcx7TPBjqkAYf1pPK%2BVwKn%2B13AMtG4C%2BGSnDV4u28DcMKJKl%2Fvz4fv6HRdHQvfsDXadwv6k%2BEsQGILI%2FslAq9rvGiAVdiLlyCIJVxltbvCFPlvcPeOZV9R%2FEf3qyHyvoJkQoN72gJTGJvzGAhlEd12%2FmgjPERmJxiQ1ybNA6Bz29KJY9h0k4u%2Fq3%2FoCCdN0sSsLgzjPXSopcYaLIRnKqtLXKIe7uRdCljICk%2Bi&X-Amz-Signature=6fab09a779201f8960540bb2fe51b35e3fdf8c67d13f0a5f4f943bb47c067d57&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

