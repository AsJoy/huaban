package com.huaban.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.huaban.dao.IPictureDao;
import com.huaban.dao.IUserDao;
import com.huaban.model.Pager;
import com.huaban.model.User;

@Service("userService")
public class UserService implements IUserService
{

	private IUserDao userDao; 
	private IPictureDao pictureDao;
	
	public IUserDao getUserDao()
	{
		return userDao;
	}
	@Resource
	public void setUserDao(IUserDao userDao)
	{
		
		this.userDao = userDao;
	}
	
	public IPictureDao getPictureDao()
	{
		return pictureDao;
	}
	@Resource
	public void setPictureDao(IPictureDao pictureDao)
	{
		this.pictureDao = pictureDao;
	}
	
	@Override
	public void addUser(User u)
	{	
		String Hql = "select count(*) from User u where u.username = ? and u.password = ?";
		String args[] = new String[]{u.getUsername(),u.getPassword()};
		Long count = userDao.count(Hql, args);
		if(count==null||count==0){
			userDao.add(u);
		}
	}

	@Override
	public void delete(int id)
	{
		User user = userDao.load(id);
		userDao.delete(user);
	}
	@Override
	public void updata(User u)
	{
		userDao.update(u);
	}

	@Override
	public User Load(int id)
	{
		return userDao.load(id);
	}
	@Override
	public User login(String username, String password)
	{
		
		return userDao.login(username, password);
		
	}
	@Override
	public Pager<User> pagerlist()
	{
		return userDao.pagerAll("from User");
	}
	
}
