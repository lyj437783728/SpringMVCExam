package com.lyj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lyj.po.Address;
import com.lyj.po.Customer;
import com.lyj.po.MoreCustomer;
import com.lyj.service.AddressService;
import com.lyj.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AddressService addressService;
	
	@ModelAttribute("addressInfo")
	public List<Address> getAddressInfo() throws Exception{

		return addressService.getAddressInfo();
	}
	
	@RequestMapping("/updateCustomerJsp")
	public String updateCustomerJsp(Model model,Customer customer) throws Exception{
		
		model.addAttribute("customer", customer);
		return "editCustomer";
	}
	
	@RequestMapping("/updateCustomer")
	public String updateCustomer(Customer customer) throws Exception{
		
		if(customerService.updateCustomer(customer)){
			return "success";
		}
		return "error";
		
	}
	
	
	@RequestMapping("/addCustmoerJsp")
	public String addCustmoerJsp() throws Exception{
		return "newCustomer";
	}
	
	@RequestMapping("/insertCustomer")
	public String insertCustomer(Customer customer) throws Exception{
		if(customerService.insertCustomer(customer)){
			return "success";
		}
		return "error";
	}
	
	
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request,String firstName,Customer customer,HttpSession session) throws Exception{
		
		if(customerService.hasCustomer(customer)){  
		    session.setAttribute("firstName", firstName);
		    return "redirect:index.action";	
		}
		request.setAttribute("error", "用户名不存在");
		return "forward:login.jsp";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:login.jsp";
	}
	
	
	@RequestMapping("/index")
	public ModelAndView index(String spageNow) throws Exception{
		
		if(spageNow == null){
			System.out.println("pageNow为空");
			spageNow = "1";
		}
		
		int customerCount = customerService.customerCount();
		int pageCount = customerCount/10;
		if(customerCount%10 != 0){
			pageCount++;
		}
		
		Integer pageNow = Integer.parseInt(spageNow);
		Integer start = (pageNow-1)*10;
		
		List<MoreCustomer> moreCustomerList = customerService.getMoreCustomerList(start);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("moreCustomerList", moreCustomerList);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.setViewName("index");
		
		return modelAndView;
		
	}
	
	
	@RequestMapping("/showCustomerByPage")
	public @ResponseBody List<MoreCustomer> showCustomerByPage(String spageNow) throws Exception{
		
		if(spageNow == null){
			System.out.println("pageNow为空");
			spageNow = "1";
		}
			
		Integer pageNow = Integer.parseInt(spageNow);
		Integer start = (pageNow-1)*10;
		
		System.out.println("Integer start = "+start);
		
		List<MoreCustomer> moreCustomerList = customerService.getMoreCustomerList(start);
		
		System.out.println(moreCustomerList.size());
		
		return moreCustomerList;
		
		
	}
	

}
