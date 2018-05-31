<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>支出账单列表-添加支出账单</title>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/js/spinner/bootstrap-spinner.css" rel="stylesheet">
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/spinner/jquery.spinner.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
				<link href="${pageContext.request.contextPath}/js/spinner/bootstrap-spinner.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/spinner/jquery.spinner.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js" type="text/javascript"></script>
		<style type="text/css">
			.error{
				color: red;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#form1").validate({
					rules:{
						"investname":{
							"required":true
						},
						"invest_datetime":{
							"required":true
						},
						"invest_year":{
							"required":true,
							"digits":true
						},
						"interest_rates":{
							"required":true
						},
						"invest_money":{
							"required":true
						},
						"invest_target":{
							"required":true
						}
					},
					messages:{
						"investname":{
							"required":"投资名称不能为空！"
						},
						"invest_datetime":{
							"required":"投资日期不能为空！"
						},
						"invest_year":{
							"required":"投资周期不能为空",
							"digits":"周期必须为整数"
						},
						"interest_rates":{
							"required":"利息率不能为空！"
						},
						"invest_money":{
							"required":"投资金额不能为空！"
						},
						"invest_target":{
							"required":"不能为空！"
						}
					}
				});
			})
		</script>
	</head>
	<body>
		<%@include file="/WEB-INF/user/common/head.jsp" %>
		<div class="container-fluid">
			<!--导航路径-->
			<ol class="breadcrumb">
				<li>
					<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
				</li>
				<li>
					<a href="javascript:;">我的账本</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/InvestAction_list.action">投资理财</a>
				</li>
				<li>
					<span class="glyphicon glyphicon-plus"></span>添加投资账单
				</li>
			</ol>
			<!--导航路径end-->
			
			<div class="container">
				<form action="${pageContext.request.contextPath }/InvestAction_add.action" method="post" id="form1">
				<div class="row">
					<div class="col-md-offset-3 col-md-5" style="border: 1px solid antiquewhite;background-color: ghostwhite;border-radius: 6px;padding: 10px;" align="center">
						<div class="form-group form-inline">
							<label class="control-label">投资名称:</label>
							<input style="width: 220px;" type="text" class="form-control" name="investname" id="investname" placeholder="请填写投资名称"/>
						</div>
						<div class="form-group form-inline" style="">
							<label class="control-label">投资日期:</label>
							<input style="width: 220px;" type="text" class="form-control" name="invest_datetime" id="investtime"  placeholder="点击这里选择日期" readonly="readonly"/>
							<script type="text/javascript">
									// 日期控件
									 $('#investtime').datetimepicker({
											 	 	pickerPosition: 'up-right',
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
						</div>
						<div class="form-group form-inline" style="margin-right: 50px;">
							<label class="control-label">投资周期(按年算):</label>
							<input style="width: 220px;" type="text" class="form-control" name="invest_year" required="required"  placeholder="填写周期"/>
						</div>
						<div class="form-group form-inline" style="padding-left: 15px;">
							<label class="control-label">利率:</label>
							<div class="input-group spinner" data-trigger="spinner" style="width: 220px;">
					          <input type="text"  required="required" name="interest_rates" class="form-control text-center" value="1" data-rule="currency">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
						</div>
						<div class="form-group form-inline">
							<label class="control-label">投资金额:</label>
							<div class="input-group spinner" data-trigger="spinner" style="width: 220px;">
					          <input type="text"  required="required" name="invest_money" class="form-control text-center" value="1000" data-rule="currency">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
						</div>
						<div class="form-group form-inline" >
							<label class="control-label">投资股东:</label>
							<input style="width: 220px;" type="text" class="form-control"  name="invest_target"  required="required" placeholder="填写投资股东"/>
						</div>
						<div class="form-group form-inline" style="padding-left: 25px;">
							<label class="control-label">备注:</label>
							<textarea style="width: 220px;" class="form-control" name="invest_desc"  placeholder="备注，方便记忆"></textarea>
						</div>
						<input type="reset" value="重置" class="btn btn-warning"/>
						<input type="submit" value="提交添加" class="btn btn-danger"/>
					</div>
				</div>
				</form>
			</div>
			<%@include file="/WEB-INF/user/common/foot.jsp" %>
		</div>
		<script src="${pageContext.request.contextPath }/js/box.js"></script>
	</body>

</html>