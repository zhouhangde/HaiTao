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
 * ������
 */

public class myfilter implements Filter{

	@Override
	/*servert����ʱ����*/
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	/*���������ص���Ӧurl����������ִ��doFilter()������chain.doFilter()֮ǰ�Ĵ���*/
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		/*��ȡ�ͻ��������request��response����*/
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		if(request.getSession().getAttribute("customerLogin")!=null){
			/*������ת����������������һ�������������һ��ָ������һ��filter�����û��filter�Ǿ������������Դ�� һ��filter����һ����,web.xml ���������˼������м���*/
			chain.doFilter(req, resp);
		}else{
			/*û��sessionʱ�ض���*/
			response.sendRedirect("../login/login.jsp");
		}
	}

	@Override
	/*servert��ʼ��ʱ����*/
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
