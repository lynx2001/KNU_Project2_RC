################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third_Party/LVGL/src/lv_misc/lv_anim.c \
../Third_Party/LVGL/src/lv_misc/lv_area.c \
../Third_Party/LVGL/src/lv_misc/lv_async.c \
../Third_Party/LVGL/src/lv_misc/lv_bidi.c \
../Third_Party/LVGL/src/lv_misc/lv_color.c \
../Third_Party/LVGL/src/lv_misc/lv_debug.c \
../Third_Party/LVGL/src/lv_misc/lv_fs.c \
../Third_Party/LVGL/src/lv_misc/lv_gc.c \
../Third_Party/LVGL/src/lv_misc/lv_ll.c \
../Third_Party/LVGL/src/lv_misc/lv_log.c \
../Third_Party/LVGL/src/lv_misc/lv_math.c \
../Third_Party/LVGL/src/lv_misc/lv_mem.c \
../Third_Party/LVGL/src/lv_misc/lv_printf.c \
../Third_Party/LVGL/src/lv_misc/lv_task.c \
../Third_Party/LVGL/src/lv_misc/lv_templ.c \
../Third_Party/LVGL/src/lv_misc/lv_txt.c \
../Third_Party/LVGL/src/lv_misc/lv_txt_ap.c \
../Third_Party/LVGL/src/lv_misc/lv_utils.c 

OBJS += \
./Third_Party/LVGL/src/lv_misc/lv_anim.o \
./Third_Party/LVGL/src/lv_misc/lv_area.o \
./Third_Party/LVGL/src/lv_misc/lv_async.o \
./Third_Party/LVGL/src/lv_misc/lv_bidi.o \
./Third_Party/LVGL/src/lv_misc/lv_color.o \
./Third_Party/LVGL/src/lv_misc/lv_debug.o \
./Third_Party/LVGL/src/lv_misc/lv_fs.o \
./Third_Party/LVGL/src/lv_misc/lv_gc.o \
./Third_Party/LVGL/src/lv_misc/lv_ll.o \
./Third_Party/LVGL/src/lv_misc/lv_log.o \
./Third_Party/LVGL/src/lv_misc/lv_math.o \
./Third_Party/LVGL/src/lv_misc/lv_mem.o \
./Third_Party/LVGL/src/lv_misc/lv_printf.o \
./Third_Party/LVGL/src/lv_misc/lv_task.o \
./Third_Party/LVGL/src/lv_misc/lv_templ.o \
./Third_Party/LVGL/src/lv_misc/lv_txt.o \
./Third_Party/LVGL/src/lv_misc/lv_txt_ap.o \
./Third_Party/LVGL/src/lv_misc/lv_utils.o 

C_DEPS += \
./Third_Party/LVGL/src/lv_misc/lv_anim.d \
./Third_Party/LVGL/src/lv_misc/lv_area.d \
./Third_Party/LVGL/src/lv_misc/lv_async.d \
./Third_Party/LVGL/src/lv_misc/lv_bidi.d \
./Third_Party/LVGL/src/lv_misc/lv_color.d \
./Third_Party/LVGL/src/lv_misc/lv_debug.d \
./Third_Party/LVGL/src/lv_misc/lv_fs.d \
./Third_Party/LVGL/src/lv_misc/lv_gc.d \
./Third_Party/LVGL/src/lv_misc/lv_ll.d \
./Third_Party/LVGL/src/lv_misc/lv_log.d \
./Third_Party/LVGL/src/lv_misc/lv_math.d \
./Third_Party/LVGL/src/lv_misc/lv_mem.d \
./Third_Party/LVGL/src/lv_misc/lv_printf.d \
./Third_Party/LVGL/src/lv_misc/lv_task.d \
./Third_Party/LVGL/src/lv_misc/lv_templ.d \
./Third_Party/LVGL/src/lv_misc/lv_txt.d \
./Third_Party/LVGL/src/lv_misc/lv_txt_ap.d \
./Third_Party/LVGL/src/lv_misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Third_Party/LVGL/src/lv_misc/%.o Third_Party/LVGL/src/lv_misc/%.su Third_Party/LVGL/src/lv_misc/%.cyclo: ../Third_Party/LVGL/src/lv_misc/%.c Third_Party/LVGL/src/lv_misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Third_Party-2f-LVGL-2f-src-2f-lv_misc

