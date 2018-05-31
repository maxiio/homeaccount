<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>友情提醒</title>
<script type="text/javascript">
	$(function(){
		$("#tb_warn").datagrid({
			columns:[[
				{title:'编号',field:'id'},
				{title:'名称',field:'name',width:200,align:'center'},
				{title:'是否展示',field:'state',width:200,align:'center',formatter:function(value, row, index){  
                    if (value=='1') {  
                        return "是";  
                    } else {  
                        return "否";  
                    }  
                }},
				{title:'描述',field:'content',width:200,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/json/warn.json',
			striped:true,
			singleSelect: true,
			pageList: [10,15,20],
			toolbar:[
				{text:'添加',iconCls:'icon-add'},
				{text:'修改',iconCls:'icon-edit'},
				{text:'删除',iconCls:'icon-remove'}
			],
			pagination:true,
			fit : true
		});
	});
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_warn">
			
		</table>
	</div>
</body>
</html>