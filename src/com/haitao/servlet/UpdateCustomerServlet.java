package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.entity.CustomerLogin;
import com.haitao.service.CustomerLoginService;

public class UpdateCustomerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String customerPwd = request.getParameter("customerPwd");
		String rcustomerPwd = request.getParameter("rcustomerPwd");
		String name = request.getParameter("name");
		String customerMail = request.getParameter("customerMail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("customerAddress");
		String customerName = request.getParameter("customerName");
		if(customerPwd.equals(rcustomerPwd)){
			CustomerLoginService cust = new CustomerLoginService();
			cust.updateCustomer(new CustomerLogin(customerName,customerPwd,name,customerPhone,customerAddress,customerMail));
			response.sendRedirect("login/login.jsp");
		}else{
			response.sendRedirect("member/member.jsp");
		}
	}
	

}
