package com.zoutong.homeaccount.service;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.Invest;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface InvestService {

	public void save(Invest invest);

	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public Invest findById(String invest_id);

	public void update(Invest invest);

	public void deleteById(String invest_id);

	public void deleteBatch(String invest_ids);

	public int getTotal();

}
