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
<title>角色列表</title>
<script type="text/javascript">
	$(function(){
		$("#tb_role").datagrid({
			columns:[[
				{title:'编号',field:'role_id'},
				{title:'角色名称',field:'role_name',width:200,align:'center'},
				{title:'描述',field:'role_desc',width:200,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/RoleAction_pageQuery.action',
			rownumbers:true,
			striped:true,
			pageList: [10,15,20],
			toolbar:[
				<shiro:hasPermission name="role-add">
				{text:'添加',iconCls:'icon-add',handler:addRole},
				</shiro:hasPermission>
				<shiro:hasPermission name="role-update">
				{text:'修改',iconCls:'icon-edit',handler:editRole}
				</shiro:hasPermission>
			],
			singleSelect:true,
			pagination:true,
			fit : true
		});
	});
	
	function addRole(){
		location.href="${pageContext.request.contextPath}/page_admin_role_add.action"
	}
	function editRole(){
		var rows = $('#tb_role').datagrid('getSelected');
		if(rows==null||rows.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要修改这个角色？",function(e){
			if(e){
				location.href="${pageContext.request.contextPath}/RoleAction_foredit.action?role_id="+rows.role_id;
			}
		});
		
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_role">
		
		</table>
	</div>
</body>
</html>