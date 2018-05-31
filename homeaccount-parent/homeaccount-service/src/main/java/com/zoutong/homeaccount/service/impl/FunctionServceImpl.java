package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.FunctionDao;
import com.zoutong.homeaccount.entity.Function;
import com.zoutong.homeaccount.entity.Manager;
import com.zoutong.homeaccount.service.FunctionService;
import com.zoutong.homeaccount.utils.PageBean;
@Service
@Transactional
public class FunctionServceImpl implements FunctionService{

	@Autowired
	private FunctionDao functionDao;
	//加载页面
	public void pageQuery(PageBean pb) {
		functionDao.pageQuery(pb);
	}
	//查询加载下拉框
	public List<Function> findAll() {
		return functionDao.findAll();
	}
	@Override
	public void save(Function function) {
		Function parent =function.getParentFunction();
		if(parent==null||parent.getId().equals("")){
			function.setParentFunction(null);
		}
		functionDao.merge(function);
	}
	@Override
	public List<Function> findajax() {
		
		return functionDao.findajax();
	}
	@Override
	public Function findById(String id) {
		
		return functionDao.load(id);
	}
	@Override
	public void update(Function function) {
		functionDao.updatepersist(function);
		if(function.getParentFunction()!=null||!function.getParentFunction().getId().equals("")){
			String pid = function.getParentFunction().getId();
			Function parentFunction =new Function(pid);
			function.setParentFunction(parentFunction);
		}else{
			function.setParentFunction(null);
		}
	}
	// 根据角色查询权限
	public List<Function> findByRole(String role_id) {
		
		return functionDao.findByRole(role_id);
	}
	@Override
	public List<Function> findMenu(Manager manager) {
		if(manager.getManager_name().equals("admin")){
			return functionDao.findAllMenu();
		}else{
			return functionDao.findMenuByManagerId(manager.getManager_id());
		}
	}

}
