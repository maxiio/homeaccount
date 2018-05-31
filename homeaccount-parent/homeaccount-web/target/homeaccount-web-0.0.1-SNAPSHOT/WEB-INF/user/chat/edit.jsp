<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>修改帖子</title>
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
				  <li><a href="javascript:;">个人中心</a></li>
				  <li>我的帖子</li>
				  <li>修改帖子</li>
				</ol>
			</div>
			<form action="${pageContext.request.contextPath }/TopicAction_update.action" class="form-inline" method="post" id="editForm">
			<div align="center">
				<div class="row">
				<input type="hidden" name="topic_id" value='<s:property value="#topic.topic_id"/>'/>
				<div class="col-md-10 col-md-offset-1" align="left"><span style="font-weight: bold;">标题：</span><input type="text" class="form-control form-inline" name="topic_title" required="required" style="width: 300px;" value='<s:property value="#topic.topic_title"/>'/></div>
				<div class="col-md-10 col-md-offset-1" align="left"><span style="font-weight: bold;">内容：</span>
					<textarea name="topic_content" style="width:750px;height:300px;visibility:hidden;"><s:property value="#topic.topic_content"/></textarea>
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
								        $("#region").find("option[value='<s:property value="#topic.region.region_id"/>']").attr("selected",true);
								})
					 	})
					 </script>
				</div>
				<div class="col-md-10 col-md-offset-1" style="margin-top: 10px;" align="left">
				    <input type="button" onclick="editParm.submitForm()" class="btn btn-success" value="确认修改" />
				     <input type="reset"  class="btn btn-success" value="重置表单" />
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
				var editParm={
						submitForm:function(){
							editor.sync();
							var topic_title=$("input[name=topic_title]").val();
							var topic_content=$("textarea[name=topic_content]").val();
							if(topic_title==null||topic_title==''){
								Ewin.alert({message:"标题不能为空！"})
								return;
							}
							if(topic_content==null||topic_content==''){
								Ewin.alert({message:"请输入主题内容！"})
								return;
							}
							Ewin.confirm({message:"确定要修改此主题帖吗？"}).on(function(e){
								if(e){
									$("#editForm").submit();
								}
							})
						}
				}
			</script>
		</div><!--container主容器end-->
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
	</body>

</html>