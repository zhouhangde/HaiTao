package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ShoppingCartDao;

public class addToShoppingCart extends HttpServlet {

	@Override
	/*在servlet中默认情况下，无论你是get还是post 提交过来 都会经过service（）方法来处理，然后转向到doGet 
	或是doPost方法*/
	/*收到客服端请求后，service创建request对象和response对象，doGet()依据为客户端为get请求*/
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String customerName=String.valueOf(request.getSession().getAttribute("customerL"));
		if(!(customerName.equals("null"))){
		/*getParameter获取请求中的参数*/
		String productName=request.getParameter("spm");
		String productPrice=request.getParameter("yj");
		String buyPrice=request.getParameter("zhj");
		String kc=request.getParameter("kc");
		Float disc=Float.valueOf(productPrice)-Float.valueOf(buyPrice);
		String discount=String.valueOf(disc);
		String saleCount=request.getParameter("text_box");
		ShoppingCartDao scd=new ShoppingCartDao();
		scd.addShoppingCartCount(customerName, productName, Integer.valueOf(saleCount), productPrice, buyPrice, discount);
		response.sendRedirect("ShoppingCartServlet");
		}else{
			response.sendRedirect("login/login.jsp");
		}
	}
	
}
