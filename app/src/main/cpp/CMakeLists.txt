
# Copyright 2023 Two Six Technologies
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

cmake_minimum_required(VERSION 3.22.1)
project(raceboat LANGUAGES CXX)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -v")

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/race-cmake-modules)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_BUILD_TYPE Debug)

set(BUILD_VERSION "" CACHE STRING "Version of the SDK being built")
#silly hardcode to bypass this if check
set(BUILD_VERSION "jigglypuff")
#set(BUILD_VERSION "local")
if("${BUILD_VERSION}" STREQUAL "")
    message(FATAL_ERROR "Missing or empty BUILD_VERSION argument")
endif()

find_library( # Sets the name of the path variable.
        log-lib
        log )

#include(race/clang-format)
#include(race/coverage)
#include(race/java-format)
#include(race/lint)
#include(race/test-targets)
#include(race/valgrind)
#include(race/warnings)

#setup_project_test_targets(raceboat UNIT INTEGRATION)
#setup_project_format_targets(raceboat)
# Set the path to Python include directory
set(PYTHON_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/include/python3.7m)

# Set the path to Python library directory
set(PYTHON_LIBRARY ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/lib/libpython3.7m.so)

# Set the path to Python executable directory
set(PYTHON_EXECUTABLE ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/bin/python3.7m)

# Set the path to the Python packages
set(PYTHON_PACKAGES_DIR "${CMAKE_SOURCE_DIR}/../python/python-packages-3.7.16-3-android-arm64-v8a")
set(PYTHONPATH "${PYTHON_PACKAGES_DIR}:${PYTHONPATH}")

# Find Python libraries
find_package(PythonLibs 3.7.16 EXACT REQUIRED)

if (PythonLibs_FOUND)
    message(STATUS "Python 3 found: ${PythonLibs_VERSION}")
    message(STATUS "Include directories: ${PythonLibs_INCLUDE_DIRS}")
    message(STATUS "Libraries: ${PythonLibs_LIBRARIES}")
    message(STATUS "Include directories: ${PYTHON_INCLUDE_DIRS}")
    message(STATUS "Libraries: ${PYTHON_LIBRARIES}")
else()
    message(FATAL_ERROR "Python 3 not found")
endif()


add_subdirectory(language-shims)
add_subdirectory(source)
#if(NOT ANDROID)
#    add_subdirectory(app/race-cli)
#    add_subdirectory(test/common/UnifiedTestStub EXCLUDE_FROM_ALL)
#    add_subdirectory(test/common/DecomposedTestStub EXCLUDE_FROM_ALL)
#    add_subdirectory(test/common/plugins/myOS/myArch/DecomposedTestImplementation EXCLUDE_FROM_ALL)
#    add_subdirectory(test/source EXCLUDE_FROM_ALL)
#endif()

# Create this after all subdirectories have been added
#setup_project_coverage_target()

install(
    TARGETS
        raceboat
    EXPORT raceboat
    LIBRARY DESTINATION lib
    PUBLIC_HEADER DESTINATION include
)

install(
    EXPORT raceboat
    DESTINATION lib/cmake
)
#testing raceboat's  main()
include(run_raceboat.cmake)
#LOCAL_LDLIBS := -llog

add_library(raceboat-driver SHARED
        # List C/C++ source files with relative paths to this CMakeLists.txt.
        mainDriver.cpp)

target_link_libraries(raceboat-driver
        raceboat
        # List libraries link to the target library
        android
        log)
