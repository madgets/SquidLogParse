package com.javacodegeeks.snippets.enterprise;

import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.javacodegeeks.snippets.enterprise.dao.GetDataIoIntoDbDao;
import com.javacodegeeks.snippets.enterprise.dao.LogInfoSecondStorageDao;
import com.javacodegeeks.snippets.enterprise.util.DateUt;



public class LogInfoSecondStorageExe {
	
	public static void main(String[] args) throws ParseException {
		
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		LogInfoSecondStorageDao logInfoSecondStorageDao = (LogInfoSecondStorageDao)context.getBean("logInfoSecondStorageDao");
		try {
			logInfoSecondStorageDao.organizeDataToDb();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(DateUt.getFromatedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"执行入库操作失败。错误信息:"+e.getMessage());
			System.out.println("---------------------------------");	
		}
	}
	
}
