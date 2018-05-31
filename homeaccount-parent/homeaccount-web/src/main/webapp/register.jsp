<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>用户注册界面</title>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/findpwd.css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<STYLE type="text/css">
			label.error{
			   font-size:14px;
				color: red;
			}
		</STYLE>
		<script type="text/javascript">
		//自定义校验规则
		$.validator.addMethod(
			//规则的名称
			"checkUserName",
			//校验的函数
			function(value,element,params){
				//定义一个标志
				var flag = false;
				//value:输入的内容
				//element:被校验的元素对象
				//params：规则对应的参数值
				//目的：对输入的username进行ajax校验
				$.ajax({
					"async":false,
					"url":"${pageContext.request.contextPath}/UserAction_checkUserName.action",
					"data":{"user_name":value},
					"type":"POST",
					"dataType":"json",
					"success":function(data){
						flag = data.isExist;
					}
				});
				//返回false代表该校验器不通过
				return !flag;
			}
			
		);
		//自定义校验规则
		$.validator.addMethod(
			"checkemail",
			function(value,element,params){
				var flag = false;
				$.ajax({
					"async":false,
					"url":"${pageContext.request.contextPath}/UserAction_checkemail.action",
					"data":{"email":value},
					"type":"POST",
					"dataType":"json",
					"success":function(data){
						flag = data.isExist;
					}
				});
				return !flag;
			}
			
		);
		//自定义校验规则
		$.validator.addMethod(
			"check",
			function(value,element,params){
				var flag = false;
				$.ajax({
					"async":false,
					"url":"${pageContext.request.contextPath}/UserAction_check.action",
					"data":{"checkcode":value},
					"type":"POST",
					"dataType":"json",
					"success":function(data){
						flag = data.isExist;
					}
				});
				return flag;
			}
			
		);
$(function(){
		$("#form1").validate({
			rules:{
				"user_name":{
					"required":true,
					"checkUserName":true
				},
				"user_password":{
					"required":true,
					"rangelength":[6,12]
				},
				"repassword":{
					"required":true,
					"rangelength":[6,12],
					"equalTo":"[name='user_password']"
				},
				"email":{
					"required":true,
					"email":true,
					"checkemail":true
				},
				"user_phone":{
					"number":true
				},
				"checkcode":{
					"required":true,
					"check":true,
				}
			},
			messages:{
				"user_name":{
					"required":"用户名不能为空",
					"checkUserName":"用户名已经存在"
				},
				"user_password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"repassword":{
					"required":"确认密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
				"email":{
					"required":"邮箱不能为空",
					"email":"邮箱格式不正确",
					"checkemail":"该邮箱已经注册过账号了！"
				},
				"user_phone":{
					"number":"输入合法手机号"
				},
				"checkcode":{
					"required":"验证码不能为空",
					"check":"验证码输入有误"
				}
				
			}
		});
});
</script>
	</head>
	<body background="${pageContext.request.contextPath}/img/bg.jpg">
		<!--container主容器1-->
		<div class="container">
			<div class="page-header">
					<ol class="list-inline" style="margin-bottom:-10px;">
						<li>
							<h3>家庭记账系统 <small style="color: orangered;">用户注册</small></h3>
						</li>
						<li>
							<p>我已注册，现在就<a class="btn btn-default" href="${pageContext.request.contextPath}/login.jsp" style="font-weight: bolder;">登录</a></p>
						</li>
					</ol>
				
				
			</div>
		</div>
		<!--container主容器1end-->
		<!--container主容器2-->
		<div class="container">
			<!--row-->
			<div class="row">
				<div class="col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6" style="margin-top: 10px;font-size: 12px;">
					<div class="row" align="center">
						<form id="form1" class="form-horizontal" name="registerForm" action="${pageContext.request.contextPath }/UserAction_regist.action" method="post">
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 hidden-xs">用户名</label>
								<div class="col-md-5 col-sm-5">
									<input type="text" name="user_name" class="form-control" placeholder="请设置用户名（用于登录）"/>
								</div>
								<div class="col-md-3 col-sm-3" style="margin-left:-50px;margin-top: 10px;">
									
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12 col-sm-12" id="userNameMessage" >
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 hidden-xs">邮箱地址</label>
								<div class="col-md-5 col-sm-5">
									<input type="text" name="email" class="form-control" placeholder="请输入邮箱地址可用于找回密码" id="email"/>
								</div>
								<div class="col-md-3 col-sm-3" style="margin-left:-50px;margin-top: 10px;color: red;" id="emailMessage">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 hidden-xs">手机号码</label>
								<div class="col-md-5 col-sm-5">
									<input type="text" name="user_phone"   id="number" class="form-control" placeholder="手机号"/>
								</div>
								<div class="col-md-3 col-sm-3" style="margin-left:-50px;margin-top: 10px;color: red;" id="numberMessage">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 hidden-xs">密码</label>
								<div class="col-md-5 col-sm-5" >
									<input type="password" id="password"  required="required" id="password" name="user_password" class="form-control" placeholder="请设置登录密码"/>
								</div>
								<div class="col-md-3 col-sm-3" style="margin-left:-50px;margin-top: 10px;color: red;" id="pwdMessage">
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-5" id="pwdLevel" style="display: none;">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 hidden-xs">确认密码</label>
								<div class="col-md-5 col-sm-5">
									<input type="password" name="repassword"  class="form-control" placeholder="再输入一次密码"/>
								</div>
								<div class="col-md-3 col-sm-3" style="margin-left:-50px;margin-top: 10px;" id="okpwdMessage">
								</div>
							</div>
							<div class="form-group">
								<label for="checkcode" class="col-md-offset-1 col-md-3 col-sm-3 hidden-xs control-label">验证码</label>
								<div class="col-sm-5 col-md-5 col-lg-5 col-xs-6">
									<input type="text" name="checkcode" class="form-control"  placeholder="请输入验证码" />
								</div>
								<img id="loginform:vCode" src="${pageContext.request.contextPath }/validatecode.jsp"
								onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();" />
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-2 col-sm-offset-4 col-sm-2">
									<input type="submit" class="btn btn-danger" value="提交注册" />
								</div>
								<div class="col-md-5 col-sm-5">
									<input type="reset" class="btn btn-warning" value="重置表单" />
								</div>
							</div>
						</form>
					</div>
					<!--内部row-->
				</div>
				<!--rowDIV END-->
			</div>
			<!--row END-->
		</div>
		<!--container2 END-->

	</body>
</html>