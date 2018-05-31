package com.zoutong.homeaccount.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.OutAccount;

public interface OutAccountDao extends BaseDao<OutAccount>{

	public List<Object> findOutAccountGroupByOutAccountTypeName(Long user_id,String year);


	public Double findCurrentMonthTotalMoney(Date str,Long user_id);

}
