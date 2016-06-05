package com.huaban.dao;

import java.util.List;

import com.huaban.model.Pager;

public interface IBasedao<T>
{
	public void add(T t);
	public void delete(T t);
	public void update(T t);
	public T load(int id);
	public List<T> listAll(String Hql);
	public List<T> list(String Hql, Object args[]);
	public List<T> list(String Hql,Object arg);
	public Pager<T> pagerAll(String Hql);
	public Pager<T> pager(String Hql,Object args[]);
	public Pager<T> pager(String Hql, Object ars);
	public Long countAll(String Hql);
	public Long count(String hql, Object args[]);
	public Long count(String hql, Object args);
	
}
