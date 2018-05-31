<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>等待审核主题帖</title>
<script type="text/javascript">
	$(function(){
		$("#tb_confirm").datagrid({
			columns:[[
				{title:'编号',field:'topic_id',checkbox:true},
				{title:'主题帖标题',field:'topic_title',width:200,align:'center'},
				{title:'发表者',field:'user',align:'center',width:120,formatter:function(v){
					return v.user_name;
				}},
				{title:'发帖时间',field:'topic_datetime_s',align:'center'},
				{title:'所属大区',field:'region',align:'center',formatter:function(v){
					return v.region_name;
				}},
				{title:'鄙视数',field:'topic_bad',align:'center'}
			]],
			url:'${pageContext.request.contextPath}/TopicAction_pageQuery.action?badcount=10',
			rownumbers:true,
			striped:true,
			singleSelect:true,
			pagination:true,
			pageList: [10,15,20],
			toolbar:[
				{text:'审核通过',iconCls:'icon-ok',handler:confirm}
				],
			fit : true
		});
	});
	function confirm(){
		var row=$("#tb_confirm").datagrid("getSelected");
		$.messager.confirm("提示","你确定要通过此主题帖的审核？",function(e){
			if(e){
				location.href="${pageContext.request.contextPath}/TopicAction_confirm.action?topic_id="+row.topic_id;
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_confirm">
		
		</table>
	
	</div>
</body>
</html>