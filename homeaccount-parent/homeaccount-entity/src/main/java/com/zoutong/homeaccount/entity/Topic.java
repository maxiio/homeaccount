package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.zoutong.homeaccount.utils.DateFormateUtil;

/**
 *主题帖实体
 */
public class Topic implements Serializable{
	
	private Long topic_id;//主题帖编号
	private String topic_title;//主题帖标题
	private String topic_content;//主题帖内容
	private Date topic_datetime;//主题帖发布日期
	private Character is_top;//是否置顶
	private Character is_good;//是否加精
	private Character is_end;//是否结贴
	private Integer look_count;//浏览数量
	private Integer topic_zan;
	private Integer topic_bad;
	private Character del;//是否删除  1:删除  0：未删除
	private User user;
	private Region region;
	private Set<Reply> replys=new HashSet<Reply>();
	
	
	public Topic() {
	}
	public Integer getTopic_zan() {
		return topic_zan;
	}
	public void setTopic_zan(Integer topic_zan) {
		this.topic_zan = topic_zan;
	}
	public Integer getTopic_bad() {
		return topic_bad;
	}
	public void setTopic_bad(Integer topic_bad) {
		this.topic_bad = topic_bad;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Reply> getReplys() {
		return replys;
	}
	public void setReplys(Set<Reply> replys) {
		this.replys = replys;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public Long getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(Long topic_id) {
		this.topic_id = topic_id;
	}
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}
	public String getTopic_content() {
		return topic_content;
	}
	public void setTopic_content(String topic_content) {
		this.topic_content = topic_content;
	}
	public String getTopic_datetime_s() {
		return DateFormateUtil.transferHaveTime(topic_datetime);
	}
	public Date getTopic_datetime() {
		return topic_datetime;
	}
	public void setTopic_datetime(Date topic_datetime) {
		this.topic_datetime = topic_datetime;
	}
	public Character getIs_top() {
		return is_top;
	}
	public void setIs_top(Character is_top) {
		this.is_top = is_top;
	}
	public Character getIs_good() {
		return is_good;
	}
	public void setIs_good(Character is_good) {
		this.is_good = is_good;
	}
	public Character getIs_end() {
		return is_end;
	}
	public void setIs_end(Character is_end) {
		this.is_end = is_end;
	}
	public Integer getLook_count() {
		return look_count;
	}
	public void setLook_count(Integer look_count) {
		this.look_count = look_count;
	}
	public Character getDel() {
		return del;
	}
	public void setDel(Character del) {
		this.del = del;
	}
	

}
