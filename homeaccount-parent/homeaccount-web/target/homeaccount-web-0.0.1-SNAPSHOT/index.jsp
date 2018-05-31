<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<title>正在跳转到主界面....</title>
</head>
<body>
	<div style="width:500px;height:500px; margin: 0 auto;margin-top: 200px;margin-left: 500px;">
	    <img alt="页面跳转" src="${pageContext.request.contextPath }/img/indexreload.gif">
	    <h3>正在进入系统主界面，请稍后...</h3>
	</div>
	<jsp:forward page="MainAction_forindex.action"></jsp:forward> 
</body>
</html>