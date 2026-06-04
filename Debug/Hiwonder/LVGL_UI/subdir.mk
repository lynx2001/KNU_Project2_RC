################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Hiwonder/LVGL_UI/custom.c \
../Hiwonder/LVGL_UI/events_init.c \
../Hiwonder/LVGL_UI/gui_guider.c \
../Hiwonder/LVGL_UI/lvgl_handle.c \
../Hiwonder/LVGL_UI/setup_scr_screen_empty.c \
../Hiwonder/LVGL_UI/setup_scr_screen_imu.c \
../Hiwonder/LVGL_UI/setup_scr_screen_ps2.c \
../Hiwonder/LVGL_UI/setup_scr_screen_sbus.c \
../Hiwonder/LVGL_UI/setup_scr_screen_startup.c \
../Hiwonder/LVGL_UI/setup_scr_screen_sys.c 

OBJS += \
./Hiwonder/LVGL_UI/custom.o \
./Hiwonder/LVGL_UI/events_init.o \
./Hiwonder/LVGL_UI/gui_guider.o \
./Hiwonder/LVGL_UI/lvgl_handle.o \
./Hiwonder/LVGL_UI/setup_scr_screen_empty.o \
./Hiwonder/LVGL_UI/setup_scr_screen_imu.o \
./Hiwonder/LVGL_UI/setup_scr_screen_ps2.o \
./Hiwonder/LVGL_UI/setup_scr_screen_sbus.o \
./Hiwonder/LVGL_UI/setup_scr_screen_startup.o \
./Hiwonder/LVGL_UI/setup_scr_screen_sys.o 

C_DEPS += \
./Hiwonder/LVGL_UI/custom.d \
./Hiwonder/LVGL_UI/events_init.d \
./Hiwonder/LVGL_UI/gui_guider.d \
./Hiwonder/LVGL_UI/lvgl_handle.d \
./Hiwonder/LVGL_UI/setup_scr_screen_empty.d \
./Hiwonder/LVGL_UI/setup_scr_screen_imu.d \
./Hiwonder/LVGL_UI/setup_scr_screen_ps2.d \
./Hiwonder/LVGL_UI/setup_scr_screen_sbus.d \
./Hiwonder/LVGL_UI/setup_scr_screen_startup.d \
./Hiwonder/LVGL_UI/setup_scr_screen_sys.d 


# Each subdirectory must supply rules for building sources it contributes
Hiwonder/LVGL_UI/%.o Hiwonder/LVGL_UI/%.su Hiwonder/LVGL_UI/%.cyclo: ../Hiwonder/LVGL_UI/%.c Hiwonder/LVGL_UI/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Third_Party/LVGL/src -I../Third_Party/LVGL/src/lv_core -I../Third_Party/LVGL/src/lv_draw -I../Third_Party/LVGL/src/lv_font -I../Third_Party/LVGL/src/lv_hal -I../Third_Party/LVGL/src/lv_misc -I../Third_Party/LVGL/src/lv_themes -I../Third_Party/LVGL/src/lv_widgets -I../Hiwonder/LVGL_UI/guider_fonts -I../Hiwonder/LVGL_UI/guider_customer_fonts -I../Hiwonder/LVGL_UI/images -I../Third_Party/LVGL/porting -I../Third_Party -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Hiwonder-2f-LVGL_UI

clean-Hiwonder-2f-LVGL_UI:
	-$(RM) ./Hiwonder/LVGL_UI/custom.cyclo ./Hiwonder/LVGL_UI/custom.d ./Hiwonder/LVGL_UI/custom.o ./Hiwonder/LVGL_UI/custom.su ./Hiwonder/LVGL_UI/events_init.cyclo ./Hiwonder/LVGL_UI/events_init.d ./Hiwonder/LVGL_UI/events_init.o ./Hiwonder/LVGL_UI/events_init.su ./Hiwonder/LVGL_UI/gui_guider.cyclo ./Hiwonder/LVGL_UI/gui_guider.d ./Hiwonder/LVGL_UI/gui_guider.o ./Hiwonder/LVGL_UI/gui_guider.su ./Hiwonder/LVGL_UI/lvgl_handle.cyclo ./Hiwonder/LVGL_UI/lvgl_handle.d ./Hiwonder/LVGL_UI/lvgl_handle.o ./Hiwonder/LVGL_UI/lvgl_handle.su ./Hiwonder/LVGL_UI/setup_scr_screen_empty.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_empty.d ./Hiwonder/LVGL_UI/setup_scr_screen_empty.o ./Hiwonder/LVGL_UI/setup_scr_screen_empty.su ./Hiwonder/LVGL_UI/setup_scr_screen_imu.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_imu.d ./Hiwonder/LVGL_UI/setup_scr_screen_imu.o ./Hiwonder/LVGL_UI/setup_scr_screen_imu.su ./Hiwonder/LVGL_UI/setup_scr_screen_ps2.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_ps2.d ./Hiwonder/LVGL_UI/setup_scr_screen_ps2.o ./Hiwonder/LVGL_UI/setup_scr_screen_ps2.su ./Hiwonder/LVGL_UI/setup_scr_screen_sbus.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_sbus.d ./Hiwonder/LVGL_UI/setup_scr_screen_sbus.o ./Hiwonder/LVGL_UI/setup_scr_screen_sbus.su ./Hiwonder/LVGL_UI/setup_scr_screen_startup.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_startup.d ./Hiwonder/LVGL_UI/setup_scr_screen_startup.o ./Hiwonder/LVGL_UI/setup_scr_screen_startup.su ./Hiwonder/LVGL_UI/setup_scr_screen_sys.cyclo ./Hiwonder/LVGL_UI/setup_scr_screen_sys.d ./Hiwonder/LVGL_UI/setup_scr_screen_sys.o ./Hiwonder/LVGL_UI/setup_scr_screen_sys.su

.PHONY: clean-Hiwonder-2f-LVGL_UI

