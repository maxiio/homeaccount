package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.zoutong.homeaccount.utils.DateFormateUtil;

/**
 * 支出类型实体
 */
public class OutAccountType implements Serializable{

	private Long outaccounttype_id;//支出类型编号
	private String outaccounttype_name;//支出类型名称
	private Date outaccounttype_createtime;//支出类型创建时间
	private String outaccounttype_desc;//支出类型备注
	
	private User user;
	private Set<OutAccount> outaccounts=new HashSet<OutAccount>();
	
	public OutAccountType() {
	}
	public Set<OutAccount> getOutaccounts() {
		return outaccounts;
	}
	public void setOutaccounts(Set<OutAccount> outaccounts) {
		this.outaccounts = outaccounts;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getOutaccounttype_id() {
		return outaccounttype_id;
	}
	public void setOutaccounttype_id(Long outaccounttype_id) {
		this.outaccounttype_id = outaccounttype_id;
	}
	public String getOutaccounttype_name() {
		return outaccounttype_name;
	}
	public void setOutaccounttype_name(String outaccounttype_name) {
		this.outaccounttype_name = outaccounttype_name;
	}
	public String getOutaccounttype_createtime_s() {
		return	DateFormateUtil.transferHaveTime(outaccounttype_createtime);
	}
	public Date getOutaccounttype_createtime() {
		return outaccounttype_createtime;
	}
	public void setOutaccounttype_createtime(Date outaccounttype_createtime) {
		this.outaccounttype_createtime = outaccounttype_createtime;
	}
	public String getOutaccounttype_desc() {
		return outaccounttype_desc;
	}
	public void setOutaccounttype_desc(String outaccounttype_desc) {
		this.outaccounttype_desc = outaccounttype_desc;
	}
}
