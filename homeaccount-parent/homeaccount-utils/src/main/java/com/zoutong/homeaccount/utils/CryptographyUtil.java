package com.zoutong.homeaccount.utils;
/**
 * 无敌版加密
 */
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
public class CryptographyUtil {

	/**
	 * base64加密
	 * @param str
	 * @return
	 */
	public static String encBase64(String str){
		return Base64.encodeToString(str.getBytes());
	}
	
	/**
	 * base64解密
	 * @param str
	 * @return
	 */
	public static String decBase64(String str){
		return Base64.decodeToString(str);
	}
	
	/**
	 * Md5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
	public static void main(String[] args) {
		String pwd="123456";
		String md5 = CryptographyUtil.md5(pwd, CryptographyUtil.md5("www.javazt.top", "homeaccount"));
		System.out.println(md5);
	}
}
