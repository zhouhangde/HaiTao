package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ShoppingCartDao;

public class updateShoppingCart extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ShoppingCartDao shop=new ShoppingCartDao();
		Integer shoppingCartID=Integer.valueOf(request.getParameter("shoppingCartID"));
		Integer productNum=Integer.valueOf(request.getParameter("text_box"));
		shop.updateShoppingCartCount(productNum, shoppingCartID);
	}

}
