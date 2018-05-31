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
<title>管理员添加</title>
<script type="text/javascript">
	$(function(){
		$("body").css({visibility:"visible"});
		$("#save").click(function(){
		   var v=$("#form").form("validate");
		   if(v){
			   $("#form").submit();
		   }
			
		})
	});
</script>
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
		<div class="datagrid-toolbar">
			<a id="save" icon="icon-save" href="javascript:;" class="easyui-linkbutton" plain="true" >保存</a>
		</div>
	</div>
    <div region="center" style="overflow:auto;padding:5px;" border="false">
       <form id="form" method="post" action="ManagerAction_add.action">
           <table class="table-edit"  width="95%" align="center">
           		<tr class="title"><td colspan="4">基本信息</td></tr>
	           	<tr><td>用户名:</td><td><input type="text" name="manager_name" id="manager_name" class="easyui-validatebox" required="true" /></td>
					<td>口令:</td><td><input type="password" name="manager_pwd" id="manager_pwd" class="easyui-validatebox" required="true" validType="minLength[5]" /></td></tr>
				<tr class="title"><td colspan="4">其他信息</td></tr>
	           	<tr><td>身份证:</td><td><input type="text" name="manager_idcard" id="manager_idcard" class="easyui-numberbox" /></td>
					<td>出生日期:</td><td><input type="text" name="birthday" id="birthday" class="easyui-datebox" /></td></tr>
	           	<tr><td>性别:</td><td>
	           		 <span class="radioSpan">
			                <input type="radio" name="manager_sex" value="男">男</input>
			                <input type="radio" name="manager_sex" value="女">女</input>
			         </span>
	           	</td>
					<td>职业:</td><td>
					<select name="manager_address" id="station" class="easyui-combobox" style="width: 150px;">
	           			<option value="">请选择</option>
	           			<option value="学生">学生</option>
	           			<option value="白领">白领</option>
	           			<option value="老板">老板</option>
	           			<option value="教师">教师</option>
	           			<option value="程序">程序员</option>
	           		</select>
				</td></tr>
				<tr>
					<td>联系电话</td>
					<td colspan="3">
						<input type="text" name="manager_number" id="telephone" class="easyui-validatebox" required="true" />
					</td>
				</tr>
	           	<tr><td>备注:</td><td colspan="3"><textarea style="width:75%;height: 100px" name="manager_face"></textarea></td></tr>
	           	<tr>
	           		<td>选择角色：</td>
	           		<td colspan="3">
	           			<input class="easyui-combotree" name="roleIds" data-options="url:'RoleAction_listajax.action',multiple:true,panelHeight:'auto'"> 
	           		</td>
	           	</tr>
           </table>
       </form>
	</div>
</body>
</html>