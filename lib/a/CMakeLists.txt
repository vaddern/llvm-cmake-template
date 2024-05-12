project(libs)

add_library(a STATIC a.cpp)

install(TARGETS a DESTINATION lib)
install(DIRECTORY inc/ DESTINATION lib)
