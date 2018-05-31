package com.zoutong.homeaccount.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.OutAccoutTypeDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.OutAccountType;
@Repository
public class OutAccountTypeDaoImpl extends BaseDaoImpl<OutAccountType> implements OutAccoutTypeDao{
	//通过支出类型名称查找支出类型
	public OutAccountType findOutAccountTypeByTypeName(final String typename) {
		return this.getHibernateTemplate().execute(new HibernateCallback<OutAccountType>() {

			@Override
			public OutAccountType doInHibernate(Session session) throws HibernateException {
				String hql="FROM OutAccountType where outaccounttype_name=?";
				Query query = session.createQuery(hql);
				query.setParameter(0,typename);
				OutAccountType outAccountType = (OutAccountType) query.uniqueResult();
				return outAccountType;
			}
		});
	}

}
