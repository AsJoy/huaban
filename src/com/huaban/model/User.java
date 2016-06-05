package com.huaban.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


@Entity
@Table(name="t_user")
public class User
{
	private int id;
	private String username;
	private String password;
	private String nickname;
	private String motto;
	private String selfpic;
//	0表示普通会员 1表示管理员
//	注册的都是普通会员 
//	管理员直接在数据库指定
	private int type;
	private List<Picture> pictures;
	
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
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getMotto()
	{
		return motto;
	}
	public void setMotto(String motto)
	{
		this.motto = motto;
	}
	public String getSelfpic()
	{
		return selfpic;
	}
	public void setSelfpic(String selfpic)
	{
		this.selfpic = selfpic;
	}
	
	@OneToMany(mappedBy="user",fetch=FetchType.LAZY)
	@LazyCollection(LazyCollectionOption.EXTRA)
	public List<Picture> getPictures()
	{
		return pictures;
	}
	public void setPictures(List<Picture> pictures)
	{
		this.pictures = pictures;
	}
	
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public User()
	{
	}
	
	
}
