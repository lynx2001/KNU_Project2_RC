################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/LVGL/src/lv_themes/lv_theme.c \
../Third_Party/LVGL/src/lv_themes/lv_theme_empty.c \
../Third_Party/LVGL/src/lv_themes/lv_theme_material.c \
../Third_Party/LVGL/src/lv_themes/lv_theme_mono.c \
../Third_Party/LVGL/src/lv_themes/lv_theme_template.c 

OBJS += \
./Third_Party/LVGL/src/lv_themes/lv_theme.o \
./Third_Party/LVGL/src/lv_themes/lv_theme_empty.o \
./Third_Party/LVGL/src/lv_themes/lv_theme_material.o \
./Third_Party/LVGL/src/lv_themes/lv_theme_mono.o \
./Third_Party/LVGL/src/lv_themes/lv_theme_template.o 

C_DEPS += \
./Third_Party/LVGL/src/lv_themes/lv_theme.d \
./Third_Party/LVGL/src/lv_themes/lv_theme_empty.d \
./Third_Party/LVGL/src/lv_themes/lv_theme_material.d \
./Third_Party/LVGL/src/lv_themes/lv_theme_mono.d \
./Third_Party/LVGL/src/lv_themes/lv_theme_template.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/LVGL/src/lv_themes/%.o Third_Party/LVGL/src/lv_themes/%.su Third_Party/LVGL/src/lv_themes/%.cyclo: ../Third_Party/LVGL/src/lv_themes/%.c Third_Party/LVGL/src/lv_themes/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-LVGL-2f-src-2f-lv_themes

clean-Third_Party-2f-LVGL-2f-src-2f-lv_themes:
	-$(RM) ./Third_Party/LVGL/src/lv_themes/lv_theme.cyclo ./Third_Party/LVGL/src/lv_themes/lv_theme.d ./Third_Party/LVGL/src/lv_themes/lv_theme.o ./Third_Party/LVGL/src/lv_themes/lv_theme.su ./Third_Party/LVGL/src/lv_themes/lv_theme_empty.cyclo ./Third_Party/LVGL/src/lv_themes/lv_theme_empty.d ./Third_Party/LVGL/src/lv_themes/lv_theme_empty.o ./Third_Party/LVGL/src/lv_themes/lv_theme_empty.su ./Third_Party/LVGL/src/lv_themes/lv_theme_material.cyclo ./Third_Party/LVGL/src/lv_themes/lv_theme_material.d ./Third_Party/LVGL/src/lv_themes/lv_theme_material.o ./Third_Party/LVGL/src/lv_themes/lv_theme_material.su ./Third_Party/LVGL/src/lv_themes/lv_theme_mono.cyclo ./Third_Party/LVGL/src/lv_themes/lv_theme_mono.d ./Third_Party/LVGL/src/lv_themes/lv_theme_mono.o ./Third_Party/LVGL/src/lv_themes/lv_theme_mono.su ./Third_Party/LVGL/src/lv_themes/lv_theme_template.cyclo ./Third_Party/LVGL/src/lv_themes/lv_theme_template.d ./Third_Party/LVGL/src/lv_themes/lv_theme_template.o ./Third_Party/LVGL/src/lv_themes/lv_theme_template.su

.PHONY: clean-Third_Party-2f-LVGL-2f-src-2f-lv_themes

