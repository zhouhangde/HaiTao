package com.haitao.servlet;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.CustomerLoginDao;
import com.haitao.dao.ProductSearchDao;
import com.haitao.dao.ShoppingCartDao;
import com.haitao.dao.salesDao;
import com.haitao.entity.CustomerLogin;
import com.haitao.entity.Products;
import com.haitao.entity.ShoppingCart;
import com.haitao.service.CustomerLoginService;

public class ByServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		ShoppingCartDao shop=new ShoppingCartDao();
		 
		String customerName=String.valueOf(request.getSession().getAttribute("customerL"));
		String shoppingCartID=request.getParameter("shoppingCartID");
		ShoppingCart shops=shop.SelectShopping(Integer.valueOf(shoppingCartID));
		
		
		String productName=shops.getProductName();
		
		
		String productPrice=shops.getProductPrice();
		String buyPrice=shops.getBuyPrice();
		String discount=shops.getDiscount();
		Integer saleCount=shops.getProductNum();
		String productId=shops.getProductId();
		  
		
		CustomerLoginService customer = new CustomerLoginService();
		CustomerLogin customers=new CustomerLogin();
		customers=customer.SelectAllCustomers(customerName);
		
		String money=customers.getCustomerMoney();
		salesDao sd=new salesDao();
		String saleTime=format.format(cal.getTime());
		
		
		
		ProductSearchDao psd=new ProductSearchDao();
		Products products=psd.selectProduct(productId);
		Integer kc=products.getProductNum();
		
		Integer productNum=kc-Integer.valueOf(saleCount);
		System.out.println(kc);
		System.out.println(saleCount);
		System.out.println(productNum);
		
		if(Float.valueOf(money)>=Float.valueOf(buyPrice)){
			int i=sd.add(customerName, productName, productPrice, buyPrice, discount, String.valueOf(saleCount), saleTime,productId);
			if(i==1){
			Float customeMoney=Float.valueOf(money)-Float.valueOf(buyPrice);
			psd.updateProducts(productId, productNum);
			CustomerLoginDao cld=new CustomerLoginDao();
			cld.updateMoney(customerName, String.valueOf(customeMoney));
			}
			
		}
		response.sendRedirect("memberServlet");
	}


}
