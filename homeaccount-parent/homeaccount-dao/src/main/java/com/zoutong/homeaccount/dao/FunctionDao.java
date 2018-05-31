package com.zoutong.homeaccount.dao;

import java.util.List;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.Function;

public interface FunctionDao extends BaseDao<Function>{

	public List<Function> findajax();

	public List<Function> findByRole(String role_id);

	public List<Function> findByManagerId(String manager_id);


	public List<Function> findAllMenu();

	public List<Function> findMenuByManagerId(String manager_id);

}
