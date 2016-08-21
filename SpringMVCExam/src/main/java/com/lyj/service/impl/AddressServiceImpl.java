package com.lyj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lyj.mapper.AddressOptionMapper;
import com.lyj.po.Address;
import com.lyj.service.AddressService;

public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressOptionMapper addressOptionMapper;
	
	public List<Address> getAddressInfo() throws Exception {
		return addressOptionMapper.getAddressInfo();
	}

}
