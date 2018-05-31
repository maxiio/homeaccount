package com.zoutong.homeaccount.dao;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.OutAccountType;

public interface OutAccoutTypeDao extends BaseDao<OutAccountType>{

	public OutAccountType findOutAccountTypeByTypeName(String typename);

}
