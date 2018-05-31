<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索界面</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ocupload-1.1.2.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
	<div class="container">
		<div class="well well-sm" style="font-size: 16px;">
			搜索关键字：<span style="color:red;font-size:18px;">“<s:property value="keyword"/>”</span>共<s:property value="#searchBean.totalCount"/>条记录【共<s:property value="#searchBean.totalPage"/>页】
		</div> 
		<s:if test="#searchBean.rows.size==0">
			<h2>没有检索到此数据</h2>
		</s:if>
		<s:else>
			<div class="well">
				<ul class="list-unstyled">
				<s:iterator var="topic" value="#searchBean.rows" status="index">
					<li style="height:100px;">
						<a href="${pageContext.request.contextPath }/TopicAction_showContent.action?topic_id=<s:property value="#topic.id"/>" style="font-size: 15px;">标题：<s:property value="#topic.topic_title" escape="false"/><br></a>
						<div>内容：<s:property value="#topic.topic_content" escape="false"/></div>
						<div style="color: grey">
							发布时间：<s:property value="#topic.topic_datetime_s"/>  浏览量：<s:property value="#topic.look_count"/>
						</div>
					</li>
				</s:iterator>
				</ul>
			</div>
		<nav aria-label="...">
		  <ul class="pager">
		    <li><a href="${pageContext.request.contextPath }/SearchAction_search.action?keyword=<s:property value="keyword"/>&currentPage=<s:property value="#searchBean.currentPage-1>0?#searchBean.currentPage-1:1"/>">上一页</a></li>
		    <li><a href="${pageContext.request.contextPath }/SearchAction_search.action?keyword=<s:property value="keyword"/>&currentPage=<s:property value="#searchBean.currentPage+1>#searchBean.totalPage?#searchBean.totalPage:#searchBean.currentPage+1"/>">下一页</a></li>
		  </ul>
		</nav>
		</s:else>
	</div>
	
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
</body>
</html>