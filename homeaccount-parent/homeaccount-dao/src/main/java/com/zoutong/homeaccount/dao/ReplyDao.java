package com.zoutong.homeaccount.dao;

import java.util.List;

import com.zoutong.homeaccount.dao.base.BaseDao;
import com.zoutong.homeaccount.entity.Reply;

public interface ReplyDao extends BaseDao<Reply>{

	public List<Reply> findByTopicAndUser(Long user_id);
}
