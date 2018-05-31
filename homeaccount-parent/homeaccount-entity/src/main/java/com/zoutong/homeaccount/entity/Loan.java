package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.zoutong.homeaccount.utils.DateFormateUtil;
/**
 * 借款还贷实体
 */
public class Loan implements Serializable{
	private String loan_id;//借款还贷编号
	private String loanname;//借款还贷名称
	private Date loan_datetime;//借款还贷日期
	private Integer loan_year;//周期（按年）
	private Double interest_rates;//利息率
	private Double loan_money;//借款金额
	private String loan_source;//借款来源
	private String loan_desc;//借款还贷备注
	private Date loan_createtime;//创建时间
	private User user;
	public Loan() {
	}
	//计算是否到期
	public String getOvertime(){
			Calendar ca=Calendar.getInstance();
			ca.setTime(loan_datetime);
			ca.add(ca.YEAR,loan_year);
			Long end=ca.getTime().getTime();
			Date date=new Date();
			Long now=date.getTime();
			Long result=now-end;
			if(result<0){
				return "未到期";
			}
		return "<span style='color:red;'>已到期</span>";
	}
	//计算预期应还利息
	public Float getLixi(){
		return (float) (loan_money*interest_rates*loan_year);
	}
	public String getLoan_id() {
		return loan_id;
	}
	public void setLoan_id(String loan_id) {
		this.loan_id = loan_id;
	}
	public String getLoanname() {
		return loanname;
	}
	public void setLoanname(String loanname) {
		this.loanname = loanname;
	}
	public String getLoan_datetime_s() {
		return DateFormateUtil.transferForCN(loan_datetime);
	}
	public Date getLoan_datetime() {
		return loan_datetime;
	}
	public void setLoan_datetime(Date loan_datetime) {
		this.loan_datetime = loan_datetime;
	}
	public Integer getLoan_year() {
		return loan_year;
	}
	public void setLoan_year(Integer loan_year) {
		this.loan_year = loan_year;
	}
	public Double getInterest_rates() {
		return interest_rates;
	}
	public void setInterest_rates(Double interest_rates) {
		this.interest_rates = interest_rates;
	}
	public Double getLoan_money() {
		return loan_money;
	}
	public void setLoan_money(Double loan_money) {
		this.loan_money = loan_money;
	}
	public String getLoan_source() {
		return loan_source;
	}
	public void setLoan_source(String loan_source) {
		this.loan_source = loan_source;
	}
	public String getLoan_desc() {
		return loan_desc;
	}
	public void setLoan_desc(String loan_desc) {
		this.loan_desc = loan_desc;
	}
	public String getLoan_createtime_s() {
		return DateFormateUtil.transferHaveTime(loan_createtime);
	}
	public Date getLoan_createtime() {
		return loan_createtime;
	}
	public void setLoan_createtime(Date loan_createtime) {
		this.loan_createtime = loan_createtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Autowired
	public static void main(String[] args) {
		SimpleDateFormat formate=new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = formate.parse("2017-12-20");
			Calendar ca=Calendar.getInstance();
			ca.setTime(date);
			ca.add(ca.YEAR,1);
			date=ca.getTime();
			System.out.println(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
