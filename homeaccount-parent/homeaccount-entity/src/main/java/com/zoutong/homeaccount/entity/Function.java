package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
/**
 * 权限实体
 * @author zoutong
 *
 */
public class Function implements Serializable{
	private String id;//权限编号
	private String name;//权限名称
	private String code;//权限关键字
	private String fundesc;//权限描述
	private String page;//权限url
	private Integer zindex;//优先级
	private String generatemenu;//是否生成菜单
	//角色集合
	private Set<Role> roles=new HashSet<Role>();
	//上级权限
	private Function parentFunction;
	//下级权限
	private Set<Function> children=new HashSet<Function>();
	
	public Function() {
	}
	
	public Function(String functionId) {
		this.id=functionId;
	}

	public String getpId() {
		if(parentFunction==null){
			return "0";
		}
		return parentFunction.getId();
	}
	
	public String getText(){
		return name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}


	public String getFundesc() {
		return fundesc;
	}

	public void setFundesc(String fundesc) {
		this.fundesc = fundesc;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Integer getZindex() {
		return zindex;
	}

	public void setZindex(Integer zindex) {
		this.zindex = zindex;
	}

	public String getGeneratemenu() {
		return generatemenu;
	}

	public void setGeneratemenu(String generatemenu) {
		this.generatemenu = generatemenu;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Function getParentFunction() {
		return parentFunction;
	}

	public void setParentFunction(Function parentFunction) {
		this.parentFunction = parentFunction;
	}

	public Set<Function> getChildren() {
		return children;
	}

	public void setChildren(Set<Function> children) {
		this.children = children;
	}

	


	
	
}
