package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.InvestDao;
import com.zoutong.homeaccount.entity.Invest;
import com.zoutong.homeaccount.service.InvestService;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class InvestServiceImpl implements InvestService {
	@Autowired
	private InvestDao investDao;
	//保存投资账单
	@Override
	public void save(Invest invest) {
		investDao.save(invest);
	}
	//分页查询投资账单
	@Override
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount = investDao.getTotalCount(dc);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		List<Invest> list = investDao.getPageList(dc, pb.getStartIndex(), pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	//根据id查询投资账单
	@Override
	public Invest findById(String invest_id) {
		Invest invest = investDao.findById(invest_id);
		return invest;
	}
	//修改投资账单
	@Override
	public void update(Invest invest) {
		investDao.update(invest);
	}
	//根据id删除投资账单
	@Override
	public void deleteById(String invest_id) {
		investDao.executeUpdate("invest.delete",invest_id);
	}
	//批量删除
	@Override
	public void deleteBatch(String invest_ids) {
		String[] investids = invest_ids.split(",");
		for (String invest_id : investids) {
			investDao.executeUpdate("invest.delete", invest_id);
		}
	}
	@Override
	public int getTotal() {
		DetachedCriteria dc=DetachedCriteria.forClass(Invest.class);
		dc.setProjection(Projections.rowCount());
		Integer totalCount = investDao.getTotalCount(dc);
		return totalCount;
	}

}
