package com.zoutong.homeaccount.service;

import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.utils.PageBean;

public interface ManagerService {

	public Manager findManagerByName(String manager_name);

	public void save(Manager manager, String[] roleIds);

	public void pageQuery(PageBean pb);

	public Manager findById(String manager_id);

	public void initpwd(String manager_id);

	public void update(Manager manager, String[] roleIds);

	public void editpwd(String manager_pwd, String manager_id);
	
}
