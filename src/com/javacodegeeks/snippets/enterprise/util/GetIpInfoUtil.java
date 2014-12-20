package com.javacodegeeks.snippets.enterprise.util;

import java.net.*;
import java.util.*;

public class GetIpInfoUtil {
    public static void main(String[] args) {
	    System.out.println(getIpFromDistinctOs("eth0")); //暂时只使用这个IP地址
	    //System.out.println(GetIpInfoUtil.getMacAddr()); 
    }
    
    public static String getIpFromDistinctOs(String networcard) {    
    	
    	String ipAddr = null;
		Properties prop = System.getProperties();
		String os = prop.getProperty("os.name");
		if (os.startsWith("win") || os.startsWith("Win")) {
			ipAddr = getWindowIpAdd();
		}else {
			ipAddr = getLocalIP(networcard);
		}
		return ipAddr;
    	
    }
    
    
    
//    public static String getMacAddr() {    
//        String MacAddr = "";
//        String str = "";
//        try {
//            NetworkInterface NIC = NetworkInterface.getByName("eth0");
//            byte[] buf = NIC.getHardwareAddress();
//            for (int i = 0; i < buf.length; i++) {
//                str = str + byteHEX(buf[i]);
//            }
//            MacAddr = str.toUpperCase();
//        } catch (SocketException e) {
//            e.printStackTrace();
//            System.exit(-1);
//        }
//        return MacAddr;
//    }

    public static String getLocalIP(String networcard) {
        String ip = "";
        try {
            Enumeration<?> e1 = (Enumeration<?>) NetworkInterface.getNetworkInterfaces();
            while (e1.hasMoreElements()) {
                NetworkInterface ni = (NetworkInterface) e1.nextElement();
                if (!ni.getName().equals(networcard)) {
                    continue;
                } else {
                    Enumeration<?> e2 = ni.getInetAddresses();
                    while (e2.hasMoreElements()) {
                        InetAddress ia = (InetAddress) e2.nextElement();
                        if (ia instanceof Inet6Address)
                            continue;
                        ip = ia.getHostAddress();
                    }
                    break;
                }
            }
        } catch (SocketException e) {
            e.printStackTrace();
            System.exit(-1);
        }
        return ip;
    }

 /* 一个将字节转化为十六进制ASSIC码的函数 */
//    public static String byteHEX(byte ib) {
//        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a','b', 'c', 'd', 'e', 'f' };
//        char[] ob = new char[2];
//        ob[0] = Digit[(ib >>> 4) & 0X0F];
//        ob[1] = Digit[ib & 0X0F];
//        String s = new String(ob);
//        return s;
//    }
    
    // Windows操作系统  获取服务器IP地址，当 %Sh/%<A 为 NONE/- 时， 取IP地址
	private static String getWindowIpAdd() {

		InetAddress addr;
		String ip = null;
		try {
			addr = InetAddress.getLocalHost();
			ip = addr.getHostAddress().toString();// 获得本机IP
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return ip;
	}
}