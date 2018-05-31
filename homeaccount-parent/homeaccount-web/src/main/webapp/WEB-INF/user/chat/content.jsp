<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:property value="#topic.topic_title"/></title>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/editor2.js"></script>
<script src="${pageContext.request.contextPath }/js/box.js"></script>
<link href="${pageContext.request.contextPath }/js/kindeditor/themes/simple/simple.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/kindeditor/lang/zh-CN.js"></script>
<script src="${pageContext.request.contextPath }/js/script.js"></script>

<style type="text/css">
#btn {
	width: 40px;
	height: 40px;
	display: none;
	position: fixed;
	left: 50%;
	margin-left: 610px;
	bottom: 30px;
	background: url("img/top_bg.png") no-repeat left top;
}

#btn:hover {
	background: url("img/top_bg.png") no-repeat left -40px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
	<div class="container-fluid">
		<div class="well-small" style="margin-top: 10px;">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/RegionAction_list.action">用户交流区</a></li>
				<li><a href="${pageContext.request.contextPath }/TopicAction_list.action?region_id=<s:property value="#topic.region.region_id"/>"><s:property value="#topic.region.region_name"/></a></li>
				<li>主题展示</li>
			</ol>
		</div>
		<div class="container">
			<div class="panel panel-primary">
				<div class="panel-heading"
					style="font-size: 16px; font-weight: bolder;">
					        <s:if test="#topic.is_end=='1'">
			    		       <span class="label label-warning">【已结帖】</span>
			    			</s:if>
			    			<s:else>
			    				<span class="label label-default">【未结帖】</span>
			    			</s:else>
			    			<s:if test="#topic.is_good=='1'">
					          <span class="label label-danger">【加精】</span> 
			    			</s:if>
			    			<s:if test="#topic.is_top=='1'">
					           <span class="label label-success">【置顶】</span> 
			    			</s:if><s:property value="#topic.topic_title"/><a
						class="inline btn btn-default" href="#bottom"
						style="border-radius: 0px;">快速回复</a>
				</div>
			</div>
			<div class="media">
				<div class="media-left media-top" style="width: 20%;color: gray;" align="left">
					<ul class="list-unstyled ">
						<li><a href="#"> <img class="media-object"
								src="${pageContext.request.contextPath }/<s:property value="#topic.user.face"/>" alt="...">
						</a></li>
						<li>用户名：<s:property value="#topic.user.user_name"/></li>
						<li>性别：<s:property value="#topic.user.user_sex"/></li>
						<li>用户等级：
							<s:if test="#topic.user.level==0">
									<span class="label label-success">普通用户</span>
								</s:if>
								<s:if test="#topic.user.level==1">
									<span class="label label-warning">会员用户</span>
								</s:if>
								<s:if test="#topic.user.level==2">
									<span class="label label-danger">超级会员</span>
								</s:if>
						</li>
						<li>用户积分：<s:property value="#topic.user.score"/></li>
						<li>
							<address>来自：<s:property value="#topic.user.address_s"/></address>
						</li>
						<li style="font-weight: bolder;font-size: 15px;color: black">#楼主</li>
					</ul>
				</div>
				<div class="media-body"
					style="width: 80%; border-left: 1px solid #F0F0F0; padding-left: 10px;">
					<s:property value="#topic.topic_content" escape="false"/>
				</div>
				<div style="color: gray;" align="right">
					发表于：【<s:property value="#topic.topic_datetime_s"/>】浏览量：【<s:property value="#topic.look_count"/>】回复次数：【<s:property value="#topic.replys.size"/>】 <span class="badge"
						style="background-color: green;cursor: pointer;" onclick="zan(<s:property value="#topic.topic_id"/>)"><span
						class="glyphicon glyphicon-thumbs-up"></span><s:property value="#topic.topic_zan==null?0:#topic.topic_zan"/></span> <span
						class="badge" style="background-color: red;cursor: pointer;"><span
						class="glyphicon glyphicon-thumbs-down"></span><s:property value="#topic.topic_bad==null?0:#topic.topic_bad"/></span> <a
						class="btn-sm btn-danger" href="javascript:;" onclick="bad(<s:property value="#topic.topic_id"/>)">举报</a> <span style="font-weight: bolder;font-size: 15px;color: black">#楼顶</span>
				</div>

			</div>
			<hr>
			<s:iterator value="#replylist" var="reply" status="index">
				<div class="media">
				<div class="media-left media-middle" style="width: 20%;color: gray;" align="left">
					<ul class="list-unstyled ">
						<li><a href="#"> <img class="media-object"
								src="${pageContext.request.contextPath }/<s:property value="#reply.user.face"/>" alt="...">
						</a></li>
						<li>用户名：<s:property value="#reply.user.user_name"/></li>
						<li>性别：<s:property value="#reply.user.user_sex"/></li>
						<li>用户等级：
							<s:if test="#reply.user.level==0">
									<span class="label label-success">普通用户</span>
								</s:if>
								<s:if test="#reply.user.level==1">
									<span class="label label-warning">会员用户</span>
								</s:if>
								<s:if test="#reply.user.level==2">
									<span class="label label-danger">超级会员</span>
								</s:if>
						</li>
						<li>用户积分：<s:property value="#reply.user.score"/></li>
						<li>
							<address>来自：<s:property value="#reply.user.address_s"/></address>
						</li>
						<li>#<s:property value="#index.count"/>楼</li>
					</ul>
				</div>
				<div class="media-body"
					style="width: 80%; border-left: 1px solid #F0F0F0; padding-left: 10px;">
					<s:property value="#reply.reply_content" escape="false"/></div>
				<div style="color: gray;" align="right">
					回复于：【<s:property value="#reply.reply_datetime_s"/>】
					 <span class="badge" style="background-color: green;cursor: pointer;" onclick="replyzan(<s:property value="#reply.reply_id"/>)">
					 	<span class="glyphicon glyphicon-thumbs-up"></span>
					 	<s:property value="#reply.zan==null?0:#reply.zan"/>
					 </span>
					 <span class="badge" style="background-color: red;cursor: pointer;">
					 <span class="glyphicon glyphicon-thumbs-down"></span>
					 	<s:property value="#reply.bad==null?0:#reply.bad"/>
					 </span> 
					 <a class="btn-sm btn-danger" onclick="replybad(<s:property value="#reply.reply_id"/>)">举报</a>
					 <span>#<s:property value="#index.count"/>楼</span>
				</div>
			</div>
			<hr>
			</s:iterator>
			<div name="bottom" id="bottom">
				<s:if test="#topic.is_end=='0'">
					<form action="ReplyAction_add.action" method="post" id="replyForm">
						<input type="hidden" name="topic.topic_id" value='<s:property value="#topic.topic_id"/>'/>
					<table>
						<tr>
							<td style="padding-right: 10px;"><h5>用户回复</h5></td>
							<td>
								
								<textarea name="reply_content"
									style="width: 800px; height: 200px; visibility: hidden;" id="reply_content"></textarea>
								
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center" style="padding-top: 10px;"><input
								type="button" value="确认回复" class="btn btn-success"
								style="border-radius: 0px;" id="btn_reply" onclick="replyPage.submitForm()"/>
								<hr></td>
						</tr>
						
					</table>
					</form>
				</s:if>
				<s:else>
					<h4 style="color: red;">该帖已结贴</h4>
				</s:else>
				<script type="text/javascript">
				    var editor;
					$(function(){
					
						KindEditor.ready(function(K) {
							editor = K.create('textarea[name="reply_content"]',HA.kingEditorParams);
						});
					})
					var replyPage={
							submitForm:function(){
								editor.sync();
								var neirong=$("#reply_content").val();
								if(neirong==null||neirong==''||neirong.replace(/&nbsp;/ig,"")==' '){
									Ewin.alert({message:"请输入回复的内容！"});
									return;
								}
								Ewin.confirm({message:"确定要回复吗？"}).on(function(e){
									if(e){
							           $("#replyForm").submit();
									}
								})
							}
					}
					function zan(id){
						$.post("TopicAction_zan.action",{"topic_id":id},function(data){
							if(data=="1"){
								window.location.reload();
							}else{
								alert("出现异常！")
							}
						})
					}
					function replyzan(id){
						$.post("ReplyAction_zan.action",{"reply_id":id},function(data){
							if(data=='1'){
								window.location.reload();
							}else{
								alert("出现异常");
							}
						})
					}
					function bad(id){
						Ewin.confirm({message:"你确定要举报吗？"}).on(function(e){
							
							if(e){
								$.post("TopicAction_bad.action",{"topic_id":id},function(data){
									if(data=="1"){
										window.location.reload();
									}else{
										alert("出现异常！")
									}
								})
							}
						})
						
					}
					function replybad(id){
                         Ewin.confirm({message:"你确定要举报吗？"}).on(function(e){
							
							if(e){
								$.post("ReplyAction_bad.action",{"reply_id":id},function(data){
									if(data=='1'){
										window.location.reload();
									}else{
										alert("出现异常");
									}
								})
							}
						})
						
					}
				</script>
			</div>
		</div>
		<a href="javascript:;" id="btn" title="回到顶部"></a>
	</div>
	<!--container主容器end-->
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
</body>

</html>