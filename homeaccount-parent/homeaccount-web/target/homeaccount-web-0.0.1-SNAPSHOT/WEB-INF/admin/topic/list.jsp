<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>主题帖</title>
<script type="text/javascript">
	$(function(){
		$("#tb_topic").datagrid({
			columns:[[
				{title:'编号',field:'topic_id',checkbox:true},
				{title:'<strong>主题帖标题</strong>',field:'topic_title',width:200},
				{title:'<strong>发表者</strong>',field:'user',align:'center',width:120,formatter:function(v){
					return v.user_name;
				}},
				{title:'<strong>所属大区</strong>',field:'region',align:'center',width:120,formatter:function(v){
					return v.region_name;
				}},
				{title:'<strong>发表时间</strong>',field:'topic_datetime_s',align:'center'},
				{title:'<strong>是否置顶</strong>',field:'is_top',align:'center',formatter:function(v){
					if(v=='1'){
						return "<span style='color:red;'>是</span>";
					}else{
						return "否";
					}
				}},
				{title:'<strong>是否加精</strong>',field:'is_good',align:'center',formatter:function(v){
					if(v=='1'){
						return "<span style='color:red;'>是</span>";
					}else{
						return "否";
					}
				}},
				{title:'<strong>是否结贴</strong>',field:'is_end',align:'center',formatter:function(v){
					if(v=='1'){
						return "<span style='color:red;'>是</span>";
					}else{
						return "否";
					}
				}},
				{title:'<strong>浏览量</strong>',field:'look_count',align:'center'},
				{title:'<strong>是否删除',field:'del',align:'center',formatter:function(v){
					if(v=='1'){
						return "<span style='color:red;'>是</span>";
					}else{
						return "否";
					}
				}},
				{title:'<strong>点赞数</strong>',field:'topic_zan',align:'center'},
				{title:'<strong>鄙视数</strong>',field:'topic_bad',align:'center'}
			]],
			url:'${pageContext.request.contextPath}/TopicAction_pageQuery.action',
			rownumbers:true,
			striped:true,
			pageList: [10,15,20],
			toolbar:[
				{text:'搜索',iconCls:'icon-search',handler:search},
				<shiro:hasPermission name="topic-top">
					{text:'置顶',iconCls:'icon-ok',handler:toTop},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-notop">
					{text:'取消置顶',iconCls:'icon-no',handler:noTop},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-good">
					{text:'加精',iconCls:'icon-tip',handler:isGood},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-nogood">
					{text:'取消加精',iconCls:'icon-redo',handler:noGood},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-delete">
					{text:'删除',iconCls:'icon-cut',handler:deleteTopic},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-undelete">
					{text:'恢复删除',iconCls:'icon-save',handler:noDelete},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-end">
					{text:'结贴',iconCls:'icon-remove',handler:end},
				</shiro:hasPermission>
				<shiro:hasPermission name="topic-unend">
					{text:'取消结贴',iconCls:'icon-reload',handler:unend},
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
		//搜索按钮事件
		$("#btn_search").click(function(){
			var p=$("#searchForm").serializeJson();
			$("#tb_topic").datagrid("load",p);
			$("#searchWindow").window("close");
		});
	});
	//打开搜索窗口
	function search(){
		$("#searchWindow").window("open");
	}
	function toTop(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要置顶这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_top.action?topic_ids="+arr.join(",");
			}
		});
	}
	//TODO 合并置顶和不置顶
	function noTop(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要取消置顶这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_noTop.action?topic_ids="+arr.join(",");
			}
		});
	}
	function isGood(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要加精这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_good.action?topic_ids="+arr.join(",");
			}
		});
	}
	function noGood(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要取消加精这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_noGood.action?topic_ids="+arr.join(",");
			}
		});
	}
	function deleteTopic(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要取消删除这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_deleteBatch.action?topic_ids="+arr.join(",");
			}
		});
	}
	function noDelete(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要删除这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_noDelete.action?topic_ids="+arr.join(",");
			}
		});
	}
	function end(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要结贴这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_adminend.action?topic_ids="+arr.join(",");
			}
		});
	}
	function unend(){
		var row = $('#tb_topic').datagrid('getSelections');
		if(row.length==0){
			$.messager.alert("系统提示","请选择！","warning");
			return;
		}
		$.messager.confirm("提示","你确定要取消结贴这"+row.length+"条主题帖？",function(e){
			if(e){
				var arr=new Array();
				for(var i=0;i<row.length;i++){
					arr.push(row[i].topic_id);
				}
				location.href="${pageContext.request.contextPath}/TopicAction_unend.action?topic_ids="+arr.join(",");
			}
		});
	} 
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<table id="tb_topic"></table>
	</div>
	
	<!-- 查询主题帖 -->
	<div class="easyui-window" title="查询窗口" id="searchWindow" closed="true" modal="true" collapsible="false" minimizable="false" maximizable="false" style="height:300px;width:360px;top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="100%" align="center">
					<tr class="title">
						<td colspan="2" align="center">查询条件</td>
					</tr>
					<tr>
						<td>主题帖标题：</td>
						<td><input type="text" class="easyui-validatebox" style="width:180px;" name="topic_title"/></td>
					</tr>
					<tr>
						<td>发表时间：</td>
						<td>
							<input class="easyui-datebox" name="topic_datetime" style="width:180px;">
						</td>
					</tr>
					<tr>
						<td>是否置顶：</td>
						<td>
							<select name="is_top" class="easyui-combobox" style="width:180px;">
								<option value="">不限</option>
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>是否加精：</td>
						<td>
							<select name="is_good" class="easyui-combobox" style="width:180px;">
								<option value="">不限</option>
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>是否结贴：</td>
						<td>
							<select name="is_end" class="easyui-combobox" style="width:180px;">
								<option value="">不限</option>
								<option value="0">否</option>
								<option value="1">是</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>是否删除：</td>
						<td>
							<select name="del" class="easyui-combobox" style="width:180px;">
								<option value="">不限</option>
								<option value="0">否</option>
								<option value="1">是</option>
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
</body>
</html>