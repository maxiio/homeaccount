package com.zoutong.homeaccount.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.utils.PageBean;

public interface BaseDao<T> {
	
	public void updatepersist(T t);
	
	public T load(Serializable id);
	public void merge(T t);
	//保存
	public void save(T t);
	
	//删除
	public void delete(T t);
	
	//修改
	public void update(T t);
	
	//保存或更新
	public void saveOrUpdate(T t);
	
	//通过Id查找
	public T findById(Serializable id);
	
	//查找所有
	public List<T> findAll();
	
	//条件查询
	public List<T> findByCriteria(DetachedCriteria detachedCriteria);
	
	//执行更新通过Hibernate中实体配置文件
	public void executeUpdate(String queryName,Object...objects);
	
	/**
	 * 查《根据条件查总记录数》
	 */
	public Integer getTotalCount(DetachedCriteria dc);
	/**
	 * 查《条件+分页》
     */	
	public List<T> getPageList(DetachedCriteria dc,Integer startIndex,Integer pageSize);
	
	//分页查询2
	public void pageQuery(PageBean pageBean);
	
	
}
