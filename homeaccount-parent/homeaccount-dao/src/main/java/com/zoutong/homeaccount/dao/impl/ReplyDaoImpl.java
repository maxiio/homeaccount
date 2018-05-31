package com.zoutong.homeaccount.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.ReplyDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.Reply;
@Repository
public class ReplyDaoImpl extends BaseDaoImpl<Reply> implements ReplyDao {

	@SuppressWarnings("unchecked")
	//根据用户主题帖查找回复内容
	public List<Reply> findByTopicAndUser(Long user_id) {
		String hql="SELECT DISTINCT r FROM  Reply r  LEFT OUTER JOIN r.topic t LEFT OUTER JOIN t.user u WHERE u.user_id=? AND r.status=0 ORDER BY r.reply_datetime DESC";
		return (List<Reply>) getHibernateTemplate().find(hql, user_id);
	}
}
