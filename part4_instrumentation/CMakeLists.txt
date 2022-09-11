cmake_minimum_required(VERSION 3.4.3)
set(CMAKE_C_COMPILER /usr/bin/clang-12)
set(CMAKE_CXX_COMPILER /usr/bin/clang++-12)
project(data-flow-analysis)
if(POLICY CMP0074)
    cmake_policy(SET CMP0074 OLD)
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 14)
if(CMAKE_BUILD_TYPE MATCHES "Debug")
    set(CMAKE_CXX_FLAGS "-std=c++14 -D__GLIBCXX_USE_CXX11_ABI=0 -O0 -fno-rtti -fno-limit-debug-info")
else()
    set(CMAKE_CXX_FLAGS "-std=c++14 -D__GLIBCXX_USE_CXX11_ABI=0 -O3 -fno-rtti -fno-limit-debug-info")
endif()

find_package(LLVM REQUIRED CONFIG)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})


add_subdirectory(DivZeroInstrument)
