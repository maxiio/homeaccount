package com.zoutong.homeaccount.service;


import com.zoutong.homeaccount.utils.SearchBean;

public interface SearchService {
	
	//根据条件查询
	public SearchBean searchByKeyWord(String keyword,Integer currentPage);
	
	//批量导入索引库
	public void importIndex() throws Exception;

	public void delete(String topic_id) throws Exception;
}
