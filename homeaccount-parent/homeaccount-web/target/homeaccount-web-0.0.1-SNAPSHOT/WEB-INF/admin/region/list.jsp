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
<title>分区列表</title>
<script type="text/javascript">
	$(function(){
		$("#tb_region").datagrid({
			columns:[[
				{title:'编号',field:'region_id',checkbox:true},
				{title:'大区名称',field:'region_name',width:200,align:'center'},
				{title:'描述',field:'region_desc',width:200,align:'center'}
			]],
			url:'${pageContext.request.contextPath}/RegionAction_listajax.action',
			rownumbers:true,
			striped:true,
			pageList: [10,15,20],
			toolbar:[
				<shiro:hasPermission name="region-add">
					{text:'添加',iconCls:'icon-add',handler:addRegion},
				</shiro:hasPermission>
				<shiro:hasPermission name="region-edit">
				    {text:'修改',iconCls:'icon-edit',handler:editRegion},
				</shiro:hasPermission>
				<shiro:hasPermission name="region-delete">
				    {text:'删除',iconCls:'icon-remove',handler:deleteRegion}
				</shiro:hasPermission>
			],
			pagination:true,
			fit : true
		});
	});
	//打开添加窗口
	function addRegion(){
		$("#addRegionWindow").window('open');
		$("#save").click(function(){
		   var r= $("#addRegionForm").form("validate");
		   if(r){
			   $("#addRegionForm").submit();
		   }
		})
	}
	
	//打开修改窗口
	function editRegion(){
		var rows = $('#tb_region').datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert("系统提示","请选择大区！","warning");
			return;
		}
		if(rows.length>1){
			$.messager.alert("系统提示","只能选择一个大区！","warning");
			return;
		}
		$("#editRegionWindow").window('open');
		$("#editRegionForm").form("load",{
			region_id:rows[0].region_id,
			region_name:rows[0].region_name,
			region_desc:rows[0].region_desc
		})
		$("#edit").click(function(){
			var r=$("#editRegionForm").form("validate");
			if(r){
				$.messager.confirm("提示","你确定要修改吗？",function(e){
					if(e){
						$("#editRegionForm").submit();
						$("#editRegionWindow").window('close');
					}
				});
			}
		})
		
	}
	
	//删除事件
	function deleteRegion(){
		var row = $('#tb_region').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要删除这"+row.length+"个大区？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].region_id);
				}
				location.href="${pageContext.request.contextPath}/RegionAction_delete.action?region_ids="+arr.join(",");
			}
		});
	}
	
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_region">
		</table>
	</div>
	<!--修改大区 窗口-->
	<div id="editRegionWindow" title="修改大区窗口" class="easyui-window" closed="true" modal="true" collapsible="false" minimizable="false" maximizable="false" style="height:300px;width:360px;top:20px;left:200px">
			<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
					<div class="datagrid-toolbar">
						<a id="edit" icon="icon-save" href="javascript:;" class="easyui-linkbutton" plain="true" >保存</a>
					</div>
			</div>
			<div region="center" style="overflow:auto;padding:5px;" border="false">
			   <form id="editRegionForm" action="${pageContext.request.contextPath}/RegionAction_update.action" method="post">
				    <table class="table-edit" width="100%" align="center">
						<tr class="title">
							<td colspan="2" align="center">大区信息</td>
							<input type="hidden" name="region_id"/>
						</tr>
						<tr>
							<td>大区名称</td>
							<td><input type="text" name="region_name" class="easyui-validatebox" required="true"/></td>
						</tr>
						<tr>
							<td>大区描述</td>
							<td><textarea rows="5" cols="30" name="region_desc"></textarea></td>
						</tr>
					</table>
			   </form>
		</div>
	</div>
	<!--添加大区 窗口-->
	<div id="addRegionWindow" title="添加大区窗口" class="easyui-window" closed="true" modal="true" collapsible="false" minimizable="false" maximizable="false" style="height:300px;width:360px;top:20px;left:200px">
			<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
					<div class="datagrid-toolbar">
						<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
					</div>
			</div>
				
			<div region="center" style="overflow:auto;padding:5px;" border="false">
					<form id="addRegionForm" action="${pageContext.request.contextPath }/RegionAction_add.action" method="post">
						<table class="table-edit" width="100%" align="center">
							<tr class="title">
								<td colspan="2" align="center">大区信息</td>
							</tr>
							<tr>
								<td>大区名称</td>
								<td><input type="text" name="region_name" class="easyui-validatebox" required="true"/></td>
							</tr>
							<tr>
								<td>大区描述</td>
								<td><textarea rows="5" cols="30" name="region_desc"></textarea></td>
							</tr>
						</table>
			   </form>
		</div>
	</div>
</body>
</html>