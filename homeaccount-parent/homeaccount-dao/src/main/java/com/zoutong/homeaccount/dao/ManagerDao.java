package com.zoutong.homeaccount.dao;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.Manager;

public interface ManagerDao extends BaseDao<Manager>{

	public Manager findManagerByName(String manager_name);

}
