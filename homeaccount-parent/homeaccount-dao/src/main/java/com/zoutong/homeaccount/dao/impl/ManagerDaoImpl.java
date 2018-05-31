package com.zoutong.homeaccount.dao.impl;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.ManagerDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.Manager;
@Repository
public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao {

	@Override
	public Manager findManagerByName(final String manager_name) {
		return this.getHibernateTemplate().execute(new HibernateCallback<Manager>() {

			@Override
			public Manager doInHibernate(Session session) throws HibernateException {
				String hql="FROM Manager WHERE manager_name=?";
				Query query = session.createQuery(hql);
				query.setParameter(0,manager_name);
				return (Manager) query.uniqueResult();
			}
		});
		 
	}



}
