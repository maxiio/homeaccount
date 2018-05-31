<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>个人中心-个人资料-修改成功</title>
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container">
			<ol class="breadcrumb">
				<li>
					<a href="${pageContext.request.contextPath }/MainAction_forindex.action">首页</a>
				</li>
				<li><a href="javascript:;">个人中心</a></li>
				<li>会员中心</li>
			</ol>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default" align="center">
						<div class="panel-heading">
							<h3><span class="label label-warning">会员用户VIP</span></h3>
						</div>
					  <div class="panel-body">
					   <p>功能介绍：会员用户，可以进行支出账单、收入账单的统计查看、录入、修改、删除、不可以进行账本的操作。
					   用户交流功能。</p>
					   <p class="bg-danger">送（永久会员）</p>
					  </div>
					  <div class="panel-footer">
					  		<a href="javascript:;" class="btn btn-success">联系管理员</a>
					  </div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default" align="center">
						<div class="panel-heading">
							<h3><span class="label label-danger">超级会员SVIP</span></h3>
						</div>
					  <div class="panel-body">
					   <p>
					   	功能介绍：该用户可以进行支出账单、收入账单的统计查看、录入、修改、删除、还可以进行账本的操作。
					      	进入用户交流区发帖、回复、浏览的功能。拥有尽有
					   </p>
					   <p class="bg-danger">送（永久会员）</p>
					  </div>
					  <div class="panel-footer">
					  		<a href="javascript:;" class="btn btn-success">联系管理员</a>
					  </div>
					</div>
				</div>
			</div>
		</div>
		
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
		
	</body>

</html>