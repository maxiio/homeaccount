package com.zoutong.homeaccount.dao;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.InAccountType;

public interface InTypeDao extends BaseDao<InAccountType>{

	/**
	 * 根据收入类型名称查找收入类型ID
	 * @param typename
	 * @return
	 */
	public InAccountType findByName(String typename);

}
