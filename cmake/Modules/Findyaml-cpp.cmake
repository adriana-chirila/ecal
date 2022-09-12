find_path(YAML_CPP_INCLUDE_DIR
  NAMES yaml-cpp/yaml.h
  HINTS "${ECAL_PROJECT_ROOT}/thirdparty/yaml-cpp/include"
  NO_DEFAULT_PATH
  NO_CMAKE_FIND_ROOT_PATH
)

if(YAML_CPP_INCLUDE_DIR-NOTFOUND)
  message(FATAL_ERROR "Could not find yaml-cpp library")
  set(yaml-cpp_FOUND FALSE)
else()
  set(yaml-cpp_FOUND TRUE)
endif()

if(yaml-cpp_FOUND)
  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(yaml-cpp
    REQUIRED_VARS YAML_CPP_INCLUDE_DIR)

  if(NOT TARGET yaml-cpp)
    add_library(yaml-cpp INTERFACE IMPORTED)
    set_target_properties(yaml-cpp PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES ${YAML_CPP_INCLUDE_DIR})
    mark_as_advanced(YAML_CPP_INCLUDE_DIR)
  endif()
endif()
