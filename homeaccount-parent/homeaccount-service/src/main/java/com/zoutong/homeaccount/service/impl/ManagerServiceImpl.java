package com.zoutong.homeaccount.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.ManagerDao;
import com.zoutong.homeaccount.dao.RoleDao;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.entity.Role;
import com.zoutong.homeaccount.service.ManagerService;
import com.zoutong.homeaccount.utils.CryptographyUtil;
import com.zoutong.homeaccount.utils.PageBean;
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private RoleDao roleDao;
	//根据名称查询管理员
	@Override
	public Manager findManagerByName(String manager_name) {
		return managerDao.findManagerByName(manager_name);
	}
	@Override
	public void save(Manager manager, String[] roleIds) {
		if(StringUtils.isBlank(manager.getManager_pwd())){
			manager.setManager_pwd("123456");
		}
		String pwd = CryptographyUtil.md5(manager.getManager_pwd(), CryptographyUtil.md5("www.javazt.top", "homeaccount"));
		manager.setManager_pwd(pwd);
		if(roleIds!=null&&roleIds.length>0){
			for (String role_id : roleIds) {
				System.out.println(role_id);
				Role role = roleDao.findById(role_id);
				manager.getRoles().add(role);
			}
		}
		managerDao.saveOrUpdate(manager);
	}
	//查询数据
	public void pageQuery(PageBean pb) {
		managerDao.pageQuery(pb);
	}
	@Override
	public Manager findById(String manager_id) {
		return managerDao.load(manager_id);
	}
	//初始化密码
	public void initpwd(String manager_id) {
		managerDao.executeUpdate("manager.initpwd", CryptographyUtil.md5("123456", CryptographyUtil.md5("www.javazt.top", "homeaccount")),manager_id);
	}
	//修改信息
	public void update(Manager manager, String[] roleIds) {
		if(StringUtils.isBlank(manager.getManager_pwd())){
			manager.setManager_pwd("123456");
		}
		String pwd = CryptographyUtil.md5(manager.getManager_pwd(), CryptographyUtil.md5("www.javazt.top", "homeaccount"));
		manager.setManager_pwd(pwd);
		if(roleIds!=null&&roleIds.length>0){
			for (String role_id : roleIds) {
				System.out.println(role_id);
				Role role = roleDao.findById(role_id);
				manager.getRoles().add(role);
			}
		}
		managerDao.update(manager);
	}
	//修改密码
	public void editpwd(String manager_pwd, String manager_id) {
		manager_pwd=CryptographyUtil.md5(manager_pwd, CryptographyUtil.md5("www.javazt.top", "homeaccount"));
		managerDao.executeUpdate("manager.initpwd", manager_pwd,manager_id);
	}

}
