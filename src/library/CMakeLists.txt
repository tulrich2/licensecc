add_library(licensecc_static STATIC
    licensecc.cpp
    LicenseReader.cpp
    limits/license_verifier.cpp
    ini/ConvertUTF.cpp
)

target_link_libraries(licensecc_static PUBLIC ${OPENSSL_LIB_DIR}/libcrypto.a base os locate hw_identifier)
add_dependencies(licensecc_static project_initialize)

add_subdirectory("base")
add_subdirectory("os")
add_subdirectory("locate")
add_subdirectory("hw_identifier")
