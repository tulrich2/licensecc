//
// Created by Tom Ulrich on 08.09.22.
//


#include "../cpu_info.hpp"


namespace license {

  namespace os {
  
    CpuInfo::CpuInfo() : m_vendor("APPLE"), m_brand("APPLE") { }
	
	CpuInfo::~CpuInfo() { }

	bool CpuInfo::is_hypervisor_set() const {
		return false;
	}

	uint32_t CpuInfo::model() const {
		return 0xFFFFFFFF;
	}
  
  }

}
