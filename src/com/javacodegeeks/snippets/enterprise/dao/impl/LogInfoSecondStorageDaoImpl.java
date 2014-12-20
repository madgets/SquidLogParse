package com.javacodegeeks.snippets.enterprise.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import com.javacodegeeks.snippets.enterprise.dao.LogInfoSecondStorageDao;
import com.javacodegeeks.snippets.enterprise.model.HttpStsMod;
import com.javacodegeeks.snippets.enterprise.util.DateUt;

public class LogInfoSecondStorageDaoImpl implements LogInfoSecondStorageDao {

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	@Override
	public void organizeDataToDb() {
		jdbcTemplate = new JdbcTemplate(dataSource);

		Date date = new Date();
		String timeStrFourLogInfo = getDateStrForQuery(date);
		String nowTime = DateUt.getFromatedDate(date, "yyyy-MM-dd HH:mm:ss");

		// 入库时间信息分割 年 月 日 时 周
		String visitYear = timeStrFourLogInfo.substring(0, 4);
		String visitMonth = timeStrFourLogInfo.substring(5, 7);
		String visitDay = timeStrFourLogInfo.substring(8, 10);
		String visitHour = timeStrFourLogInfo.substring(11, 13);
		int week = getWeekInfo();
		String fromTime = timeStrFourLogInfo + ":00:00";
		String toTime = nowTime.substring(0, 13) + ":00:00";
		String create_time = nowTime;

		 //VV信息 --vv表
		 String sqlforVv ="select count(*) from (select * from squid_log_analyse where left(visit_time,13) = ? )A";
		 Long longVv = jdbcTemplate.queryForObject(sqlforVv,new Object[] { timeStrFourLogInfo },Long.class);
		
		 //UV信息--uv表
		 String sqlforUv ="select count(*) from (select count(1) from squid_log_analyse where left(visit_time,13) = ?  group by Client_ip)A;";
		 Long longUv = jdbcTemplate.queryForObject(sqlforUv,new Object[] { timeStrFourLogInfo }, Long.class);
		 
		 //状态码 --statuscode表
	 	 String sqlforHttpStatus = "select http_status,count(*) as num from squid_log_analyse where left(visit_time,13) = ? group by http_status";
	     List<Map<String, Object>> list = jdbcTemplate.queryForList(sqlforHttpStatus, new Object[] { timeStrFourLogInfo });
	     
	     //ts m3u8--squid_log_tsorm3u8表
	     String sqlforTs   = "select count(*) from squid_log_analyse where tsOr_m3u8='ts' and left(visit_time,13) = ?";
	     String sqlforM3u8 = "select count(*) from squid_log_analyse where tsOr_m3u8='m3u8' and left(visit_time,13) = ?";
		 Long longTs   = jdbcTemplate.queryForObject(sqlforTs,new Object[] { timeStrFourLogInfo }, Long.class);
		 Long longM3u8 = jdbcTemplate.queryForObject(sqlforM3u8,new Object[] { timeStrFourLogInfo }, Long.class);
	     
		 
		 //hit or miss  info
		 String sqlforHitorMiss = "select Squid_status,count(*) as num from squid_log_analyse where left(visit_time,13) = ? group by Squid_status";
	     List<Map<String, Object>> listHitorMiss = jdbcTemplate.queryForList(sqlforHitorMiss, new Object[] { timeStrFourLogInfo });

		 //domainname info
		 String sqlforDomainInfo = "select domain_name,count(*) as num from squid_log_analyse where left(visit_time,13) = ? group by domain_name";
	     List<Map<String, Object>> listDomainInfo = jdbcTemplate.queryForList(sqlforDomainInfo, new Object[] { timeStrFourLogInfo });

	     //总相应时间，总响应大小
	     String sql4replyTotalTime = "select sum(response_time) from squid_log_analyse where left(visit_time,13) = ?";
	     String sql4replyTotalSize = "select sum(size_reply) from squid_log_analyse where  left(visit_time,13) = ?";
	     long replyTotalTime = jdbcTemplate.queryForObject(sql4replyTotalTime,new Object[] { timeStrFourLogInfo }, Long.class);
    	 long replyTotalSize = jdbcTemplate.queryForObject(sql4replyTotalSize,new Object[] { timeStrFourLogInfo }, Long.class);
    	 replyTotalSize = replyTotalSize/1024;//replyTotalSize单位从字节转为KB 20141208
    	 
    	 //code_rate
		 String sqlforcodeRate = "select code_rate,count(*) as num from squid_log_analyse where left(visit_time,13) = ? group by code_rate";
	     List<Map<String, Object>> listforcodeRate = jdbcTemplate.queryForList(sqlforcodeRate, new Object[] { timeStrFourLogInfo });
    	 
    	 
		 if(longVv==null||longVv.intValue()==0||longUv==null||longUv.intValue()==0||list==null||list.size()==0) {
			System.out.println(nowTime + "查询" + fromTime + "至" + toTime+ "区间 UV或VV或状态码信息值为0，程序终止");
			return;
		 }
		//=================================================================================

		 //解析状态码list
		 List<HttpStsMod> listOfSts = new ArrayList<HttpStsMod>();
		 StringBuilder sb = new StringBuilder();
		 for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			HttpStsMod hscode = new HttpStsMod();
			String code =map.get("http_status").toString();
			Long number = Long.parseLong(map.get("num").toString());
			hscode.setStsCode(code);
			hscode.setNum(number);
			sb.append("HttpStatus："+code+" num:"+number+"  ");
			listOfSts.add(hscode);
		 }
		
