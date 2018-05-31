<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>发帖</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
			<script src="${pageContext.request.contextPath }/js/editor.js"></script>
		<link href="${pageContext.request.contextPath }/js/kindeditor/themes/default/default.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/kindeditor/kindeditor-all-min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/kindeditor/lang/zh-CN.js"></script>
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container-fluid">
			<div class="well-small" style="margin-top: 10px;">
				<ol class="breadcrumb">
				  <li><a href="javascript:;">首页</a></li>
				  <li><a href="${pageContext.request.contextPath }/RegionAction_list.action">用户交流区</a></li>
				  <li>系统问题区</li>
				  <li>发帖</li>
				</ol>
			</div>
			<form action="${pageContext.request.contextPath }/TopicAction_add.action" id="topicForm" class="form-inline" method="post">
			<div align="center">
				<div class="row">
				<div class="col-md-10 col-md-offset-1" align="left"><span style="font-weight: bold;">标题：</span><input type="text" class="form-control form-inline" name="topic_title" required="required" style="width: 300px;"/></div>
				<div class="col-md-10 col-md-offset-1" align="left"><span style="font-weight: bold;">内容：</span>
					<textarea name="topic_content" id="topic_content" style="width:750px;height:300px;visibility:hidden;"></textarea>
				</div>
				<div class="col-md-10 col-md-offset-1" style="margin-top: 10px;" align="left"><span style="font-weight: bold;">选择大区：</span>
					<select class="form-control" style="width: 200px" name="region.region_id" id="region">
						
					</select>
					<script type="text/javascript">
						$(function(){
							$.post("RegionAction_listajax.action",{},function(data){
								for(var i=0;i<data.length;i++){
									$("#region").append("<option value='"+data[i].region_id+"'>"+data[i].region_name+"</option>");
								}
							})
						})
					</script>
				</div>
				<div class="col-md-10 col-md-offset-1" style="margin-top: 10px;" align="left">
				<input type="button" class="btn btn-success" value="确认发帖" onclick="topicPage.submitForm()"/>
				</div>
			</div>
			</div>
			</form>
			<script type="text/javascript">
			   var editor;
			   $(function(){
					KindEditor.ready(function(K) {
						editor = K.create('textarea[name="topic_content"]',HA.kingEditorParams);
					});
			   });
			   var topicPage={
						submitForm:function(){
							editor.sync();
							var title=$("input[name='topic_title']").val();
							var neirong=$("#topic_content").val();
							if(title==null||title==''){
								Ewin.alert({message:"请输入主题帖标题！"});
								return;
							}
							if(neirong==null||neirong==''||neirong.replace(/&nbsp;/ig,"")==' '){
								Ewin.alert({message:"请输入主题帖的内容！"});
								return;
							}
							Ewin.confirm({message:"确定要发布主题帖吗？"}).on(function(e){
								if(e){
						           $("#topicForm").submit();
								}
							})
						}
				}
			</script>
		</div><!--container主容器end-->
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
	</body>

</html>