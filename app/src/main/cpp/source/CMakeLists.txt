
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

#Add the source to the shared library
add_library(raceboat SHARED
    api-managers/ChannelManager.cpp
    api-managers/ApiManager.cpp
    common/ChannelProperties.cpp
    common/ChannelRole.cpp
    common/ChannelStatus.cpp
    common/ConnectionStatus.cpp
    common/ConnectionType.cpp
    common/EncPkg.cpp
    common/LinkProperties.cpp
    common/LinkPropertyPair.cpp
    common/LinkPropertySet.cpp
    common/LinkStatus.cpp
    common/LinkType.cpp
    common/PackageStatus.cpp
    common/PackageType.cpp
    common/PluginResponse.cpp
    common/RaceEnums.cpp
    common/RaceLog.cpp
    common/SendType.cpp
    common/TransmissionType.cpp
    decomposed/ComponentActionManager.cpp
    decomposed/ComponentConnectionManager.cpp
    decomposed/ComponentLifetimeManager.cpp
    decomposed/ComponentLinkManager.cpp
    decomposed/ComponentManager.cpp
    decomposed/ComponentManagerTypes.cpp
    decomposed/ComponentPackageManager.cpp
    decomposed/ComponentReceivePackageManager.cpp
    decomposed/ComponentTypes.cpp
    decomposed/ComponentWrappers.cpp
    decomposed/MimeTypes.cpp
    decomposed/SdkWrappers.cpp
    unified/SdkResponse.cpp
    plugin-loading/ComponentPlugin.cpp
    plugin-loading/CompositeWrapper.cpp
    plugin-loading/Config.cpp
    plugin-loading/DecomposedPluginLoader.cpp
    plugin-loading/DynamicLibrary.cpp
    plugin-loading/LoaderWrapper.cpp
    plugin-loading/PluginLoader.cpp
    plugin-loading/PythonHelper.cpp
    plugin-loading/PythonComponentPlugin.cpp
    plugin-loading/PythonLoaderWrapper.cpp
    state-machine/ApiContext.cpp
    state-machine/ConnectionObjectStateMachine.cpp
    state-machine/ConnectionStateMachine.cpp
    state-machine/DialStateMachine.cpp
    state-machine/Events.cpp
    state-machine/ListenStateMachine.cpp
    state-machine/PreConnObjStateMachine.cpp
    state-machine/ReceiveStateMachine.cpp
    state-machine/SendStateMachine.cpp
    state-machine/SendReceiveStateMachine.cpp
    state-machine/StateMachine.cpp
    base64.cpp
    Composition.cpp
    Core.cpp
    FileSystem.cpp
    Handler.cpp
    helper.cpp
    PluginContainer.cpp
    PluginDef.cpp
    PluginWrapper.cpp
    Race.cpp
    SdkWrapper.cpp
    Storage.cpp
    UserInput.cpp
)

#Add the headers to the shared library
file(GLOB_RECURSE COMM_LIB_PUBLIC_HEADERS CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/../include/*.h
)

set_target_properties(raceboat PROPERTIES
    PUBLIC_HEADER "${COMM_LIB_PUBLIC_HEADERS}"
)
target_include_directories(raceboat PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/include/python3.7m>
        $<INSTALL_INTERFACE:include>
)

file(GLOB_RECURSE COMM_LIB_PRIVATE_HEADERS CONFIGURE_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/*.h
)

set_target_properties(raceboat PROPERTIES
    PRIVATE_HEADER "${COMM_LIB_PRIVATE_HEADERS}"
)

# Set the path to Python include directory
#set(PYTHON_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/include)

# Set the path to Python library
#set(PYTHON_LIBRARY ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/lib)

message(STATUS "In source/cmakeLists")
message(STATUS "Checking include directory: ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/include")
message(STATUS "Checking library directory: ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/lib")

#These should exist
message(STATUS "Printing Python include dirs: ${PYTHON_INCLUDE_DIRS}")
message(STATUS "Printing Python libraries: ${PYTHON_LIBRARIES}")

# Include PythonLibs
#include_directories(PYTHON_INCLUDE_DIRS)
#link_directories(PYTHON_LIBRARIES)

#set(PYTHON_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/include/python3.7m)

# Set the path to Python library
#set(PYTHON_LIBRARY ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/lib/python3.7/libpython3.7m.so)


target_compile_definitions(raceboat PUBLIC SWIG_TYPE_TABLE=RaceSdk)

# Set the path to Python executable directory
#set(PYTHON_EXECUTABLE ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/bin/python3.7m)

#find_package(PythonLibs 3.7 EXACT REQUIRED)
# Set the path to Python libraries directory relative to the source directory
#set(PYTHON_LIBRARIES_PATH ${CMAKE_SOURCE_DIR}/../python/python-3.7.16-3-android-arm64-v8a/lib)

# Link against Python libraries
#target_link_libraries(raceboat ${PYTHON_LIBRARIES_PATH})

#changing the PYTHON_PLUGIN_SUPPORT from 1 to 0 for testing
target_compile_definitions(raceboat PRIVATE PYTHON_PLUGIN_SUPPORT=0)


#message(DEBUG "Printing Python include dirs: ${PYTHON_INCLUDE_PATH}")

if(ANDROID)
    target_link_libraries(raceboat
        PRIVATE
            language-shims-headers
            ${PYTHON_LIBRARIES}
            #${PYTHON_LIBRARY}
            ${CMAKE_DL_LIBS} # Contains dlopen and dlclose for dynamically loading plugins.
            log
    )
    #target_include_directories(raceboat SYSTEM PRIVATE ${PYTHON_INCLUDE_PATH})
    target_include_directories(raceboat SYSTEM PRIVATE ${PYTHON_INCLUDE_DIRS})

    #target_link_libraries(raceboat PRIVATE Python::Python)
    #target_link_libraries(raceboat PRIVATE ${PYTHON_LIBRARIES})
else()
    # Default to Linux
    target_link_libraries(raceboat
        PRIVATE
            language-shims-headers
            ${PYTHON_LIBRARIES}
            #${PYTHON_LIBRARY}
            ${CMAKE_DL_LIBS} # Contains dlopen and dlclose for dynamically loading plugins.
        PUBLIC
            stdc++fs
    )
    target_include_directories(raceboat SYSTEM PRIVATE ${PYTHON_INCLUDE_DIRS})
endif()

# TODO enable performance-* and readability-* checks (needs fixes)
# setup_clang_tidy_for_target(TARGET raceboat)
# setup_cppcheck_for_target(
#     TARGET raceboat
#     CHECKS all
#     SUPPRESS unmatchedSuppression unusedFunction missingIncludeSystem useStlAlgorithm
# )
#setup_clang_format_for_target(raceboat)
