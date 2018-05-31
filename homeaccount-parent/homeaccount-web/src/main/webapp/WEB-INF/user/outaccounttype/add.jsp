<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>添加收入类型</title>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container-fluid">
			<!--导航路径-->
			<ol class="breadcrumb">
				<li>
					<a href="${pageContext.request.contextPath }/MainAction_forindex.action">首页</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/OutAccountTypeAction_list.action">收入类型列表</a>
				</li>
				<li>
					<span class="glyphicon glyphicon-plus"></span>添加支出类型
				</li>
			</ol>
			<!--导航路径end-->
			<div class="container">
				<form action="${pageContext.request.contextPath }/OutAccountTypeAction_add.action" method="post">
				<div class="row">
					<div class="col-md-offset-3 col-md-5" style="border: 1px solid antiquewhite;background-color: ghostwhite;border-radius: 6px;padding: 10px;" align="center">
						<div class="form-group form-inline">
							<label class="control-label">支出类型名称:</label>
							<input style="width: 220px;" required="required" type="text" class="form-control" name="outaccounttype_name" id="outaccounttype_name" style="width: 220px;" placeholder="支出类型名称"/>
						</div>
						<div class="form-group form-inline" style="padding-left: 50px;">
							<label class="control-label">描述:</label>
							<textarea style="width: 220px;" class="form-control" name="outaccounttype_desc"  placeholder="备注，方便记忆"></textarea>
						</div>
						<input type="reset" value="重置" class="btn btn-warning"/>
						<input type="submit" value="提交添加" class="btn btn-danger"/>
					</div>
				</div>
				</form>
			</div>
		</div>
		<%@include file="/WEB-INF/user/common/foot.jsp"%>
	</body>
</html>