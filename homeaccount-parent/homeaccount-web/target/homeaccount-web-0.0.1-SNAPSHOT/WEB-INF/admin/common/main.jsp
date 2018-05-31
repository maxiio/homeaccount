<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"></script>
<title>后台管理界面</title>
<script type="text/javascript">
	$(function(){
		//提示框
		$.messager.show({
			title:'系统提示',
			msg:'欢迎您管理员【<s:property value="#session.currentManager.manager_name"/>】',
			timeout:5000,
			showType:'slide'
		})
	})
	//动态添加选项卡
	function zTreeOnClick(event,treeId,treeNode,clickFlag){
			if(treeNode.page!=undefined&&treeNode.page!=null&&treeNode.page!=''){
				var content='<iframe frameborder="0" height="100%" width="100%" src="${pageContext.request.contextPath}/'+treeNode.page+'"></iframe>';
				if($("#tt").tabs("exists",treeNode.name)){
					$("#tt").tabs("select",treeNode.name);
					var tab = $('#tt').tabs('getSelected'); 
					$('#tt').tabs('update', {
					    tab: tab,
					    options: {
					        title: treeNode.name,
					        content: content
					    }
					});
				}else{
					$("#tt").tabs("add",{
						title:treeNode.name,
						content:content,
						closable:true
					})
				}
			}
	}
	
	//打开修改密码窗口
	function openEditPwdWindow(){
		$("#editPwdWindow").window('open');
	}
	//联系管理员
	function call(){
		$("#callWindow").window('open');
	}
	function closecallWindow(){
		$("#callWindow").window('close');
	}
	//提交修改密码
	function editPwd(){
		var v=$("#editPasswordForm").form("validate");
		if(v){
			var v1=$("#txtNewPass").val();
			var v2=$("#txtRePass").val();
			if(v1==v2){
				window.location.href="${pageContext.request.contextPath}/ManagerAction_editPwd.action?manager_pwd="+v1;
			}else{
				$.messager.alert("提示信息","两次密码输入不一致","warning");
			}
		}
	}
	//取消修改密码
	function closeEditPwdWindow(){
		$("#editPwdWindow").window('close');
	}
	//更换皮肤
	function changeTheme(themeName) {
		var $easyuiTheme = $('#easyuiTheme');
		var url = $easyuiTheme.attr('href');
		var href = url.substring(0, url.indexOf('themes')) + 'themes/'
				+ themeName + '/easyui.css';
		$easyuiTheme.attr('href', href);
		var $iframe = $('iframe');
		if ($iframe.length > 0) {
			for ( var i = 0; i < $iframe.length; i++) {
				var ifr = $iframe[i];
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			}
		}
	};
	
	//退出系统事件
	function exit(){
		$.messager.confirm('确认提示框','确定要退出系统吗?',function(r){ 
			if (r){ 
				window.location.href="${pageContext.request.contextPath}/ManagerAction_logout.action";
			} 
			});
	}
</script>
</head>
<body class="easyui-layout"> 
	<div data-options="region:'north',split:true" style="height:70px">
           <div style="float: left;">
			   <img alt="" src="${pageContext.request.contextPath }/images/admin_logo.png">
           </div>
           <div style="float: right;line-height: 60px;">
			   欢迎您,管理员<strong>【<s:property value="#session.currentManager.manager_name"/>】</strong>
			<a href="javascript:void(0)" class="easyui-menubutton" data-options="menu:'#pf',iconCls:'icon-ok'">更换皮肤</a> 
			<a href="javascript:void(0)" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-help'">控制面板</a> 
			<div id="mm" style="width:150px;"> 
				<div data-options="iconCls:'icon-edit'" onclick="openEditPwdWindow()">修改密码</div> 
				<div data-options="iconCls:'icon-user'" onclick="call()">联系管理员</div>
				<div class="menu-sep"></div> 
				<div data-options="iconCls:'icon-cancel'" onclick="exit()">退出系统</div> 
			</div>
			<div id="pf" style="width:150px;"> 
				<div onclick="changeTheme('default');">default</div>
				<div onclick="changeTheme('gray');">gray</div>
				<div onclick="changeTheme('black');">black</div>
				<div onclick="changeTheme('bootstrap');">bootstrap</div>
				<div onclick="changeTheme('metro');">metro</div>
			</div>
           </div>
	</div> 
	<div data-options="region:'west',title:'菜单列表',split:true" style="width:195px;">
			<div class="easyui-accordion" data-options="fit:true">
				<div title="基础菜单" data-options="iconCls:'icon-basic'">
					<ul id="permissions" class="ztree"></ul>
					<script type="text/javascript">
						$(function(){
							var setting={
									data: {
										simpleData: {
											enable: true,
										}
									},
									callback:{
										onClick:zTreeOnClick
									}
							};
							var url1="${pageContext.request.contextPath}/FunctionAction_findMenu.action";
							$.post(url1,function(date){
								 $.fn.zTree.init($("#permissions"),setting,date);
							},"json");
							
							var url2="${pageContext.request.contextPath}/json/sys.json";
							$.post(url2,{},function(zNodes){
							  	 $.fn.zTree.init($("#roles"),setting,zNodes);
							},"json");
						});
					</script>
				</div>
				<div title="系统菜单" data-options="iconCls:'icon-basic'">
					<ul id="roles" class="ztree"></ul>
				</div>
			</div>
	</div> 
	<div data-options="region:'center',split:true" style="background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<div title="首页" data-options="iconCls:'icon-home'" align="center">
				<div style="padding-top: 160px;">
					<h1>欢迎使用家庭记账后台管理系统</h1>
					<h3>welcome！</h3>
				</div>
			</div>
		</div>
	</div> 
	<div data-options="region:'south',split:true" style="height:40px;">
		<center>
			家庭记账系统后台管理
		</center>
	</div> 
	
	<!-- 弹出窗口==修改密码 -->
	<div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 160px; padding: 5px;
        background: #fafafa">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
            <form method="post" id="editPasswordForm">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" name="manager_pwd" type="Password" data-options="validType:'length[6,12]'" class="txt01 easyui-validatebox" required="true"/></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" name="okpwd" type="Password" data-options="validType:'length[6,12]'" class="txt01 easyui-validatebox" required="true"/></td>
                    </tr>
                </table>
            </div>
            </form>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a onclick="editPwd()" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >确定</a> 
                <a onclick="closeEditPwdWindow()" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
           
	    </div>
	</div>
	<!-- 联系管理员窗口 -->
	<div id="callWindow" class="easyui-window" title="联系管理员" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false"
        maximizable="false" icon="icon-menu"  style="width: 300px; height: 160px; padding: 5px;background: #fafafa">
        <div class="easyui-layout" fit="true">
	            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
	            	<strong>管理员邮箱：javazt@126.com</strong><br>
	            	<strong>管理员qq：1534479537</strong>
		       </div>
	     </div>
	 </div>
</body> 
</html>