add_library(licensecc_static STATIC
    licensecc.cpp
    LicenseReader.cpp
    limits/license_verifier.cpp
    ini/ConvertUTF.cpp
)

target_link_libraries(licensecc_static PUBLIC libcrypto.a base os locate hw_identifier)

add_subdirectory("base")
add_subdirectory("os")
add_subdirectory("locate")
add_subdirectory("hw_identifier")
