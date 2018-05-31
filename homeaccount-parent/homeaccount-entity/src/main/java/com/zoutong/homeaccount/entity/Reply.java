package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Date;

import com.zoutong.homeaccount.utils.DateFormateUtil;

/**
 * 回复贴实体
 */
public class Reply implements Serializable{

	private Long reply_id;//回复贴编号
	private String reply_content;//回复内容
	private Date reply_datetime;//回复日期
	private Character is_top;//是否置顶
	private Integer zan;//赞数量
	private Integer bad;//鄙视数
	private Integer status;//是否被查看
	
	private User user;
	private Topic topic;
	
	public Reply() {
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public Integer getBad() {
		return bad;
	}
	public void setBad(Integer bad) {
		this.bad = bad;
	}
	public Long getReply_id() {
		return reply_id;
	}
	public void setReply_id(Long reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_datetime_s() {
		return DateFormateUtil.transferHaveTime(reply_datetime);
	}
	public Date getReply_datetime() {
		return reply_datetime;
	}
	public void setReply_datetime(Date reply_datetime) {
		this.reply_datetime = reply_datetime;
	}
	public Character getIs_top() {
		return is_top;
	}
	public void setIs_top(Character is_top) {
		this.is_top = is_top;
	}
	public Integer getZan() {
		return zan;
	}
	public void setZan(Integer zan) {
		this.zan = zan;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
}
