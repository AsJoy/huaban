package com.huaban.util;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil
{
	private static Properties fileProperties;
	
	public static Properties getFileProperties(){
		if(fileProperties==null){
			try
			{
				fileProperties = new Properties();
				fileProperties.load(PropertiesUtil.class.getClassLoader().getResourceAsStream("ImgFileUrl.properties"));
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		return fileProperties;
	}
	
	
}
