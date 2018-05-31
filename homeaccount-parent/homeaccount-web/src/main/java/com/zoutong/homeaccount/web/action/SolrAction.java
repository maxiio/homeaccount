package com.zoutong.homeaccount.web.action;

import java.io.IOException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zoutong.homeaccount.service.SearchService;
@Controller
@Scope("prototype")
public class SolrAction extends ActionSupport{

	private String topic_id;
	
	public String getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(String topic_id) {
		this.topic_id = topic_id;
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private SearchService searchService;
	//一键导入索引库
	@RequiresPermissions("solr-add")
	public String importIndex() throws IOException{
		String flag="1";
		try {
			searchService.importIndex();
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
	//删除索引库
	@RequiresPermissions("solr-delete")
	public String delete() throws IOException{
		String flag="1";
		try {
			searchService.delete(topic_id);
		} catch (Exception e) {
			flag="0";
			e.printStackTrace();
		}
		ServletActionContext.getResponse().getWriter().write(flag);
		return NONE;
	}
}
