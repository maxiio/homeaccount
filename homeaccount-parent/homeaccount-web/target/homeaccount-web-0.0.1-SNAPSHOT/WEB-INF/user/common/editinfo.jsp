<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>主界面</title>
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.zh-CN.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/box.js" ></script>
		<link href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath }/js/msdropdown/js/msdropdown/jquery.dd.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/msdropdown/css/msdropdown/dd.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/msdropdown/css/msdropdown/dd.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/msdropdown/css/msdropdown/flags.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/msdropdown/css/msdropdown/skin2.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/msdropdown/css/msdropdown/sprite.css" />
		<style type="text/css">
				.infocolor{
					color: darkgray;
				}
		</style>
		
	</head>

	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<!--路径墙-->
		<div class="well-sm" style="padding-bottom: 0px;">
			<ol class="breadcrumb" style="font-size: 15px;">
				<li>
					<a href="javascript:;">个人中心</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/page_user_common_userdesc.action">个人资料</a>
				</li>
				<li>
					编辑资料
				</li>
			</ol>
		</div>
		<!--路径墙end-->
		<form action="${pageContext.request.contextPath }/UserAction_edit.action"  method="post">
		<div class="container">
			 <input type="submit" style="width: 100px;background-color: gray;color: white;" class="form-control pull-right" value="保存修改"  />
		</div>
		<!--用户资料容器-->
		<div class="container">
			<!--main row-->
			<div class="row" align="center">
				<!--row div 用户详细信息-->
				<div class="col-md-12 col-sm-12 col-xs-12">
					
					<!--存用户信息row-->
					<div class="row" style="font-size: 16px;">
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-picture" style="color: green;"> 头&nbsp;像：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<select style="width:200px" class="tech" name="face" id="tech">
						      <option value="img/userface/user0.gif" data-image="${pageContext.request.contextPath }/img/userface/user0.gif">头像一</option>
						      <option value="img/userface/user1.gif" data-image="${pageContext.request.contextPath }/img/userface/user1.gif">头像二</option>
						      <option value="img/userface/user2.gif" data-image="${pageContext.request.contextPath }/img/userface/user2.gif" name="cd">头像三</option>
						      <option value="img/userface/user3.gif"  data-image="${pageContext.request.contextPath }/img/userface/user3.gif">头像四</option>
						      <option value="img/userface/user4.gif" data-image="${pageContext.request.contextPath }/img/userface/user4.gif">头像五</option>
						      <option value="img/userface/user5.gif" data-image="${pageContext.request.contextPath }/img/userface/user5.gif">头像六</option>
						      <option value="img/userface/user6.gif" data-image="${pageContext.request.contextPath }/img/userface/user6.gif">头像七</option>
						      <option value="img/userface/user7.gif" data-image="${pageContext.request.contextPath }/img/userface/user7.gif">头像八</option>
						      <option value="img/userface/user8.gif" data-image="${pageContext.request.contextPath }/img/userface/user8.gif">头像九</option>
						      <option value="img/userface/user9.gif" data-image="${pageContext.request.contextPath }/img/userface/user9.gif">头像十</option>
						      <option value="img/userface/user10.gif" data-image="${pageContext.request.contextPath }/img/userface/user10.gif">头像十一</option>
						      <option value="img/userface/user11.gif" data-image="${pageContext.request.contextPath }/img/userface/user11.gif" name="cd">头像十二</option>
						      <option value="img/userface/user12.gif" data-image="${pageContext.request.contextPath }/img/userface/user12.gif" name="cd">头像十三</option>
						      <option value="img/userface/user13.gif" data-image="${pageContext.request.contextPath }/img/userface/user13.gif" name="cd">头像十四</option>
						      <option value="img/userface/user14.gif" data-image="${pageContext.request.contextPath }/img/userface/user14.gif" name="cd">头像十五</option>
						      <option value="img/userface/user15.gif" data-image="${pageContext.request.contextPath }/img/userface/user15.gif" name="cd">头像十六</option>
						      <option value="img/userface/user16.gif" data-image="${pageContext.request.contextPath }/img/userface/user16.gif" name="cd">头像十七</option>
						      <option value="img/userface/user17.gif" data-image="${pageContext.request.contextPath }/img/userface/user17.gif" name="cd">头像十八</option>
						      <option value="img/userface/user18.gif" data-image="${pageContext.request.contextPath }/img/userface/user18.gif" name="cd">头像十九</option>
						      <option value="img/userface/user19.gif" data-image="${pageContext.request.contextPath }/img/userface/user19.gif" name="cd">头像二十</option>
						    </select>
						</div>
						
						<script type="text/javascript">
							$("#tech").msDropdown();
						</script>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>
						<%-- <div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-user" style="color: green;">	
								</span>用&nbsp;&nbsp;户&nbsp;&nbsp;名：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left" >
							<input style="width: 240px;" class="form-control" type="text" name="user_name" id="userName" placeholder="<s:property value="#session.currentUser.user_name"/>" />
						</div> --%>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>
						
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-user" style="color: green;">	
								</span>真实姓名：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left" >
							<input style="width: 240px;" class="form-control" type="text" name="realname" id="userName" value="<s:property value="#session.currentUser.realname"/>" />
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/sex.png" />性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<script type="text/javascript">
								$(function(){
									$("#sex option[value='<s:property value="#session.currentUser.user_sex"/>']").prop("selected",'selected');
									$("#tech option[value='<s:property value="#session.currentUser.face"/>']").prop("selected",'selected');
									$("#question option[value='<s:property value="#session.currentUser.question"/>']").prop("selected",'selected');
								})
							</script>
							<select class="form-control" style="width: 240px;" name="user_sex" id="sex">
							  <option value='男'>男</option>
							  <option value='女'>女</option>
							  <option value=''>保密</option>
							</select>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>
			
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-credit-card"></span>身份证号：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<input style="width: 240px;" type="text" name="idcard" id="idcard" class="form-control" value="<s:property value="#session.currentUser.idcard"/>"/>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-phone"></span>手机号码：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
						    <input style="width: 240px;" type="text" name="user_phone" id="num" class="form-control" value="<s:property value="#session.currentUser.user_phone"/>"/>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12"  style="margin-right: 0px;" align="right">
							<span class="glyphicon glyphicon-envelope"></span>邮箱地址：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<input style="width: 240px;" type="text" name="email" id="email" readonly="readonly" class="form-control" value="<s:property value="#session.currentUser.email"/>"/>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-home" style="color: red;"></span>家庭地址：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor form-inline" align="left">
							<select class="form-control" style="width: 25%;" name="province" id="province">
								<option value="" selected="selected">省份</option>
							</select>
							<select class="form-control" style="width: 25%;" name="city" id="city">
								<option value="城市" selected="selected">城市</option>
							</select>
							<div class="col-md-12 col-sm-12" style="height: 8px;"></div>
							<input style="width: 400px;" type="text" name="details" id="newhome" class="form-control" value="<s:property value="#session.currentUser.details"/>"/>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/mibao.png"/>密保问题：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left" align="center">
						    <select class="form-control" style="width: 240px;" name="question" id="question">
								<option value=" ">请选择密保问题</option>
								<option value="您父亲的姓名是？">您父亲的姓名是？</option>
								<option value="您父亲的生日是？">您父亲的生日是？</option>
								<option value="您母亲的姓名是？">您母亲的姓名是？</option>
								<option value="您母亲的生日是？">您母亲的生日是？</option>
								<option value="您配偶的姓名是？">您配偶的姓名是？</option>
								<option value="您配偶的生日是？">您配偶的生日是？</option>
								<option value="您小学班主任的名字是">您小学班主任的名字是</option>
								<option value="您初中班主任的名字是？">您初中班主任的名字是？</option>
								<option value="您高中班主任的名字是？">您高中班主任的名字是？</option>
								<option value="您的学号（或工号）是？">您的学号（或工号）是？</option>
								<option value="您最熟悉的童年好友名字是？">您最熟悉的童年好友名字是？</option>
								<option value="您最熟悉的学校宿舍室友名字是？">您最熟悉的学校宿舍室友名字是？</option>
								<option value="对您影响最大的人名字是？">对您影响最大的人名字是？</option>
							</select>
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/daan.png"/>密保答案：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<input type="text" name="answer" id="answer" class="form-control" style="width: 240px;" value="<s:property value="#session.currentUser.answer"/>" />
						</div>
						<div class="col-md-12 col-sm-12" style="height: 8px;"></div>
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/birth.png"/>出生日期：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left">
							<input type="text" data-date-format="yyyy-mm-dd" readonly="readonly" name="birthday" id="birthday" class="form-control date" style="width: 240px;" value="<s:property value="#session.currentUser.birthday_s"/>"/>
						</div>

					</div>
					<!--存用户信息row end-->
					
				</div>
				<!--row div 用户详细信息 end-->

			</div>
			<!--main row end-->
		</div>
		<!--用户资料主容器-->
		</form>
		
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
		<script type="text/javascript">
		 	 $('#birthday').datetimepicker({  
		 	 	pickerPosition: 'top-right',
		 	 	format: 'yyyy-mm-dd ',
	            language:  'zh-CN',  
	            weekStart: 1,  
	            todayBtn:  1,  
	            autoclose: 1,  
	            todayHighlight: 1,  
	            startView: 2,  
	            minView: 2,  
	            forceParse: 0  
           });  
		</script>
		<script src="${pageContext.request.contextPath }/js/address.js"></script>
	</body>

</html>