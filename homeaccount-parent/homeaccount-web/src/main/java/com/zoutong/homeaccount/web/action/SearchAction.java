package com.zoutong.homeaccount.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zoutong.homeaccount.service.SearchService;
import com.zoutong.homeaccount.utils.SearchBean;
import com.zoutong.homeaccount.utils.SearchPojo;
@Controller
@Scope("prototype")
public class SearchAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Autowired
	private SearchService searchService;
	
	private Integer currentPage;
	private String keyword;
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String search(){
		System.out.println(currentPage);
		if(StringUtils.isNotBlank(keyword)){
			SearchBean searchBean = searchService.searchByKeyWord(keyword,currentPage);
			ActionContext.getContext().put("searchBean", searchBean);
			return "list";
		}
		return "home";
		
	}

}
