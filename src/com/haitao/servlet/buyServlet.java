package com.haitao.servlet;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.CustomerLoginDao;
import com.haitao.dao.ManagerLoginDao;
import com.haitao.dao.ProductSearchDao;
import com.haitao.dao.salesDao;
import com.haitao.entity.CustomerLogin;
import com.haitao.service.CustomerLoginService;

public class buyServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		salesDao sd=new salesDao();
		String buy=request.getParameter("buy");
		CustomerLoginService customer = new CustomerLoginService();
		CustomerLogin customers=new CustomerLogin();
        /*Calendar.getInstance()获取当天指定点上的时间*/
		Calendar cal=Calendar.getInstance();
		/*格式化时间为24小时制的*/
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String productId=request.getParameter("spbh");
		String customerName=String.valueOf(request.getSession().getAttribute("customerL"));
		String productName=request.getParameter("spm");
		String productPrice=request.getParameter("yj");
		String buyPrice=request.getParameter("zhj");
		
		String kc=request.getParameter("kc");
		String saleCount=request.getParameter("text_box");
		if(buy!=null){
		if( customerName.equals("null")){
			response.sendRedirect("login/login.jsp");
		}else{
			customers=customer.SelectAllCustomers(customerName);
			String money=customers.getCustomerMoney();
			Float disc=Float.valueOf(productPrice)-Float.valueOf(buyPrice);
			String discount=String.valueOf(disc);
			
			Integer productNum=Integer.valueOf(kc)-Integer.valueOf(saleCount);
			//返回格式化后的时间
			String saleTime=format.format(cal.getTime());
			if(Float.valueOf(money)>=Float.valueOf(buyPrice)){
				int i=sd.add(customerName, productName, productPrice, buyPrice, discount, saleCount, saleTime,productId);
				if(i==1){
				Float customeMoney=Float.valueOf(money)-Float.valueOf(buyPrice);
				ProductSearchDao psd=new ProductSearchDao();
				psd.updateProducts(productId, productNum);
				CustomerLoginDao cld=new CustomerLoginDao();
				cld.updateMoney(customerName, String.valueOf(customeMoney));
				}
				
			}
			response.sendRedirect("memberServlet");
		}
	}else{
		request.getRequestDispatcher("addToShoppingCart").forward(request, response);
	}
		
	}
}
