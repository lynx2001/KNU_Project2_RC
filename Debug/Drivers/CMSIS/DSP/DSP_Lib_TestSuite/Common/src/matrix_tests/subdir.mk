################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (14.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.c \
../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.c 

OBJS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.o \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.o 

C_DEPS += \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.d \
./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/%.o Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/%.su Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/%.cyclo: ../Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/%.c Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -D__FPU_PRESENT=1U -DDEBUG '-DCMSIS_device_header="stm32f4xx.h"' -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Drivers/CMSIS/Include -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Core/Inc -I../Drivers/CMSIS/RTOS2/Include -I../Drivers/CMSIS/DSP/Include -I../Drivers/CMSIS/NN/Include -I../Hiwonder/USB_HOST -I../Hiwonder/Chassis -I../Hiwonder/LVGL_UI -I../Hiwonder/Misc -I../Hiwonder/Peripherals -I../Hiwonder/Portings -I../Hiwonder/System -I../Third_Party/Fusion/Fusion -I../Third_Party/LVGL -I../Third_Party/Lw -I../Third_Party/RTT -I../Third_Party/U8g2 -I../USB_HOST/App -I../USB_HOST/Target -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/HID/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-matrix_tests

clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-matrix_tests:
	-$(RM) ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_add_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_cmplx_mult_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_init_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_inverse_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_fast_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_mult_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_scale_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_sub_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/mat_trans_tests.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_common_data.su ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.cyclo ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.d ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.o ./Drivers/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/matrix_tests/matrix_test_group.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-matrix_tests

