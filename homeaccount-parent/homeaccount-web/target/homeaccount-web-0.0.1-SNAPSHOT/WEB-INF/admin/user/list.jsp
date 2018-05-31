<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
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
<title>用户列表</title>
<script type="text/javascript">
	$(function(){
		$("#tb_user").datagrid({
			columns:[[
				{title:'编号',field:'user_id',checkbox:true},
				{title:'姓名',field:'user_name',width:100,align:'center'},
				{title:'身份证',field:'idcard',width:120,align:'center',formatter:function(value,row,index){
					if(value==''){
						return "暂无数据";
					}
						return value;
					
				}},
				{title:'性别',field:'user_sex',width:100,align:'center',formatter:function(value,row,index){
					if(value==''){
						return "保密";
					}
					return value;
				}},
				{title:'手机号',field:'user_phone',width:100,align:'center'},
				{title:'状态',field:'state',width:120,align:'center',formatter:function(value,row,index){
					if(value==0){
						return "正常";
					}else{
						return "被封";
					}
				}},
				{title:'级别',field:'level',width:120,align:'center',formatter:function(data,row,index){
					if(data=='0'){
						return "普通用户";
					}else if(data=='1'){
						return "会员用户";
					}else if(data=='2'){
						return "超级会员";
					}
				}},
				{title:'用户积分',field:'score',width:120,align:'center'},
				{title:'最近登录时间',field:'loginDate_s',width:120,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/UserAction_pageQuery.action',
			rownumbers:true,
			fitColumns:true,
			striped:true,
			idField:"user_id",
			pageList: [10,15,20],
			toolbar:[
				{text:'查询',iconCls:'icon-search',handler:searchUser},
				<shiro:hasPermission name="user-level">
					{text:'修改',iconCls:'icon-edit',handler:editUser},
				</shiro:hasPermission>
				<shiro:hasPermission name="user-stop">
					{text:'封禁',iconCls:'icon-no',handler:fengUser},
				</shiro:hasPermission>
				<shiro:hasPermission name="user-open">
					{text:'解封',iconCls:'icon-back',handler:jieUser}
				</shiro:hasPermission>
			],
			pagination:true,
			fit : true
		});
		//定义一个工具方法，用于将指定的form表单中所有的输入项转为json数据{key:value,key:value}
		$.fn.serializeJson=function(){  
		    var serializeObj={};  
		    var array=this.serializeArray();
		    $(array).each(function(){  
		        if(serializeObj[this.name]){  
		            if($.isArray(serializeObj[this.name])){  
		                serializeObj[this.name].push(this.value);  
		            }else{  
		                serializeObj[this.name]=[serializeObj[this.name],this.value];  
		            }  
		        }else{  
		            serializeObj[this.name]=this.value;   
		        }  
		    });  
		    return serializeObj;  
		}; 
		//查询
		$("#btn_search").click(function(){
			var p=$("#searchForm").serializeJson();
			$("#tb_user").datagrid("load",p);
			$("#searchWindow").window("close");
		})
		//修改等级事件
		$("#btn_editLevel").click(function(){
			$("#editLevelForm").submit();
			$("#editLevelForm").form("clear");
		})
	});
	function searchUser(){
		$("#searchWindow").window('open');
	}
	//修改用户级别
	function editUser(){
		var rows = $('#tb_user').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert("系统提示","请选择用户！","warning");
			return;
		}
		if(rows.length>1){
			$.messager.alert("系统提示","只能选择一个用户！","warning");
			return;
		}
		$("#editLevelWindow").window("open");
		$("#editLevelForm").form("load",{
			user_id:rows[0].user_id,
			user_name:rows[0].user_name,
			level:rows[0].level
		})
	}
	//封禁用户
	function fengUser(){
		var rows = $('#tb_user').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert("系统提示","请选择用户！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要封禁这"+rows.length+"个用户？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<rows.length;i++){
					arr.push(rows[i].user_id);
				}
				location.href="${pageContext.request.contextPath}/UserAction_stop.action?user_ids="+arr.join(",");
			}
		});
	}
	//解封用户
	function jieUser(){
		var rows = $('#tb_user').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert("系统提示","请选择用户！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要解封这"+rows.length+"个用户？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<rows.length;i++){
					arr.push(rows[i].user_id);
				}
				location.href="${pageContext.request.contextPath}/UserAction_open.action?user_ids="+arr.join(",");
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_user">
		
		</table>
	</div>

	<!-- 查询用户 -->
	<div class="easyui-window" title="查询窗口" id="searchWindow" closed="true" modal="true" collapsible="false" minimizable="false" maximizable="false" style="height:300px;width:360px;top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="100%" align="center">
					<tr class="title">
						<td colspan="2" align="center">查询条件</td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td><input type="text" class="easyui-validatebox" style="width:180px;" name="user_name"/></td>
					</tr>
					<tr>
						<td>身份证号：</td>
						<td><input type="text" class="easyui-validatebox" style="width:180px;" name="idcard"/></td>
					</tr>
					<tr>
						<td>手机号：</td>
						<td><input type="text" class="easyui-validatebox"  style="width:180px;" name="user_phone"/></td>
					</tr>
					<tr>
						<td>状态：</td>
						<td>
							<select class="easyui-combobox" style="width:180px;" name="state">
							    <option value="">--不限--</option>
								<option value="0">正常使用</option>
								<option value="1">封禁</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>用户级别：</td>
						<td>
							<select class="easyui-combobox" style="width:180px;" name="level">
							    <option value="">--不限--</option>
								<option value="0">普通用户</option>
								<option value="1">会员用户</option>
								<option value="2">超级会员</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn_search" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!-- 修改用户等级 -->
	<div class="easyui-window" title="修改用户等级窗口" id="editLevelWindow" closed="true" modal="true" collapsible="false" minimizable="false" maximizable="false" style="height:300px;width:360px;top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="editLevelForm" action="${pageContext.request.contextPath }/UserAction_editLevel.action" method="post">
				<table class="table-edit" width="100%" align="center">
					<tr class="title">
						<td colspan="2" align="center">修改用户等级</td>
					</tr>
					<tr>
						<input type="hidden" name="user_id"/>
						<td>用户名：</td>
						<td><input type="text" class="easyui-validatebox" style="width:180px;" name="user_name" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>用户级别：</td>
						<td>
							<select class="easyui-combobox" style="width:180px;" name="level">
								<option value="0">普通用户</option>
								<option value="1">会员用户</option>
								<option value="2">超级会员</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a id="btn_editLevel" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确认修改</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>