package com.huaban.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.huaban.model.Pager;
import com.huaban.util.PagerThreadLocal;


public class BaseDao<T> implements IBasedao<T>
{

	private SessionFactory sessionFactory;
	private Class<T> cls;
	
	public SessionFactory getSessionFactory()
	{
		return sessionFactory;
	}
	
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	private Class<T> getcls(){
		if(cls==null){
			cls = ((Class<T>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		
		return cls;
	}
	
	@Override
	public void add(T t)
	{
		getSession().save(t);
		
	}

	@Override
	public void delete(T t)
	{
		getSession().delete(t);
	}

	@Override
	public void update(T t)
	{
		getSession().update(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T load(int id)
	{
		
		return (T) getSession().load(getcls(), id);
	}

	@Override
	public List<T> listAll(String Hql)
	{
		return list(Hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> list(String Hql, Object[] args)
	{
		Query query = getSession().createQuery(Hql);
		for(int i=0; args!=null&i< args.length; i++ ){
			query.setParameter(i, args[i]);
		}
		return query.list();
	}

	@Override
	public List<T> list(String Hql, Object arg)
	{
		return list(Hql, new Object[]{arg});
	}

	@Override
	public Pager<T> pagerAll(String Hql)
	{
		return pager(Hql, null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pager<T> pager(String Hql, Object[] args)
	{
		Query query = getSession().createQuery(Hql);
		Pager<T> pager = new Pager<T>();
		int pageOffset = PagerThreadLocal.getPageroffset();
		int pageSize = PagerThreadLocal.getPagerSize();
		
		String Hql1 = getCountSql(Hql);
		System.out.println(Hql+"--"+Hql1);
		Query query2 = getSession().createQuery(Hql1);
		if(args!=null){
			for(int i = 0; i < args.length ; i++){
				query.setParameter(i, args[i]);
				query2.setParameter(i, args[i]);
				
			}
		}
		Long pageCouunt = (Long)query2.uniqueResult();
		query.setFirstResult(pageOffset);
		query.setMaxResults(pageSize);
		pager.setObjs(query.list());
		pager.setPagerSize(pageSize);
		pager.setPageOffset(pageOffset);
		pager.setPageCount(pageCouunt);
		
		return pager;
	}

	@Override
	public Pager<T> pager(String Hql, Object ars)
	{
		return pager(Hql, new Object[]{ars});
	}
	
	public String getCountSql(String Hql){
		int index = Hql.indexOf("from");
		Hql = "select count(*) "+Hql.substring(index);
		return Hql;
	}

	@Override
	public Long countAll(String Hql)
	{
		
		return count(Hql, null);
	}

	@Override
	public Long count(String hql, Object[] args)
	{
		Query query = getSession().createQuery(hql);
		if(args!=null){
			for(int i =0 ; i < args.length ; i++){
				query.setParameter(i, args[i]);
			}
		}
		
		return (Long)query.uniqueResult();
	}

	@Override
	public Long count(String hql, Object args)
	{
		return count(hql, new Object[]{args});
	}

}
