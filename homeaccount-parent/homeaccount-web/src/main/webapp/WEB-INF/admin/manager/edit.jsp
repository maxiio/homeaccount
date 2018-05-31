<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
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
<title>管理员修改</title>
<script type="text/javascript">
	$(function(){
		$("body").css({visibility:"visible"});
		$("#edit").click(function(){
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
			<a id="edit" icon="icon-save" href="javascript:;" class="easyui-linkbutton" plain="true" >保存</a>
		</div>
	</div>
    <div region="center" style="overflow:auto;padding:5px;" border="false">
       <form id="form" method="post" action="ManagerAction_update.action">
           <table class="table-edit"  width="95%" align="center">
           		<tr class="title"><td colspan="4">基本信息</td></tr>
           			<input name="manager_id" type="hidden" value="<s:property value="#manager.manager_id"/>"/>
	           	<tr><td>用户名:</td><td><input type="text" name="manager_name" id="manager_name" class="easyui-validatebox" required="true" value='<s:property value="#manager.manager_name"/>' /></td>
					<td>口令:</td><td><input type="password"  id="manager_pwd" class="easyui-validatebox"  name="manager_pwd"/><input type="button"class="easyui-validatebox" value="初始化密码" onclick="initpwd('<s:property value="#manager.manager_id"/>')"/></td></tr>
				<tr class="title"><td colspan="4">其他信息</td></tr>
	           	<tr><td>身份证:</td><td><input type="text" name="manager_idcard" id="manager_idcard" class="easyui-numberbox" value='<s:property value="#manager.manager_idcard"/>'/></td>
					<td>出生日期:</td><td><input type="text" name="birthday" id="birthday" class="easyui-datebox" value='<s:property value="#manager.birthday_s"/>'/></td></tr>
	           	<tr><td>性别:</td><td>
	           		 <span class="radioSpan">
			                <input type="radio" name="manager_sex" value="男" <s:property value="#manager.manager_sex=='男'?'checked':''"/>>男</input>
			                <input type="radio" name="manager_sex" value="女" <s:property value="#manager.manager_sex=='女'?'checked':''"/>>女</input>
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
						<input type="text" name="manager_number" value='<s:property value="#manager.manager_number"/>' id="telephone" class="easyui-validatebox" required="true" />
					</td>
				</tr>
	           	<tr><td>备注:</td><td colspan="3"><textarea style="width:75%;height: 100px" name="manager_face"><s:property value="#manager.manager_face"/></textarea></td></tr>
	           	<tr>
	           		<td>选择角色：</td>
	           		<td colspan="3" id="role">
		           		
	           		</td>
	           		<script>
	           			$(function(){
	           				$('#station').combobox('select',"<s:property value="#manager.manager_address"/>");
	           				$.post("RoleAction_listajax.action",function(data){
									var arr=new Array();
									<s:iterator var="role" value="#manager.roles">
				           			   arr.push("<s:property value="#role.role_id"/>");
				           		    </s:iterator>
								for(var i=0;i<data.length;i++){
									var id=data[i].role_id;
									var name=data[i].role_name;
									var ischeck='';
									for(var j=0;j<arr.length;j++){
										if(arr[j]==id){
											ischeck='checked';
										}
									}
		           					$("#role").append("<input id="+id+" type='checkbox' "+ischeck+" name='roleIds' value="+id+"><label for='"+id+"'>"+name+"</label>");									
								}
	           				});
	           			});
	           			function initpwd(manager_id){
	           				$.post("ManagerAction_initpwd.action",{"manager_id":manager_id},function(data){
	           					if(data=='1'){
	           						$.messager.alert("系统提示","初始化密码成功！","info");
	           					}else{
	           						$.messager.alert("系统提示","初始化密码失败！","error");
	           					}
	           				})
	           			}
	           		</script>
	           	</tr>
           </table>
       </form>
	</div>
</body>
</html>