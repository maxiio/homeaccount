package com.zoutong.homeaccount.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.Reply;
import com.zoutong.homeaccount.utils.PageBean;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface ReplyService {

	public void save(Reply reply);

	public List<Reply> findByCriteria(Long user_id);


	public void updateStatusByUser(Long user_id);

	public List<Reply> findByTopicAndUser(Long user_id);

	public void readById(Long reply_id);

	public void deleteById(Long reply_id);

	public List<Reply> findByCriteria(DetachedCriteria dc);

	public void zan(Long reply_id);

	public void bad(Long reply_id);

	public List<Reply> findFontSix(Long user_id);

	public void pageQuery(PageBean pb);

	public void confirm(Long reply_id);


}
