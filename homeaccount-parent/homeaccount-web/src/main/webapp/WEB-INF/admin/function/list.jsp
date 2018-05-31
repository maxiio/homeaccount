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
<title>权限列表</title>

<script type="text/javascript">
	$(function(){
		$("#grid").datagrid({
			toolbar : [
				<shiro:hasPermission name="function-add">
				{
					id : 'add',
					text : '添加权限',
					iconCls : 'icon-add',
					handler : function(){
						location.href='${pageContext.request.contextPath}/page_admin_function_add.action';
					}
				},
				</shiro:hasPermission>
				<shiro:hasPermission name="function-update">
				{
					id : 'update',
					text : '修改权限',
					iconCls : 'icon-edit',
					handler : function(){
						  var rows =$("#grid").datagrid("getSelected");
						  if(rows==null||rows.length==0){
							  $.messager.alert("提示","你还没有选择！","warning");
							  return ;
						  }
						  $.messager.confirm("提示","你确定要修改吗？",function(e){
								if(e){
									location.href="FunctionAction_foredit.action?id="+rows.id;
								}
							});
					}
				}
				</shiro:hasPermission>
			],
			url : '${pageContext.request.contextPath}/FunctionAction_pageQuery.action',
			pagination : true,
			singleSelect:true,
			fit:true,
			columns : [[
			  {
				  field : 'id',
				  title : '编号',
				  width : 200,
				  checkbox:true
			  },
			  {
				  field : 'name',
				  title : '名称',
				  width : 200
			  },  
			  {
				  field : 'fundesc',
				  title : '描述',
				  width : 200
			  },  
			  {
				  field : 'generatemenu',
				  title : '是否生成菜单',
				  width : 150,
				  formatter : function(data,row, index){
						if(data=="1"){
							return "是";
						}else{
							return "否";
						}
					}
			  },  
			  {
				  field : 'zindex',
				  title : '优先级',
				  width : 200
			  },  
			  {
				  field : 'page',
				  title : '路径',
				  width : 240
			  }
			]]
		});
	});
</script>	
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<table id="grid"></table>
	</div>
</body>
</html>