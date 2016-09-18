package com.yc.law.listener;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.law.entity.User;

public class RequestURLListenerImpl implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		User user=(User)request.getSession().getAttribute("user");
		PrintWriter out = response.getWriter();
		if(user==null||user.getUsid()==0){
			out.print("<script>"
					+ "$.messager.confirm('提示信息','登陆超时...',function(r){  "
					+ "	    if (r){  "
					+ "	       location.href='back/login.jsp'"  
					+ "	    }  "
					+ "	}); "
					+ "</script>");
			return;
		}
		arg2.doFilter(arg0, arg1);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
