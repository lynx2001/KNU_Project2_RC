# STM32


[bookmark](https://wiki.hiwonder.com/projects/ROS-Robot-Control-Board/en/latest/index.html)


# 1. Controller Hardware Course


## 1.1. Introduction


### 1.1.1. Development Board Diagram


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4e0d2eee-3a16-4f03-921e-7b741591c143/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=5234e8828dd371b5f18307e5c69d0c0f9b345f9cd6d5eb40b7ad22ed16e58cab&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


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


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0c7bd8e5-6649-4156-9edd-62d0ea8b15fc/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=1cf8f23e55a8d80838e416feef5c8bebbdbc119941c8c17833700472df4c8e7a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.2 Shut Capacity


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/be72562f-5299-473d-a3ea-f8bc5539ec99/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=df427a886f985ba0d5139d0e6183238fff39b6b3b9a06509cdbbeb4815e0c8f4&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.3. Peripheral Circuitry of the VET6


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e7a255bb-f57f-4f02-97fa-4d7c04940648/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=3e5bc4b52ab540cee591abe4ad1b3c6d8244e4ebe34a4d8dd1ad05f3bd66ca0c&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.4. Power Indicator


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/1a230b86-4197-4ae4-971a-778a5a81d38b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=531294b232be66640403d70fa79090fd0d752960957cc7ebf4a0e43d2136d35b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.5. Crystal Oscillator Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a7dd23f9-3fcb-4f0e-8266-2576579d005e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=976325f6a4ba9dd0e4ec0d20466dd349d19e8621ef039805b23f66af36f7b88b&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.6. Button Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bab84de3-3592-4b72-a5c5-c4e96e65b433/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=c603e146d792a09a97bd9872527ac8e50930770ac03fd4fc7222d493f2737d18&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 버튼  |   |   |
| --- | - | - |
| K2  |   |   |
| K1  |   |   |
| RST |   |   |


### 1.2.7. OLED Display


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/386b5cca-307b-4fee-a576-6b89738f8036/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=58c876aa484c9522e0957557c430393db58ab2c06c30ed67c4edc501a777142a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.8. Bluetooth Module Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4ca567c1-8cf1-4629-abee-1b170581dd91/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214449Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=11a32db9428bd6369300fd265d531e0c0ed245c30df85f51bfa99238236c2340&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.9. IIC Reserved Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/ddea3c7d-fba7-47f7-a94d-d2c610344314/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=084ae4c11862a566ea0cbb292bdcdaee47fbcfc970360ee94f82e86157743d38&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.10. SWD Download (Debug port)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/f23582dc-2923-4971-95b9-3bbb2da0eb9f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=883ad4af9f67504bb13000927c87e3afc76d0bb6b9b4b59d87ff2ad2c2ee1863&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


⇒ GPIO


|   | [IN] | [OUT] |
| - | ---- | ----- |
|   | 3V3  | PA13  |
|   | GND  | PA14  |


### 1.2.11. Reserved Port


⇒ GPIO Pin map


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3d63a7a0-05b7-486b-9b7c-91e42cfd8147/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=3d1ee93d33bf4712d1aa990dfc70c1e4de57893742e8f226a9bf83b395fe012a&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.12. TYPE-C Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/2ef68a73-188f-4f48-ac3c-f3395e4685c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=01dc63ab90f9a75c7bffcf5bd814cb70da666a6974e6671c5edae25274aeed05&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.13. MPU-6050


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/192fd282-b5ed-48a0-9377-80fe9c2f07d4/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=66513d07bab5566994a7a735b85fb56ce89eeb75043e6f284675009201e174d1&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.14. CH9102F Serial Port 3 Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3bb04f55-8e11-4263-868c-727530727fc0/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=a7bf0ef99417e0b82f743372739ac0e02fc6331da2558796744485be2fd8fcfc&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.15. Aircraft Remote Control Interface for BUS Model


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e959c4d3-33df-4d6d-9df0-5b6b157b14c7/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=f5ec7edccd71c102422bdf3ff1f6963745dad270bf42c1a23943dbc6c9659a6f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.16. CAN Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/e07c2010-2b10-404d-b706-154f5dce536e/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=0cf3c6cee4376baff3a8c3cefa83af15bc2ff57a6101a81a3247739bec2f63a0&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.17. Buzzer


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/6ac82afd-42dc-4697-bde4-b7dc87620f8b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=28fda80209a1a828409d0148bc481d898aac1d25b89cd813bcbe04da1f1a69e2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|        | [IN] Port |   |
| ------ | --------- | - |
| Buzzer | PA8       |   |
|        |           |   |


### 1.2.18. Enable Switch (ON/OFF)


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/d5e4505f-70dd-4ffe-a363-4e4fc2ba25a2/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=12d577195fdee8c942d28755319818f6c26106e5cca1d1dfb307476898c9dbc7&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.19. 4-Lane Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/4be66708-cf8c-422d-8ceb-3dc9ad7fc327/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=0b8cb1aa609b450d91756d1139b45929f6487ea766fbe8621e41a784366de388&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


| 구분 | [IN] Port | [IN] Voltage |
| -- | --------- | ------------ |
| J1 | PA11      | 5V           |
| J2 | PA12      | 5V           |
| J4 | PC8       | 5V           |
| J5 | PC9       | 5V           |


### 1.2.20. 5V→3.3V Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/c8debef7-9c4e-4b3f-a705-d984f27ee7a1/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=dc4a44e420b303ef76cdbe1dbf562d82d195acfaa5cd6a13e98398d6cf136168&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

- **RT9013-33GB:** 입력 전압을 받아 3.3V를 내보내는 LDO 레귤레이터
- **BSMD0603-050-6V:** 0603 사이즈의 PPTC(복구 가능한 퓨즈)
	- **050:** 보통 0.5A(500mA)의 정격 전류를 의미
	- **6V:** 최대 6V 전압까지 견딜 수 있다는 의미

### 1.2.21 RPi 5V Power Supply Circuit & Onboard 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bd6b023c-259d-4916-af78-acf6091b0152/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=71fb445e2ff6cde2897e9f5a05f00175545df1dd7e63544fed3097884f7fdab3&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|   | [OUT] V/A |   |
| - | --------- | - |
|   | 5V/5A     |   |
|   |           |   |


→ 라즈베리파이 연결 ㄱㄱ (보조배터리 제외) 
<2번> 5V 5A external power supply: Specially designed to power Raspberry Pi, Jetson Nano development boards, etc.


### 1.2.22. On-board 5V Power Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/0208e733-05b0-48bb-9c31-e49420d4c305/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=4533262208b44c6e09c50f572c515b202b1fef59ebb53f69d687d8bf9839cd5f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.23. Motor Drive Circuit

- Motor Driver [YX-4055AM]
	- PE9, PE11, PE5, PE6, PE13, PE14, PB8, PB9 → Main Chip
	- regulate our motor rotation, speed, and other functions
- Capacitor
	- C4, C36, C29, C48
	- purposes of filtering and denoising
	- stabilizing the supply voltage

**[STM → Motor Driver → Motor]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/bdceecca-da60-49df-8fb4-d69f0f12dc3f/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=a8ec0fb9151b552aef1cb9b517847b2b5abe8f156cd6bfba9363e5605ee5f1c2&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    | Front | Back |
| -- | ----- | ---- |
| M1 | PE14  | PE13 |
| M2 | PE11  | PE9  |
| M3 | PE5   | PE6  |
| M4 | PB9   | PB8  |


**[Encoder Sensor → STM32]**


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/7bfbd05d-5e08-4471-8674-23a34ce55538/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=5f06516d56d857cadb2ba33ab5867eb32b4368baf1ba560514065402cabcfd44&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


|    |           |
| -- | --------- |
| M1 | PA0, PA1  |
| M2 | PA15, PB3 |
| M3 | PB6, PB7  |
| M4 | PB4, PB5  |


### 1.2.24. Serial Bus Servo Port


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/3fe9bbac-33ee-4321-8afc-d15f8887452a/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=29de4cc58d88a739cebd8e3b3ae1e094c5c700314ddd8e3a7e27f974d1220f6d&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)


