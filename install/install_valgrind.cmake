include(ExternalProject)


if (APPLE)
    add_custom_target(install_valgrind)
else ()
    set(VALGRIND_ROOT_DIR ${CMAKE_SOURCE_DIR}/3rdParty/valgrind)
    set(VALGRIND_SRC_DIR ${VALGRIND_ROOT_DIR}/src/install_valgrind)
    ExternalProject_Add(install_valgrind
            PREFIX ${VALGRIND_ROOT_DIR}
            URL https://sourceware.org/pub/valgrind/valgrind-3.19.0.tar.bz2
            URL_MD5 4687a4990585a038c52f842448ef4e63

            CONFIGURE_COMMAND cd ${VALGRIND_SRC_DIR} && ./autogen.sh && ./configure "--prefix=${VALGRIND_ROOT_DIR}/src/install_valgrind-build"
            BUILD_COMMAND cd ${VALGRIND_SRC_DIR} && make && make install
            INSTALL_COMMAND ""
            TEST_COMMAND ""
            )
endif ()
