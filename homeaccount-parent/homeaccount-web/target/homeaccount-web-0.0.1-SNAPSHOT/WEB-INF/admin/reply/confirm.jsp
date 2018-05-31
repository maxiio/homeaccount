<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>等待审核回复</title>
<script type="text/javascript">
	$(function(){
		$("#tb_rconfirm").datagrid({
			url:'${pageContext.request.contextPath}/ReplyAction_pageQuery.action',
			columns:[[
				{title:'编号',field:'reply_id',checkbox:true},
				{title:'回复主题帖标题',field:'topic',width:120,align:'center',formatter:function(v){
					return v.topic_title;
				}},
				{title:'回复者',field:'user',width:120,align:'center',formatter:function(v){
					return v.user_name;
				}},
				{title:'回复时间',field:'reply_datetime_s',width:120,align:'center'},
				{title:'鄙视数',field:'bad',width:120,align:'center'}
				
			]],
			rownumbers:true,
			striped:true,
			singleSelect:true,
			pagination:true,
			pageList: [10,15,20],
			toolbar:[
				<shiro:hasPermission name="reply-confirm">
					{text:'审核通过',iconCls:'icon-ok',handler:confirm}
				</shiro:hasPermission>
				],
			fit : true
		});
	});
	function confirm(){
		var row=$("#tb_rconfirm").datagrid("getSelected");
		$.messager.confirm("提示","你确定要通过此回复的审核？",function(e){
			if(e){
				location.href="${pageContext.request.contextPath}/ReplyAction_confirm.action?reply_id="+row.reply_id;
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_rconfirm">
		
		</table>
	
	</div>
</body>
</html>