macro(initTesting)
    include_directories(
        ../googletest/googletest/include
        ../googletest/googlemock/include
    )
    link_directories(../googletest/build/lib)
    enable_testing()
endmacro()


macro(addTest)
    set(oneValueArgs TARGET)
    set(multiValueArgs SOURCES)
    cmake_parse_arguments(ADD_TEST "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    add_executable(${ADD_TEST_TARGET} ${ADD_TEST_SOURCES})
    target_link_libraries(${ADD_TEST_TARGET} gtest gtest_main)
endmacro()
