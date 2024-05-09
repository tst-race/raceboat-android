# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "language-shims/source"
  "language-shims/source/commsPluginBindings.py"
  "language-shims/source/commsPluginBindingsPYTHON_wrap.cxx"
  )
endif()
