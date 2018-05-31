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
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/findpwd.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script>
			window.onload=function(){
				var time=5;
				time--;
				var second=document.getElementById("second");
				
					var timer=setInterval(function(){
						second.innerHTML=time;
						time--;
						if(time==0){
							clearInterval(timer);
							window.location="${pageContext.request.contextPath}/login.jsp";
						}
					},1000);
			}
		</script>
	</head>
	<body background="${pageContext.request.contextPath }/img/bg.jpg">
		<!--container主容器1-->
		<div class="container">
			<div class="page-header">
					<ol class="list-inline" style="margin-bottom:-10px;">
						<li>
							<h3>家庭记账系统 <small style="color: orangered;">用户注册</small></h3>
						</li>
						<li>
							<p>立即<a class="btn btn-default" href="${pageContext.request.contextPath }/login.jsp" style="font-weight: bolder;">登录</a></p>
						</li>
					</ol>
			</div>
		</div>
		<!--container主容器1end-->
		<!--container主容器2-->
		<div class="container">
			<!--row-->
			<div class="row">
				<div class="col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6" style="margin-top: 10px;font-size: 16px;background-color: ghostwhite;" align="center">
					<!--内部ROW-->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">

							<img src="${pageContext.request.contextPath }/img/success.jpg" class="img-responsive" />
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">

							<p style="font-size: 18px;color: green;margin-left: 5px;">注册账号成功!</p>

						</div>
						<div class="col-md-12 col-sm-12 col-xs-12">
							还有
							<h2 style="color: red;display: inline;" id="second">5</h2>秒钟自动跳转到登录界面！
						</div>
					</div>
					<!--内部ROW END-->
				</div>
				<!--rowDIV END-->
			</div>
			<!--row END-->
		</div>
		<!--container2 END-->
	</body>
</html>