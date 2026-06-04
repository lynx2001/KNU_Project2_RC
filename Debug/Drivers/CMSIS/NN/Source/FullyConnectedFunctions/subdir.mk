################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.c \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.c \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.c \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.c \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.c \
../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.c 

OBJS += \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.o \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.o \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.o \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.o \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.o \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.o 

C_DEPS += \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.d \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.d \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.d \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.d \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.d \
./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Source/FullyConnectedFunctions/%.o Drivers/CMSIS/NN/Source/FullyConnectedFunctions/%.su Drivers/CMSIS/NN/Source/FullyConnectedFunctions/%.cyclo: ../Drivers/CMSIS/NN/Source/FullyConnectedFunctions/%.c Drivers/CMSIS/NN/Source/FullyConnectedFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -D__RESTRICT= -D__RESTRICT=__restrict '-D__STATIC_INLINE=static inline' -D__GNUC__ '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-FullyConnectedFunctions

clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-FullyConnectedFunctions:
	-$(RM) ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.su ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.su ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.su ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.su ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.su ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.cyclo ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.d ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.o ./Drivers/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-FullyConnectedFunctions

