package com.zoutong.homeaccount.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.utils.PageBean;
import com.zoutong.homeaccount.utils.PageBean_list;

public interface TopicService {

	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize);

	public Topic showContent(Long topic_id);

	public void save(Topic topic);

	public void deleteById(Long topic_id);

	public Topic findById(Long topic_id);

	public void update(Topic topic);

	public void zan(Long topic_id);

	public void bad(Long topic_id);

	public void end(Long topic_id);

	public List<Topic> findFontSix(Long user_id);

	public void pageQuery(PageBean pb);

	public void top(String topic_ids);

	public void good(String topic_ids);

	public void deleteBatch(String topic_ids);

	public void notop(String topic_ids);

	public void nogood(String topic_ids);

	public void nodelete(String topic_ids);

	public void adminend(String topic_ids);

	public void unend(String topic_ids);

	public void confirm(Long topic_id);
}
