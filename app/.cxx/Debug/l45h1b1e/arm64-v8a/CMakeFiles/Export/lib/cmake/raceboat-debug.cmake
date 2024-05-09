#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "raceboat" for configuration "Debug"
set_property(TARGET raceboat APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(raceboat PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libraceboat.so"
  IMPORTED_SONAME_DEBUG "libraceboat.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS raceboat )
list(APPEND _IMPORT_CHECK_FILES_FOR_raceboat "${_IMPORT_PREFIX}/lib/libraceboat.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
