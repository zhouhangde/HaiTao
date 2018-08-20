package com.haitao.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.haitao.dao.ShoppingCartDao;
import com.haitao.entity.ShoppingCart;
public class ShoppingCartServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ShoppingCartDao shop=new ShoppingCartDao();
		String customerName=String.valueOf(request.getSession().getAttribute("customerL"));
		if(!(customerName.equals("null"))){
		List<ShoppingCart> list=shop.SelectShoppingCart(customerName);
		request.setAttribute("shop", list);
		request.getRequestDispatcher("member/order.jsp").forward(request, response);
		}else{
			response.sendRedirect("login/login.jsp");
		}
	}
}
