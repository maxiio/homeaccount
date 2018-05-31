<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改密码</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/user/common/head.jsp" %>
	<div class="container">
		           <div class="modal-header">
						<h5>
							<span class="glyphicon glyphicon-edit"></span>修改密码
						</h5>
					</div>
					<br>
					<div align="center">
						<form  id="editPwd" action="${pageContext.request.contextPath }/UserAction_editPwd.action" method="post">
							<div class="form-group form-inline">

								<label for="" class="control-label" style="color: red;"><b>原密码：</b></label>
								<input type="password"  class="form-control" id="oldpassword" name="oldpassword" style="width: 240px;">
							</div>
							
							<div class="form-group form-inline" >
								<label for="" class="control-label">新密码：</label>
								<input class="form-control" id="user_password" type="password" style="width: 240px;"  name="user_password" />
							</div>
							<div class="form-group form-inline" style="margin-right: 10px;">
								<label for="" class="control-label">确认密码：</label>
								<input type="password" id="repassword" class="form-control" style="width: 240px;" name="repassword" />
							</div>
						</form>
							<div class="form-group form-inline">
								<button class="form-control btn btn-warning" value="提交" onclick="checkForm()">提交修改</button>
							</div>
							<div  class="form-group form-inline" id="message"></div>
					</div>
	</div>
		<script type="text/javascript">
		//校验表单
			function checkForm(){
				var old=$("#oldpassword").val();
				var upwd=$("#user_password").val();
				var repwd=$("#repassword").val();
				if(old==null||old==""||upwd==null||upwd==""||repwd==null||repwd==""){
					
					$("#message").html("<span  style='color: red;'>输入有空！</span>");
					return;
				}
				if(upwd!=repwd){
					 $("#message").html("<span  style='color: red;'>两次密码输入不一致！</span>");
					 return;
				}
				if(upwd==repwd){
				  $.post("${pageContext.request.contextPath}/UserAction_checkOldPassword.action",{"oldpwd":old},function(data){
			
					 if(data.isExist){
						 $("#editPwd").submit();
					 }else{
						 $("#message").html("<span  style='color: red;'>原密码输入有误！</span>");
						 return;
					 }
				  	
				  },"json");
				}
			}
		</script>
	<%@include file="/WEB-INF/user/common/foot.jsp" %>
</body>
</html>