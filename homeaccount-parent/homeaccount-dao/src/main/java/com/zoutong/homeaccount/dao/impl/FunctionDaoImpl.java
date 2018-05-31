package com.zoutong.homeaccount.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.FunctionDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.Function;
@Repository
@SuppressWarnings("unchecked")
public class FunctionDaoImpl extends BaseDaoImpl<Function> implements FunctionDao {

	@Override
	public List<Function> findajax() {
		String hql="From Function r WHERE r.parentFunction is null";
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public List<Function> findByRole(String role_id) {
		String hql="SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r WHERE r.role_id=?";
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql, role_id);
		return list;
	}

	//根据管理员ID查询对应权限
	public List<Function> findByManagerId(String manager_id) {
		String hql="SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.managers m WHERE m.manager_id=?";
		List<Function> list = (List<Function>)this.getHibernateTemplate().find(hql, manager_id);
		return list;
	}

	//根据管理员id查询对应菜单
	public List<Function> findMenuByManagerId(String manager_id) {
		String hql="SELECT DISTINCT f FROM Function f LEFT OUTER JOIN f.roles r LEFT OUTER JOIN r.managers m WHERE  f.generatemenu = '1' AND m.manager_id=?  ORDER BY f.zindex DESC";
		List<Function> list = (List<Function>)this.getHibernateTemplate().find(hql, manager_id);
		return list;
	}


	//查询所有菜单
	public List<Function> findAllMenu() {
		String hql="From Function r WHERE r.generatemenu = '1' ORDER BY r.zindex DESC";
		List<Function> list = (List<Function>) this.getHibernateTemplate().find(hql);
		return list;
	}


}
