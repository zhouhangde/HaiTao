package com.haitao.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.haitao.dao.ProductSearchDao;
import com.haitao.dao.ZhuceDao;
import com.haitao.entity.Products;

public class ProductSearch extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String value=request.getParameter("proName");
		ProductSearchDao psd=new ProductSearchDao();
		List<Products> list =psd.selectProducts(value);
		request.setAttribute("search", list);
		request.getSession().setAttribute("productName", value);
		request.getRequestDispatcher("description.jsp").forward(request, response);
	}

}
