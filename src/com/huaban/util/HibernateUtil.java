package com.huaban.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil
{
	private HibernateUtil(){};
	
	private final static SessionFactory FACTORY = HibernateUtil.getFactory();
	
	private static SessionFactory getFactory(){
		
		Configuration configuration = new Configuration().configure();
		
		ServiceRegistry registry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		
		return configuration.buildSessionFactory(registry);
		
	}
	
	public static Session getsession(){
		
		return FACTORY.openSession();
		
	}
	
	public static void closeSession(Session session ){
		
		if(session!=null) session.close();
		
	}
	
	public  static void rollbackSession(Session session ){
		
		if(session!=null) session.getTransaction().rollback();
		
	}

	
}
