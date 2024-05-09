# Install script for directory: /Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Users/jesse.jenter/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/build/intermediates/cxx/Debug/7l5n2o65/obj/arm64-v8a/libraceboat.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Users/jesse.jenter/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libraceboat.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/ClrMsg.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/IRaceApp.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/MessageStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/PluginStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/Race.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ChannelId.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ChannelProperties.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ChannelRole.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ChannelStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ConnectionStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/ConnectionType.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/Defer.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/EncPkg.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/LinkProperties.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/LinkPropertyPair.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/LinkPropertySet.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/LinkStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/LinkType.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/PackageStatus.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/PackageType.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/PluginConfig.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/PluginResponse.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/RaceEnums.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/RaceExport.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/RaceHandle.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/RaceLog.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/RacePluginExports.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/SendType.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/TransmissionType.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/common/constants.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/ComponentTypes.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IComponentBase.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IComponentSdkBase.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IEncodingComponent.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IEncodingSdk.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/ITransportComponent.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/ITransportSdk.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IUserModelComponent.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/decomposed/IUserModelSdk.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/unified/IRacePluginComms.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/unified/IRaceSdkCommon.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/unified/IRaceSdkComms.h"
    "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/src/main/cpp/source/../include/race/unified/SdkResponse.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/raceboat.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/raceboat.cmake"
         "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/CMakeFiles/Export/lib/cmake/raceboat.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/raceboat-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/raceboat.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/CMakeFiles/Export/lib/cmake/raceboat.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake" TYPE FILE FILES "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/CMakeFiles/Export/lib/cmake/raceboat-debug.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/language-shims/cmake_install.cmake")
  include("/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/source/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/jesse.jenter/AndroidStudioProjects/Raceboat/app/.cxx/Debug/7l5n2o65/arm64-v8a/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
