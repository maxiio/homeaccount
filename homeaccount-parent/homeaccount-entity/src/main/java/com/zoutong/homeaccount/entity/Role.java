package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 角色实体
 * @author zoutong
 * 
 */
public class Role implements Serializable{
	private String role_id;//编号
	private String role_name;//名称
	private String role_code;//关键字
	private String role_desc;//描述
	//角色关联的权限集合
	private Set<Function> functions=new HashSet<Function>();
	//角色关联的管理员集合
	private Set<Manager> managers=new HashSet<Manager>();
	
	public Role() {
	}
	public Role(String role_id2) {
		this.role_id=role_id2;
	}
	public String getId(){
		return role_id;
	}
	public String getText(){
		return role_name;
	}
	public String getRole_id() {
		return role_id;
	}
	
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	public Set<Function> getFunctions() {
		return functions;
	}
	public void setFunctions(Set<Function> functions) {
		this.functions = functions;
	}
	public Set<Manager> getManagers() {
		return managers;
	}
	public void setManagers(Set<Manager> managers) {
		this.managers = managers;
	}
}
