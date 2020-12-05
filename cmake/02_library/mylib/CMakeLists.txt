cmake_minimum_required(VERSION 3.1)
project(mylib
	VERSION 1.0.0
	DESCRIPTION "Sample Library"
	LANGUAGES CXX)

# add_library(mylib STATIC
# 	./src/mylib.cpp
# 	)

# If BUILD_SHARED_LIBS is used with configure, the we can remove 'STATIC'.
# BUILD_SHARED_LIBS
add_library(mylib 
	./src/mylib.cpp
	)

# target_include_directories(mylib INTARFACE ./include)
target_include_directories(mylib PUBLIC ./include)

set_target_properties(mylib
	PROPERTIES
	VERSION ${PROJECT_VERSION})

