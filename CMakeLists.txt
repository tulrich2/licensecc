cmake_minimum_required(VERSION 3.10)

set(LICENSECC_SHORT_LICENSE "BSD Software License")
cmake_policy(SET CMP0048 NEW)

project (licensecc
	VERSION 2.1.0
	LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

include(install/install_openssl.cmake)
include_directories(${OPENSSL_INCLUDE_DIR})
link_directories(${OPENSSL_LIB_DIR})
include(install/install_boost.cmake)
include_directories(${BOOST_INCLUDE_DIR})
link_directories(${BOOST_LIB_DIR})
include(install/install_valgrind.cmake)

if (NOT LCC_PROJECTS_BASE_DIR)
	set(LCC_PROJECTS_BASE_DIR "${CMAKE_SOURCE_DIR}/projects")
endif ()
message(STATUS "Storing projects at '${LCC_PROJECTS_BASE_DIR}'")

if (NOT LCC_PROJECT_NAME)
	message(STATUS "No project name specified; set LCC_PROJECT_NAME with the name of the software you want to add a license to when running CMake")
	set(LCC_PROJECT_NAME "DEFAULT")
endif ()
message(STATUS "Creating licenses for project '${LCC_PROJECT_NAME}'")

#initialize project
#load the current project from files or find it from environment variables or create a default one
set(LCC_INCLUDE_DIR "${LCC_PROJECTS_BASE_DIR}/${LCC_PROJECT_NAME}/include/${PROJECT_NAME}/${LCC_PROJECT_NAME}" )
set(LCC_PROJECT_PUBLIC_KEY "${LCC_INCLUDE_DIR}/public_key.h" )
set(LCC_PROJECT_PRIVATE_KEY "${LCC_PROJECTS_BASE_DIR}/${LCC_PROJECT_NAME}/private_key.rsa" )

add_custom_target(project_initialize
  COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/lccgen project initialize -t "${CMAKE_SOURCE_DIR}/src/templates" -n "${LCC_PROJECT_NAME}" -p "${LCC_PROJECTS_BASE_DIR}"
  COMMENT "generating ${LCC_PROJECT_PUBLIC_KEY} and ${LCC_PROJECT_PRIVATE_KEY} if they don't already exist"
  USES_TERMINAL
)

include_directories(
	"${LCC_INCLUDE_DIR}"
	"${CMAKE_SOURCE_DIR}/include"
)

add_subdirectory(src)
add_subdirectory(extern/license-generator)

add_custom_target(environment DEPENDS install_boost install_openssl install_valgrind)
