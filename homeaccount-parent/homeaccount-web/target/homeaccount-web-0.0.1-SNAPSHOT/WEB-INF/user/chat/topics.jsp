<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>主题帖</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/box.js"></script>
		<script type="text/javascript">
			function showContent(id){
				window.location.href="${pageContext.request.contextPath}/TopicAction_showContent.action?topic_id="+id;
			}
		</script>
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container-fluid">
			<div class="well-small" style="margin-top: 10px;">
				<ol class="breadcrumb">
				  <li><a href="javascript:;">首页</a></li>
				  <li><a href="${pageContext.request.contextPath}/RegionAction_list.action">用户交流区</a></li>
				  <li class="active">系统问题区</li>
				</ol>
			</div>
			<div class="container">
			 <s:if test="#pageBean.list.size==0">
			 		<a href="${pageContext.request.contextPath }/page_user_chat_write.action" style="color: red;font-size: 18px;" >点击此处发帖</a>	
			    	<h2>暂无此类帖子</h2>
			 </s:if>
			 <s:else>
			<div class="row">
				<div class="col-md-5">
					  <ul class="pagination pagination-sm" style="margin-top: 0px;">
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_list.action?region_id=<s:property value="region_id"/>&currentPage=1&keyword=<s:property value="keyword"/>" aria-label="Previous">
					        <span aria-hidden="true">首页</span>
					      </a>
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_list.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.currentPage>1?#pageBean.currentPage-1:1"/>&keyword=<s:property value="keyword"/>">
					        <span aria-hidden="true">上一页</span>
					      </a>
					    </li>
					    <li>
					    	当前页：<s:property value="#pageBean.currentPage"/>||总计：<s:property value="#pageBean.totalPage"/>页||
					    	一共：<s:property value="#pageBean.totalCount"/>条主题
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_list.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.currentPage>=#pageBean.totalPage?#pageBean.totalPage:#pageBean.currentPage+1"/>&keyword=<s:property value="keyword"/>">
					        <span aria-hidden="true">下一页</span>
					      </a>
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_list.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.totalPage"/>&keyword=<s:property value="keyword"/>"  aria-label="Next">
					        <span aria-hidden="true">尾页</span>
					      </a>
					    </li>
					  </ul>
					
				</div>
				<div class="col-md-2" >
					
					
				</div>
				<div class="col-md-3">
					<ul class="list-unstyled  list-inline pull-right">
						<form action="${pageContext.request.contextPath }/TopicAction_list.action" method="post" class="form-inline">
							<input type="hidden" name="region_id" value="<s:property value="region_id"/>">
							<input type="text" name="keyword" value="<s:property value="keyword"/>" class="form-control" placeholder="关键词">
							<input type="submit" value="搜索" class="form-control btn btn-warning">
						</form>
						<br>
						<li style="width: 100px;"></li>
						<li  style="width: 80px;height:30px;line-height:30px; background-color: #0C72B1;cursor: pointer;text-align: center;">
							
						  <a href="${pageContext.request.contextPath }/page_user_chat_write.action" style="color: white;" >发帖</a>	
							
						</li>
					</ul>
				</div>
			</div>
			
			<div class="table-responsive">
			  <table class="table  table-hover">
			    <tr>
			    	<th>标题</th>
			    	<th>发帖者</th>
			    	<th>发帖日期</th>
			    	<th>回复数</th>
			    	<th>浏览量</th>
			    </tr>
			   
			    <s:iterator var="topic" value="#pageBean.list">
			     <tr id="topic">
			    	<td>
			    		<s:if test="#topic.is_end=='1'">
		    		       <span class="label label-warning">已结帖</span>
		    			</s:if>
		    			<s:elseif test="#topic.is_end=='0'">
				          <span class="label label-default">未结帖</span> 
		    			</s:elseif>
			    		<a href="javascript:;" onclick="showContent(<s:property value="#topic.topic_id"/>)"style="color: blue;line-height: 20px;"><s:property value="#topic.topic_title"/></a>
			    		<s:if test="#topic.is_good=='1'">
				          <span class="label label-danger">加精</span> 
		    			</s:if>
		    			<s:if test="#topic.is_top=='1'">
				           <span class="label label-success">置顶</span> 
		    			</s:if>
			    	</td>
			    	<td>
			    		<a href="javascript:;" ><s:property value="#topic.user.user_name"/></a>
			    	</td>
			    	<td>
			    		<s:property value="#topic.topic_datetime_s"/>
			    	</td>
			    	<td><s:property value="#topic.replys.size"/></td>
			    	<td>
			    		<s:property value="#topic.look_count"/>
			    	</td>
			   
			     </tr>
			    </s:iterator>
			  </table>
			    </s:else>
			</div>
			</div>
		</div><!--container主容器end-->
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
	</body>

</html>