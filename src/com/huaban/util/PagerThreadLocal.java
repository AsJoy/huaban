package com.huaban.util;

public class PagerThreadLocal
{
	private static ThreadLocal<Integer> pagerindex = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pagerSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageroffset = new ThreadLocal<Integer>();
	private static ThreadLocal<Long> pagerAcount = new ThreadLocal<Long>();
	
	public static int getPagerindex()
	{
		return pagerindex.get();
	}
	public static void setPagerindex(int _pagerindex)
	{
		pagerindex.set(_pagerindex);
	}
	public static void removePagerindex()
	{
		pagerindex.remove();
	}
	
	public static int getPagerSize()
	{
		return pagerSize.get();
	}
	public static void setPagerSize(int _pagercount)
	{
		pagerSize.set(_pagercount);
	}
	
	public static void removePagerSize()
	{
		pagerSize.remove();
	}

	
	public static int getPageroffset()
	{
		return pageroffset.get();
	}
	
	public static void setPageroffset(int _pageroffset)
	{
		PagerThreadLocal.pageroffset.set(_pageroffset);
	}
	
	public static void removePageroffset()
	{
		PagerThreadLocal.pageroffset.remove();
	}
	
	public static Long getPagerAcount()
	{
		return pagerAcount.get();
	}
	public static void setPagerAcount(Long _pagerAcount)
	{
		PagerThreadLocal.pagerAcount.set(_pagerAcount);
	}
	
	public static void removePagerAcount()
	{
		PagerThreadLocal.pagerAcount.remove();
	}
	
	
	
	
}
