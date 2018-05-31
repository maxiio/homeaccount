package com.zoutong.homeaccount.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 交流大区实体
 */
public class Region implements Serializable{

	private Integer region_id;//交流大区编号
	private String region_name;//交流大区名称
	private String region_desc;//交流大区备注
	private Set<Topic> topics=new HashSet<Topic>();
	
	public Region() {
	}
	public Set<Topic> getTopics() {
		return topics;
	}
	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}
	public Integer getRegion_id() {
		return region_id;
	}
	public void setRegion_id(Integer region_id) {
		this.region_id = region_id;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getRegion_desc() {
		return region_desc;
	}
	public void setRegion_desc(String region_desc) {
		this.region_desc = region_desc;
	}
	@Override
	public String toString() {
		return "Region [region_id=" + region_id + ", region_name=" + region_name + "]";
	}
	
}
