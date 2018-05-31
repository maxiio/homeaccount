<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>solr索引库维护</title>
<script type="text/javascript">
	$(function(){
		$("#tb_topic").datagrid({
			columns:[[
				{title:'编号',field:'id'},
				{title:'标题',field:'topic_title',width:200,align:'center'},
				{title:'创建时间',field:'topic_datetime',width:200,align:'center'},
				{title:'是否置顶',field:'is_top',width:200,align:'center'},
				{title:'是否加精',field:'is_good',width:200,align:'center'},
				{title:'是否结贴',field:'is_end',width:200,align:'center'},
				{title:'浏览量',field:'look_count',width:200,align:'center'},
				{title:'点赞数',field:'topic_zan',width:200,align:'center'},
				{title:'举报数',field:'topic_bad',width:200,align:'center'},
				{title:'是否删除',field:'del',width:200,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/SolrAction_pageQuery.action',
			rownumbers:true,
			striped:true,
			pageList: [10,15,20],
			toolbar:[
				<shiro:hasPermission name="solr-add">
				{text:'一键导入索引库',iconCls:'icon-add',handler:addtopic},
				</shiro:hasPermission>
				<shiro:hasPermission name="solr-delete">
				 {text:'删除索引',iconCls:'icon-remove',handler:deletetopic}
				</shiro:hasPermission>
			],
			singleSelect:true,
			pagination:true,
			fit : true
		});
	});
	
	function addtopic(){
		$.post("${pageContext.request.contextPath}/SolrAction_importIndex.action",{},function(data){
			if(data=="1"){
				$.messager.alert("提示信息","导入索引库成功！","info");
			}else{
				$.messager.alert("提示信息","导入索引库失败！","warning");
			}
		});
	}
	function deletetopic(){
		var rows = $('#tb_topic').datagrid('getSelected');
		if(rows==null||rows.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要删除索引吗？",function(e){
			if(e){
				$.post("${pageContext.request.contextPath}/SolrAction_delete.action",{"topic_id":rows.id},function(data){
					if(data=="1"){
						$.messager.alert("提示信息","删除索引成功！","info");
					}else{
						$.messager.alert("提示信息","删除索引失败！","warning");
					}
				});
			}
		});
		
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_topic">
		
		</table>
	</div>
</body>
</html>