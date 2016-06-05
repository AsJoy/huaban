package com.huaban.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.huaban.model.Picture;

public class ImginfoUtil
{
	public static void setHeightWidth( File file, Picture picture){
		try
		{
			FileInputStream fis = new FileInputStream(file);
			BufferedImage bufferedImg = ImageIO.read(fis);
			
			int imgWidth = bufferedImg.getWidth();
			int imgHeight = bufferedImg.getHeight();
			picture.setWidth(imgWidth);
			picture.setHeight(imgHeight);
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		
	}
}
