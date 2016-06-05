package com.huaban.dao;

import org.springframework.stereotype.Repository;

import com.huaban.exception.CaijiException;
import com.huaban.model.User;

@Repository("userDao")
public class UserDao extends BaseDao<User> implements IUserDao
{

	@Override
	public User login(String username, String password)
	{
		String Hql=" from User where username = ? and password = ?";
		
		User u = (User)getSession().createQuery(Hql)
			.setParameter(0, username)
			.setParameter(1, password)
			.uniqueResult();
		if(u==null){
			throw new CaijiException("用户名不存在或账户不存在");
		}
		return u;
	}
	
}
