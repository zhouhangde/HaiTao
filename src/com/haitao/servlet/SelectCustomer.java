package com.haitao.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.haitao.dao.ZhuceDao;
import com.haitao.entity.Customer;

public class SelectCustomer extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ZhuceDao zhuce=new ZhuceDao();
		String customerName=request.getParameter("loginname");
		String customermail=request.getParameter("email");
		String customerphone=request.getParameter("phone");
		
		int i=0;
		int m=0;
		int p=0;
		PrintWriter out = response.getWriter();
		List<Customer> list=zhuce.selectCustomer();
		for (Customer customer : list) {
			if(customer.getCustomerName().equals(customerName)){
				i=1;
				out.print(i);
			}
			
			if(customer.getCustomerMail().equals(customermail)){
				m=1;
				out.print(m);
			}
			
			if(customer.getCustomerPhone().equals(customerphone)){
				p=1;
				out.print(p);
			}
		}
	}
}
