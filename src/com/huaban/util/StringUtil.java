package com.huaban.util;

public class StringUtil
{
	public static String getfiletype(String fileName){
		StringBuffer str = new StringBuffer(fileName);
		int i = str.lastIndexOf(".");
		String s = str.substring(i);
		return s;
	}
}
