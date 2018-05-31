<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>分区修改</title>
<script type="text/javascript">
	$(function(){
		// 点击保存
		$('#save').click(function(){
			//表单校验
			var v = $("#regionForm").form("validate");
			if(v){
				$("#regionForm").submit();
			}
		});
	});
</script>	
</head>
<body class="easyui-layout">
<div data-options="region:'north'">
	<div class="datagrid-toolbar">
		<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
	</div>
</div>
<div data-options="region:'center'">
	<form id="regionForm" method="post" action="${pageContext.request.contextPath }/RegionAction_add.action">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">大区信息</td>
					</tr>
					<tr>
						<td width="200">大区名称</td>
						<td>
							<input type="text" name="region_name" class="easyui-validatebox" data-options="required:true" />						
						</td>
					</tr>
					<tr>
						<td>大区描述</td>
						<td>
							<textarea name="region_desc" rows="4" cols="60"></textarea>
						</td>
					</tr>
					</table>
			</form>
</div>
</body>
</html>