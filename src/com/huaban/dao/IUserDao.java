package com.huaban.dao;

import com.huaban.model.User;

public interface IUserDao extends IBasedao<User>
{
	public void add(User u);
	public void update(User u);
	public void delete(User u);
	public User load(int id);
	public User login(String username, String password);
}
