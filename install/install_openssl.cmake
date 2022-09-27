include(ExternalProject)


ExternalProject_Add(install_openssl
  PREFIX ${CMAKE_SOURCE_DIR}/3rdParty/openssl
  GIT_REPOSITORY https://github.com/openssl/openssl
  GIT_SHALLOW TRUE
  GIT_TAG openssl-3.0.5
  
  CONFIGURE_COMMAND ../install_openssl/Configure
  BUILD_COMMAND make
  INSTALL_COMMAND ""
  TEST_COMMAND ""
)


set(OPENSSL_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/3rdParty/openssl/src/install_openssl/include;${CMAKE_SOURCE_DIR}/3rdParty/openssl/src/install_openssl-build/include)
set(OPENSSL_LIB_DIR ${CMAKE_SOURCE_DIR}/3rdParty/openssl/src/install_openssl-build)
