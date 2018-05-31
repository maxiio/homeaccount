package com.zoutong.homeaccount.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.InTypeDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.InAccountType;
@Repository
public class InTypeDaoImpl extends BaseDaoImpl<InAccountType> implements InTypeDao{

	@Override
	public InAccountType findByName(final String typename) {
		
		InAccountType inAccountType = this.getHibernateTemplate().execute(new HibernateCallback<InAccountType>() {

			@Override
			public InAccountType doInHibernate(Session session) throws HibernateException {
				String hql="from InAccountType where inaccounttype_name=?";
				Query query=session.createQuery(hql);
				query.setParameter(0, typename);
				InAccountType inAccountType = (InAccountType) query.uniqueResult();
				return inAccountType;
			}
		});
		
		return inAccountType;
	}

}
