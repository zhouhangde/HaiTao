package com.haitao.service;

import java.util.List;

import com.haitao.dao.CustomerLoginDao;

import com.haitao.entity.CustomerLogin;



public class CustomerLoginService {
	CustomerLoginDao dao = new CustomerLoginDao();
	/*��ѯ����*/
	public int SelectAllCustomer(String customerName,String customerPwd){
		int i =0;
	    List<CustomerLogin> list =dao.SelectAllCustomer();
		for(CustomerLogin m:list){
			if(customerName.equals(m.getCustomerName()) && customerPwd.equals(m.getCustomerPwd())){
				 i =1;
			}
		}
		return i;
	}
	
	/*��ѯ����*/
	public CustomerLogin SelectAllCustomers(String customer_name){
		return dao.SelectAllCustomers(customer_name);
	}
	
	public boolean updateCustomer(CustomerLogin customer){	
		return dao.updateCustomer(customer);
	}
}
