package com.huaban.dao;

import com.huaban.model.Pager;
import com.huaban.model.Picture;

public interface IPictureDao extends IBasedao<Picture>
{
	public void add(Picture c);
	public void delete(Picture c);
	public void update(Picture c);
	public Pager<Picture> pager(String Hql, Object args[]);
	public Pager<Picture> pager(String Hql, Object args);
	public Long countAll(String Hql);
	public Long count(String hql, Object args[]);
	public Long count(String hql, Object args);
	public void deleteByUserId(int uid);
}
