package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.FunctionDao;
import com.zoutong.homeaccount.dao.RoleDao;
import com.zoutong.homeaccount.entity.Function;
import com.zoutong.homeaccount.entity.Role;
import com.zoutong.homeaccount.service.RoleService;
import com.zoutong.homeaccount.utils.PageBean;
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	@Autowired
	private FunctionDao functionDao;
	// 添加角色
	public void save(Role role, String functionIds) {
		if(StringUtils.isNotBlank(functionIds)){
			String[] function_ids = functionIds.split(",");
			for (String functionId : function_ids) {
				Function function = functionDao.load(functionId);
				role.getFunctions().add(function);
			}
		}
		roleDao.saveOrUpdate(role);
	}
	//分页查询
	public void pageQuery(PageBean pb) {
		roleDao.pageQuery(pb);
	}
	@Override
	public List<Role> findAll() {
		return roleDao.findAll();
	}
	//根据id查找角色
	public Role findById(String role_id) {
		
		return roleDao.findById(role_id);
	}
	//修改
	public void update(Role role, String functionIds) {
		if(StringUtils.isNotBlank(functionIds)){
			String[] function_ids = functionIds.split(",");
			for (String functionId : function_ids) {
				Function function = functionDao.load(functionId);
				role.getFunctions().add(function);
			}
		}
		roleDao.update(role);
	}
}
