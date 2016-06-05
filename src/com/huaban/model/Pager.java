package com.huaban.model;

import java.util.List;

public class Pager<T>
{
	private int pagerindex;
	private int pagerSize;
	private long pageCount;
	private int pageOffset;
	private String url;
	private List<T> objs;
	public int getPagerindex()
	{
		return pagerindex;
	}
	public void setPagerindex(int pagerindex)
	{
		this.pagerindex = pagerindex;
	}
	public int getPagerSize()
	{
		return pagerSize;
	}
	public void setPagerSize(int pagerSize)
	{
		this.pagerSize = pagerSize;
	}
	public long getPageCount()
	{
		return pageCount;
	}
	public void setPageCount(long pageCount)
	{
		this.pageCount = pageCount;
	}
	public int getPageOffset()
	{
		return pageOffset;
	}
	public void setPageOffset(int pageOffset)
	{
		this.pageOffset = pageOffset;
	}
	public List<T> getObjs()
	{
		return objs;
	}
	public void setObjs(List<T> objs)
	{
		this.objs = objs;
	}
	
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	@Override
	public String toString()
	{
		return "Pager [pagerindex=" + pagerindex + ", pagerSize=" + pagerSize
				+ ", pageCount=" + pageCount + ", pageOffset=" + pageOffset
				+ ", objs=" + objs + "]";
	}
	public Pager(int pagerindex, int pagerSize, long pageCount, int pageOffset,
			List<T> objs)
	{
		super();
		this.pagerindex = pagerindex;
		this.pagerSize = pagerSize;
		this.pageCount = pageCount;
		this.pageOffset = pageOffset;
		this.objs = objs;
	}
	
	public Pager()
	{
	}
	
}
