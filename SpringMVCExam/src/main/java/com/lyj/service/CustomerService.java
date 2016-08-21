package com.lyj.service;

import java.util.List;

import com.lyj.po.Customer;
import com.lyj.po.MoreCustomer;

public interface CustomerService {

	public boolean hasCustomer(Customer customer) throws Exception;
	
	List<MoreCustomer> getMoreCustomerList() throws Exception;
	
	public boolean insertCustomer(Customer customer) throws Exception;
	
	public boolean updateCustomer(Customer customer) throws Exception;
	
}
