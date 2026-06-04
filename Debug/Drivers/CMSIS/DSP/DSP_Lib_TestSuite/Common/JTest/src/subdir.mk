################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src

