package com.huaban.test;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huaban.dao.IPictureDao;
import com.huaban.dao.IUserDao;
import com.huaban.model.Picture;
import com.huaban.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class ModelTest
{
	private IUserDao userDao;
	private IPictureDao pictureDao;
	@Test
	public void testadd(){
		

		
		User u = new User();
		u.setUsername("lazybody");
		u.setPassword("123");
		u.setNickname("哼唧哼唧");
		u.setMotto("谁不哼是小狗");
		userDao.add(u);
		Picture picture = new Picture();
		picture.setName("哼哼");
		picture.setWidth(200);
		picture.setHeight(200);
		picture.setCreateTime(new Date());
		picture.setComment("哼唧哼唧");
		picture.setUser(u);
		pictureDao.add(picture);
		
	}

	public IUserDao getUserDao()
	{
		return userDao;
	}
	@Resource(name="userDao")
	public void setUserDao(IUserDao userDao)
	{
		this.userDao = userDao;
	}

	public IPictureDao getPictureDao()
	{
		return pictureDao;
	}

	@Resource(name="pictureDao")
	public void setPictureDao(IPictureDao pictureDao)
	{
		this.pictureDao = pictureDao;
	}


}
