package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import com.zoutong.homeaccount.utils.DateFormateUtil;
/**
 * 投资理财实体
 */
public class Invest implements Serializable{
	private String invest_id;//投资理财编号
	private String investname;//投资理财名称
	private Date invest_datetime;//时间
	private Integer invest_year;//投资周期
	private String invest_target;//投资目标
	private Date invest_createtime;//创建时间
	private Double interest_rates;//利率
	private Double invest_money;//投资金额
	private String invest_desc;//投资理财备注
	private User user;
	public Invest() {
	}
	//计算是否到期
		public String getOvertime(){
				Calendar ca=Calendar.getInstance();
				ca.setTime(invest_datetime);
				ca.add(ca.YEAR,invest_year);
				Long end=ca.getTime().getTime();
				Date date=new Date();
				Long now=date.getTime();
				Long result=now-end;
				if(result<0){
					return "未到期";
				}
			return "<span style='color:red;'>已到期</span>";
		}
	public Float getProfit(){
		return (float) (invest_money*interest_rates*invest_year);
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getInvest_id() {
		return invest_id;
	}
	public void setInvest_id(String invest_id) {
		this.invest_id = invest_id;
	}
	public String getInvestname() {
		return investname;
	}
	public void setInvestname(String investname) {
		this.investname = investname;
	}
	public String getInvest_datetime_s() {
		return DateFormateUtil.transferForCN(invest_datetime);
	}
	public Date getInvest_datetime() {
		return invest_datetime;
	}
	public void setInvest_datetime(Date invest_datetime) {
		this.invest_datetime = invest_datetime;
	}
	public Integer getInvest_year() {
		return invest_year;
	}
	public void setInvest_year(Integer invest_year) {
		this.invest_year = invest_year;
	}
	public String getInvest_target() {
		return invest_target;
	}
	public void setInvest_target(String invest_target) {
		this.invest_target = invest_target;
	}
	public String getInvest_createtime_s() {
		return DateFormateUtil.transferHaveTime(invest_createtime);
	}
	public Date getInvest_createtime() {
		return invest_createtime;
	}
	public void setInvest_createtime(Date invest_createtime) {
		this.invest_createtime = invest_createtime;
	}
	public Double getInterest_rates() {
		return interest_rates;
	}
	public void setInterest_rates(Double interest_rates) {
		this.interest_rates = interest_rates;
	}
	public Double getInvest_money() {
		return invest_money;
	}
	public void setInvest_money(Double invest_money) {
		this.invest_money = invest_money;
	}
	public String getInvest_desc() {
		return invest_desc;
	}
	public void setInvest_desc(String invest_desc) {
		this.invest_desc = invest_desc;
	}
	
}
