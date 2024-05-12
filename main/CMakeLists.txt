cmake_minimum_required(VERSION 3.14)
project(mainProject)

add_executable(main main.cpp)
target_link_libraries(main a)


install(TARGETS main DESTINATION .)
