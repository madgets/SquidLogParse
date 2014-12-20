package com.javacodegeeks.snippets.enterprise.dao.impl;

import java.util.Date;

import javax.sql.DataSource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import com.javacodegeeks.snippets.enterprise.dao.ClearDbTableInfoDao;
import com.javacodegeeks.snippets.enterprise.util.DateUt;

public class ClearDbTableInfoDaoImpl implements ClearDbTableInfoDao {
	
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	@Override
	public void clearDbTableInfo() {
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
		Date date = new Date();

		String nowTimeStr = DateUt.getFromatedDate(date, "yyyy-MM-dd HH:mm:ss");
		String nowTimeMinusonedayStr = DateUt.getFromatedDate(DateUtils.addDays(date, -1), "yyyy-MM-dd HH:mm:ss");
		
		String dateDelStr = nowTimeMinusonedayStr.substring(0, 10);		
		String sql = "delete from squid_log_analyse where left(visit_time,10) = ?";
		
		jdbcTemplate.update(sql, new Object[]{dateDelStr});
		
		System.out.println(nowTimeStr+"清理squid_log_analyse表的程序执行，清理掉数据表中visit_time日期为"+dateDelStr+"的数据。");
		System.out.println("---------------------------------");	
	}
	
	
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
