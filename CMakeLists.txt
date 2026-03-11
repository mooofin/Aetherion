cmake_minimum_required(VERSION 3.22)

project(doom VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(PkgConfig REQUIRED)
find_package(SDL2 CONFIG QUIET)
find_package(SDL2_image CONFIG QUIET)

if(NOT TARGET SDL2::SDL2)
    pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)
    add_library(SDL2::SDL2 INTERFACE IMPORTED)
    target_link_libraries(SDL2::SDL2 INTERFACE PkgConfig::SDL2)
endif()

if(NOT TARGET SDL2_image::SDL2_image)
    pkg_check_modules(SDL2_IMAGE REQUIRED IMPORTED_TARGET SDL2_image)
    add_library(SDL2_image::SDL2_image INTERFACE IMPORTED)
    target_link_libraries(SDL2_image::SDL2_image INTERFACE PkgConfig::SDL2_IMAGE)
endif()

add_executable(${PROJECT_NAME}
    src/main.cpp
)

target_link_libraries(
    ${PROJECT_NAME} 
    PUBLIC SDL2::SDL2
    PUBLIC SDL2_image::SDL2_image
)
