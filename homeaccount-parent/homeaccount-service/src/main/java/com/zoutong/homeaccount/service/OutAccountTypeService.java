package com.zoutong.homeaccount.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.OutAccountType;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface OutAccountTypeService {

	public List<OutAccountType> findAll(DetachedCriteria dc);

	public PageBean_list findList(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize);

	public void save(OutAccountType outAccountType);

	public OutAccountType findById(Long outaccounttype_id);

	public void update(OutAccountType outAccountType);

	public void deleteById(Long outaccounttype_id);

}
