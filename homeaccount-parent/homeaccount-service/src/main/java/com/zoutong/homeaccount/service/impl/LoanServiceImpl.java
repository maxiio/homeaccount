package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.LoanDao;
import com.zoutong.homeaccount.entity.Loan;
import com.zoutong.homeaccount.service.LoanService;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class LoanServiceImpl implements LoanService {
	@Autowired
	private LoanDao loanDao;
	@Override
	public void saveLoan(Loan loan) {
			loanDao.save(loan);
	}
	@Override
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount = loanDao.getTotalCount(dc);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		List<Loan> list = loanDao.getPageList(dc, pb.getStartIndex(), pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	//根据ID查找借款账单
	@Override
	public Loan findById(String loan_id) {
		return loanDao.findById(loan_id);
	}
	//修改借款账单
	@Override
	public void update(Loan loan) {
		loanDao.update(loan);
	}
	//根据ID删除借款账单
	@Override
	public void deleteById(String loan_id) {
		loanDao.executeUpdate("loan.delete", loan_id);
	}
	//批量删除借款账单
	@Override
	public void deleteBatch(String loan_ids) {
		String[] loanids = loan_ids.split(",");
		for (String loan_id : loanids) {
			loanDao.executeUpdate("loan.delete", loan_id);
		}
		
	}
    //统计
	public int getTotal() {
		DetachedCriteria dc=DetachedCriteria.forClass(Loan.class);
		dc.setProjection(Projections.rowCount());
		Integer totalCount = loanDao.getTotalCount(dc);
		dc.setProjection(null);
		return totalCount;
	}

}
