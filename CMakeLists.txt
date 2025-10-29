cmake_minimum_required(VERSION 3.22)

project(doom VERSION 1.0)

# Enable C++20 features
set(CMAKE_CXX_STANDARD 20)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)
SET(CMAKE_CXX_EXTENSIONS OFF)

# Find SDL2 using pkg-config (works well with NixOS)
find_package(SDL2 REQUIRED)
find_package(SDL2_image REQUIRED)

file(GLOB_RECURSE SOURCES CO NFIGURE_DEPENDS
    "${PROJECT_SOURCE_DIR}/src/*.cpp"
)

add_executable(${PROJECT_NAME}
    src/main.cpp
    ${SOURCES}
)

target_link_libraries(
    ${PROJECT_NAME} 
    PUBLIC SDL2::SDL2
    PUBLIC SDL2_image::SDL2_image
)

target_include_directories(${PROJECT_NAME} 
    PUBLIC ${SDL2_INCLUDE_DIRS}
    PUBLIC ${SDL2_IMAGE_INCLUDE_DIRS}
)
