package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 收入账单实体
 */
public class InAccount implements Serializable{
	private Long inaccount_id;//收入账单编号
	private Date inaccount_datetime;//收入日期时间
	private Double inaccount_money;//收入金额
	private Date inaccount_createtime;//收入账单创建时间
	private String inaccount_desc;//收入账单备注
	private User user;
	private InAccountType inAccountType;
	
	public InAccount() {
	}
	public InAccount(Date inaccount_datetime, Double inaccount_money, Date inaccount_createtime,
			String inaccount_desc) {
		this.inaccount_datetime = inaccount_datetime;
		this.inaccount_money = inaccount_money;
		this.inaccount_createtime = inaccount_createtime;
		this.inaccount_desc = inaccount_desc;
	}

	public InAccountType getInAccountType() {
		return inAccountType;
	}
	public void setInAccountType(InAccountType inAccountType) {
		this.inAccountType = inAccountType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getInaccount_id() {
		return inaccount_id;
	}
	public void setInaccount_id(Long inaccount_id) {
		this.inaccount_id = inaccount_id;
	}
	public String transforDate(Date date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		String format = sdf.format(date);
		return format;
	}
	
    public String getInaccount_datetime_s() {
		return transforDate(inaccount_datetime);
	}
    
    public String getInaccount_createtime_s() {
		return transforDate(inaccount_createtime);
	}
    
	public Date getInaccount_datetime() {
		
		return inaccount_datetime;
	}
	public void setInaccount_datetime(Date inaccount_datetime) {
		this.inaccount_datetime = inaccount_datetime;
	}
	public Double getInaccount_money() {
		return inaccount_money;
	}
	public void setInaccount_money(Double inaccount_money) {
		this.inaccount_money = inaccount_money;
	}
	public Date getInaccount_createtime() {
		return inaccount_createtime;
	}
	public void setInaccount_createtime(Date inaccount_createtime) {
		this.inaccount_createtime = inaccount_createtime;
	}
	public String getInaccount_desc() {
		return inaccount_desc;
	}
	public void setInaccount_desc(String inaccount_desc) {
		this.inaccount_desc = inaccount_desc;
	}
	@Override
	public String toString() {
		return "InAccount [inaccount_id=" + inaccount_id + ", inaccount_money=" + inaccount_money + "]";
	}
	
}
