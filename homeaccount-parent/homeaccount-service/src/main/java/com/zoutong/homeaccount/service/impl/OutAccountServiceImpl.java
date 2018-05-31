package com.zoutong.homeaccount.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.OutAccountDao;
import com.zoutong.homeaccount.dao.OutAccoutTypeDao;
import com.zoutong.homeaccount.dao.UserDao;
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.entity.OutAccount;
import com.zoutong.homeaccount.entity.OutAccountType;
import com.zoutong.homeaccount.entity.User;
import com.zoutong.homeaccount.service.OutAccountService;
import com.zoutong.homeaccount.utils.DateFormateUtil;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class OutAccountServiceImpl implements OutAccountService{
	@Autowired
	private OutAccountDao outAccountDao;
	@Autowired
	private OutAccoutTypeDao outAccoutTypeDao;
	@Autowired
	private UserDao userDao;
	@Override
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount=outAccountDao.getTotalCount(dc);
		PageBean_list pb=new PageBean_list(currentPage, pageSize, totalCount);
		Integer startIndex=pb.getStartIndex();
		List<OutAccount> list = outAccountDao.getPageList(dc, startIndex, pb.getPageSize());
		pb.setList(list);
		return pb;
	}
	@Override
	public void saveOutAccount(List<OutAccount> list) {
		for (OutAccount outAccount : list) {
			String typename=outAccount.getOutAccountType().getOutaccounttype_name();
			OutAccountType outAccountType=outAccoutTypeDao.findOutAccountTypeByTypeName(typename);
			if(outAccountType!=null){
				outAccount.setOutAccountType(outAccountType);
				outAccountDao.save(outAccount);
			}else{
				throw new RuntimeException("类型名称不匹配异常信息");
			}
		}
		
	}
	//批量删除
	public void deleteBatch(String outaccount_ids) {
		if(StringUtils.isNotBlank(outaccount_ids)){
			String[] outaccountIds = outaccount_ids.split(",");
			for (String outaccount_id : outaccountIds) {
				outAccountDao.executeUpdate("outaccount.delete", Long.parseLong(outaccount_id));
			}
		}
	}
	//根据ID删除支出账单
	public void deleteById(Long outaccount_id) {
		
		outAccountDao.executeUpdate("outaccount.delete", outaccount_id);
		
		
	}
	//添加支出账单
	public void save(OutAccount outAccount) {
		User user=outAccount.getUser();
		user.setScore(user.getScore()+2);
		//持久化user，使其修改的数据同步数据库
		userDao.persistUser(user);
		OutAccountType outAccountType=outAccoutTypeDao.findById(outAccount.getOutAccountType().getOutaccounttype_id());
		outAccount.setUser(user);
		outAccount.setOutAccountType(outAccountType);
		outAccount.setOutaccount_createtime(new Date());
		outAccountDao.save(outAccount);
	}
	//通过条件查找支出账单
	public List<OutAccount> findList(DetachedCriteria dc) {
		List<OutAccount> list = outAccountDao.findByCriteria(dc);
		return list;
	}
	//根据id查找支出账单
	public OutAccount findById(Long outaccount_id) {
		return outAccountDao.findById(outaccount_id);
	}
	//修改支出账单
	public void update(OutAccount outAccount) {
		OutAccountType outtype = outAccoutTypeDao.findById(outAccount.getOutAccountType().getOutaccounttype_id());
		outAccount.setOutAccountType(outtype);
		outAccount.setOutaccount_createtime(new Date());
		outAccountDao.update(outAccount);
	}
	//根据用户id分类查询支出账单金额总和
	public List<Object> findOutAccountGroupByOutAccountTypeName(Long user_id,String year) {
		
		return outAccountDao.findOutAccountGroupByOutAccountTypeName(user_id,year);
	}
	//根据当前用户查找金额前十的支出
	public List<OutAccount> findFontTen(Long user_id) {
		DetachedCriteria dc=DetachedCriteria.forClass(OutAccount.class);
		dc.add(Restrictions.eq("user.user_id", user_id));
		dc.addOrder(Order.desc("outaccount_money"));
		return outAccountDao.getPageList(dc, 0,10);
	}
	//查询当月支出总额
	public Double findCurrentMonthTotalMoney(Long user_id) {
		return outAccountDao.findCurrentMonthTotalMoney(DateFormateUtil.transferYearAndMonth(),user_id);
	}
	//统计
	public int getTotal() {
		DetachedCriteria dc =DetachedCriteria.forClass(OutAccount.class);
		dc.setProjection(Projections.rowCount());
		Integer totalCount = outAccountDao.getTotalCount(dc );
		return totalCount;
	}

}
