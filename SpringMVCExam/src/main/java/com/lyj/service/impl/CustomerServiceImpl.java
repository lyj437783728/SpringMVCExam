package com.lyj.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lyj.mapper.CustomerExistMapper;
import com.lyj.mapper.CustomerMapper;
import com.lyj.po.Customer;
import com.lyj.po.MoreCustomer;
import com.lyj.service.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerExistMapper customerExistMapper;
	


	public boolean hasCustomer(Customer customer) throws Exception {
		boolean b = false;
		int i = customerExistMapper.hasCustomer(customer);
		if(i != 0){
			b = true;
		}
		return b;
	}

	public List<MoreCustomer> getMoreCustomerList(Integer start) throws Exception {
		
		return customerExistMapper.getMoreCustomerList(start);
		
	}

	public boolean insertCustomer(Customer customer) throws Exception {
		boolean b = false;
		int i = customerExistMapper.insertCustomer(customer);
		if(i != 0){
			b=true;
		}
		
		System.out.println("Integer i = "+i);
		
		return b;
	}

	public boolean updateCustomer(Customer customer) throws Exception {
		boolean b = false;
		int i = customerExistMapper.updateCustomer(customer);
		if(i != 0){
			b=true;
		}
		return b;
	}

	public int customerCount() throws Exception {
		return customerExistMapper.customerCount();
	}

	

	

}
