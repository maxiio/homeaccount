package com.zoutong.homeaccount.utils;

import java.util.ArrayList;
import java.util.List;

public class SearchBean {

	private Integer currentPage;//当前页
	private Integer pagesize;//每页记录数
	private Long totalCount;//总记录数
	private Integer totalPage;
	private List<SearchPojo> rows=new ArrayList<SearchPojo>();//数据集合
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public List<SearchPojo> getRows() {
		return rows;
	}
	public void setRows(List<SearchPojo> rows) {
		this.rows = rows;
	}
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

}
