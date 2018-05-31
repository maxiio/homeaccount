package com.zoutong.homeaccount.dao.impl;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.InAccountDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.InAccount;
import com.zoutong.homeaccount.utils.DateFormateUtil;
@Repository
public class InAccountDaoImpl extends BaseDaoImpl<InAccount> implements InAccountDao{

	@SuppressWarnings("unchecked")
	public List<Object> findInAccountGroupByInAccountTypeName(Long user_id,String year) {
		String hql="";
		if(StringUtils.isNotBlank(year)){
			hql="SELECT tit.inaccounttype_name,SUM(ti.inaccount_money) FROM InAccount ti LEFT OUTER JOIN ti.inAccountType tit LEFT OUTER JOIN tit.user u where u.user_id=? AND ti.inaccount_datetime between ? and ? GROUP BY tit.inaccounttype_name ";
			return (List<Object>) this.getHibernateTemplate().find(hql,user_id,DateFormateUtil.transferYear(year),DateFormateUtil.transferYear(String.valueOf(Integer.parseInt(year)+1)));
		}else{
			hql="SELECT tit.inaccounttype_name,SUM(ti.inaccount_money) FROM InAccount ti LEFT OUTER JOIN ti.inAccountType tit LEFT OUTER JOIN tit.user u where u.user_id=? GROUP BY tit.inaccounttype_name ";
			return (List<Object>) this.getHibernateTemplate().find(hql,user_id);
		}
	}

	//查询当月收入总额
	public Double findCurrentMonthTotalMoney(Date date,Long user_id) {
		String hql="SELECT SUM(ia.inaccount_money) FROM InAccount ia  WHERE ia.user.user_id=? AND inaccount_datetime between ? and ?";
		List list = this.getHibernateTemplate().find(hql, user_id,date,new Date());
		if(list!=null&&list.size()>0){
			Double money=(Double) list.get(0);
			return money;
		}
		return null;
	}
	
	public static void main(String[] args) {
		Date date = DateFormateUtil.transferYear("2018");
		String string = date.toString();
		System.out.println(string);
	}
	
}
