<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面头部</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/box.js"></script>
		<script type="text/javascript">
			//导航菜单--设置鼠标滑过
			$(function () {
			    $(".dropdown").mouseover(function () {
			        $(this).addClass("open");
			    });
			
			    $(".dropdown").mouseleave(function(){
			        $(this).removeClass("open");
			    })
			
			})
			function logout(){
				 Ewin.confirm({ message: "确定要注销吗？" }).on(function (e) {
	                 if (e) {
	                	 window.location.href="${pageContext.request.contextPath }/UserAction_logout.action";
	                }
					});
			}
			function search(){
				 Ewin.alert({message:"此功能还未完善！敬请期待..."});
			}
		</script>
		<style type="text/css">
		
		</style>
</head>
<body>
		<!--nav-->
		<nav class="navbar navbar-default" id="top">
			<!--nav container-fluid-->
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar">1</span>
				        <span class="icon-bar">2</span>
				        <span class="icon-bar">3</span>
				    </button>
					<a class="navbar-brand" href="${pageContext.request.contextPath }/MainAction_forindex.action" style="font-weight: bolder;margin-top: -4px;"><span class="glyphicon glyphicon-home" style="font-size: 20px;"></span>多功能家庭记账系统</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" id="menu">
						<li><a href="${pageContext.request.contextPath }/MainAction_forindex.action" >首页 <span class="sr-only">(current)</span></a></li>
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath }/img/out.png" />支出账单 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/OutAccountAction_list.action" style="color: red;"><span class="glyphicon glyphicon-yen"></span>支出账单列表</a></li>
								<li><a href="${pageContext.request.contextPath}/OutAccountTypeAction_list.action" style="color: red;"><span class="glyphicon glyphicon-list-alt"></span>支出账单类型</a></li>
								<s:if test="#session.currentUser.level==1||#session.currentUser.level==2">
								<li><a href="${pageContext.request.contextPath}/page_user_outaccount_report.action" style="color: red;"><span class="glyphicon glyphicon-list-alt"></span>支出报表展示</a></li>
								</s:if>
							</ul>
						</li>
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath }/img/in.png" />收入账单 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/InAccountAction_list.action" style="color: green;"><span class="glyphicon glyphicon-yen"></span>收入账单列表</a></li>
								<li><a href="${pageContext.request.contextPath}/InTypeAction_list.action" style="color: green;"><span class="glyphicon glyphicon-list-alt"></span>收入账单类型</a></li>
								<s:if test="#session.currentUser.level==1||#session.currentUser.level==2">
								<li><a href="${pageContext.request.contextPath}/page_user_inaccount_report.action" style="color: green;"><span class="glyphicon glyphicon-list-alt"></span>收入报表展示</a></li>
								</s:if>
							</ul>
						</li>
						<s:if test="#session.currentUser.level==2">
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-book"></span>我的账本<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/InvestAction_list.action"><span style="color: red;" class="glyphicon glyphicon-list"></span>投资理财</a></li>
								<li><a href="${pageContext.request.contextPath }/LoanAction_list.action"><span  style="color: red;" class="glyphicon glyphicon-list"></span>借款还贷</a></li>
							</ul>
						</li>
						</s:if>
						<li></li>
					</ul>
					<form class="navbar-form navbar-left" action="${pageContext.request.contextPath }/SearchAction_search.action" method="get">
						<div class="form-group">
							<input type="text" name="keyword" class="form-control" required placeholder="关键词" value='<s:property value="keyword"/>'>
						</div>
						<input type="submit" value="搜索" class="btn btn-default">
					</form> 
					<ul class="nav navbar-nav navbar-right">
						<li style="margin-top: 15px;">欢迎您的使用：</li>
						<li style="margin-top: 2px;">
							<h5><img alt="" src="${pageContext.request.contextPath }/<s:property value="#session.currentUser.face"/>" width="29" height="29"><s:property value="#session.currentUser.user_name"/>
								<s:if test="#session.currentUser.level==0">
									<span class="label label-success">普通用户</span>
								</s:if>
								<s:if test="#session.currentUser.level==1">
									<span class="label label-warning">会员用户</span>
								</s:if>
								<s:if test="#session.currentUser.level==2">
									<span class="label label-danger">超级会员</span>
								</s:if>
							</h5>
						</li>
						<li class="dropdown">
							<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/page_user_common_userdesc.action"><span class="glyphicon glyphicon-user"></span>个人资料</a></li>
								<li><a href="${pageContext.request.contextPath }/page_user_vip_buyvip.action"><img src="${pageContext.request.contextPath }/img/level.png" />会员中心</a></li>
								<li><a href="${pageContext.request.contextPath }/TopicAction_findByUser.action"><span class="glyphicon glyphicon-tags"></span>我的帖子</a></li>
								<li><a href="${pageContext.request.contextPath }/page_user_inform_list.action"><span class="glyphicon glyphicon-file"></span>系统公告</a></li>
								<li><a href="${pageContext.request.contextPath }/RegionAction_list.action"><span class="glyphicon glyphicon-comment"></span>交流中心</a></li>
								<li><a href="${pageContext.request.contextPath }/page_user_common_editpwd.action"><span class="glyphicon glyphicon-edit"></span>修改密码</a></li>
								<li><a href="javascript:;" onclick="logout()"><span class="glyphicon glyphicon-off"></span>注销用户</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	
</body>
</html>