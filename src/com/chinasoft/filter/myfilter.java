package com.chinasoft.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author Administrator
 * 过滤器
 */

public class myfilter implements Filter{

	@Override
	/*servert销毁时调用*/
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	/*过滤器拦截到响应url的请求后会先执行doFilter()方法中chain.doFilter()之前的代码*/
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		/*获取客户端请求的request和response对象*/
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		if(request.getSession().getAttribute("customerLogin")!=null){
			/*将请求转发给过滤器链上下一个对象。这里的下一个指的是下一个filter，如果没有filter那就是你请求的资源。 一般filter都是一个链,web.xml 里面配置了几个就有几个*/
			chain.doFilter(req, resp);
		}else{
			/*没有session时重定向*/
			response.sendRedirect("../login/login.jsp");
		}
	}

	@Override
	/*servert初始化时调用*/
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
