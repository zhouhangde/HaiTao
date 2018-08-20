package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ShoppingCartDao;

public class DeleteShoppingCart extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ShoppingCartDao shop=new ShoppingCartDao();
		String shoppingCartID=request.getParameter("shoppingCartID");
		shop.DeleteShoppingCart(Integer.valueOf(shoppingCartID));
		response.sendRedirect("ShoppingCartServlet");
	}
}
