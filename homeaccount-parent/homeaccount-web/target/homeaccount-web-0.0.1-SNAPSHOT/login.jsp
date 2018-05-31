<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>用户登录界面</title>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" />
		<STYLE type="text/css">
			.errorMessage{
				list-style-type: none;
			}
		</STYLE>
		<script type="text/javascript">
			if (window.self != window.top) {
				window.top.location = window.location;
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="row" >
				    <img src="${pageContext.request.contextPath}/img/logo.png" class="img-responsive"/>
			</div>
			<!--主ROW-->
			<div class="row">
				<!--ROWdiv-->
				<div class="col-md-offset-5 col-sm-offset-5 col-sm-4 col-md-4">
					<!--表单row-->
					<div class="row" style="border:1px solid #E7E7E7;" id="login">
						<form class="form-horizontal" method="post" action="UserAction_login.action">
							<div class="form-group">
								<div class="col-md-12 col-sm-12 hidden-xs" id="header">
									<h3>用户登录界面</h3>
								</div>
								<div class="visible-xs" id="header">
									<h4>用户登录界面</h4>
								</div>
							</div>
							<div class="form-group">

								<label for="user_name" class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">用户名</label>
								<div class="col-md-7 col-sm-7">
									<input type="text" name="user_name" required="required" class="form-control" placeholder="请输入用户名" />
								</div>
							</div>
							<div class="form-group">
								<label for="user_password" class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								<div class="col-sm-7">
									<input type="password" required="required" name="user_password" class="form-control" placeholder="请输入密码" />
								</div>
							</div>
							<div class="form-group">
								<label for="checkCode" class="col-md-3 col-sm-3 hidden-xs control-label">验证码</label>
								<div class="col-sm-5 col-md-5 col-lg-5 col-xs-6">

									<input type="text" name="checkcode" class="form-control" placeholder="请输入验证码" />
								</div>
									<img id="loginform:vCode" src="${pageContext.request.contextPath }/validatecode.jsp"
								onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();" />

								
							</div>
							
							<div class="form-group">
								<div class="col-md-offset-8 col-md-4 col-sm-offset-8 col-sm-4 col-xs-offset-8 col-xs-4">
									<a href="${pageContext.request.contextPath}/findpwd.jsp" id="btn_findpwd">忘记密码?</a>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-10 col-sm-offset-1">
									<input type="submit" value="登录" name="submit" class="btn btn-danger btn-block">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-2 col-sm-2 col-xs-2">
									<!--关联账号登录（qq、微信）-->
								</div>
								<div class="col-md-offset-6 col-sm-offset-6 col-xs-offset-5 col-md-4 col-sm-4 col-xs-5" id="register">
									<a href="${pageContext.request.contextPath}/register.jsp" id="btn_register">
										立即注册<img src="${pageContext.request.contextPath}/img/register.png" />
									</a>
								</div>
							</div>
							<div align="center">
						<b style="color: red;font-size: 15px;list-style-type: none;">
							<s:actionerror/>
						</b>
					</div>
						</form>
					</div><!--表单rowend-->
				</div><!--rowdivEND-->
			</div><!-- 主ROWend-->

		</div><!--container主容器end-->
	</body>

</html>