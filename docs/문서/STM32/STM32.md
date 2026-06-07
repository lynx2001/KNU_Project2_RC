# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=3124803c8c2dd52043fd01967bbdbb67cecb45ad8e37633eaeb9ce00728c408b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=c0f325c390d9578fb7d87a7f2ab106e658ca0f8e160eaa348a0dbea6a205c171&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=73ea8a2148f16403dc6e1b8f50c2e9760a8061660d1435352636738063d920de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=c5035a4d6d8ca653a88c329ffe9af7ff78a91bd44b376bdb9991a773634b8fe0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=db48c7271429cd67f3a32ec9fa44f16686e5cc76ff80e2127c5c895d86765d0e&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=6018a82c6aea556f940ddef6fab9e4adac71d291a2685f4fe1820e5fe99842cf&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=65a295c87781fc070ef373ed0827c8d74d2922cf5ecaad62982f76e6d670480b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=7861950fc410b37e0273aa254ccfde77efa7a423970ec2b2ffb1e5243a5a6e02&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=d22b7b3c5179dc0b4c37c0440bfacc50ce44ba0fefdddb1adf3cd380fa453185&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=873ed6e28a0614a849da8bceec8d68f9705ccfbf1ec812845170573b5c003952&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=174e8ccdb896911e0be4210f4666af0aa1c708d680ade391d512603f2d09d40b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=82b6ecb0431a6187f885320a8e96af5f47a5948853fe4d5be7adfcb1def5106b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=7b86dde3fbe19db910d5eefe50f04ee41b551ee1a5b69b49c608f6b99ae1aadb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=74508f51b54bca4f31b4885353a44f70cfc9b7c50b3c158f4fd2b529b9e2183c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=71c81ac2aa1061796a8dbb9307a017dfe5e8cb1146e273c38f646e6715b27f0f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=d4bd00d882bd4135be4aba304b96ba061241899d50bbcffb92771432b6ca12ee&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=8612264546caeb105b795224286b21be21b9bca8a91ccad0c5bed22706a7f166&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=79e5588f7418cdd1a79f869490b5708bb4a2f238d5ccf4ec3f15827d0d770c19&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=8a96d3ffd3c6edced32624253452ed7c0dc28f069506486d2e8907fbd272ff12&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=4e962e1d1de61bb5aef413dff62de568c1c704b24aa670a163e7a283f7722b3a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=76f62cb23d2f71ea108cbab986de8e7d100dc8d8c2d3ea664592c50eb2dbeadb&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=a0b83eb1c38e074fa4e96272e0a047501f60978195a5376dbd3de132adb41b62&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=fa3d15e44774d07caa6f3fe26b6af9635455f380ab4875cc66f71e77bf8b6d42&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=13e91dc023e6142d9a4e531048cb5528739da8d349ba15ab04b7a5fb21e994e7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- 왼쪽모터는 반대로

|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=8432b2c6d02920d462aadcbba864ee7968f2d54d0c634f6d8fb3feaf7042bae6&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=fcbaf687b9af62573326a8023c8ee99578ac3791bebcaace9e7608019472b0dc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB4667ZRROKGS%2F20260607%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260607T220706Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQC%2FLo7NsRTF83B5APX6dXlR1QqZ%2FaPyqYJrYehNE2LymwIgGJGyZYQzf0FPULigVcK7YXoRapyDBHUMx4G9VteZqR0qiAQIpv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw2Mzc0MjMxODM4MDUiDJMuw0lL%2BhQJ7ULZRircA6%2BSLJzcLHY5O7zFoJJQAcYdY7Lr%2BijE54Ja%2BGN7bzVbI5H%2B3rRduHRMQ08UEZdI%2FwAWjsK5RKBse8rYNJz%2B72GIJfvCCv1gbHSB6JObPc679eKBVqPV8sHSmwCzk%2Bl8RjcT1Jx9RbEvK0834RdMCFsBBGWwbKiSNf0Cjqw1zm0UHO3RwCyB%2BbXqPA1BjMeTHabZDRG%2F7JYJIHOgQk9W8XUJqiGL8IU%2FribnhtEI0iKhTJd3MPXN1nQscdHZETCZBZfCyaps1hEmnX5WPH6VD4n%2BuYzfrn3Za98%2BDJmVwJc%2BC%2B8L0EZFJkX2NJlg2tsvImHhmSaJrgMOebCz1By39W75o7VYJy28%2BMoxE7ikWyMyL7PzkAsStHmX2jMSRvqe%2Fag53oZkMM4HMp0IUZqjAat9gGJBSMGh4FgAQcqYiZdJLTiBLiolFsWiMo3%2FPqq08Aumw%2BV3j%2FEPTRI6wlVh1wv%2BiqripD9UeAyLNiw2clGjNnYiIMfO48oXaSOh7bSC54iikAum%2FVPcLBsBQOiWi9iPaWKnG4HEAVY5I24COuRl9iMmZJdyMIRm%2Bs9mofj2ukxqq0vc3T5m%2F7nzwYgLmqOpnoG3ktUcQ0eserYXnk65VxiNNWxmFIv37p4wMOmql9EGOqUBMpJKaCkarTjmqF1ud1GJMVnewQsqRrzKezkM0bVGHKCzZp6fObRbNO6NA8xnM7lE1ljESZ9FMLa4mTnLqX%2FZif%2BnFk%2BWKNfweqeYD%2FPqazmwzfAwkuNaNKOiSgPEhZ0ioqQznBVWvuMyDxsztpdRqrzTJsMEPSipMBhKwSkHX1BvnxFABN0dgkzga5i1OyAesGLiWI5J%2BigU1W91iq1YTkrR2H6D&X-Amz-Signature=511465a76eff1a02734793797451b9386a965b66cc2c9795d45922f0d33945de&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

