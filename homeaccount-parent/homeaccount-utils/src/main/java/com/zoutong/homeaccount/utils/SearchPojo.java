package com.zoutong.homeaccount.utils;

import java.util.Date;

public class SearchPojo {
	private String id;
	private String topic_title;
	private String topic_content;
	private Date topic_datetime;
	private String look_count;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getLook_count() {
		return look_count;
	}
	public void setLook_count(String look_count) {
		this.look_count = look_count;
	}

}
