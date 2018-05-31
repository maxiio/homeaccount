package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Date;

import com.zoutong.homeaccount.utils.DateFormateUtil;

/**
 * 支出实体
 */
public class OutAccount implements Serializable{

	private Long outaccount_id;
	private Date outaccount_datetime;
	private Double outaccount_money;
	private String outaccount_desc;
	private Date outaccount_createtime;
	private User user;
	private OutAccountType outAccountType;
	

	public OutAccount() {
	}
	public OutAccount(Date outaccount_datetime, Double outaccount_money, String outaccount_desc,
			Date outaccount_createtime) {
		super();
		this.outaccount_datetime = outaccount_datetime;
		this.outaccount_money = outaccount_money;
		this.outaccount_desc = outaccount_desc;
		this.outaccount_createtime = outaccount_createtime;
	}
	public OutAccountType getOutAccountType() {
		return outAccountType;
	}
	public void setOutAccountType(OutAccountType outAccountType) {
		this.outAccountType = outAccountType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getOutaccount_id() {
		return outaccount_id;
	}
	public void setOutaccount_id(Long outaccount_id) {
		this.outaccount_id = outaccount_id;
	}
	public String getOutaccount_datetime_s() {
		return DateFormateUtil.transferNotTime(outaccount_datetime);
	}
	public Date getOutaccount_datetime() {
		return outaccount_datetime;
	}
	public void setOutaccount_datetime(Date outaccount_datetime) {
		this.outaccount_datetime = outaccount_datetime;
	}
	public Double getOutaccount_money() {
		return outaccount_money;
	}
	public void setOutaccount_money(Double outaccount_money) {
		this.outaccount_money = outaccount_money;
	}
	public String getOutaccount_desc() {
		return outaccount_desc;
	}
	public void setOutaccount_desc(String outaccount_desc) {
		this.outaccount_desc = outaccount_desc;
	}
	public String getOutaccount_createtime_s() {
		return DateFormateUtil.transferHaveTime(outaccount_createtime);
	}
	public Date getOutaccount_createtime() {
		return outaccount_createtime;
	}
	public void setOutaccount_createtime(Date outaccount_createtime) {
		this.outaccount_createtime = outaccount_createtime;
	}
	
	
}
