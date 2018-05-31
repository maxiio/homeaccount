package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
/**
 * 收入类型实体
 */
public class InAccountType implements Serializable{

	private Long inaccounttype_id;//收入类型编号
	private String inaccounttype_name;//收入类型名称
	private Date inaccounttype_createtime;//收入类型创建时间
	private String inaccounttype_desc;//收入类型备注
	private User user;
	private Set<InAccount> inaccounts=new HashSet<InAccount>();
	
	public InAccountType() {
	}
	
	public InAccountType(Long inaccounttype_id) {
		this.inaccounttype_id = inaccounttype_id;
	}

	public Set<InAccount> getInaccounts() {
		return inaccounts;
	}
	public void setInaccounts(Set<InAccount> inaccounts) {
		this.inaccounts = inaccounts;
	}
	public Long getInaccounttype_id() {
		return inaccounttype_id;
	}
	public void setInaccounttype_id(Long inaccounttype_id) {
		this.inaccounttype_id = inaccounttype_id;
	}
	public String getInaccounttype_name() {
		return inaccounttype_name;
	}
	public void setInaccounttype_name(String inaccounttype_name) {
		this.inaccounttype_name = inaccounttype_name;
	}
	
	public String getInaccounttype_createtime_s(){
		SimpleDateFormat format=new SimpleDateFormat("yyyy年MM月dd日  HH:mm");
		return format.format(this.inaccounttype_createtime);
	}
	
	public Date getInaccounttype_createtime() {
		return inaccounttype_createtime;
	}
	public void setInaccounttype_createtime(Date inaccounttype_createtime) {
		this.inaccounttype_createtime = inaccounttype_createtime;
	}
	public String getInaccounttype_desc() {
		return inaccounttype_desc;
	}
	public void setInaccounttype_desc(String inaccounttype_desc) {
		this.inaccounttype_desc = inaccounttype_desc;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
