package com.huaban.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.huaban.exception.CaijiException;
import com.huaban.model.Pager;
import com.huaban.model.Picture;
import com.huaban.model.User;
import com.huaban.service.IPictureService;
import com.huaban.service.IUserService;
import com.huaban.util.ImginfoUtil;
import com.huaban.util.PropertiesUtil;
import com.huaban.util.StringUtil;
import com.huaban.util.UUIDUtil;
import com.opensymphony.xwork2.ActionContext;

@Controller("pictureAction")
@Scope("prototype")
public class PictureAction extends BaseAction
{
	private IPictureService pictureService;
	private File picFile;
	private String picFileFileName;
	private String picFileContentType;
	private Picture picture;
	private String bJudge;
	private Pager<Picture> pager;
//	检索的值
	private String seachValue;
//	通过ajax再次获取到检索的值
	private String sSelectvalue;
	private int uid;
	private IUserService userService;
	
	public String addPicTure(){
		
		ImginfoUtil.setHeightWidth(picFile, picture);
		User u = (User)ActionContext.getContext().getSession().get("u");
		Date createdate = new Date();
		picture.setCreateTime(createdate);
		picture.setUser(u);
		
		String imgname = UUIDUtil.getShortUuid() + StringUtil.getfiletype(picFileFileName);
		String path = PropertiesUtil.getFileProperties().getProperty("fileUrl")+u.getId()+"\\";
		String name = "\\"+u.getId()+"\\"+imgname;
		picture.setName(name);
		try
		{
			FileUtils.copyFile(picFile, new File(path+imgname));
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		pictureService.add(picture);
		bJudge = "success";
		return "ajax";
	}
	
	public String userPictureList(){
		User u = (User)ActionContext.getContext().getSession().get("u");
		pager = pictureService.list(u.getId());
		String url = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
		pager.setUrl(url);
		return SUCCESS;
	}
	
	public String pictureList(){
		sSelectvalue = request.getParameter("sSelectvalue");
		if(sSelectvalue==null||"".equals(sSelectvalue)){
			pager = pictureService.listAll();
		}else{
			pager= pictureService.list(sSelectvalue);
			ActionContext.getContext().put("selectvalue", sSelectvalue);
		}
		String url = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
		pager.setUrl(url);
		return SUCCESS;
	}
	
	public String findpictureList(){
		ActionContext.getContext().put("selectvalue", seachValue);
		return SUCCESS;
	}
	
//	设置commonuser跳转参数
	public String commonUserPicture(){
		User u = userService.Load(uid);
		String selfpic = PropertiesUtil.getFileProperties().getProperty("apacheUrl")+u.getSelfpic();
		u.setSelfpic(selfpic);
		ActionContext.getContext().put("user", u);
		ActionContext.getContext().put("uid", uid);
		return SUCCESS;
	}
//	设置commonuser的pager
	public String commonUserPictureList(){
		try
		{
			int svalue = Integer.parseInt(request.getParameter("svalue"));
			pager= pictureService.list(svalue);
			String url = PropertiesUtil.getFileProperties().getProperty("apacheUrl");
			pager.setUrl(url);
		} catch (NumberFormatException e)
		{
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
//	删除图片
	public String delepic(){
		try
		{
			int pid = Integer.parseInt(request.getParameter("pid"));
			Picture p = pictureService.load(pid);
			String fileurl = PropertiesUtil.getFileProperties().getProperty("fileUrl");
			String srdfile = fileurl.substring(0,fileurl.length()-1)+p.getName();
			try
			{
				FileUtils.forceDelete(new File(srdfile));
				pictureService.delete(p);
			} catch (IOException e)
			{
				e.printStackTrace();
				return ERROR;
			}
		} catch (NumberFormatException e)
		{
			e.printStackTrace();
		}
		
		
		
		return SUCCESS;
	}
	
//	更新用户的picture对象的跳转
	public String updatepicreforward(){
		if(ActionContext.getContext().getSession().get("u")==null){
			 throw new CaijiException("请先登录用户");
		}
		try
		{
			int id = Integer.parseInt(request.getParameter("pid"));
			Picture p = pictureService.load(id);
			ActionContext.getContext().put("picture", p);
			ActionContext.getContext().put("url", PropertiesUtil.getFileProperties().getProperty("apacheUrl"));
		} catch (NumberFormatException e)
		{
			e.printStackTrace();
		}
		return SUCCESS;
	}

	//更新picture对象
	public String updatePics(){
		String picname = request.getParameter("picname");
		String dir = PropertiesUtil.getFileProperties().getProperty("fileUrl");
		dir = dir.substring(0, dir.length()-1)+picname;
		File f = new File(dir);
		try
		{
			FileUtils.forceDelete(f);
			FileUtils.copyFile(picFile, f);
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return SUCCESS;
	}
//	修改用户的图片信息
	public String updatePicAction(){
		Picture p = pictureService.load(picture.getId());
		p.setComment(picture.getComment());
		p.setCreateTime(new Date());
		pictureService.update(p);
		return SUCCESS;
	}
	
	public Pager<Picture> getPager()
	{
		return pager;
	}

	public void setPager(Pager<Picture> pager)
	{
		this.pager = pager;
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
	
	public File getPicFile()
	{
		return picFile;
	}
	public void setPicFile(File picFile)
	{
		this.picFile = picFile;
	}
	
	@JSON(serialize=false)  
	public String getPicFileFileName()
	{
		return picFileFileName;
	}
	public void setPicFileFileName(String picFileFileName)
	{
		this.picFileFileName = picFileFileName;
	}
	
	@JSON(serialize=false)  
	public String getPicFileContentType()
	{
		return picFileContentType;
	}
	public void setPicFileContentType(String picFileContentType)
	{
		this.picFileContentType = picFileContentType;
	}

	
	@JSON(serialize=false)  
	public Picture getPicture()
	{
		return picture;
	}

	public void setPicture(Picture picture)
	{
		this.picture = picture;
	}

	public String getbJudge()
	{
		return bJudge;
	}

	public void setbJudge(String bJudge)
	{
		this.bJudge = bJudge;
	}
	
	@JSON(serialize=false)
	public String getSeachValue()
	{
		return seachValue;
	}

	public void setSeachValue(String seachValue)
	{
		this.seachValue = seachValue;
	}
	
	public String getsSelectvalue()
	{
		return sSelectvalue;
	}

	public void setsSelectvalue(String sSelectvalue)
	{
		this.sSelectvalue = sSelectvalue;
	}
	
	@JSON(serialize=false) 
	public int getUid()
	{
		return uid;
	}
	
	public void setUid(int uid)
	{
		this.uid = uid;
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
	
	
	

}
