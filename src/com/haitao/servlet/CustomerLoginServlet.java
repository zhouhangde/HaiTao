package com.haitao.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.haitao.dao.ManagerLoginDao;
import com.haitao.dao.salesDao;
import com.haitao.entity.CustomerLogin;
import com.haitao.entity.sales;
import com.haitao.service.CustomerLoginService;
import com.haitao.service.ManagerLoginService;

public class CustomerLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CustomerLoginService customer = new CustomerLoginService();
		HttpSession session = request.getSession();
		String customerName = request.getParameter("customerName");
		String customerPwd = request.getParameter("customerPwd");
		String yzm=String.valueOf(request.getSession().getAttribute("randomString"));
		String identity=request.getParameter("identity");
		CustomerLogin customers=new CustomerLogin();
		if(customerName !=null && customerPwd!=null && identity.equalsIgnoreCase(yzm)){
			int i =customer.SelectAllCustomer(customerName, customerPwd);
			if(i==1){
				customers=customer.SelectAllCustomers(customerName);
				session.setAttribute("customer",customers);
				session.setAttribute("customerLogin","当前用户:"+customerName);
				session.setAttribute("customerL",customerName);
				salesDao sd=new salesDao();
				List<sales> list=sd.SelectAll(customerName);
				session.setAttribute("sales",list);
				request.getRequestDispatcher("member/member.jsp").forward(request, response);
			}else{
				response.sendRedirect("login/login.jsp");
			}
		}else{
			response.sendRedirect("login/login.jsp");
		}
		
	}
	

}
