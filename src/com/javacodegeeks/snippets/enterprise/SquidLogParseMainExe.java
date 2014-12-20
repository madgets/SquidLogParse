package com.javacodegeeks.snippets.enterprise;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.apache.commons.lang3.time.DateUtils;
//import org.apache.log4j.Logger;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.javacodegeeks.snippets.enterprise.dao.GetDataIoIntoDbDao;

public class SquidLogParseMainExe {
	
	
	public static void main(String[] args) throws IOException, ParseException {
		
		//1读取squidLogParse.properties中的配置信息
		Resource resource = new ClassPathResource("squidLogParse.properties");
		Properties prop = null;
		try {
			prop = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//日志文件路径
		final String filePath = (String) prop.get("squid.parseLog.filepath");
		
		String networcard = (String) prop.get("linux.service.networcard");
		
		
		//2判断日志的时间区间是否合适
		boolean boo = false ;
		try {
			boo =getLastLineVtime(filePath);
		} catch (Exception e) {
			 System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"执行程序失败，错误日志："+e.getMessage());
			 System.out.println("---------------------------------");	
				
	    }
		
		
		if(boo){
			//3定时解析指定路径日志文件并入库
			ConfigurableApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
			final GetDataIoIntoDbDao getDataToDb = (GetDataIoIntoDbDao)context.getBean("getDataIoIntoDbDao");
		/*	try {
				getDataToDb.getDataIoIntoDb(filePath,networcard);
			} catch (Exception e) {
				 
				 //程序报错会把insert语句打印出来 ，但是insert有几万条数据。这些会输出到日志中去，所以对e.getMessage()处理一下
				 String errStr =  e.getMessage().toString();
				 if(errStr.contains("[")&&errStr.contains("]")){
					 errStr = errStr.substring(errStr.indexOf("]"), errStr.length());
				 }
				 System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"执行程序失败，错误日志："+errStr);
				 System.out.println("------------------------------------------------------------------");

			}*/
			
			getDataToDb.getDataIoIntoDb(filePath,networcard);

		}
	}
	
	
	
	/**
	 * 当前为9：10解析日志文件的区间应为 八点整个小时的数据
	 * 
	 * */
	private static boolean getLastLineVtime(String filepath) throws Exception, ParseException{
		// 使用RandomAccessFile , 从后找最后一行数据
		RandomAccessFile raf = new RandomAccessFile(filepath, "r"); //以读的方式打开
		long len = raf.length();
		
		String firstLine = raf.readLine();
		String lastLine = "";
		if (len != 0L) {
		  long pos = len - 1;
		  while (pos > 0) { 
		    pos--;
		    raf.seek(pos);
		    if (raf.readByte() == '\n') {
		      lastLine = raf.readLine();
		      break;
		    }
		  }
		}
		raf.close();
		
		
		Date currentDate = new Date();
		SimpleDateFormat simdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//当前时间 保留小时后，添加分钟为01。
		String currentDateStr = simdf.format(currentDate).substring(0, 14)+"01";
		String currentDateStr2 = simdf.format(currentDate).substring(0, 14)+"00";

		//当前时间减去一小时，截串形如2014-09-23 15:
		String logTimeInTheory   = simdf.format(DateUtils.addHours(currentDate, -1)).substring(0, 14);
		//日志第一行时间 ,截串形如2014-09-23 15:
		String firStLineTIme =firstLine.split("\\s+")[0].replaceAll("T", " ");
		String stOfLogH = firStLineTIme.substring(0, 14);
		//日志末尾一行时间,截串形如2014-09-23 15:01 保留分钟
		String lastLineTime =  lastLine.split("\\s+")[0].replaceAll("T", " ");
		String etOfLogHm = lastLineTime.substring(0, 16);
		//日志末尾一行时间,截串形如2014-09-23 15:
		String etOfLogH = etOfLogHm.substring(0, 14);
		
		if(logTimeInTheory.equals(stOfLogH)&&((logTimeInTheory.equals(etOfLogH))|| currentDateStr.equals(etOfLogHm)||currentDateStr2.equals(etOfLogHm))){
			return true;
		}else{
			 System.out.println(simdf.format(currentDate)+"执行程序，扫描失败，文件日志数据时间校验出错!");
			 System.out.println("------------------------------------------------------------------");
			 return false;
		}
		
		
	}
}
