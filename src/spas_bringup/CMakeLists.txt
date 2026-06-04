cmake_minimum_required(VERSION 3.8)
project(spas_bringup)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic -std=c++17)
endif()

find_package(ament_cmake REQUIRED)

# 💡 launch 폴더 안에 있는 모든 런치 파일을 인스톨(빌드 타겟에 포함)하라는 명령
install(DIRECTORY
  launch
  DESTINATION share/${PROJECT_NAME}
)

ament_package()