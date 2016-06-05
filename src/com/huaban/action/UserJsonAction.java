package com.huaban.action;

import java.io.File;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.huaban.model.Picture;
import com.huaban.model.User;
import com.huaban.service.IPictureService;
import com.huaban.service.IUserService;
import com.huaban.service.PictureService;
import com.huaban.util.PropertiesUtil;
import com.huaban.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("userJsonAction")
@Scope("prototype")
public class UserJsonAction extends ActionSupport
{

	private IUserService userService;
	private User user;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private Map<String, Object> jsonMap;
	private IPictureService pictureService;
	
	public String update(){

		User u = (User)ActionContext.getContext().getSession().get("u");
		user.setId(u.getId());
		String aPacheurl = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
		String str = u.getSelfpic();
		user.setSelfpic(str.replace(aPacheurl, ""));
		userService.updata(user);
		user.setSelfpic(str);
		ActionContext.getContext().getSession().put("u", user);
		return SUCCESS;
	}
	
	public String updatePhoto(){

		User u = (User)ActionContext.getContext().getSession().get("u");
		String userFilename = PropertiesUtil.getFileProperties().getProperty("fileUrl")+u.getId();
		String str =StringUtil.getfiletype(fileFileName);
		String logoFileName = userFilename+"/logo"+str;
		try
		{
			FileUtils.forceDelete(new File(logoFileName));
			FileUtils.copyFile(file, new File(logoFileName));
	
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
//	用户删除
	public String deleteuser(){
		/*int id = Integer.parseInt(request.getParameter("id"));
		User u = userService.Load(id);
		for( Picture pic : u.getPictures()){
			pictureService.delete(pic);
		}
		userService.delete(id);
		String dirFile = PropertiesUtil.getFileProperties().getProperty("fileUrl")+id;
		try
		{
			FileUtils.deleteDirectory(new File(dirFile));
		} catch (IOException e)
		{
			e.printStackTrace();
		}*/
		String uid = ServletActionContext.getRequest().getParameter("uid");
		int id = Integer.parseInt(uid);
		User u = userService.Load(id);
		List<Picture> pictures = u.getPictures();
		for( int i= 0 ; pictures!=null && i < pictures.size();i++  ){
			Picture pic = pictures.get(i);
			pictureService.delete(pic);
		}
		userService.delete(id);
		
		String dirFile = PropertiesUtil.getFileProperties().getProperty("fileUrl")+id;
		File f = new File(dirFile);
		if(f.isDirectory()){
			try
			{
				FileUtils.deleteDirectory(f);
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		jsonMap = new HashMap<String, Object>();
		jsonMap.put("msg", "成功");
		
		return SUCCESS;
	}

	@JSON(serialize=false)
	public IUserService getUserService()
	{
		return userService;
	}
	
	@Resource
	public void setUserService(IUserService userService)
	{
		this.userService = userService;
	}

	@JSON(serialize=false)
	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@JSON(serialize=false)
	public File getFile()
	{
		return file;
	}

	public void setFile(File file)
	{
		this.file = file;
	}
	
	@JSON(serialize=false)
	public String getFileFileName()
	{
		return fileFileName;
	}

	public void setFileFileName(String fileFileName)
	{
		this.fileFileName = fileFileName;
	}
	
	@JSON(serialize=false)
	public String getFileContentType()
	{
		return fileContentType;
	}

	public void setFileContentType(String fileContentType)
	{
		this.fileContentType = fileContentType;
	}

	public Map<String, Object> getJsonMap()
	{
		return jsonMap;
	}

	public void setJsonMap(Map<String, Object> jsonMap)
	{
		this.jsonMap = jsonMap;
	}
	
	@JSON(serialize=false)
	public IPictureService getPictureService()
	{
		return pictureService;
	}
	
	@Resource
	public void setPictureService(IPictureService pictureService)
	{
		this.pictureService = pictureService;
	}
	
	
	
	
}
