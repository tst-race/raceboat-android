#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jaegertracing::jaegertracing" for configuration "RelWithDebInfo"
set_property(TARGET jaegertracing::jaegertracing APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(jaegertracing::jaegertracing PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libjaegertracing.so"
  IMPORTED_SONAME_RELWITHDEBINFO "libjaegertracing.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS jaegertracing::jaegertracing )
list(APPEND _IMPORT_CHECK_FILES_FOR_jaegertracing::jaegertracing "${_IMPORT_PREFIX}/lib/libjaegertracing.so" )

# Import target "jaegertracing::jaegertracing-static" for configuration "RelWithDebInfo"
set_property(TARGET jaegertracing::jaegertracing-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(jaegertracing::jaegertracing-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libjaegertracing.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS jaegertracing::jaegertracing-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_jaegertracing::jaegertracing-static "${_IMPORT_PREFIX}/lib/libjaegertracing.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
