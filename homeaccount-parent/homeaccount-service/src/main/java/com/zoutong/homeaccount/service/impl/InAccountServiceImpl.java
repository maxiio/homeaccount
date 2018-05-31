package com.zoutong.homeaccount.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.InAccountDao;
import com.zoutong.homeaccount.dao.InTypeDao;
import com.zoutong.homeaccount.dao.impl.InAccountDaoImpl;
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.entity.InAccountType;
import com.zoutong.homeaccount.entity.OutAccount;
import com.zoutong.homeaccount.service.InAccountService;
import com.zoutong.homeaccount.utils.DateFormateUtil;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class InAccountServiceImpl implements InAccountService {
	@Autowired
	private InAccountDao inaccountDao;
	@Autowired
	private InTypeDao inTypeDao;
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount=inaccountDao.getTotalCount(dc);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		Integer startIndex=pb.getStartIndex();
		List<InAccount> list = inaccountDao.getPageList(dc, startIndex, pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	//添加收入账单
	public void save(InAccount inAccount) {
		inaccountDao.save(inAccount);
	}
	//批量添加收入账单
	public void saveInAccount(List<InAccount> list) {
		
		for (InAccount inAccount : list) {
		  String typename = inAccount.getInAccountType().getInaccounttype_name();
			//根据类型名称查找类型
		  InAccountType inAccountType = inTypeDao.findByName(typename);
		  if(inAccountType!=null){
			  
			  inAccount.setInAccountType(inAccountType);
			  inaccountDao.save(inAccount);
		  }else{
			  throw new RuntimeException("类型名称不匹配异常信息");
		  }
		}
		
		
	}
	//查找所有收入账单数据
	public List<InAccount> findList(DetachedCriteria dc) {
		
		return inaccountDao.findByCriteria(dc);
	}
	//根据ID删除收入账单
	public void deleteById(Long inaccount_id) {
		inaccountDao.executeUpdate("inaccount.delete", inaccount_id);
	}
	//根据ID查找收入账单
	public InAccount findById(Long inaccount_id) {
		return inaccountDao.findById(inaccount_id);
	}
	//修改收入账单
	public void update(InAccount inAccount) {
		inaccountDao.update(inAccount);
	}
	//批量删除收入账单
	public void deleteByIds(String inaccount_ids) {
			String[] inaccountIds = inaccount_ids.split(",");
			for (String inaccount_id : inaccountIds) {
				inaccountDao.executeUpdate("inaccount.delete", Long.parseLong(inaccount_id));
		}
	}
	
	public List<Object> findInAccountGroupByInAccountTypeName(Long user_id,String year) {
		
		return inaccountDao.findInAccountGroupByInAccountTypeName(user_id,year);
	}
	//根据当前用户查找金额前十的收入账单
	public List<InAccount> findFontTen(Long user_id) {
		DetachedCriteria dc=DetachedCriteria.forClass(InAccount.class);
		dc.add(Restrictions.eq("user.user_id", user_id));
		dc.addOrder(Order.desc("inaccount_money"));
		return inaccountDao.getPageList(dc, 0, 10);
	}
	@Override
	public Double findCurrentMonthTotalMoney(Long user_id) {
		Double money= inaccountDao.findCurrentMonthTotalMoney(DateFormateUtil.transferYearAndMonth(),user_id);
		return money;
	}
	//总记录数
	public int getTotal() {
		DetachedCriteria dc=DetachedCriteria.forClass(InAccount.class);
		dc.setProjection(Projections.rowCount());
		Integer totalCount = inaccountDao.getTotalCount(dc);
		dc.setProjection(null);
		return totalCount;
	}
}
