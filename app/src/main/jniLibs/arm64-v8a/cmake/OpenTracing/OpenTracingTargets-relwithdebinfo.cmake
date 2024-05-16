#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "OpenTracing::opentracing-static" for configuration "RelWithDebInfo"
set_property(TARGET OpenTracing::opentracing-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenTracing::opentracing-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libopentracing.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenTracing::opentracing-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenTracing::opentracing-static "${_IMPORT_PREFIX}/lib/libopentracing.a" )

# Import target "OpenTracing::opentracing_mocktracer-static" for configuration "RelWithDebInfo"
set_property(TARGET OpenTracing::opentracing_mocktracer-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(OpenTracing::opentracing_mocktracer-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELWITHDEBINFO "CXX"
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libopentracing_mocktracer.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS OpenTracing::opentracing_mocktracer-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_OpenTracing::opentracing_mocktracer-static "${_IMPORT_PREFIX}/lib/libopentracing_mocktracer.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
