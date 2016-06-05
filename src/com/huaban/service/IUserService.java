package com.huaban.service;

import com.huaban.model.Pager;
import com.huaban.model.User;

public interface IUserService
{
	public void addUser(User u);
	public void delete(int id);
	public void updata(User u);
	public User Load(int id);
	public User login(String username,String password);
	public Pager<User> pagerlist();
}