		 //解析hit or miss List
		 List<HttpStsMod> listhitmiss = new ArrayList<HttpStsMod>();
		 StringBuilder sbhitmiss = new StringBuilder();
		 for (int i = 0; i < listHitorMiss.size(); i++) {
			 Map<String, Object> map = listHitorMiss.get(i);
				HttpStsMod hscode = new HttpStsMod();
				String code =map.get("Squid_status").toString();
				Long number = Long.parseLong(map.get("num").toString());
				hscode.setStsCode(code);
				hscode.setNum(number);
				sbhitmiss.append("(Squid_status："+code+" num:"+number+") ");
				listhitmiss.add(hscode);
		}
		 
		 //解析域名list
		 List<HttpStsMod> listDomainPojo = new ArrayList<HttpStsMod>();
		 StringBuilder sbDomainInfo = new StringBuilder();
		 Long numForDigitDomain = 0L;
		 for (int i = 0; i < listDomainInfo.size(); i++) {
			 Map<String, Object> map = listDomainInfo.get(i);
				
				String code =map.get("domain_name").toString();
				Long number = Long.parseLong(map.get("num").toString());
				if (!code.matches(".*[\\d+\\.]{1,}")) {
					HttpStsMod hscode = new HttpStsMod();
					hscode.setStsCode(code);
					hscode.setNum(number);
					sbDomainInfo.append("(domain_name："+code+" num:"+number+") ");
					listDomainPojo.add(hscode);
				}else{
					numForDigitDomain+=number;
				}
		}
		//域名为数字的 单独处理
		HttpStsMod hscode = new HttpStsMod();
		hscode.setStsCode("otherdomain");
		hscode.setNum(numForDigitDomain);
		listDomainPojo.add(hscode);
		sbDomainInfo.append("(domain_name：otherdomain num:"+numForDigitDomain+") ");
		
		//解析code_rate List
		 List<HttpStsMod> list4codeRate = new ArrayList<HttpStsMod>();
		 StringBuilder sb4codeRate = new StringBuilder();
		 for (int i = 0; i < listforcodeRate.size(); i++) {
			 Map<String, Object> map = listforcodeRate.get(i);
				HttpStsMod hscode1 = new HttpStsMod();
				String code =map.get("code_rate").toString();
				Long number = Long.parseLong(map.get("num").toString());
				hscode1.setStsCode(code);
				hscode1.setNum(number);
				sb4codeRate.append("(code_rate："+code+" num:"+number+") ");
				list4codeRate.add(hscode1);
		}
		//=================================================================================
		
		 //执行插入VV   //执行插入UV信息
		 String sqlInsertVv = "insert into squid_log_vvinfo (`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`, `hour`,`week`,`visit_vv`,`visit_uv`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
		 jdbcTemplate.update(sqlInsertVv, new Object[]{fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week,longVv,longUv});
		 
