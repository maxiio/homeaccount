package com.zoutong.homeaccount.service.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.ReplyDao;
import com.zoutong.homeaccount.entity.Reply;
import com.zoutong.homeaccount.service.ReplyService;
import com.zoutong.homeaccount.utils.PageBean;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDao replyDao;
	@Override
	public void save(Reply reply) {
		reply.setReply_datetime(new Date());
		reply.setZan(0);
		reply.setBad(0);
		reply.setStatus(0);
		replyDao.merge(reply);
	}
	@Override
	public List<Reply> findByCriteria(Long user_id) {
		DetachedCriteria dc=DetachedCriteria.forClass(Reply.class);
		dc.add(Restrictions.eq("user.user_id",user_id));
		return replyDao.findByCriteria(dc);
	}
	@Override
	public void updateStatusByUser(Long user_id) {
		
		replyDao.executeUpdate("reply.update", user_id);
		
	}
	//查找为查看的回复
	public List<Reply> findByTopicAndUser(Long user_id) {
		
		return replyDao.findByTopicAndUser(user_id);
	}
	//修改回复状态
	public void readById(Long reply_id) {
		replyDao.executeUpdate("reply.doread", reply_id);
	}
	//根据ID删除回复
	public void deleteById(Long reply_id) {
		replyDao.executeUpdate("reply.delete", reply_id);
	}
	@Override
	public List<Reply> findByCriteria(DetachedCriteria dc) {
		return replyDao.findByCriteria(dc);
	}
	//点赞
	public void zan(Long reply_id) {
		replyDao.executeUpdate("reply.zan", reply_id);
	}
	//鄙视
	public void bad(Long reply_id) {
		replyDao.executeUpdate("reply.bad", reply_id);
	}
	@Override
	public List<Reply> findFontSix(Long user_id) {
		DetachedCriteria dc=DetachedCriteria.forClass(Reply.class);
		dc.add(Restrictions.eq("user.user_id", user_id));
		dc.addOrder(Order.desc("reply_datetime"));
		return replyDao.getPageList(dc, 0, 6);
	}
	//查找待审核的回复
	public void pageQuery(PageBean pb) {
		replyDao.pageQuery(pb);
	}
	//审核
	public void confirm(Long reply_id) {
		replyDao.executeUpdate("reply.confirm", reply_id);
	}

}
