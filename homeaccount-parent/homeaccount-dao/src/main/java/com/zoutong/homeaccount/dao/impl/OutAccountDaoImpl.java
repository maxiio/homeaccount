package com.zoutong.homeaccount.dao.impl;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;
import com.zoutong.homeaccount.dao.OutAccountDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.OutAccount;
import com.zoutong.homeaccount.utils.DateFormateUtil;
@Repository
public class OutAccountDaoImpl extends BaseDaoImpl<OutAccount> implements OutAccountDao {
	//根据用户id分类查询出支出账单金额总和
	@SuppressWarnings("unchecked")
	public List<Object> findOutAccountGroupByOutAccountTypeName(Long user_id,String year) {
		String hql="";
		if(StringUtils.isNotBlank(year)){
			hql="SELECT oat.outaccounttype_name,SUM(oa.outaccount_money) FROM OutAccount oa LEFT OUTER JOIN oa.outAccountType oat LEFT OUTER JOIN oat.user u where u.user_id=? AND oa.outaccount_datetime between ? and ? GROUP BY oat.outaccounttype_name";
			return (List<Object>) this.getHibernateTemplate().find(hql,user_id,DateFormateUtil.transferYear(year),DateFormateUtil.transferYear(String.valueOf(Integer.parseInt(year)+1)));
		}else{
			hql="SELECT oat.outaccounttype_name,SUM(oa.outaccount_money) FROM OutAccount oa LEFT OUTER JOIN oa.outAccountType oat LEFT OUTER JOIN oat.user u where u.user_id=? GROUP BY oat.outaccounttype_name ";
			return (List<Object>) this.getHibernateTemplate().find(hql, user_id);
		}
		
	}

	//查询当月总支出额
	public Double findCurrentMonthTotalMoney(Date date,Long user_id) {
		String hql="SELECT SUM(oa.outaccount_money) FROM OutAccount oa  WHERE oa.user.user_id=? AND outaccount_datetime between ? and ?";
		List list = this.getHibernateTemplate().find(hql, user_id,date,new Date());
		if(list!=null&&list.size()>0){
			Double money=(Double) list.get(0);
			return money;
		}
		return null;
	}

}