		 /* 
		  * //执行插入UV信息
		 String sqlInsert =
		 "insert into squid_log_uvinfo(`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`,`hour`,`week`,`visit_uv`) values ( ?,? ,?, ?,? ,?, ?,? ,?)";
		 jdbcTemplate.update(sqlInsert, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week,longUv });
		 */
		
		
		 //执行插入状态码信息
		 String sqlInsertHttpStatus = "insert into squid_log_statcode(`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`,`hour`,`week`,`statcode`,`num`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
		 for (int i = 0; i < listOfSts.size(); i++) {
			jdbcTemplate.update(sqlInsertHttpStatus, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, listOfSts.get(i).getStsCode(),listOfSts.get(i).getNum() });
		 }
		 
		 //执行插入hit miss 信息
		 String sqlInsertHitMiss = "insert into squid_log_hitmiss(`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`,`hour`,`week`,`hitmiss_info`,`num`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
		 for (int i = 0; i < listhitmiss.size(); i++) {
			jdbcTemplate.update(sqlInsertHitMiss, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, listhitmiss.get(i).getStsCode(),listhitmiss.get(i).getNum() });
		 }
		 //执行插入域名 信息
		 String sqlInsertDomain = "insert into squid_log_domain(`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`,`hour`,`week`,`domain_name`,`num`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
		 for (int i = 0; i < listDomainPojo.size(); i++) {
			jdbcTemplate.update(sqlInsertDomain, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, listDomainPojo.get(i).getStsCode(),listDomainPojo.get(i).getNum() });
		 }
		 
		 //插入 ts m3u8信息
		 String sqlInserttsm3u8 = "insert into squid_log_tsorm3u8 (`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`, `hour`,`week`,`ts_num`,`m3u8_num`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
			jdbcTemplate.update(sqlInserttsm3u8, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, longTs,longM3u8 });
		
		 //总相应时间
	     String sqlReplyInfo = "insert into squid_log_serverrpInfo (`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`, `hour`,`week`,`resp_time`,`resp_szie`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
		 jdbcTemplate.update(sqlReplyInfo, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, replyTotalTime,replyTotalSize });
		 
		 //插入code_rate
	     String sqlforcoderate = "insert into squid_log_coderate (`from_time` ,`to_time`,`create_time`,`year`,`month`,`day`, `hour`,`week`,`code_rate`,`num`) values ( ?,? ,?, ?,? ,?, ?,? ,?,?)";
	     for (int i = 0; i < list4codeRate.size(); i++) {
				jdbcTemplate.update(sqlforcoderate, new Object[] {fromTime,toTime,create_time,visitYear,visitMonth,visitDay,visitHour,week, list4codeRate.get(i).getStsCode(),list4codeRate.get(i).getNum() });
			 }
	     
		 System.out.println(DateUt.getFromatedDate(new Date(),"yyyy-MM-dd HH:mm:ss")+"执行完入库操作，入库信息 时间区间："+fromTime+"--"+toTime+"，[VV："+longVv+"条 , UV："+longUv+"条],[Ts："+longTs+"条 ,M3u8："+longM3u8+"条],[码率信息:"+sb+"]，[命中hitminss信息:"+sbhitmiss+"]，[域名信息："+sbDomainInfo+"]，[总响应时间："+replyTotalTime+",总响应大小:"+replyTotalSize+"]，[码率："+sb4codeRate+"]。");
		 System.out.println("---------------------------------------------------------------------------------------------------------------------------------------------------------------------");	
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private String getDateStrForQuery(Date date) {
		String mubiaoDateStr = null;
		try {
			String currendateStr = DateUt.getFromatedDate(date,
					"yyyy-MM-dd HH:mm:ss");
			Date currendateDa = DateUt.strToDate(currendateStr,
					"yyyy-MM-dd HH:mm:ss");
			Date mubiaoDate = DateUtils.addHours(currendateDa, -1);
			mubiaoDateStr = DateUt.getFromatedDate(mubiaoDate,
					"yyyy-MM-dd HH:mm:ss");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mubiaoDateStr.substring(0, 13);
	}

	private int getWeekInfo() {

		Calendar cal = Calendar.getInstance();
		// 取当前日期的年份里面的周数
		int currentWeekOfYear = cal.get(Calendar.WEEK_OF_YEAR);
		return currentWeekOfYear;
	}
}

/*
 * //码率信息
 * 
 * // String sqlforCodeRate = //
 * "select count(1) from squid_log_analyse where left(visit_time,13) = '"
 * +timeStrFourLogInfo+"' and code_rate = ?"; // Long longCR0 =
 * jdbcTemplate.queryForObject(sqlforCodeRate, new // Object[] { 0 },
 * Long.class); // Long longCR250 = jdbcTemplate.queryForObject(sqlforCodeRate,
 * new // Object[] { 250 }, Long.class); // Long longCR450 =
 * jdbcTemplate.queryForObject(sqlforCodeRate, new // Object[] { 450 },
 * Long.class); // Long longCR850 = jdbcTemplate.queryForObject(sqlforCodeRate,
 * new // Object[] { 850 }, Long.class); // Long longCR2000 =
 * jdbcTemplate.queryForObject(sqlforCodeRate, new // Object[] { 2000 },
 * Long.class); // // String insertCRSql = //
 * "insert into `squid_log_codrateinfo` (`visit_year` ,`visit_month`,`visit_day`,`visit_hour`,`code_rate_250`,`code_rate_450`,`code_rate_850`,`code_rate_2000`,`code_rate_main`) values ( ?,? ,?, ?,? ,?,?,?,?)"
 * ; // jdbcTemplate.update(insertCRSql, new Object[] { visitYear, //
 * visitMonth, visitDay, visitHour, //
 * longCR250,longCR450,longCR850,longCR2000,longCR0});
 */