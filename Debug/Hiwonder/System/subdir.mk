################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Hiwonder/System/app.c \
../Hiwonder/System/battery_handle.c \
../Hiwonder/System/gampad_handle.c 

OBJS += \
./Hiwonder/System/app.o \
./Hiwonder/System/battery_handle.o \
./Hiwonder/System/gampad_handle.o 

C_DEPS += \
./Hiwonder/System/app.d \
./Hiwonder/System/battery_handle.d \
./Hiwonder/System/gampad_handle.d 


# Each subdirectory must supply rules for building sources it contributes
Hiwonder/System/%.o Hiwonder/System/%.su Hiwonder/System/%.cyclo: ../Hiwonder/System/%.c Hiwonder/System/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Hiwonder-2f-System

clean-Hiwonder-2f-System:
	-$(RM) ./Hiwonder/System/app.cyclo ./Hiwonder/System/app.d ./Hiwonder/System/app.o ./Hiwonder/System/app.su ./Hiwonder/System/battery_handle.cyclo ./Hiwonder/System/battery_handle.d ./Hiwonder/System/battery_handle.o ./Hiwonder/System/battery_handle.su ./Hiwonder/System/gampad_handle.cyclo ./Hiwonder/System/gampad_handle.d ./Hiwonder/System/gampad_handle.o ./Hiwonder/System/gampad_handle.su

.PHONY: clean-Hiwonder-2f-System

