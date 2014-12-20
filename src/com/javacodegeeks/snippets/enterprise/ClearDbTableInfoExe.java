package com.javacodegeeks.snippets.enterprise;

import java.util.Date;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.javacodegeeks.snippets.enterprise.dao.ClearDbTableInfoDao;
import com.javacodegeeks.snippets.enterprise.util.DateUt;

public class ClearDbTableInfoExe {
		
	
	public static void main(String[] args) {
		/*
			程序运行逻辑：squid_log_analyse中的数据不断增加，此程序定时运行清除表中的数据，
			如20141028的某一时刻运行则清除20141027这一天的数据，(今天清掉昨天的数据)
			此程序每天定时执行（Linxu crontab），
			即可使squid_log_analyse表中仅保留一天数据，达到 表 瘦身的效果。
		*/
		ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		ClearDbTableInfoDao clearDbTableInfoDao = (ClearDbTableInfoDao)context.getBean("clearDbTableInfoDao");
		try {
			clearDbTableInfoDao.clearDbTableInfo();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(DateUt.getFromatedDate(new Date(), "yyyy-MM-dd HH:mm:ss")+"清理squid_log_analyse表程序执行失败。错误信息:"+e.getMessage());
			System.out.println("---------------------------------");	
		}
	}
	
	
}
