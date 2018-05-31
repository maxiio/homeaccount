package com.zoutong.homeaccount.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.utils.PageBean;
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
	private Class<T> entityName;
	@Resource
	public void setBaseSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	public BaseDaoImpl() {
		//获得运行期的泛型T的具体类型
		ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
		entityName=(Class<T>) actualTypeArguments[0];
	}
	
	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}
	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}
	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}
	@Override
	public void saveOrUpdate(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}
	@Override
	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(entityName, id);
	}
	@Override
	public List<T> findAll() {
		String hql="FROM "+entityName.getSimpleName();
		return (List<T>) this.getHibernateTemplate().find(hql);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByCriteria(DetachedCriteria detachedCriteria) {
		return (List<T>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
	}
	@Override
	public void executeUpdate(String queryName, Object... objects) {
		Session session = this.getSessionFactory().getCurrentSession();
		Query query=session.getNamedQuery(queryName);
		int i=0;
		for (Object object : objects) {
			query.setParameter(i++, object);
		}
		query.executeUpdate();
	}
	@Override
	public void pageQuery(PageBean pageBean) {
		int currentPage=pageBean.getCurrentPage();
		int pageSize=pageBean.getPageSize();
		DetachedCriteria detachedCriteria=pageBean.getDetachedCriteria();
		//查总记录
		detachedCriteria.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
		Long count = list.get(0);
		pageBean.setTotal(count.intValue());
		detachedCriteria.setProjection(null);
		//封装对象
		detachedCriteria.setResultTransformer(DetachedCriteria.ROOT_ENTITY);
		//查找数据
		int firstResult=(currentPage-1)*pageSize;
		int maxResults=pageSize;
		List<T> rows = (List<T>) this.getHibernateTemplate().findByCriteria(detachedCriteria, firstResult, maxResults);
		pageBean.setRows(rows);
	}
	@Override
	public Integer getTotalCount(DetachedCriteria dc) {
		dc.setProjection(Projections.rowCount());
		List list = getHibernateTemplate().findByCriteria(dc);
		dc.setProjection(null);
		if(list!=null&&list.size()>0){
			Long count = (Long) list.get(0);
			return count.intValue();
		}
		return null;
	}
	@Override
	public List<T> getPageList(DetachedCriteria dc, Integer startIndex, Integer pageSize) {
		List<T> list = (List<T>) getHibernateTemplate().findByCriteria(dc, startIndex, pageSize);
		return list;
	}
	@Override
	public void merge(T t) {
		getHibernateTemplate().merge(t);
	}
	@Override
	public T load(Serializable id) {
		
		return getHibernateTemplate().load(entityName, id);
	}
	@Override
	public void updatepersist(T t) {
		Session currentSession = getHibernateTemplate().getSessionFactory().getCurrentSession();
		currentSession.clear();
		getHibernateTemplate().saveOrUpdate(t);
	}
}
