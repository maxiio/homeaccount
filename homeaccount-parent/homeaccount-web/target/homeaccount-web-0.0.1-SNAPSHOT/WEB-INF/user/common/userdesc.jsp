<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>主界面</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/box.js"></script>
		<!--<script src="../js/script.js"></script>-->
		<style type="text/css">
				.infocolor{
					color: darkgray;
				}
		</style>
	</head>

	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<!--路径墙-->
		<div class="container">
			<ol class="breadcrumb" style="font-size: 15px;">
				<li>
					<a href="${pageContext.request.contextPath }/MainAction_forindex.action">首页</a>
				</li>
				<li>
					<a href="javascript:;">个人中心</a>
				</li>
				<li>
					个人资料
				</li>
			</ol>
		</div>
		<!--路径墙end-->
		<!--用户资料容器-->
		<div class="container">
			<!--main row-->
			<div class="row" align="center">

				<div class="col-md-12 col-sm-12 col-xs-12"><a href="${pageContext.request.contextPath }/page_user_common_editinfo.action" style="font-size: 15px;" class="pull-right">编辑资料</a></div>
				<div class="col-md-12 col-sm-12 col-xs-12"></div>
				<div class="col-md-offset-5 col-md-2 col-sm-2 col-xs-2 ">

					<div class="" style="font-size: 16px;">
						<s:if test="#session.currentUser.face!=null">
						  <img src="${pageContext.request.contextPath }/<s:property value="#session.currentUser.face"/>"/>
						</s:if>
						<s:else>
							无头像
						</s:else>
						<p><s:property value="#session.currentUser.user_name"/></p></div>

				</div>
				<!--row div 用户详细信息-->
				<div class="col-md-12 col-sm-12 col-xs-12">
					<!--存用户信息row-->
					<div class="row" style="font-size: 16px;">
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-user" style="color:red;"></span>真实姓名：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left" ><s:property value="#session.currentUser.realname==null?'暂无数据':#session.currentUser.realname"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/sex.png" />性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.user_sex==null?'保密':#session.currentUser.user_sex"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-credit-card"></span>身份证号：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.idcard==null?'暂无数据':#session.currentUser.idcard"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-phone"></span>手机号码：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.user_phone==null?'暂无数据':#session.currentUser.user_phone"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12"  style="margin-right: 0px;" align="right">
							<span class="glyphicon glyphicon-envelope"></span>邮箱地址：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.email==null?'暂无数据':#session.currentUser.email"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-home" style="color: red;"></span>家庭地址：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.address_s==null?'暂无数据':#session.currentUser.address_s"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/mibao.png"/>密保问题：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.question==null?'暂无数据':#session.currentUser.question"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/daan.png"/>密保答案：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.answer==null?'暂无数据':#session.currentUser.answer"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-hourglass"></span>我的积分：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.score==null?'暂无数据':#session.currentUser.score"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/birth.png"/>年龄：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.birthday==null?'0':#session.currentUser.age"/>岁</div>
						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/birth.png"/>出生日期：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 infocolor" align="left"><s:property value="#session.currentUser.birthday==null?'暂无数据':#session.currentUser.birthday_s"/></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/level.png"/>用户级别：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12" align="left">
							<s:if test='#session.currentUser.level==0'>
							 <span class="label label-success">普通用户</span></h5>
							</s:if>
							<s:elseif test='#session.currentUser.level==1'>
								<span class="label label-warning">会员用户</span>
							</s:elseif>
							<s:elseif test='#session.currentUser.level==2'>
								<span class="label label-danger">超级会员</span>
							</s:elseif>
						
						</div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<img src="${pageContext.request.contextPath }/img/status.png">账号状态：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12" align="left"><span class="label label-success"><s:property value="#session.currentUser.state=='0'?'正常':'被封'"/></span></div>

						<div class="col-md-6 col-sm-6 col-xs-12" align="right">
							<span class="glyphicon glyphicon-time"></span>注册日期：
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12" align="left">
							<span class="badge"><s:property value="#session.currentUser.register_date_s"/></span>
						</div>
					</div>
					
					<!--存用户信息row end-->
				</div>
				<!--row div 用户详细信息 end-->

			</div>
			<!--main row end-->
		</div>
		<!--用户资料主容器-->
		<%@include file="/WEB-INF/user/common/foot.jsp"%>
	</body>

</html>