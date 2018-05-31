<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告内容</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ocupload-1.1.2.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
		
	<div class="container">
		
		<h3>系统公告</h3>
		<h5>关于初次使用问题</h5>
		<div style="color: #1AB4E5;font-weight: bolder;">
			大家好，现就初次使用系统作如下声明。此系统是作者花费近一个月的时间开发出来免费供大家使用，如使用过程中有任何问题请再此系统的用户交流区的系统区发帖提问，作者会同大家一起交流。
			如果出现任何不能使用等严重性问题，请直接联系作者qq：1534479537,：密保问题：邹仝
		</div>
		
		<span>发布者：zoutong  发布时间：2018-04-14 17:32</span>
	</div>
	
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
</body>
</html>