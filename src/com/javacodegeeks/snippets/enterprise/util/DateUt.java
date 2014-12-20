package com.javacodegeeks.snippets.enterprise.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DateUt{
	
	public static String getFromatedDate(Date date, String pattern)  {
		SimpleDateFormat dateformat1 = new SimpleDateFormat(pattern);
		return dateformat1.format(date);
	}
	
	
	public static Date strToDate(String dateStr, String pattern) throws ParseException  {
		SimpleDateFormat dateformat1 = new SimpleDateFormat(pattern);
		return dateformat1.parse(dateStr);
	}
}
