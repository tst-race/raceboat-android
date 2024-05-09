#include/cmakelists
# Set the path to the include directory
# may need to make this include the ../
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# Get a list of all .h files in the include directory and its subdirectories
file(GLOB_RECURSE HEADER_FILES ${INCLUDE_DIR}/*.h)

# Optionally add specific header files if needed
# list(APPEND HEADER_FILES ${INCLUDE_DIR}/example.h)

# Add any additional configurations related to include files here if needed
