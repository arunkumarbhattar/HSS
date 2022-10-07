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
CMAKE_SOURCE_DIR = /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build

# Include any dependencies generated for this target.
include Fuzzer/CMakeFiles/InstrumentPass.dir/depend.make

# Include the progress variables for this target.
include Fuzzer/CMakeFiles/InstrumentPass.dir/progress.make

# Include the compile flags for this target's objects.
include Fuzzer/CMakeFiles/InstrumentPass.dir/flags.make

Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o: Fuzzer/CMakeFiles/InstrumentPass.dir/flags.make
Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o: ../Fuzzer/src/Instrument.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o"
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o -c /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/src/Instrument.cpp

Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.i"
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/src/Instrument.cpp > CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.i

Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.s"
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer/src/Instrument.cpp -o CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.s

# Object files for target InstrumentPass
InstrumentPass_OBJECTS = \
"CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o"

# External object files for target InstrumentPass
InstrumentPass_EXTERNAL_OBJECTS =

Fuzzer/libInstrumentPass.so: Fuzzer/CMakeFiles/InstrumentPass.dir/src/Instrument.cpp.o
Fuzzer/libInstrumentPass.so: Fuzzer/CMakeFiles/InstrumentPass.dir/build.make
Fuzzer/libInstrumentPass.so: Fuzzer/CMakeFiles/InstrumentPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared module libInstrumentPass.so"
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/InstrumentPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Fuzzer/CMakeFiles/InstrumentPass.dir/build: Fuzzer/libInstrumentPass.so

.PHONY : Fuzzer/CMakeFiles/InstrumentPass.dir/build

Fuzzer/CMakeFiles/InstrumentPass.dir/clean:
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer && $(CMAKE_COMMAND) -P CMakeFiles/InstrumentPass.dir/cmake_clean.cmake
.PHONY : Fuzzer/CMakeFiles/InstrumentPass.dir/clean

Fuzzer/CMakeFiles/InstrumentPass.dir/depend:
	cd /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/Fuzzer /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer /home/arun/Desktop/TakeDownHSS/LLVMBasedFuzzer/build/Fuzzer/CMakeFiles/InstrumentPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Fuzzer/CMakeFiles/InstrumentPass.dir/depend
