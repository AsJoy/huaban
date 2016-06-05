package com.huaban.service;

import com.huaban.model.Pager;
import com.huaban.model.Picture;

public interface IPictureService
{
	public void add( Picture picture);
	public void delete(Picture picture);
	public void update(Picture picture);
	public Picture load(int id);
	public Pager<Picture> list(String commont);
	public Pager<Picture> list(int uid);
	public Pager<Picture> listAll();
	public void deleteByUSerId(int uid);
	
}
