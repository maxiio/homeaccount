package com.zoutong.homeaccount.service;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.Loan;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface LoanService {

	public void saveLoan(Loan loan);

	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public Loan findById(String loan_id);

	public void update(Loan loan);

	public void deleteById(String loan_id);

	public void deleteBatch(String loan_ids);

	public int getTotal();

}
