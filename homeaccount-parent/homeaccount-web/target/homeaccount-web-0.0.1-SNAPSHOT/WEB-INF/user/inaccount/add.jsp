<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>收入账单列表-添加收入账单</title>
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
						"inAccountType.inaccounttype_id":{
							"required":true
						},
						"inaccount_datetime":{
							"required":true
						},
						"inaccount_money":{
							"required":true,
							"number":true
						}
					},
					messages:{
						"inAccountType.inaccounttype_id":{
							"required":"收入类型不能为空"
						},
						"inaccount_datetime":{
							"required":"收入时间不能为空"
						},
						"inaccount_money":{
							"required":"收入金额不能为空",
							"number":"金额必须为数字"
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
					<a href="javascript:;">收入账单</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/OutAccountAction_list.action">收入账单列表</a>
				</li>
				<li>
					<span class="glyphicon glyphicon-plus"></span>添加收入账单
				</li>
			</ol>
			<!--导航路径end-->
			
			<div class="container">
				<form action="${pageContext.request.contextPath }/InAccountAction_add.action" method="post" id="form1">
				<div class="row">
					<div class="col-md-offset-3 col-md-5" style="border: 1px solid antiquewhite;background-color: ghostwhite;border-radius: 6px;padding: 10px;" align="center">
						<div class="form-group form-inline">
							
							<label class="control-label">收入账单类型:</label>
							<script type="text/javascript">
								$(function(){
									//加载收入类型下拉框
									$.post("${pageContext.request.contextPath}/InTypeAction_listajax.action",{},function(data){
										 for(var i=0;i<data.length;i++){
										     $("#intype").append("<option value='"+data[i].inaccounttype_id+"'>"+data[i].inaccounttype_name+"</option>")
										 }
									})
								});
							</script>
							<select class="form-control" style="width: 220px;" id="intype" name="inAccountType.inaccounttype_id">
								
							</select>
							
						</div>
						<div class="form-group form-inline" style="padding-left: 25px;">
							<label class="control-label">收入时间:</label>
							<input style="width: 220px;" type="text" class="form-control" name="inaccount_datetime" id="outaccounttime" style="width: 220px;" placeholder="点击这里选择日期" readonly="readonly"/>
							<script type="text/javascript">
									// 日期控件
									 $('#outaccounttime').datetimepicker({
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
						<div class="form-group form-inline" style="padding-left: 25px;">
						<label class="control-label">收入金额:</label>
							<div class="input-group spinner" data-trigger="spinner" style="width: 220px;">
					          <input type="text"  required="required" name="inaccount_money" class="form-control text-center" value="10" data-rule="currency">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
						</div>
						<div class="form-group form-inline" style="padding-left: 50px;">
							<label class="control-label">备注:</label>
							<textarea style="width: 220px;" class="form-control" name="inaccount_desc"  placeholder="备注，方便记忆"></textarea>
						</div>
						<input type="reset" value="重置" class="btn btn-warning"/>
						<!-- onclick="addInAccount() -->
						<input type="submit" value="提交添加" class="btn btn-danger"/>
					</div>
				</div>
				</form>
			</div>
			<%@include file="/WEB-INF/user/common/foot.jsp" %>
		</div>
		<script src="${pageContext.request.contextPath }/js/box.js"></script>
		<script>
				function addInAccount(){
				Ewin.confirm({title:"<span class='glyphicon glyphicon-plus-sign' style='color:green;'></span>添加收入账单提醒",message:"确定添加此收入账单吗？"}).on(function(e){
					if(!e){
						return;
					}
					Ewin.alert({message:"<span style='color:green;'>添加成功！</span>"});
				})
			}
		</script>
	</body>

</html>