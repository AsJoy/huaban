package com.huaban.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.huaban.dao.IPictureDao;
import com.huaban.dao.IUserDao;
import com.huaban.model.Pager;
import com.huaban.model.Picture;

@Service("pictureService")
public class PictureService implements IPictureService
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
	public void add(Picture picture)
	{
		pictureDao.add(picture);
		
	}

	@Override
	public void delete(Picture picture)
	{
		pictureDao.delete(picture);
	}

	@Override
	public void update(Picture picture)
	{
		pictureDao.update(picture);
	}

	@Override
	public Picture load(int id)
	{
		return pictureDao.load(id);
	}



	@Override
	public Pager<Picture> list(int uid)
	{
		String Hql = " from Picture p where p.user.id = ? order by p.createTime desc";
		
		return pictureDao.pager(Hql, uid);
	}
	@Override
	public Pager<Picture> list(String commont)
	{
		String Hql = " from Picture p where p.comment like ? or p.user.nickname like ? order by p.createTime desc";
		String args[] = new String[]{"%"+commont+"%","%"+commont+"%"};
		return pictureDao.pager(Hql, args);
	}
	@Override
	public Pager<Picture> listAll()
	{
		String Hql = " from Picture p order by p.createTime desc";
		return pictureDao.pager(Hql,null);
	}
	@Override
	public void deleteByUSerId(int uid)
	{
		pictureDao.deleteByUserId(uid);
		
	}

}
