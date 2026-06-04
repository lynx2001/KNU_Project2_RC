################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Hiwonder/Peripherals/button.c \
../Hiwonder/Peripherals/buzzer.c \
../Hiwonder/Peripherals/display_st7735.c \
../Hiwonder/Peripherals/encoder_motor.c \
../Hiwonder/Peripherals/imu.c \
../Hiwonder/Peripherals/imu_mpu6050.c \
../Hiwonder/Peripherals/key.c \
../Hiwonder/Peripherals/led.c \
../Hiwonder/Peripherals/pwm_servo.c \
../Hiwonder/Peripherals/serial_servo.c 

OBJS += \
./Hiwonder/Peripherals/button.o \
./Hiwonder/Peripherals/buzzer.o \
./Hiwonder/Peripherals/display_st7735.o \
./Hiwonder/Peripherals/encoder_motor.o \
./Hiwonder/Peripherals/imu.o \
./Hiwonder/Peripherals/imu_mpu6050.o \
./Hiwonder/Peripherals/key.o \
./Hiwonder/Peripherals/led.o \
./Hiwonder/Peripherals/pwm_servo.o \
./Hiwonder/Peripherals/serial_servo.o 

C_DEPS += \
./Hiwonder/Peripherals/button.d \
./Hiwonder/Peripherals/buzzer.d \
./Hiwonder/Peripherals/display_st7735.d \
./Hiwonder/Peripherals/encoder_motor.d \
./Hiwonder/Peripherals/imu.d \
./Hiwonder/Peripherals/imu_mpu6050.d \
./Hiwonder/Peripherals/key.d \
./Hiwonder/Peripherals/led.d \
./Hiwonder/Peripherals/pwm_servo.d \
./Hiwonder/Peripherals/serial_servo.d 


# Each subdirectory must supply rules for building sources it contributes
Hiwonder/Peripherals/%.o Hiwonder/Peripherals/%.su Hiwonder/Peripherals/%.cyclo: ../Hiwonder/Peripherals/%.c Hiwonder/Peripherals/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Hiwonder-2f-Peripherals

clean-Hiwonder-2f-Peripherals:
	-$(RM) ./Hiwonder/Peripherals/button.cyclo ./Hiwonder/Peripherals/button.d ./Hiwonder/Peripherals/button.o ./Hiwonder/Peripherals/button.su ./Hiwonder/Peripherals/buzzer.cyclo ./Hiwonder/Peripherals/buzzer.d ./Hiwonder/Peripherals/buzzer.o ./Hiwonder/Peripherals/buzzer.su ./Hiwonder/Peripherals/display_st7735.cyclo ./Hiwonder/Peripherals/display_st7735.d ./Hiwonder/Peripherals/display_st7735.o ./Hiwonder/Peripherals/display_st7735.su ./Hiwonder/Peripherals/encoder_motor.cyclo ./Hiwonder/Peripherals/encoder_motor.d ./Hiwonder/Peripherals/encoder_motor.o ./Hiwonder/Peripherals/encoder_motor.su ./Hiwonder/Peripherals/imu.cyclo ./Hiwonder/Peripherals/imu.d ./Hiwonder/Peripherals/imu.o ./Hiwonder/Peripherals/imu.su ./Hiwonder/Peripherals/imu_mpu6050.cyclo ./Hiwonder/Peripherals/imu_mpu6050.d ./Hiwonder/Peripherals/imu_mpu6050.o ./Hiwonder/Peripherals/imu_mpu6050.su ./Hiwonder/Peripherals/key.cyclo ./Hiwonder/Peripherals/key.d ./Hiwonder/Peripherals/key.o ./Hiwonder/Peripherals/key.su ./Hiwonder/Peripherals/led.cyclo ./Hiwonder/Peripherals/led.d ./Hiwonder/Peripherals/led.o ./Hiwonder/Peripherals/led.su ./Hiwonder/Peripherals/pwm_servo.cyclo ./Hiwonder/Peripherals/pwm_servo.d ./Hiwonder/Peripherals/pwm_servo.o ./Hiwonder/Peripherals/pwm_servo.su ./Hiwonder/Peripherals/serial_servo.cyclo ./Hiwonder/Peripherals/serial_servo.d ./Hiwonder/Peripherals/serial_servo.o ./Hiwonder/Peripherals/serial_servo.su

.PHONY: clean-Hiwonder-2f-Peripherals

