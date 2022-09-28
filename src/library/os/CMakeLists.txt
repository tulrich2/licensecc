if (APPLE)
	add_library(os STATIC
		openssl/signature_verifier.cpp
		execution_environment_common.cpp
		linux/execution_environment.cpp
		macos_m1/cpu_info.cpp
		macos_m1/dmi_info.cpp
		linux/network.cpp
		linux/os_linux.cpp
  )
else ()
	add_library(os STATIC
		openssl/signature_verifier.cpp
		execution_environment_common.cpp
		linux/execution_environment.cpp
		linux/cpu_info.cpp
		linux/dmi_info.cpp
		linux/network.cpp
		linux/os_linux.cpp
  )
endif ()
add_dependencies(os project_initialize)
