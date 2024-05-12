cmake_minimum_required(VERSION 3.14)
project(templateProject)

include(configs/cmake/defaults.cmake)
include(configs/cmake/macros.cmake)

add_subdirectory(lib)
include_directories(lib/a/inc)

add_subdirectory(main)

if ($ENV{TESTING})
    add_subdirectory(test)
endif()
