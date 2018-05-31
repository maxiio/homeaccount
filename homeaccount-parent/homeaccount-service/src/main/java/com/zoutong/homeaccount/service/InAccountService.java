package com.zoutong.homeaccount.service;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.utils.PageBean_list;
public interface InAccountService {

	/**
	 * 根据条件显示所有收入账单
	 */
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize);
	/**
	 * 保存收入账单
	 */
	public void save(InAccount inAccount);
	/**
	  *批量保存收入账单
	 */
	public void saveInAccount(List<InAccount> list);
	/**
	 * 查找所有收入账单数据
	 * @param dc 
	 */
	public List<InAccount> findList(DetachedCriteria dc);
	/**
	 * 根据ID删除收入账单
	 * @param inaccount_id
	 */
	public void deleteById(Long inaccount_id);
	/**
	 * 根据ID查找收入账单
	 * @param inaccount_id
	 * @return
	 */
	public InAccount findById(Long inaccount_id);
	/**
	 *  修改收入账单
	 * @param inAccount
	 */
	public void update(InAccount inAccount);
	/**
	 * 批量删除收入账单
	 * @param inaccount_ids
	 */
	public void deleteByIds(String inaccount_ids);
	
	public List<Object> findInAccountGroupByInAccountTypeName(Long user_id,String year);
	public List<InAccount> findFontTen(Long user_id);
	
	public Double findCurrentMonthTotalMoney(Long user_id);
	public int getTotal();
}
