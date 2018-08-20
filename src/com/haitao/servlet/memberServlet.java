package com.haitao.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.salesDao;
import com.haitao.entity.CustomerLogin;
import com.haitao.entity.sales;
import com.haitao.service.CustomerLoginService;

public class memberServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customerName =String.valueOf(request.getSession().getAttribute("customerL"));
		CustomerLoginService customer = new CustomerLoginService();
		CustomerLogin customers=new CustomerLogin();
		customers=customer.SelectAllCustomers(customerName);
		request.getSession().setAttribute("customerL",customerName);
		salesDao sd=new salesDao();
		List<sales> list=sd.SelectAll(customerName);
		request.getSession().setAttribute("sales",list);
		request.getRequestDispatcher("member/member.jsp").forward(request, response);
	}
}