clean-Third_Party-2f-LVGL-2f-src-2f-lv_misc:
	-$(RM) ./Third_Party/LVGL/src/lv_misc/lv_anim.cyclo ./Third_Party/LVGL/src/lv_misc/lv_anim.d ./Third_Party/LVGL/src/lv_misc/lv_anim.o ./Third_Party/LVGL/src/lv_misc/lv_anim.su ./Third_Party/LVGL/src/lv_misc/lv_area.cyclo ./Third_Party/LVGL/src/lv_misc/lv_area.d ./Third_Party/LVGL/src/lv_misc/lv_area.o ./Third_Party/LVGL/src/lv_misc/lv_area.su ./Third_Party/LVGL/src/lv_misc/lv_async.cyclo ./Third_Party/LVGL/src/lv_misc/lv_async.d ./Third_Party/LVGL/src/lv_misc/lv_async.o ./Third_Party/LVGL/src/lv_misc/lv_async.su ./Third_Party/LVGL/src/lv_misc/lv_bidi.cyclo ./Third_Party/LVGL/src/lv_misc/lv_bidi.d ./Third_Party/LVGL/src/lv_misc/lv_bidi.o ./Third_Party/LVGL/src/lv_misc/lv_bidi.su ./Third_Party/LVGL/src/lv_misc/lv_color.cyclo ./Third_Party/LVGL/src/lv_misc/lv_color.d ./Third_Party/LVGL/src/lv_misc/lv_color.o ./Third_Party/LVGL/src/lv_misc/lv_color.su ./Third_Party/LVGL/src/lv_misc/lv_debug.cyclo ./Third_Party/LVGL/src/lv_misc/lv_debug.d ./Third_Party/LVGL/src/lv_misc/lv_debug.o ./Third_Party/LVGL/src/lv_misc/lv_debug.su ./Third_Party/LVGL/src/lv_misc/lv_fs.cyclo ./Third_Party/LVGL/src/lv_misc/lv_fs.d ./Third_Party/LVGL/src/lv_misc/lv_fs.o ./Third_Party/LVGL/src/lv_misc/lv_fs.su ./Third_Party/LVGL/src/lv_misc/lv_gc.cyclo ./Third_Party/LVGL/src/lv_misc/lv_gc.d ./Third_Party/LVGL/src/lv_misc/lv_gc.o ./Third_Party/LVGL/src/lv_misc/lv_gc.su ./Third_Party/LVGL/src/lv_misc/lv_ll.cyclo ./Third_Party/LVGL/src/lv_misc/lv_ll.d ./Third_Party/LVGL/src/lv_misc/lv_ll.o ./Third_Party/LVGL/src/lv_misc/lv_ll.su ./Third_Party/LVGL/src/lv_misc/lv_log.cyclo ./Third_Party/LVGL/src/lv_misc/lv_log.d ./Third_Party/LVGL/src/lv_misc/lv_log.o ./Third_Party/LVGL/src/lv_misc/lv_log.su ./Third_Party/LVGL/src/lv_misc/lv_math.cyclo ./Third_Party/LVGL/src/lv_misc/lv_math.d ./Third_Party/LVGL/src/lv_misc/lv_math.o ./Third_Party/LVGL/src/lv_misc/lv_math.su ./Third_Party/LVGL/src/lv_misc/lv_mem.cyclo ./Third_Party/LVGL/src/lv_misc/lv_mem.d ./Third_Party/LVGL/src/lv_misc/lv_mem.o ./Third_Party/LVGL/src/lv_misc/lv_mem.su ./Third_Party/LVGL/src/lv_misc/lv_printf.cyclo ./Third_Party/LVGL/src/lv_misc/lv_printf.d ./Third_Party/LVGL/src/lv_misc/lv_printf.o ./Third_Party/LVGL/src/lv_misc/lv_printf.su ./Third_Party/LVGL/src/lv_misc/lv_task.cyclo ./Third_Party/LVGL/src/lv_misc/lv_task.d ./Third_Party/LVGL/src/lv_misc/lv_task.o ./Third_Party/LVGL/src/lv_misc/lv_task.su ./Third_Party/LVGL/src/lv_misc/lv_templ.cyclo ./Third_Party/LVGL/src/lv_misc/lv_templ.d ./Third_Party/LVGL/src/lv_misc/lv_templ.o ./Third_Party/LVGL/src/lv_misc/lv_templ.su ./Third_Party/LVGL/src/lv_misc/lv_txt.cyclo ./Third_Party/LVGL/src/lv_misc/lv_txt.d ./Third_Party/LVGL/src/lv_misc/lv_txt.o ./Third_Party/LVGL/src/lv_misc/lv_txt.su ./Third_Party/LVGL/src/lv_misc/lv_txt_ap.cyclo ./Third_Party/LVGL/src/lv_misc/lv_txt_ap.d ./Third_Party/LVGL/src/lv_misc/lv_txt_ap.o ./Third_Party/LVGL/src/lv_misc/lv_txt_ap.su ./Third_Party/LVGL/src/lv_misc/lv_utils.cyclo ./Third_Party/LVGL/src/lv_misc/lv_utils.d ./Third_Party/LVGL/src/lv_misc/lv_utils.o ./Third_Party/LVGL/src/lv_misc/lv_utils.su

.PHONY: clean-Third_Party-2f-LVGL-2f-src-2f-lv_misc

