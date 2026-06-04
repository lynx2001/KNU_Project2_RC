################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/LVGL/src/lv_core/lv_disp.c \
../Third_Party/LVGL/src/lv_core/lv_group.c \
../Third_Party/LVGL/src/lv_core/lv_indev.c \
../Third_Party/LVGL/src/lv_core/lv_obj.c \
../Third_Party/LVGL/src/lv_core/lv_refr.c \
../Third_Party/LVGL/src/lv_core/lv_style.c 

OBJS += \
./Third_Party/LVGL/src/lv_core/lv_disp.o \
./Third_Party/LVGL/src/lv_core/lv_group.o \
./Third_Party/LVGL/src/lv_core/lv_indev.o \
./Third_Party/LVGL/src/lv_core/lv_obj.o \
./Third_Party/LVGL/src/lv_core/lv_refr.o \
./Third_Party/LVGL/src/lv_core/lv_style.o 

C_DEPS += \
./Third_Party/LVGL/src/lv_core/lv_disp.d \
./Third_Party/LVGL/src/lv_core/lv_group.d \
./Third_Party/LVGL/src/lv_core/lv_indev.d \
./Third_Party/LVGL/src/lv_core/lv_obj.d \
./Third_Party/LVGL/src/lv_core/lv_refr.d \
./Third_Party/LVGL/src/lv_core/lv_style.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/LVGL/src/lv_core/%.o Third_Party/LVGL/src/lv_core/%.su Third_Party/LVGL/src/lv_core/%.cyclo: ../Third_Party/LVGL/src/lv_core/%.c Third_Party/LVGL/src/lv_core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-LVGL-2f-src-2f-lv_core

clean-Third_Party-2f-LVGL-2f-src-2f-lv_core:
	-$(RM) ./Third_Party/LVGL/src/lv_core/lv_disp.cyclo ./Third_Party/LVGL/src/lv_core/lv_disp.d ./Third_Party/LVGL/src/lv_core/lv_disp.o ./Third_Party/LVGL/src/lv_core/lv_disp.su ./Third_Party/LVGL/src/lv_core/lv_group.cyclo ./Third_Party/LVGL/src/lv_core/lv_group.d ./Third_Party/LVGL/src/lv_core/lv_group.o ./Third_Party/LVGL/src/lv_core/lv_group.su ./Third_Party/LVGL/src/lv_core/lv_indev.cyclo ./Third_Party/LVGL/src/lv_core/lv_indev.d ./Third_Party/LVGL/src/lv_core/lv_indev.o ./Third_Party/LVGL/src/lv_core/lv_indev.su ./Third_Party/LVGL/src/lv_core/lv_obj.cyclo ./Third_Party/LVGL/src/lv_core/lv_obj.d ./Third_Party/LVGL/src/lv_core/lv_obj.o ./Third_Party/LVGL/src/lv_core/lv_obj.su ./Third_Party/LVGL/src/lv_core/lv_refr.cyclo ./Third_Party/LVGL/src/lv_core/lv_refr.d ./Third_Party/LVGL/src/lv_core/lv_refr.o ./Third_Party/LVGL/src/lv_core/lv_refr.su ./Third_Party/LVGL/src/lv_core/lv_style.cyclo ./Third_Party/LVGL/src/lv_core/lv_style.d ./Third_Party/LVGL/src/lv_core/lv_style.o ./Third_Party/LVGL/src/lv_core/lv_style.su

.PHONY: clean-Third_Party-2f-LVGL-2f-src-2f-lv_core

