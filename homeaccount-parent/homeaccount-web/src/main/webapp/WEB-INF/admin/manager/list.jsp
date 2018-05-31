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
<title>管理员列表</title>
<script type="text/javascript">
	$(function(){
		$("#tb_manager").datagrid({
			columns:[[
				{title:'编号',field:'manager_id',checkbox:true},
				{title:'姓名',field:'manager_name',width:100,align:'center'},
				{title:'身份证',field:'manager_idcard',width:220,align:'center'},
				{title:'性别',field:'manager_sex',width:80,align:'center'},
				{title:'手机号',field:'manager_number',width:120,align:'center'},
				{title:'地址',field:'manager_address',width:300,align:'center'},
				{title:'拥有角色',field:'rolenames',width:260,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/ManagerAction_pageQuery.action',
			rownumbers:true,
			striped:true,
			toolbar:[
				<shiro:hasPermission name="manager-add">
					{text:'添加',iconCls:'icon-add',handler:addManager},
				</shiro:hasPermission>
				
				<shiro:hasPermission name="manager-update">
					{text:'修改',iconCls:'icon-edit',handler:editManager},
				</shiro:hasPermission>
				<shiro:hasPermission name="manager-delete">
					{text:'删除',iconCls:'icon-remove',handler:deleteManager},
				</shiro:hasPermission>
				{text:'查询',iconCls:'icon-search',handler:function(){
					alert("查询");
				}}
				        
			],
			pagination:true,
			fit : true
		});
	});
	
	function addManager(){
		location.href="${pageContext.request.contextPath}/page_admin_manager_add.action"
	}
	
	function deleteManager(){
		alert("删除管理员");
	}
	function editManager(){
		var rows=$("#tb_manager").datagrid("getSelected");
		if(rows.length==0||rows==null){
			$.messager.alert("提示","请选择!","warning");
			return ;
		}
		$.messager.confirm("提示","您确定要修改"+rows.manager_name+"的信息吗？",function(e){
			if(e){
				location.href="${pageContext.request.contextPath}/ManagerAction_foredit.action?manager_id="+rows.manager_id;s
			}
		});
	}
	
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_manager">
		</table>
	</div>
</body>
</html>