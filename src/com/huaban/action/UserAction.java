package com.huaban.action;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.huaban.exception.CaijiException;
import com.huaban.model.Pager;
import com.huaban.model.User;
import com.huaban.service.IPictureService;
import com.huaban.service.IUserService;
import com.huaban.service.PictureService;
import com.huaban.util.PropertiesUtil;
import com.huaban.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<User> 
{

	private IUserService userService;
	private User user;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private IPictureService pictureService;
	
	public String addUser(){
		String str =StringUtil.getfiletype(fileFileName);
		user.setSelfpic("\\logo"+str);
		userService.addUser(user);
		User u = userService.login(user.getUsername(), user.getPassword());
		String userFilename = PropertiesUtil.getFileProperties().getProperty("fileUrl")+u.getId();
		
		String logoFileName = userFilename+"/logo"+str; 
		try
		{
			FileUtils.forceMkdir(new File(userFilename));
			FileUtils.copyFile(file, new File(logoFileName));
			System.out.println(u.getId()+"q123123123123");
			String selfpic= "\\"+u.getId()+"\\logo"+str;
			u.setSelfpic(selfpic);
			u.setType(0);
			userService.updata(u);
			selfpic = PropertiesUtil.getFileProperties().getProperty("apacheUrl")+selfpic;
			u.setSelfpic(selfpic);
			ActionContext.getContext().getSession().put("u", u);
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return "userPicture";
	}
	
	
	
	public String  loginUser(){
		User u = userService.login(user.getUsername(), user.getPassword());
		String selfpic = PropertiesUtil.getFileProperties().getProperty("apacheUrl")+"/"+u.getId()+u.getSelfpic();
		u.setSelfpic(selfpic);
		ActionContext.getContext().getSession().put("u", u);
		return SUCCESS;
	}
//	查看用户
	public String finduser(){
		Pager<User> pager = userService.pagerlist();
		ActionContext.getContext().put("pager", pager);
		String url = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
		pager.setUrl(url);
		return SUCCESS;
	}
	
//	用户管理页面跳转
	public String usermanager(){
		User u = (User)session.get("u");
		if(u==null||u.getType()!=1){
			throw new CaijiException("尚未登录或权限不够");
		}
		Pager<User> pager = userService.pagerlist();
		ActionContext.getContext().put("pager", pager);
		String url = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
		pager.setUrl(url);
		return SUCCESS;
	}

	
	public IUserService getUserService()
	{
		return userService;
	}
	
	@Resource
	public void setUserService(IUserService userService)
	{
		this.userService = userService;
	}

	@Override
	public User getModel()
	{
		if(user==null){
			user = new User(); 
		}
		return user;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	public File getFile()
	{
		return file;
	}

	public void setFile(File file)
	{
		this.file = file;
	}

	public String getFileFileName()
	{
		return fileFileName;
	}

	public void setFileFileName(String fileFileName)
	{
		this.fileFileName = fileFileName;
	}

	public String getFileContentType()
	{
		return fileContentType;
	}

	public void setFileContentType(String fileContentType)
	{
		this.fileContentType = fileContentType;
	}



	public IPictureService getPictureService()
	{
		return pictureService;
	}


	@Resource(name="pictureService")
	public void setPictureService(IPictureService pictureService)
	{
		this.pictureService = pictureService;
	}
	
	
	
}
