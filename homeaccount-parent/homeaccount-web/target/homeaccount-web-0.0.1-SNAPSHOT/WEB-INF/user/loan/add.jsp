<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>添加借款账单</title>
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
						"loanname":{
							"required":true
						},
						"loan_datetime":{
							"required":true
						},
						"loan_year":{
							"required":true,
							"digits":true
						},
						"interest_rates":{
							"required":true
						},
						"loan_money":{
							"required":true
						},
						"loan_source":{
							"required":true
						}
					},
					messages:{
						"loanname":{
							"required":"借款名称不能为空！"
						},
						"loan_datetime":{
							"required":"借款日期不能为空！"
						},
						"loan_year":{
							"required":"借款周期不能为空",
							"digits":"周期必须为整数"
						},
						"interest_rates":{
							"required":"利息率不能为空！"
						},
						"loan_money":{
							"required":"借款金额不能为空！"
						},
						"loan_source":{
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
					<a href="${pageContext.request.contextPath }/LoanAction_list.action">借款还贷</a>
				</li>
				<li>
					<span class="glyphicon glyphicon-plus"></span>添加借款账单
				</li>
			</ol>
			<!--导航路径end-->
			
			<div class="container">
				<form action="${pageContext.request.contextPath }/LoanAction_add.action" method="post" id="form1">
				<div class="row">
					<div class="col-md-offset-3 col-md-5" style="border: 1px solid antiquewhite;background-color: ghostwhite;border-radius: 6px;padding: 10px;" align="center">
						<div class="form-group form-inline">
							<label class="control-label">借款名称:</label>
							<input style="width: 220px;" type="text" class="form-control" name="loanname" id="loanname" placeholder="请填写借款名称"/>
						</div>
						<div class="form-group form-inline" style="">
							<label class="control-label">借款日期:</label>
							<input style="width: 220px;" type="text" class="form-control" name="loan_datetime" id="loantime"  placeholder="点击这里选择日期" readonly="readonly"/>
							<script type="text/javascript">
									// 日期控件
									 $('#loantime').datetimepicker({
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
						    <label class="control-label">借款周期(按年算):</label>
								<input style="width: 220px;" type="text" class="form-control" name="loan_year"  placeholder="填写借款周期"/>
						</div>
						<div class="form-group form-inline" style="padding-left: 15px;">
							<label class="control-label">利息率:</label>
							<div class="input-group spinner" data-trigger="spinner" style="width: 220px;">
					          <input type="text" name="interest_rates" class="form-control text-center" value="1" data-rule="currency">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
						</div>
						<div class="form-group form-inline">
							<label class="control-label">借款金额:</label>
							<div class="input-group spinner" data-trigger="spinner" style="width: 220px;">
					          <input type="text"  name="loan_money" class="form-control text-center" value="1000" data-rule="currency">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
						</div>
						<div class="form-group form-inline" >
							<label class="control-label">借款来源:</label>
							<input style="width: 220px;" type="text" class="form-control" name="loan_source"  required="required" placeholder="填写借款来源"/>
						</div>
						<div class="form-group form-inline" style="padding-left: 25px;">
							<label class="control-label">备注:</label>
							<textarea style="width: 220px;" class="form-control" name="loan_desc"  placeholder="备注，方便记忆"></textarea>
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