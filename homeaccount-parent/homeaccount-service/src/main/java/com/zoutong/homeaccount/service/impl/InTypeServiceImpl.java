package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.InTypeDao;
import com.zoutong.homeaccount.entity.InAccountType;
import com.zoutong.homeaccount.service.InTypeService;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class InTypeServiceImpl implements InTypeService{

	@Autowired
	private InTypeDao inTypeDao;
	//查找所有收入类型(没有任何条件)
	public List<InAccountType> findAll() {
		List<InAccountType> list = inTypeDao.findAll();
		return list;
	}
	//分页查询收入类型
	public PageBean_list findList(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize) {
		Integer totalCount=inTypeDao.getTotalCount(detachedCriteria);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		List<InAccountType> list = inTypeDao.getPageList(detachedCriteria, pb.getStartIndex(), pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	//根据ID查询收入类型
	public InAccountType findById(Long inaccounttype_id) {
		InAccountType inAccountType = inTypeDao.findById(inaccounttype_id);
		return inAccountType;
	}
	//根据条件查询所有收入类型
	public List<InAccountType> findAll(DetachedCriteria dc) {
		return inTypeDao.findByCriteria(dc);
	}
	//添加收入类型
	public void save(InAccountType inAccountType) {
		inTypeDao.save(inAccountType);
	}
	//修改收入类型
	public void update(InAccountType inAccountType) {
		inTypeDao.update(inAccountType);
	}
	//根据ID删除收入类型
	public void deleteById(Long inaccounttype_id) {
		inTypeDao.executeUpdate("inaccounttype.delete", inaccounttype_id);
	}

}
