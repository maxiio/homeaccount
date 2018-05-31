<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/ztree/jquery.ztree.all-3.5.js"></script>
<title>家庭记账系统后台管理界面</title>
<script type="text/javascript">
	$(function(){
		$.messager.show({
			title:'欢迎信息',
			msg:'欢迎【admin】登录系统',
			timeout:5000,
			showType:'slide'
		})
	})
</script>
</head>
<body class="easyui-layout"> 
	<div data-options="region:'north',split:true" style="height:70px;background-color: #149C59">
           <div style="float: left;">
			   <img alt="" src="${pageContext.request.contextPath }/images/admin_logo.png">
           </div>
           <div style="float: right;line-height: 60px;">
			   欢迎您,管理员【admin】
			 <a href="">注销</a>
           </div>
	</div> 
	<div data-options="region:'west',title:'菜单列表',split:true" style="width:160px;">
			<div class="easyui-accordion" data-options="fit:true">
				<div title="用户管理" data-options="iconCls:'icon-reload'">
					<ul id="u" class="ztree"></ul>
					<script type="text/javascript">
						$(function(){
							var setting={
									data:{
										simpleData:{
											enable:true
										}
									},
									callback:{
										onClick:function(event,treeId,treeNode){
											if(treeNode.page!=undefined){
												var content='<div style="width:100%;height:100%;overflow:hidden;">'
													+'<iframe src="'
													+'${pageContext.request.contextPath}/admin/user/'+treeNode.page+'" scrolling="auto" style="width:100%;height:100%;border:0;"></iframe></div>';
												var ext=$("#tt").tabs("exists",treeNode.name);
												if(ext){
													$("#tt").tabs("select",treeNode.name);
												}else{
													
														$("#tt").tabs("add",{
															title:treeNode.name,
															icon:'icon-tip',
															closable:true,
															content:content
														})
												}
											}
										}
									}
							};
							var url="${pageContext.request.contextPath}/json/u.json";
							$.post(url,{},function(data){
							  $.fn.zTree.init($("#u"),setting,data);
							},'json');
						});
					</script>
				</div>

				
				<div title="账单管理"  data-options="iconCls:'icon-ok'">
					<ul id="account" class="ztree"></ul>
					</script>
				</div>
				<div title="账单类型管理"  data-options="iconCls:'icon-ok'">
					<ul id="accounttype" class="ztree"></ul>
					</script>
				</div>
				<div title="交流大区管理"  data-options="iconCls:'icon-undo'">
					<ul id="area" class="ztree"></ul>
				</div>
				
				<div title="帖子管理"  data-options="iconCls:'icon-help'">
				<ul id="topic" class="ztree">
				
				</ul>
					<script type="text/javascript">
						$(function(){
							var setting3={
									data:{
										simpleData:{
											enable:true
										}
									},
									callback:{
										onClick:function(event,treeId,treeNode){
											if(treeNode.page!=undefined){
												var content='<div style="width:100%;height:100%;overflow:hidden;">'
												+'<iframe src="'
												+'${pageContext.request.contextPath}/admin/one.jsp" scrolling="auto" style="width:100%;height:100%;border:0;"></iframe></div>';
												var ext=$("#tt").tabs("exists",treeNode.name);
												if(ext){
													
													$("#tt").tabs("select",treeNode.name);
												    var tab=$("#tt").tabs("getSelected");
													
													$("#tt").tabs('update',{
														tab:tab,
														options:{
															title:treeNode.name,
															content:content
														}
													}); 
												}else{
														$("#tt").tabs("add",{
															title:treeNode.name,
															icon:'icon-tip',
															closable:true,
															content:content
														});
												}
											}
										}
									}
							};
							var url="${pageContext.request.contextPath}/json/menu.json";
							$.post(url,{},function(data){
							  $.fn.zTree.init($("#topic"),setting3,data);
							},'json');
						});
					</script>
				</div>
				<div title="反馈中心"  data-options="iconCls:'icon-undo'">
					<ul id="area" class="ztree"></ul>
				</div>
				<div title="角色管理"  data-options="iconCls:'icon-undo'">
					<ul id="area" class="ztree"></ul>
				</div>
				<div title="帮助中心" data-options="iconCls:'icon-help'">
					
				</div>
				<div title="友情提醒" data-options="iconCls:'icon-tip'">
					
				</div>
			</div>
	</div> 
	<div data-options="region:'center',split:true" style="background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			
		</div>
	</div> 
	<div data-options="region:'south',split:true" style="height:40px;">
		
		<center>
			家庭记账系统后台管理
		</center>
	</div> 

</body> 


</html>