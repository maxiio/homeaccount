package com.zoutong.homeaccount.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrQuery.SortClause;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.TopicDao;
import com.zoutong.homeaccount.entity.Topic;
import com.zoutong.homeaccount.service.SearchService;
import com.zoutong.homeaccount.utils.SearchBean;
import com.zoutong.homeaccount.utils.SearchPojo;
@Service
@Transactional
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private HttpSolrServer httpSolrServer;
	@Autowired
	private TopicDao topicDao;
	@Override
	public SearchBean searchByKeyWord(String keyword,Integer currentPage){
		SolrQuery query= new SolrQuery();
		//设置关键字
		query.setQuery(keyword);
		//判断是否有当前页
		if(currentPage==null||currentPage<=0){currentPage=1;}
		//设置开始索引
		query.setStart((currentPage-1)*8);
		//设置行数
		query.setRows(8);
		//排序
		query.addSort(new SortClause("topic_datetime", ORDER.desc));
		//设置搜索域
		query.set("df","topic_keywords");
		//开启高亮显示
		query.setHighlight(true);
		//设置多域搜索
		query.set("hl.preserveMulti", true);
		query.addHighlightField("topic_title");
		query.addHighlightField("topic_content");
		query.setHighlightSimplePre("<span style='color:red;'>");
		query.setHighlightSimplePost("</span>");
		QueryResponse response;
		try {
			response = httpSolrServer.query(query);
			SolrDocumentList docs = response.getResults();
			Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();
			SearchBean bean=new SearchBean();
			long numFound = docs.getNumFound();
			bean.setTotalCount(numFound);
			int totalPage=(int) ((numFound+8-1)/8);
			bean.setCurrentPage(currentPage);
			bean.setPagesize(8);
			bean.setTotalPage(totalPage);
			List<SearchPojo> list=new ArrayList<SearchPojo>();
			for (SolrDocument solrDocument : docs) {
				SearchPojo pojo=new SearchPojo();
				String id = (String) solrDocument.get("id");
				pojo.setId(id);
				Map<String, List<String>> map = highlighting.get((String)solrDocument.get("id"));
				List<String> title = map.get("topic_title");
				List<String> content = map.get("topic_content");
//				String topic_title = (String) solrDocument.get("topic_title");
				pojo.setTopic_title(title.get(0));
//				String topic_content=(String) solrDocument.get("topic_content");
				pojo.setTopic_content(content.get(0));
				Date topic_datetime = (Date) solrDocument.get("topic_datetime");
				pojo.setTopic_datetime(topic_datetime);
				String look_count = (String) solrDocument.get("look_count");
				pojo.setLook_count(look_count);
				list.add(pojo);
			}
			bean.setRows(list);
			return bean;
		} catch (SolrServerException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 一键导入索引库
	 */
	@Override
	public void importIndex() throws Exception{
		
		DetachedCriteria dc=DetachedCriteria.forClass(Topic.class);
		dc.add(Restrictions.eq("del", '0'));
		List<Topic> list = topicDao.findByCriteria(dc);
		for (Topic topic : list) {
			SolrInputDocument document=new SolrInputDocument();
			document.addField("id", String.valueOf(topic.getTopic_id()));
			document.addField("topic_title", topic.getTopic_title());
			document.addField("topic_content", topic.getTopic_content());
			document.addField("topic_datetime", topic.getTopic_datetime());
			Character is_top = topic.getIs_top();
			document.addField("is_top", String.valueOf(is_top));
			Character is_good = topic.getIs_good();
			document.addField("is_good", String.valueOf(is_good));
			Character is_end = topic.getIs_end();
			document.addField("is_end", String.valueOf(is_end));
			Integer look_count = topic.getLook_count();
			document.addField("look_count", String.valueOf(look_count));
			Integer topic_zan = topic.getTopic_zan();
			document.addField("topic_zan",String.valueOf(topic_zan));
			Integer topic_bad = topic.getTopic_bad();
			document.addField("topic_bad",String.valueOf(topic_bad));
			Character del = topic.getDel();
			document.addField("del", String.valueOf(del));
			httpSolrServer.add(document);
		}
		httpSolrServer.commit();
		
			
	}

	@Override
	public void delete(String topic_id) throws Exception {
		
		httpSolrServer.deleteById(topic_id);
		
	}

}
