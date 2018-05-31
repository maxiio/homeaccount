<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>用户交流区</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/box.js"></script>
		<script type="text/javascript">
			function img_region(id){
				window.location.href="${pageContext.request.contextPath}/TopicAction_list.action?region_id="+id;
			}
		</script>
		<style type="text/css">
			#img_region:hover{
			  cursor: pointer;
			  background-color: #DEECFA;
			}
		</style>
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container-fluid">
			<div class="well-small" style="margin-top: 10px;">
				<ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
				  <li><a href="${pageContext.request.contextPath }/RegionAction_list.action">用户交流区</a></li>
				  <li>选择大区</li>
				</ol>
			</div>
			<div class="row" >
				<s:iterator var="region" value="#list">
					<div class="col-md-3">
						<div class="thumbnail" id="img_region">
					      <div class="caption">
					        <h3><s:property value="#region.region_name"/></h3>
					        <p><s:property value="#region.region_desc"/></p>
					        <p><a href="javascript:;" class="btn btn-success" role="button" onclick="img_region(<s:property value="#region.region_id"/>)">进入此交流区</a></p>
					      </div>
					     </div>
				   </div>
				</s:iterator>
			</div>
		</div><!--container主容器end-->
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
	</body>

</html>