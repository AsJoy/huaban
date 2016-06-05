package com.huaban.test;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.huaban.service.PictureService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/beans.xml")
public class TestStr
{
	private PictureService pictureService;

	@Test
	public void test(){
		File file = new File("D:\\Java\\图标\\图片\\1.jpg");
		try
		{
			FileInputStream fis = new FileInputStream(file);
			BufferedImage bufferedImg = ImageIO.read(fis);
			int imgWidth = bufferedImg.getWidth();
			int imgHeight = bufferedImg.getHeight();
			System.out.println(imgWidth+"height"+imgHeight);
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}

	}
	
	@Test 
	public void testUUID(){
		
		//System.out.println(UUIDUtil.getShortUuid());
		/*String str = "123123";
		str = str.substring(0,str.length()-1);
		System.out.println(str);
		*/
		
		try
		{
			pictureService.deleteByUSerId(74);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public PictureService getPictureService()
	{
		return pictureService;
	}
	@Resource
	public void setPictureService(PictureService pictureService)
	{
		this.pictureService = pictureService;
	}
	
	
}
