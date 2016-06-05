package com.huaban.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="t_picture")
public class Picture 
{
	private int id;
	private String name;
	private int width;
	private int height;
	private String comment;
	private Date createTime;
	private User user;
	
	@Id
	@GeneratedValue
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getWidth()
	{
		return width;
	}
	public void setWidth(int width)
	{
		this.width = width;
	}
	public int getHeight()
	{
		return height;
	}
	public void setHeight(int height)
	{
		this.height = height;
	}
	public String getComment()
	{
		return comment;
	}
	public void setComment(String comment)
	{
		this.comment = comment;
	}
	public Date getCreateTime()
	{
		return createTime;
	}
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="u_id")
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	public Picture(int id, String name, int width, int height, String comment,
			Date createTime)
	{
		super();
		this.id = id;
		this.name = name;
		this.width = width;
		this.height = height;
		this.comment = comment;
		this.createTime = createTime;
	}
	
	public Picture()
	{
	}
	
	

}
