package com.lyj.mapper;

import java.util.List;

import com.lyj.po.Customer;
import com.lyj.po.MoreCustomer;

public interface CustomerExistMapper {

	int hasCustomer(Customer customer) throws Exception;
	
	List<MoreCustomer> getMoreCustomerList(Integer start) throws Exception;
	
	int insertCustomer(Customer customer) throws Exception;
	
	int updateCustomer(Customer customer) throws Exception;
	
	int customerCount() throws Exception;
	
}
