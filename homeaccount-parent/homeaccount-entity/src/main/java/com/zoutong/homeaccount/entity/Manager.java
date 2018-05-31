package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.zoutong.homeaccount.utils.DateFormateUtil;
/**
 * 管理员实体
 * @author zoutong
 *
 */
public class Manager implements Serializable{

	private String manager_id;
	private String manager_name;
	private String manager_pwd;
	private String manager_number;
	private Character manager_sex;
	private Date birthday;
	private String manager_face;
	private String manager_idcard;
	private String manager_address;
	private Set<Role> roles=new HashSet<Role>();
	
	public Manager() {
	}
	public String getRolenames(){
		String rolenames="";
		for (Role role : roles) {
			rolenames+=role.getRole_name()+" ";
		}
		return rolenames;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_pwd() {
		return manager_pwd;
	}
	public void setManager_pwd(String manager_pwd) {
		this.manager_pwd = manager_pwd;
	}
	public String getManager_number() {
		return manager_number;
	}
	public void setManager_number(String manager_number) {
		this.manager_number = manager_number;
	}
	//将日期转为字符串
	public String getBirthday_s(){
		return DateFormateUtil.transferNotTime(birthday);
	}
	
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Character getManager_sex() {
		return manager_sex;
	}
	public void setManager_sex(Character manager_sex) {
		this.manager_sex = manager_sex;
	}
	public String getManager_face() {
		return manager_face;
	}
	public void setManager_face(String manager_face) {
		this.manager_face = manager_face;
	}
	public String getManager_idcard() {
		return manager_idcard;
	}
	public void setManager_idcard(String manager_idcard) {
		this.manager_idcard = manager_idcard;
	}
	public String getManager_address() {
		return manager_address;
	}
	public void setManager_address(String manager_address) {
		this.manager_address = manager_address;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	
	
	
}
