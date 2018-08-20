package com.haitao.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.haitao.entity.CustomerLogin;
import com.haitao.service.ManagerLoginService;

public class ManagerLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ManagerLoginService manager = new ManagerLoginService();
		
		HttpSession session = request.getSession();
		String adminName = request.getParameter("adminName");
		String adminPwd = request.getParameter("adminPwd");
		if(adminName !=null && adminPwd!=null){
			int i =manager.SelectAllManager(adminName, adminPwd);
			if(i==1){
				session.setAttribute("login",adminName);
				request.getRequestDispatcher("manager.jsp").forward(request, response);
			}else{
				response.sendRedirect("index.jsp");
			}
			
		}
		
	}
	

}
