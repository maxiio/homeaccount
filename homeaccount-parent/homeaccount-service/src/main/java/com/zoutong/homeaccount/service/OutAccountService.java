package com.zoutong.homeaccount.service;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.OutAccount;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface OutAccountService {

	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public void saveOutAccount(List<OutAccount> list);

	public void deleteBatch(String outaccount_ids);

	public void deleteById(Long outaccount_id);

	public void save(OutAccount outAccount);

	public List<OutAccount> findList(DetachedCriteria dc);

	public OutAccount findById(Long outaccount_id);

	public void update(OutAccount outAccount);

	public List<Object> findOutAccountGroupByOutAccountTypeName(Long user_id, String year);

	public List<OutAccount> findFontTen(Long user_id);

	public Double findCurrentMonthTotalMoney(Long user_id);

	public int getTotal();

}
