package com.javacodegeeks.snippets.enterprise.dao;


public interface GetDataIoIntoDbDao {
	
	//将日志文件中的记录解析拼装成为SQL 插入至数据库中
	public void getDataIoIntoDb(String filePath,String networcard) ;

}
