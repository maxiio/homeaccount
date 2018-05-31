package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.OutAccoutTypeDao;
import com.zoutong.homeaccount.entity.OutAccountType;
import com.zoutong.homeaccount.service.OutAccountTypeService;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class OutAccountTypeServiceImpl implements OutAccountTypeService {
	@Autowired
	private OutAccoutTypeDao outAccountTypeDao;
	@Override
	public List<OutAccountType> findAll(DetachedCriteria dc) {
		return outAccountTypeDao.findByCriteria(dc);
	}

	@Override
	public PageBean_list findList(DetachedCriteria detachedCriteria, Integer currentPage, Integer pageSize) {
		Integer totalCount=outAccountTypeDao.getTotalCount(detachedCriteria);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		List<OutAccountType> list = outAccountTypeDao.getPageList(detachedCriteria, pb.getStartIndex(), pb.getPageSize());
		pb.setList(list);
		return pb;
	}

	@Override
	public void save(OutAccountType outAccountType) {
		outAccountTypeDao.save(outAccountType);
	}

	@Override
	public OutAccountType findById(Long outaccounttype_id) {
		return outAccountTypeDao.findById(outaccounttype_id);
	}

	@Override
	public void update(OutAccountType outAccountType) {
		outAccountTypeDao.update(outAccountType);
	}

	@Override
	public void deleteById(Long outaccounttype_id) {
		outAccountTypeDao.executeUpdate("outaccounttype.delete", outaccounttype_id);
	}

}
