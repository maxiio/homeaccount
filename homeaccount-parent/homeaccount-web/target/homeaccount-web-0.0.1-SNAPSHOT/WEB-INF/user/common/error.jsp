<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出现异常</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div align="center">
			<div align="center" style="width: 600px;height: 400px;background-color: #F8F8FF;">
				<div style="height:160px"></div>
			    <h4 style="color: #E07D3F;">系统出现错误！请检查您的操作！</h4>
			</div>
		
		</div>
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
</body>
</html>