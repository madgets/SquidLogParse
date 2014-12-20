package com.javacodegeeks.snippets.enterprise.dao.impl;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.sql.DataSource;

//import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.javacodegeeks.snippets.enterprise.SquidLogParseMainExe;
import com.javacodegeeks.snippets.enterprise.dao.GetDataIoIntoDbDao;
import com.javacodegeeks.snippets.enterprise.util.GetIpInfoUtil;
@SuppressWarnings("all")
public class GetDataIoIntoDbDaoImpl implements GetDataIoIntoDbDao {

	final static Pattern p = Pattern.compile("/hls/(\\w*)/"); // 从URL中截取码率正则
	SimpleDateFormat simdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date currentDate = new Date();

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	private String ipFromLog; // 日志中记录的IP地址
	// 将日志单行记录解析之后，插入数据库sql
	private String sql = "insert into squid_log_analyse (`visit_time`,`response_time` ,`Squid_status` ,`http_status` ,`size_reply`,`Request_method`,`Request_URL`,`code_rate`  ,`user_name`,`Squid_hierarchy_code`,`Server_IP_address`,`MIME_type_request`,`Client_IP`,`All_request_header`,`domain_name`,`tsOr_m3u8`) values ";

	@Override
	public void getDataIoIntoDb(String filePath,String networcard)  {

		jdbcTemplate = new JdbcTemplate(dataSource);
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null; // 用于包装InputStreamReader,提高处理性能。因为BufferedReader有缓冲的，而InputStreamReader没有。
		try {

			String str = "";
			StringBuilder sb = new StringBuilder();
			String strVistitTime =null;
			Long st1 = System.currentTimeMillis();
			int i = 0;
			int codezero = 0;
			int jjeror = 0;
			int jjerorNum = 0;


			fis = new FileInputStream(filePath);// FileInputStream 从文件系统中的某个文件中获取字节
			isr = new InputStreamReader(fis);// InputStreamReader 是字节流通向字符流的桥梁,
			br = new BufferedReader(isr);// 从字符输入流中读取文件中的内容,

			
			while ((str = br.readLine()) != null) {
				String[] arr = str.split("\\s+"); //空格切割单行日志记录
				String codeRate = getCodeRate(arr[5]);
				strVistitTime = arr[0].replaceAll("T", " ");
				
				if(codeRate!=null){ //当码率为空时，此条日志记录不作入库处理
					
					ipFromLog = arr[7].split("/")[1];
					if(ipFromLog.equals("-")){
						ipFromLog = GetIpInfoUtil.getIpFromDistinctOs(networcard); //IP地址
					}
					
					//reply_size出现了以f结尾的情况现予以处理
					String strReplySize =arr[3];
					if(strReplySize.matches("\\d+[a-zA-Z]$")){
						strReplySize = strReplySize.substring(0, strReplySize.length()-1);
					}
					
					//pjm 解析tsorm3u8 2014年11月24日10:05:07
					String tsorm3u8 = null;
					String requestUrl = arr[5];
					String[] requestUrlArr = requestUrl.split("/");
					
					String tsorm3usStr = requestUrlArr[requestUrlArr.length-1];
					if (tsorm3usStr.contains(".ts")) {
						tsorm3u8 = "ts";
					}else if(tsorm3usStr.contains(".m3u8")){
						tsorm3u8 = "m3u8";
					}
				/*	if(requestUrl.contains(".ts")||requestUrl.contains(".m3u8")){
						String[] tsorm3usArr = requestUrlArr[requestUrlArr.length-1].split("\\.");
						if (tsorm3usArr.length==2) {
							tsorm3u8 = tsorm3usArr[1];
							if(tsorm3u8.contains("?")){
								tsorm3u8 = tsorm3u8.split("\\?")[0];
							}
							
						}else{
							tsorm3u8 = tsorm3usArr[0];
							if(tsorm3u8.contains("?")){
								tsorm3u8 = tsorm3u8.split("\\?")[0];
							}
						}
					}*/
					
					
					// ---------
					sb.append("('").append(strVistitTime).append("', '")
							.append(arr[1]).append("', '")
							.append(arr[2].split("/")[0]).append("', '")
							.append(arr[2].split("/")[1]).append("', '")
							.append(strReplySize).append("', '")
							.append(arr[4]).append("', '")
							.append(requestUrl).append("', '")
							.append(getCodeRate(requestUrl)).append("', '")
							.append(arr[6]).append("', '")
							.append(arr[7].split("/")[0]).append("', '")
							.append(ipFromLog).append("', '")
							.append(arr[8]).append("', '")
							.append(arr[9]).append("', '")
							.append(arr[10]).append("', '")
							.append(requestUrlArr[2]).append("', '")
							.append(tsorm3u8).append("') , ");
					// ---------
					i++;
					if (i % 20000 == 0) { //20000的整数倍时执行插入操作，之后sb清空重新拼装SQL的values
						sb = sb.delete(sb.length() - 1, sb.length());
						try {
							jdbcTemplate.execute(sql+sb);
						} catch (Exception e) {
							jjerorNum += insertWipeutError(jdbcTemplate,sql,jjeror,sb.toString());
						}
						sb.setLength(0);
					}
				}else{
					codezero++;//记录中所有码率为空时，记录其数目
				}
			}
			//i不为20000的整数倍时，如为20020，在while中已经执行了20000条记录。
			//而此处执行的就是剩余的20条记录入库操作
			if (sb.length() != 0) {
				sb = sb.delete(sb.length() - 2, sb.length());
				try {
					jdbcTemplate.execute(sql + sb);
				} catch (Exception e) {
					jjerorNum += insertWipeutError(jdbcTemplate,sql,jjeror,sb.toString());
				}
			}
			
			System.out.println(simdf.format(currentDate)+"执行，添加入库["+(i-jjerorNum)+"]条记录，出错记录数["+jjerorNum+"]条，如出错：错误日志上方有打印请分析解决，码率信息为空忽略掉["+codezero+"]条，耗时"+(System.currentTimeMillis() - st1)+"ms");
			System.out.println("---------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			
		} catch (FileNotFoundException e) {
			System.out.println("找不到指定文件");
		} catch (IOException e) {
			System.out.println("读取文件失败");
		} finally {
			try {
				br.close();
				isr.close();
				fis.close();
				// 关闭的时候最好按照先后顺序关闭最后开的先关闭所以先关s,再关n,最后关m

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// -----------------------------------------------
	// 1 从日志记录文件中取到单行记录之后截取出访问URL，此方法从URL地址中截取出码率信息
	private static String getCodeRate(String url) {

		Matcher m = p.matcher(url);
		while (m.find()) {
			String str = m.group(1).toString();
			if (str.matches("\\d+")) { // 200 800等数字直接返回
				return str;
			} else if (str.equals("main")) {// main 则返回 0
				return "0";
			}
		}
		// 类似hls/c2e472d4c3953ddcb39048510a4e5c44/ 以及
		// http://202.108.8.119/console/
		// 这种返回 null (此情况下 此条记录视为垃圾记录 不予处理)
		return null;
	}

	// -----------------------------------------------
	//
	/**2 算法 核心思想  回调函数和二分查找
	 * 执行插入操作出错时，一次20000条，拆分执行，
	 * 最终忽略地错误语句 其他的语句正常执行 ( 返回值为 执行出错的条数 )
	 * @param jdt
	 * @param sql
	 * @param jjerror
	 * @param str
	 * @return
	 */
	public  int insertWipeutError(JdbcTemplate jdt,String sql ,int jjerror,String str){
		
		String[] arr = str.split(" , "); //3888
		int length = arr.length;
		int times = 2;
		
		if(length==1){
			try {
				jdt.execute(sql+arr[0]);
			} catch (Exception e) {
				
				//////////////////////////////////
				 String errStr =  e.getMessage().toString();
				 if(errStr.contains("[")&&errStr.contains("]")){
					 errStr = errStr.substring(errStr.indexOf("]"), errStr.length());
				 }
				 System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())+"执行插入语句："+arr[0]);
				 System.out.println("错误日志："+errStr);
				 System.out.println("~~~~~~~~~~~~~~~~~error~~~~~~~~~~~~~~~~~error~~~~~~~~~~~~~~~~~error~~~~~~~~~~~~~~~~~");
				//////////////////////////////////
				jjerror = jjerror+1;
				return jjerror;
			}
		}
		
		int lnum = length%2==0?length/2:length/2+1;
		int m ;
		int n ;
		for (int i = 0; i < 2; i++) {
			if(i==0){
				 m =0;
				 n =lnum;
			}else{
				 m =lnum;
				 n =length;
			}
			StringBuilder sb = new StringBuilder();
			for (int j = m; j < n; j++) {
				sb.append(arr[j]).append(" , ");
			}
			sb = sb.delete(sb.length()-2, sb.length());
			try {
				jdt.execute(sql+sb);
			} catch (Exception e) {
				jjerror= 0 + insertWipeutError(jdt, sql,jjerror, sb.toString());
			}
		}
		return jjerror;
	}
	
	// -----------------------------------------------

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
}
