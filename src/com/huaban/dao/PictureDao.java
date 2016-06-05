package com.huaban.dao;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.huaban.model.Picture;
import com.huaban.model.User;

@Repository("pictureDao")
public class PictureDao extends BaseDao<Picture> implements IPictureDao
{

	@Override
	public void deleteByUserId(int uid)
	{
		Picture picture = new Picture();
		picture=(Picture) getSession().createCriteria(User.class).add(Restrictions.eq("id", uid)).list().get(0);
		getSession().delete(picture);
	}

}
