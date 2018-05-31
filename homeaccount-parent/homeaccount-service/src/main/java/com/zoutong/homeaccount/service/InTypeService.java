package com.zoutong.homeaccount.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.InAccountType;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface InTypeService {

	/**
	 * 查找所有收入类型
	 * @param dc 
	 * @return
	 */
	public List<InAccountType> findAll(DetachedCriteria dc);

	public PageBean_list findList(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize);

	public InAccountType findById(Long inaccounttype_id);

	public void save(InAccountType inAccountType);

	public void update(InAccountType inAccountType);

	public void deleteById(Long inaccounttype_id);

}
