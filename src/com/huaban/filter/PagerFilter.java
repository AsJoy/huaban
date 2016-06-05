package com.huaban.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.huaban.util.PagerThreadLocal;

public class PagerFilter implements Filter
{
	private int pageSize;
	@Override
	public void destroy()
	{
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException
	{
		PagerThreadLocal.setPagerSize(pageSize);
		try
		{
			try
			{
				String sOffset=request.getParameter("pageOffset");
				if( sOffset ==null||"".equals(sOffset)){
					sOffset=request.getParameter("pager.offset");
				}
				if(sOffset==null||"".equals(sOffset)){
					chain.doFilter(request, response);
				}else{
					int _pageroffset = Integer.parseInt(sOffset);
					PagerThreadLocal.setPageroffset(_pageroffset);
					chain.doFilter(request, response);
				}
			} catch (NumberFormatException e){}
		} finally {
			PagerThreadLocal.removePageroffset();
			PagerThreadLocal.removePagerSize();
		}
		
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{
		try
		{
			pageSize = Integer.parseInt(filterConfig.getInitParameter("pageSize"));
		} catch (NumberFormatException e)
		{
			pageSize=15;
		}
		
	}

}
