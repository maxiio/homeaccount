package com.zoutong.homeaccount.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;

public class DateFormateUtil {
	public static Date transfer(Date date){
		SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd");
		String datestr=formate.format(date);
			try {
				return formate.parse(datestr);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
}
	public static Date transferYearAndMonth(){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM");
			String date=formate.format(new Date());
				try {
					return formate.parse(date);
				} catch (ParseException e) {
					e.printStackTrace();
					return null;
				}
	}
	public static Date transferYear(String year){
		if(year!=null&&!"".equals(year)){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy");
			try {
				return formate.parse(year);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
}
	
	public static String transferNotTime(Date date){
		if(date!=null){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd");
			return formate.format(date);
		}
		
		return null;
	}
	public static String transferForCN(Date date){
		if(date!=null){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy年MM月dd日");
			return formate.format(date);
		}
		
		return null;
	}
	public static String transferHaveTime(Date date){
		if(date!=null){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return formate.format(date);
		}
		
		return null;
	}
	
	public static Date transferString(String string){
		if(!string.equals("")&&string!=null){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd");
			try {
				return formate.parse(string);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}
	
	public static Date transferString1(String string){
		if(!string.equals("")&&string!=null){
			SimpleDateFormat formate=new SimpleDateFormat("yyyy");
			try {
				return formate.parse(string);
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}
	public static void main(String[] args) {
		Date date = DateFormateUtil.transferYearAndMonth();
		String notTime = DateFormateUtil.transferNotTime(date);
		System.out.println(notTime);
	}
}
