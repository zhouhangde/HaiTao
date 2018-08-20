package com.haitao.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ShoppingCartDao;

public class addToShoppingCart extends HttpServlet {

	@Override
	/*��servlet��Ĭ������£���������get����post �ύ���� ���ᾭ��service��������������Ȼ��ת��doGet 
	����doPost����*/
	/*�յ��ͷ��������service����request�����response����doGet()����Ϊ�ͻ���Ϊget����*/
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String customerName=String.valueOf(request.getSession().getAttribute("customerL"));
		if(!(customerName.equals("null"))){
		/*getParameter��ȡ�����еĲ���*/
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
