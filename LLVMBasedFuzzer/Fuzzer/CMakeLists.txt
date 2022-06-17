option(USE_REFERENCE "Build with reference solution" OFF)

include_directories(include)

if (USE_REFERENCE)
  message(STATUS "Use reference solution")
  add_executable(fuzzer
    src/Fuzzer.cpp
    )
  add_library(Mutate SHARED
    reference/RefMutate.cpp
    )
  target_link_libraries(fuzzer Mutate)
  add_library(InstrumentPass MODULE
  reference/Instrument.cpp
  )
else (USE_REFERENCE)
  add_executable(fuzzer
    src/Mutate.cpp
    src/Utils.cpp
    )
  add_library(InstrumentPass MODULE
  src/Instrument.cpp
  )
endif (USE_REFERENCE)

add_library(runtime MODULE
  lib/runtime.c
  )
  
target_compile_features(InstrumentPass PRIVATE cxx_range_for cxx_auto_type)

set_target_properties(InstrumentPass PROPERTIES
        COMPILE_FLAGS "-g"
        )

target_compile_features(fuzzer PRIVATE cxx_range_for cxx_auto_type)

set_target_properties(fuzzer PROPERTIES
        COMPILE_FLAGS "-g"
        )
if(APPLE)
    set_target_properties(InstrumentPass PROPERTIES
            LINK_FLAGS "-undefined dynamic_lookup"
            )
endif(APPLE)
