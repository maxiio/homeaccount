package com.zoutong.homeaccount.utils;

import java.util.List;

public class PageBean_list {

	//当前页
	private Integer currentPage;
	//起始索引
	private Integer startIndex;
	//每页显示数目
	private Integer pageSize;
	//总记录数
	private Integer totalCount;
	//总页数
	private Integer totalPage;
	
	private List list;

	public PageBean_list(Integer currentPage, Integer pageSize, Integer totalCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		if(this.currentPage==null){
			this.currentPage=1;
		}
		if (this.pageSize==null) {
			this.pageSize=5;
		}
		
		//计算总页数
		this.totalPage =(this.totalCount+this.pageSize-1)/this.pageSize;
		
		//判断当前页
		if(this.currentPage<1){
			this.currentPage=1;
		}
		if(this.currentPage>this.totalPage){
			this.currentPage=this.totalPage;
		}
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	//计算起始索引
	public Integer getStartIndex() {
		return (this.currentPage-1)*this.pageSize;
	}


	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	

}
