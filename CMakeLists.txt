cmake_minimum_required(VERSION 3.0)

set (CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}
    "${CMAKE_CURRENT_LIST_DIR}/cmake"
    "${CMAKE_CURRENT_LIST_DIR}/cmake/golang"
)

include(UseGolang)

# Disable default language
project(cmgo LANGUAGES NONE)

find_package(Golang)

add_subdirectory(cmd/cmgo)
