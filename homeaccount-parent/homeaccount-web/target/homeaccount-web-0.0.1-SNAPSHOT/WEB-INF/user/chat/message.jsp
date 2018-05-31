<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>我的帖子</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/editor.js"></script>
<link
	href="${pageContext.request.contextPath }/js/kindeditor/themes/qq/qq.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/kindeditor/lang/zh-CN.js"></script>
	<style type="text/css">
		#myTab li{
			border-radius: 1px
		}
		#myTab li:hover{
			cursor: pointer;
		}
		#myTab li a{
			font-weight: bolder;
		}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp"%>
	<div class="container-fluid">
		<div class="well-small" style="margin-top: 10px;">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
				<li><a href="javascript:;">个人中心</a></li>
				<li>我的帖子</li>
			</ol>
		</div>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"> 我发表的帖子</a></li>
			<li><a href="#mymessage" data-toggle="tab">消息中心<span class="badge"><s:property value="#xiaoxi.size"/></span></a></li>
			<li><a href="#myreply" data-toggle="tab">我的回复</a></li>
			<li><a href="${pageContext.request.contextPath }/page_user_chat_write.action">发表帖子</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			
				<!-- 我发表的帖子 -->
				<div class="tab-pane fade in active" id="home">
				<s:if test="#pageBean.list.size==0">
				<h2>您还没有发表帖子</h2>
			</s:if>
			<s:else>
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th>标题</th>
					      <th>发布时间</th>
					      <th>回复数</th>
					      <th>浏览量</th>
					      <th>操作</th>
					    </tr>
					  </thead>
					  <tbody>
					  <s:iterator var="topic" value="#pageBean.list">
					  	
					    <tr> 
					      <td>
						      	<s:if test="#topic.is_end=='1'">
				    		       <span class="label label-warning">【已结帖】</span>
				    			</s:if>
				    			<s:else>
				    				<span class="label label-default">【未结帖】</span>
				    			</s:else>
						      	<a href="${pageContext.request.contextPath }/TopicAction_showContent.action?topic_id=<s:property value="#topic.topic_id"/>">
						      		<s:property value="#topic.topic_title"/>
						      	</a>
				    			<s:if test="#topic.is_good=='1'">
						          <span class="label label-danger">【加精】</span> 
				    			</s:if>
				    			<s:if test="#topic.is_top=='1'">
						           <span class="label label-success">【置顶】</span> 
				    			</s:if>	
					      </td>
					      <td><s:property value="#topic.topic_datetime_s"/></td>
					      <td><s:property value="#topic.replys.size"/></td>
					      <td><s:property value="#topic.look_count"/></td>
					      <td>
					      	<a class="btn btn-xs btn-warning" href="javascript:;" onclick="updateTopic(<s:property value="#topic.topic_id"/>)">修改</a>
					      	<a class="btn btn-xs btn-danger"  href="javascript:;" onclick="deleteTopic(<s:property value="#topic.topic_id"/>)">删除</a>
				      		<s:if test="#topic.is_end!='1'">
				      	        <a class="btn btn-xs btn-primary"  href="javascript:;" onclick="endTopic(<s:property value="#topic.topic_id"/>)">结贴</a>
			    			</s:if>
					      </td>
					    </tr>
					  </s:iterator>
					  </tbody>
					</table>
					 <ul class="pagination pagination-sm" style="margin-top: 0px;">
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_findByUser.action?region_id=<s:property value="region_id"/>&currentPage=1" aria-label="Previous">
					        <span aria-hidden="true">首页</span>
					      </a>
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_findByUser.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.currentPage>1?#pageBean.currentPage-1:1"/>">
					        <span aria-hidden="true">上一页</span>
					      </a>
					    </li>
					    <li>
					    	当前页：<s:property value="#pageBean.currentPage"/>||总计：<s:property value="#pageBean.totalPage"/>页||
					    	共发表<s:property value="#pageBean.totalCount"/>条主题帖
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_findByUser.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.currentPage>=#pageBean.totalPage?#pageBean.totalPage:#pageBean.currentPage+1"/>">
					        <span aria-hidden="true">下一页</span>
					      </a>
					    </li>
					    <li>
					      <a href="${pageContext.request.contextPath }/TopicAction_findByUser.action?region_id=<s:property value="region_id"/>&currentPage=<s:property value="#pageBean.totalPage"/>"  aria-label="Next">
					        <span aria-hidden="true">尾页</span>
					      </a>
					    </li>
					  </ul>
			</s:else>
				</div>
			
			<!-- 我收到的回复 -->
			<div class="tab-pane fade" id="mymessage">
				<ul class="list-unstyled" style="margin: 30px;">
					<s:iterator value="#xiaoxi" var="reply">
					<li style="font-size: 16px;">
						【<s:property value="#reply.user.user_name"/>】在<s:property value="#reply.reply_datetime_s"/>回复了您的主题帖：<a target="_blank" href="TopicAction_showContent.action?topic_id=<s:property value="#reply.topic.topic_id"/>">“<s:property value="#reply.topic.topic_title"/>”</a>|回复内容为：<a>“<s:property value="#reply.reply_content" escape="false"/>”</a>
						<s:if test="#reply.status==0">
						  <a href="javascript:;" onclick="read(<s:property value="#reply.reply_id"/>)"><span class="btn btn-xs btn-danger">确认查看</span></a>
						</s:if>
						<s:else>
						  <span class="btn btn-xs btn-success">已查看</span>
						</s:else>
					</li>
					
					</s:iterator>
				
				</ul>
			</div>
			<!-- 我回复的 -->
			<div class="tab-pane fade" id="myreply">
				<ul class="list-unstyled" style="margin: 30px;">
					<s:iterator var="reply2" value="#replys">
						
					<li style="font-size: 16px;">
						回复了<a target="_blank" href="TopicAction_showContent.action?topic_id=<s:property value="#reply2.topic.topic_id"/>">“主题帖：<s:property value="#reply2.topic.topic_title"/>”</a>|回复内容为：<a>“<s:property value="#reply2.reply_content" escape="false"/>”</a><a class="btn btn-xs btn-danger" href="javascript:;" onclick="deleteById(<s:property value="#reply2.reply_id"/>)">删除</a>
					</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<script>
		   $(function(){
		      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		      // Get the name of active tab
		      var activeTab = $(e.target).text(); 
		      // Get the name of previous tab
		      var previousTab = $(e.relatedTarget).text(); 
		      $(".active-tab span").html(activeTab);
		      $(".previous-tab span").html(previousTab);
		   });
		});
		   function updateTopic(id){
			  window.location.href="${pageContext.request.contextPath}/TopicAction_findById.action?topic_id="+id;
		   }
		   function deleteTopic(id){
			   Ewin.confirm({message:"确定要删除这条帖子吗？"}).on(function(e){
				   if(e){
					   $.post("TopicAction_deleteById.action",{"topic_id":id},function(data){
						   if(data=="0"){
							   Ewin.alert({message:"删除失败！"});
						   }else{
							   window.location.reload();
						   }
						 })
				   }
			   })
		   }
		   function read(id){
			   $.post("ReplyAction_read.action",{"reply_id":id},function(data){
				   if(data=="1"){
					   window.location.reload();
				   }else{
					   Ewin.alert({message:"查看失败！"});
				   }
			   })
		   }
		   function deleteById(id){
			   Ewin.confirm({message:"确定要删除这条回复吗？"}).on(function(e){
				   if(e){
					   $.post("ReplyAction_deleteById.action",{"reply_id":id},function(data){
						   if(data=="1"){
							   window.location.reload();
						   }else{
							   Ewin.alert({message:"删除失败！"});
						   }
					   });
				   }
			   })
		   }
		   function endTopic(id){
			   Ewin.confirm({message:"确定要结贴吗？"}).on(function(e){
				   if(e){
					   $.post("TopicAction_end.action",{"topic_id":id},function(data){
						   if(data=="1"){
							   window.location.reload();
						   }else{
							   Ewin.alert({message:"结贴失败！"});
						   }
					   });
				   }
			   })
		   }
		</script>
	</div>
	<!--container主容器end-->
	<%@include file="/WEB-INF/user/common/foot.jsp"%>
</body>

</html>