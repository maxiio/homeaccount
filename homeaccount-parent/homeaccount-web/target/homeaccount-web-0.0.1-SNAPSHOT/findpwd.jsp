<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>找回密码</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/findpwd.css" />
		<STYLE type="text/css">
			.errorMessage{
				list-style-type: none;
			}
		</STYLE>
	</head>

	<body>
		<!--container主容器-->
		<div class="container">
			<div class="row">
				<div class="page-header hidden-xs">
					<h1>家庭记账系统 <small style="color: orangered;">用户找回密码</small></h1>
				</div>
				<div class="page-header visible-xs-block">
					<h4>家庭记账系统 <small style="color: orangered;">用户找回密码</small></h4>
				</div>
			</div>
		</div>
		<!--container主容器END-->
		<!--表单container-->
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath }/login.jsp">登录界面</a></li>
				<li>找回密码</li>
			</ol>

			<div class="row">

				<div class="col-md-offset-4 col-md-8 col-sm-offset-4 col-sm-8">
					<!--表单div-->
					<div class="row">
						<form class="form-horizontal" action="${pageContext.request.contextPath }/UserAction_findpwd.action" method="post">
						<div class="input-group col-md-offset-3 col-sm-offset-3 col-xs-offset-5">
									<b style="color: red;font-size: 12px">
							         <s:actionerror/>
						           </b>
							</div>
							<div class="input-group col-md-5 col-sm-5" style="margin-top: 10px;">

								<span class="input-group-addon glyphicon glyphicon-user" id="basic-addon1"></span>
								<input type="text" class="form-control" required="required" name="keyword" placeholder="请输入用户名/邮箱" aria-describedby="basic-addon1">

							</div>
							<div class="input-group col-md-5 col-sm-5" style="margin-top: 10px;">

								<span class="input-group-addon glyphicon glyphicon-lock " id="basic-addon1"></span>

								<input type="text" class="form-control" name="checkcode" required="required" placeholder="请输入验证码" aria-describedby="basic-addon1">
							</div>
							<div class="form-group">
								<div class="col-md-offset-2 col-sm-offset-2 col-xs-offset-4" style="margin-top: 10px;">

									<img id="loginform:vCode" src="${pageContext.request.contextPath }/validatecode.jsp"
							      /><a href="javascript:;" onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">看不清，换一张？</a>
								</div>
							</div>
							<div class="input-group col-md-offset-3 col-sm-offset-3 col-xs-offset-5">
								<input type="submit" class="btn btn-info" style="width:100px;" value="下一步" />
							</div>
						</form>
					</div>
					<!--表单div end-->
				</div>
				<!--row div end-->
			</div>
			<!--ROW END-->
		</div>
		<!--表单containerEND-->
		<!--containerEND-->
		<div class="container" style="margin-top:240px;">
			<%@include file="/WEB-INF/user/common/foot.jsp" %>
		</div>
	</body>

</html>