<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>找回密码--重置密码</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/findpwd.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/findpwd.js"></script>
		<style type="text/css">
			.error{
				color: red;
			}
		</style>
	</head>

	<body background="${pageContext.request.contextPath }/img/bg.jpg">
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
		</div><!--container主容器end-->
		<!--container主容器-->
		<div class="container">
			 <ol class="breadcrumb">
			 	 <li><a href="${pageContext.request.contextPath }/login.jsp">登录界面</a></li>
				  <li><a href="${pageContext.request.contextPath }/findpwd.jsp">找回密码</a></li>
				  <li>重置密码</li>
			  </ol>
			<!--row-->
			<div class="row">
				<!--FORM DIV-->
				<div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6" style="margin-top: 10px;border: 1px solid lightgrey;background-color: ghostwhite;" align="center">
					<!--form内部row-->
					<div class="row">
						<div class="input-group myInput">
							<div class="col-md-12 col-sm-12 hidden-xs">
							 <h3 style="color: #1B6D85">重置密码</h3>
								
							</div>
							<div class="visible-xs-block">
							 <h4 style="color: #1B6D85">重置密码</h4>
								
							</div>
							
						</div>
					<form class="form-horizontal" id="form1" method="post" action="${pageContext.request.contextPath }/UserAction_updatepwd.action">
						<div class="input-group" style="margin-top: 10px;">
							<input type="hidden" name="user_id" value="<s:property value="user_id"/>"/>
							<label class="control-label col-sm-4 col-md-4 hidden-xs">新&nbsp;&nbsp;&nbsp;密&nbsp;码</label>
							<div class="col-sm-6 col-md-6 col-xs-10" >
								<input class="form-control" style="width: 200px;" type="password" name="user_password" id="newpwd" placeholder="请输入新密码"/>
							</div>
							<div class="col-sm-2 col-md-2 col-xs-2" id="message"></div>
						</div>
						<div class="input-group" style="margin-top: 10px;margin-bottom: 10px;">

							<label class="control-label col-sm-4 col-md-4 hidden-xs">再输一次</label>
							<div class="col-sm-6 col-md-6 col-xs-10">
								<input class="form-control" style="width: 200px;" name="okpwd" type="password" id="okpwd" placeholder="确认密码"/>
							</div>
							<div class="col-sm-2 col-md-2 col-xs-2" id="message"></div>
						</div>
						<div class="input-group" style="margin-top: 10px;margin-bottom: 10px;">

							<label class="control-label col-sm-4 col-md-4 hidden-xs">验证码</label>
							<div class="col-sm-6 col-md-6 col-xs-10">
								<input class="form-control" style="width: 200px;" required="required" name="checkcode" type="text" placeholder="验证码已经发送到你的邮箱"/>
							</div>
							<div class="col-sm-2 col-md-2 col-xs-2" id="message"></div>
						</div>
						
						<div class="input-group">
							<div class="col-md-4 col-sm-4 col-xs-12">
							 <input type="submit" class="btn btn-info" style="width:80px;margin-bottom: 10px;" value="确认修改" />
							</div>
							
						</div>
					</form>
					</div><!--form内部row END-->
				</div><!--form DIV END-->
			</div><!--row END-->
		</div><!--containerEND-->
		<div class="container" style="margin-top:220px;"> 
			<%@include file="/WEB-INF/user/common/foot.jsp" %>
		</div>
		<script>
		$(function(){
			$("#form1").validate({
				rules:{
					"user_password":{
						"required":true,
						"rangelength":[6,12]
					},
					"okpwd":{
						"required":true,
						"rangelength":[6,12],
						"equalTo":"[name='user_password']"
					},
					"checkcode":{
						"required":true
					}
				},
				messages:{
					"user_password":{
						"required":"新密码不能为空-_-",
						"rangelength":"密码长度为6-12位"
					},
					"okpwd":{
						"required":"确认密码不能为空-_-",
						"rangelength":"密码长度为6-12位",
						"equalTo":"两次密码输入不一致"
					},
					"checkcode":{
						"required":"验证码不能为空，已经发送到你的邮箱"
					}
				}
			});
	});
		</script>
	</body>

</html>