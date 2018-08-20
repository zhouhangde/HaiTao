package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ZhuceDao;


public class zhuceServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String customerName=request.getParameter("loginname");
		String customerPwd=request.getParameter("loginpass");
		String Name=request.getParameter("cname");
		String customerSex=request.getParameter("sex");
		String customerPhone=request.getParameter("phone");
		String customerAddress=request.getParameter("address");
		String customerMail=request.getParameter("email");
		ZhuceDao zhuce=new ZhuceDao();
		zhuce.CustomerZhuce(customerName, customerPwd, Name, customerSex, customerPhone, customerAddress, customerMail);
		request.getRequestDispatcher("login/login.jsp").forward(request, response);
	}
}
