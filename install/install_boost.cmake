include(ExternalProject)

if (NOT BOOST_INCLUDE_DIR AND NOT BOOST_LIB_DIR)
    set(BOOST_ROOT_DIR "${CMAKE_SOURCE_DIR}/3rdParty/boost/src")
    set(BOOST_SRC_DIR "${BOOST_ROOT_DIR}/install_boost")

    ExternalProject_Add(install_boost
      PREFIX ${CMAKE_SOURCE_DIR}/3rdParty/boost
      URL https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz

      CONFIGURE_COMMAND ""
      BUILD_COMMAND cd "${BOOST_SRC_DIR}" && sh bootstrap.sh
      INSTALL_COMMAND cd "${BOOST_SRC_DIR}" && ./b2 --prefix=../install_boost-build --exec-prefix=../install_boost-build --libdir=../install_boost-build --includedir=../install_boost-build --build-dir=${BOOST_ROOT_DIR}/install_boost-build/tmp --with-filesystem --with-program_options --no-cmake-config install
      )

    set(BOOST_INCLUDE_DIR ${BOOST_SRC_DIR})
    set(BOOST_LIB_DIR "${BOOST_ROOT_DIR}/install_boost-build")
else ()
    add_custom_target(install_boost)
endif ()
