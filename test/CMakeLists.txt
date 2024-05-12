project(testProject)

# from macros.cmake
initTesting()
addTest(TARGET baseTest SOURCES base/test.cpp)
target_link_libraries(baseTest a)


install(TARGETS baseTest DESTINATION test)
