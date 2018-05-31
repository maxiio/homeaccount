package com.zoutong.homeaccount.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.InAccount;

public interface InAccountDao extends BaseDao<InAccount>{

	public List<Object> findInAccountGroupByInAccountTypeName(Long user_id,String year);


	public Double findCurrentMonthTotalMoney(Date transferYearAndMonth, Long user_id);

	
}
