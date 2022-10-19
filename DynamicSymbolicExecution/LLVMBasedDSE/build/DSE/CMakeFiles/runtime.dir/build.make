# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build

# Include any dependencies generated for this target.
include DSE/CMakeFiles/runtime.dir/depend.make

# Include the progress variables for this target.
include DSE/CMakeFiles/runtime.dir/progress.make

# Include the compile flags for this target's objects.
include DSE/CMakeFiles/runtime.dir/flags.make

DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o: DSE/CMakeFiles/runtime.dir/flags.make
DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o: ../DSE/src/SymbolicInterpreter.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o -c /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/SymbolicInterpreter.cpp

DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.i"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/SymbolicInterpreter.cpp > CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.i

DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.s"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/SymbolicInterpreter.cpp -o CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.s

DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.o: DSE/CMakeFiles/runtime.dir/flags.make
DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.o: ../DSE/src/Runtime.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.o"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/runtime.dir/src/Runtime.cpp.o -c /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/Runtime.cpp

DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/runtime.dir/src/Runtime.cpp.i"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/Runtime.cpp > CMakeFiles/runtime.dir/src/Runtime.cpp.i

DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/runtime.dir/src/Runtime.cpp.s"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE/src/Runtime.cpp -o CMakeFiles/runtime.dir/src/Runtime.cpp.s

# Object files for target runtime
runtime_OBJECTS = \
"CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o" \
"CMakeFiles/runtime.dir/src/Runtime.cpp.o"

# External object files for target runtime
runtime_EXTERNAL_OBJECTS =

DSE/libruntime.so: DSE/CMakeFiles/runtime.dir/src/SymbolicInterpreter.cpp.o
DSE/libruntime.so: DSE/CMakeFiles/runtime.dir/src/Runtime.cpp.o
DSE/libruntime.so: DSE/CMakeFiles/runtime.dir/build.make
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMSupport.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMCore.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMIRReader.a
DSE/libruntime.so: /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/z3-4.8.11-x64-glibc-2.31/bin/libz3.so
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMAsmParser.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMBitReader.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMCore.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMBinaryFormat.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMRemarks.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMBitstreamReader.a
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMSupport.a
DSE/libruntime.so: /usr/lib/x86_64-linux-gnu/libz.so
DSE/libruntime.so: /usr/lib/x86_64-linux-gnu/libtinfo.so
DSE/libruntime.so: /usr/lib/llvm-12/lib/libLLVMDemangle.a
DSE/libruntime.so: DSE/CMakeFiles/runtime.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared module libruntime.so"
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/runtime.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
DSE/CMakeFiles/runtime.dir/build: DSE/libruntime.so

.PHONY : DSE/CMakeFiles/runtime.dir/build

DSE/CMakeFiles/runtime.dir/clean:
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE && $(CMAKE_COMMAND) -P CMakeFiles/runtime.dir/cmake_clean.cmake
.PHONY : DSE/CMakeFiles/runtime.dir/clean

DSE/CMakeFiles/runtime.dir/depend:
	cd /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/DSE /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE /home/twinturbo/TakeDownHSS/DynamicSymbolicExecution/LLVMBasedDSE/build/DSE/CMakeFiles/runtime.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : DSE/CMakeFiles/runtime.dir/depend