### 1.2.25. USB_HOST Port Circuit


![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/113a8891-78b7-4f36-80e3-a4777bb1a855/a4157bc2-87f3-4792-b57c-b1eb4ca18b1b/image.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAZI2LB466U7FMDU4Q%2F20260413%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20260413T214450Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjELX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQCWhUZnrT6h6MVICBJKxsEsBV4oIogsNwUzEzHewpUdkwIhAM1u8KZdcGyD%2BLXWN08ZOGGyhqe1ivhuUQR015irz2SeKv8DCH4QABoMNjM3NDIzMTgzODA1IgyQjkpil%2FCSIUopMKgq3AOF3BJXnZcl1IhNqWiRHWl6z7MWOqSuKZGO5E6oSAPTbdQ%2Fxq3tfasg3VXzukcOAD7SOQtti6uwr3fRcQAw%2BzIjx1Ieo9K4kzj%2BV80lviuzXM2MSu9Ds1%2FA79yuOxdhkRhOmklObogmOi%2F8AunOuAkYBqbXRt3oQTy5uOM5WVYiKfxnLf0zH%2B4XV8Ap1IylAFYV1H0qKRRlnAAQKipCO%2B4BPJLM5SqhnBbvT5pKpgKR0gOe8KuMCYx2JR90FeXCXW2Jw4c5vyvZ3sEKc%2BJ5PMQ7L9dQtLPtWV9jGOUfr8bs62T7yUTrPXpr5TefFEH%2BAxZmern6MlVHxWz%2BnUebQCqsiJsgRSYiglqSGlEF6ZxIurVttHxxKyna9K4Y5RuFddbm%2BVzvRfWj2kENHAPa%2F3KschvA8buuX%2B%2BcuPIW9mkK7KXneWMCxCb2SNsLjAg1jAz8VUX3efQoRP9rr2kG7cM5Fxn7bt8vfYmW%2BlnhyBhN1QLaEc5xe2j3FQK5s4yZQoVitZZ6v15cgZJpbPpIfJ%2BmP%2BMZf9pJov2zQ1zTvnPxLI8trCzoAAHu6iPhY7%2Bpeh4HZZkw6pTbNwetrwNUVZzZILdjj7l7zLHpFnLth%2FRczy3eZUI8RKw4zvnB6DDAs%2FXOBjqkAaGGsyl3fwcQ%2FKtLHKmmXMWRHaFgr5t7t75W3nDpRnqf4Sel87ZjR5SwzUEWlgQG6975R7pfCChYIos86f0ooWWNlyhNm3s%2FiSFDgEzols3XN%2BTHU8uCKmvg%2BN%2BYEP7K7OUuBqEehPgk7CWKnrDA6ZPjW5BtO3nhGWVd4A86EfTkdtWLvGV6AjdK3nGn4Eane6sfQbduWGYVBt%2FvZI3DK0NvCBSv&X-Amz-Signature=bfaeae94bd1479f315d299db08ad8c59235f2e92bad4ae22dbc892fcf425d91f&X-Amz-SignedHeaders=host&x-amz-checksum-mode=ENABLED&x-id=GetObject)

