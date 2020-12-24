/* ============================================================
 * 版权：     浙江信电 版权所有 (c) 2006
 * 文件：     com.sunland.util.getMdPassword.java
 * 创建日期： 2006-9-27  上午10:01:09
 * 创建日期                               作者        
 * ============================================================
 * 2006-9-27  上午10:01:09        wdl    
 * ============================================================
 */

package com.sunland.wzjj.common.utils;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密
 * @author wdl
 *
 */
public class MD5PwdUtil {
	
	private static String byte2hex(byte[] mybytes) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < mybytes.length; n++) {
			stmp = (Integer.toHexString(mybytes[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}
	
	/**
	 * 加密
	 * @param inputStr 需要加密的字符串
	 * @return 加密的字符串
	 */
	public static String encodePassword(String inputStr) {
		byte[] digesta = null;
		try {
			/**实例对象*/
			MessageDigest alga = MessageDigest.getInstance("MD5");
			
			/**加密输入的字符串*/
			alga.update(inputStr.getBytes());
			
			/**获取加密字符串*/
			digesta = alga.digest();
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return byte2hex(digesta);
	}
	
	/**
	 * 系统初始化密码加密
	 * @return 系统初始化加密密码
	 */
	public static String initializePassword(){
		byte[] digesta=null;
		String initializeStr="123456";//
		try{
			MessageDigest md5=MessageDigest.getInstance("MD5");
			md5.update(initializeStr.getBytes());
			digesta=md5.digest();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return byte2hex(digesta);
	}
	
	public static String strToinfo(String str) {
            sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();//base64解码类
            byte[] b=null;
            try {
				 b = decoder.decodeBuffer(str);
				return new String(b);
			} catch (IOException e) {
				e.printStackTrace();
				return "";
			}            
           
    }
}
