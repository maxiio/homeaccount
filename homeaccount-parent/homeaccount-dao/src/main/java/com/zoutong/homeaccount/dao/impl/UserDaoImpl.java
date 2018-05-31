package com.zoutong.homeaccount.dao.impl;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.UserDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.User;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	//根据用户名或邮箱查找用户
	public User getUserByName(final String user_name) {
		return getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String hql="from User where user_name=? or email=?";
				Query query=session.createQuery(hql);
				query.setParameter(0, user_name);
				query.setParameter(1, user_name);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

	public void persistUser(User user) {
			this.getHibernateTemplate().getSessionFactory().getCurrentSession().clear();
			this.getHibernateTemplate().saveOrUpdate(user);
	}

	//根据用户名查找用户
	public User findByUserName(final String user_name) {
		return this.getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String hql="FROM User where user_name=?";
				Query query = session.createQuery(hql);
				query.setParameter(0, user_name);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

	@Override
	public User findUserByEmail(final String email) {
		
		return this.getHibernateTemplate().execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session session) throws HibernateException {
				String hql="FROM User where email=?";
				Query query = session.createQuery(hql);
				query.setParameter(0, email);
				User user = (User) query.uniqueResult();
				return user;
			}
		});
	}

}
