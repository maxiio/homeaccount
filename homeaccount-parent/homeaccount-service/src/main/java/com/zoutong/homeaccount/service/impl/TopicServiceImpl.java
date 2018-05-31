package com.zoutong.homeaccount.service.impl;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.TopicDao;
import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.service.TopicService;
import com.zoutong.homeaccount.utils.PageBean;
import com.zoutong.homeaccount.utils.PageBean_list;
@Service
@Transactional
public class TopicServiceImpl implements TopicService {
	@Autowired
	private TopicDao topicDao;

	//查询所有主题帖
	public PageBean_list findAll(DetachedCriteria dc, Integer currentPage, Integer pageSize) {
		Integer totalCount=topicDao.getTotalCount(dc);
		PageBean_list pb = new PageBean_list(currentPage, pageSize, totalCount);
		List<Topic> list=topicDao.getPageList(dc, pb.getStartIndex(), pb.getPageSize());
		pb.setList(list);
		return pb;
	}

	//根据id查找主题帖
	public Topic showContent(Long topic_id) {
		Topic topic = topicDao.findById(topic_id);
		topic.setLook_count(topic.getLook_count()+1);
		return topic;
	}

	//添加主题帖
	public void save(Topic topic) {
		topic.setTopic_datetime(new Date());
		topic.setIs_top('0');
		topic.setIs_good('0');
		topic.setIs_end('0');
		topic.setLook_count(0);
		topic.setDel('0');
		topic.setTopic_zan(0);
		topic.setTopic_bad(0);
		topicDao.merge(topic);
	}

	//根据ID删除主题帖
	public void deleteById(Long topic_id) {
		topicDao.executeUpdate("topic.delete", topic_id);
	}

	//根据ID查找主题帖
	public Topic findById(Long topic_id) {
		return topicDao.findById(topic_id);
	}

	//修改主题
	public void update(Topic topic) {
		topicDao.executeUpdate("topic.update", topic.getTopic_title(),topic.getTopic_content(),topic.getRegion().getRegion_id(),topic.getTopic_id());
	}

	//点赞
	public void zan(Long topic_id) {
		topicDao.executeUpdate("topic.zan", topic_id);
	}

	//鄙视
	public void bad(Long topic_id) {
		topicDao.executeUpdate("topic.bad", topic_id);
	}

	//结贴
	public void end(Long topic_id) {
		topicDao.executeUpdate("topic.end", topic_id);
	}

	//通过当前用户查找最近六条主题
	public List<Topic> findFontSix(Long user_id) {
		DetachedCriteria dc=DetachedCriteria.forClass(Topic.class);
		dc.add(Restrictions.eq("user.user_id", user_id));
		dc.addOrder(Order.desc("topic_datetime"));
		return topicDao.getPageList(dc, 0, 6);
	}

	//后台管理员查看主题帖
	public void pageQuery(PageBean pb) {
		topicDao.pageQuery(pb);
	}

	//主题帖置顶
	public void top(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.top", Long.parseLong(topic_id));
		}
	}

	//加精
	public void good(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.good", Long.parseLong(topic_id));
		}
	}

	//批量删除
	public void deleteBatch(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.delete", Long.parseLong(topic_id));
		}
	}

	//取消置顶
	public void notop(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.notop", Long.parseLong(topic_id));
		}
		
	}

	//取消加精
	public void nogood(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.nogood", Long.parseLong(topic_id));
		}
		
	}

	//取消删除
	public void nodelete(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.nodelete", Long.parseLong(topic_id));
		}
	}

	//结贴
	public void adminend(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.end", Long.parseLong(topic_id));
		}
	}

	//取消结贴
	public void unend(String topic_ids) {
		String[] topicIds = topic_ids.split(",");
		for (String topic_id : topicIds) {
			topicDao.executeUpdate("topic.unend", Long.parseLong(topic_id));
		}
	}

	//通过审核
	public void confirm(Long topic_id) {
		topicDao.executeUpdate("topic.confirm",topic_id);
	}
}
