<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>收入账单列表</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ocupload-1.1.2.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link
	href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/box.js"></script>
<script>
		//复选框全选功能
			function selectBox(){
					var allBox=document.getElementById("allBox");
					var valueBox=document.getElementsByName("valueBox");
					if(allBox.checked){
					for(i=0;i<valueBox.length;i++){
						valueBox[i].checked=true;
					}
					}else{
						for(i=0;i<valueBox.length;i++){
							valueBox[i].checked=false;
						}
					}
					
			}
		//批量删除
			function delByIds(){
				var ids=document.getElementsByName("valueBox");
				if(ids==null||ids==''){
					Ewin.alert({ message: "没有选择任何账单!" });
					return;
				}
				var nums=0;
				var s='';
				for(var i=0;i<ids.length;i++){
					
					if(ids[i].checked) {
						s+=ids[i].value+','; 
					}	
				}
				for(var i=0;i<s.length;i++){
					if(s.charAt(i)==","){
						nums++;
					}
				}
				if(s==null||s==''){
					Ewin.alert({ message:"请选择账单！" });
					return;
				}
				//批量删除
				 Ewin.confirm({ message:"你确定删除这"+nums+"条数据？" }).on(function (e) {
	                 if (e) {
	                  location.href="${pageContext.request.contextPath}/InAccountAction_deleteBatch.action?inaccount_ids="+s.substring(0,s.length-1);
	                }
					});
				
		}
		</script>
<style>
table thead th {
	text-align: center;
}

table tr td {
	text-align: center;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/user/common/head.jsp"%>
	<div class="container-fluid">
		<!--路径墙-->
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a>
			</li>
			<li><a href="javascript:;">收入账单</a></li>
			<li>收入账单列表</li>
		</ol>
		<!--路径墙end-->
		<!--搜索墙-->
		<div class="well">
			<form class="form-inline" method="post"
				action="${pageContext.request.contextPath }/InAccountAction_list.action">
				<b>根据收入账单条件搜索</b> <select class="form-control"
					style="margin-right: 25px;" id="intype"
					name="inAccountType.inaccounttype_id">

				</select>
				<SCRIPT type="text/javascript">
					$(function(){
						var $intype=$("#intype");
						$intype.append("<option value=''>--类型不限--</option>")
						$.post("InTypeAction_listajax.action",{},function(data){
							 for(var i=0;i<data.length;i++){
								  $intype.append("<option value='"+data[i].inaccounttype_id+"'>"+data[i].inaccounttype_name+"</option>")
								  //回显
		     					  $("#intype option[value='<s:property value="inAccountType.inaccounttype_id"/>']").attr("selected",true);
							 }
						});
						
					});
				</SCRIPT>
				 从<input type="text" data-date-format="yyyy-mm-dd" name="startTime"
					id="startTime" class="form-control date" placeholder="选择开始时间" readonly="readonly" value="<s:property value="startTime"/>"> 到<input
					style="margin-right: 25px;" type="text"
					data-date-format="yyyy-mm-dd" name="endTime" id="endTime"
					class="form-control date" placeholder="选择结束时间" readonly="readonly"  value="<s:property value="endTime"/>" /> 备注内容:<input
					style="margin-right: 25px;" type="text" class="form-control"
					id="desc" value="<s:property value="inaccount_desc"/>"
					name="inaccount_desc" />
				<a class="btn btn-primary" onclick="resetForm()">
					<span class="glyphicon glyphicon-refresh"></span>重置
				</a>
				<SCRIPT type="text/javascript">
				  //清空搜索表单
					function resetForm(){
						$("#intype option:first").prop("selected",'selected');
						$("#fanwei option:first").prop("selected",'selected');
						$("#startTime").val('');
						$("#endTime").val('');
						$("#desc").val('');
					}
				</SCRIPT>
				<button class="btn btn-primary" type="submit">
					<span class="glyphicon glyphicon-search"></span>搜索
				</button>
			</form>
			<BR />
			<a class="sr-only sr-only-focusable" href="#content">Skip to main content</a>
			<SCRIPT type="text/javascript">
				 	$(function(){
						$("#upload_btn").upload({
							action:"${pageContext.request.contextPath}/InAccountAction_upload.action",
							name:"myFile",
							onComplete:function (data) { //提交表单之后
								   
						           if(data == "1"){
						        	   Ewin.alert({message:"<span style='color:green;'>导入成功！</span>"});
						        	   window.location.reload();
						            }else{
						            	Ewin.alert({message:"<span style='color:red;'>导入失败！</span>"});
						            }
						      }
						});
				 	});
				 	function myexport(){
				 		location.href="${pageContext.request.contextPath}/InAccountAction_download.action";
				 	}
				 </SCRIPT>
				<p>
				<a class="btn btn-success"
					href="${pageContext.request.contextPath }/page_user_inaccount_add.action"><span
					class="glyphicon glyphicon-plus"></span>添加收入账单</a>
				</p>
				<DIV align="right" style="margin-top: -40px;margin-right: 60px;">
						<button class="btn btn-danger" id="myexport" onclick="myexport()">
							<span class="glyphicon glyphicon-cloud-download"></span>导出
						</button>
						<p></p>
						<button class="btn btn-warning" id="upload_btn">
							<span class="glyphicon glyphicon-cloud-upload"></span>导入
						</button>
				</DIV>
		</div>
		<!--搜索墙end-->
		<s:if test="#pageBean.list.size==0">
			<DIV align="center">
				<H2>暂无数据</H2>

			</DIV>
		</s:if>
		<s:else>
			<table class="table table-bordered table-striped">
				<thead>
					<th align="center"><input type="checkbox" name="allBox"
						id="allBox" onclick="selectBox()" />全选</th>
					<th>编号</th>
					<th>收入类型</th>
					<th>收入金额</th>
					<th>收入时间</th>
					<th>账单创建时间</th>
					<th>备注</th>
					<th>操作</th>
				</thead>
				<tbody>
					<s:iterator value="#pageBean.list" var="inaccount" status="index">
						<tr>
							<td align="center"><input type="checkbox" name="valueBox"
								id="valueBox"
								value="<s:property value="#inaccount.inaccount_id"/>" /></td>
							<td><s:property value="#index.count" /></td>
							<td><s:property
									value="#inaccount.inAccountType.inaccounttype_name" /></td>
							<td><s:property value="#inaccount.inaccount_money" /></td>
							<td><s:property value="#inaccount.inaccount_datetime_s" /></td>
							<td><s:property value="#inaccount.inaccount_createtime_s" /></td>
							<td><s:property value="#inaccount.inaccount_desc" /></td>
							<td style="font-size: 16px;"><a class="label label-danger"
								href="javascript:delInAccountById(<s:property value="#inaccount.inaccount_id"/>)">删除</a>
								<a class="label label-primary" href="javascript:;"
								onclick="openData(<s:property value="#inaccount.inaccount_id"/>)">修改</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td align="center"><a class="label label-default" href="javascript:;"
							id="deletebatch" onclick="delByIds()">全删</a></td>
						<td colspan="7" align="center"><span
							class="label label-default">共有<s:property
									value="#pageBean.totalCount" />条数据
						</span>&nbsp; &nbsp;<span class="label label-default">每页显示<s:property
									value="#pageBean.pageSize" />条数据
						</span>&nbsp; &nbsp; <span class="label label-default">共<s:property
									value="#pageBean.totalPage" />页
						</span>&nbsp; &nbsp; <span class="label label-success">当前为第<s:property
									value="#pageBean.currentPage" />页
						</span></td>
					</tr>
				</tfoot>
			</table>
			<div align="center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<!---------------------------------- 分页部分---------------------------- -->
						<c:if test="${pageBean.currentPage==1 }">

							<li class="disabled"><a href="javascript:;">首页</a></li>
							<li class="disabled"><a href="javascript:;">上一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage>1}">
							<li class=""><a
								href="${pageContext.request.contextPath }/InAccountAction_list.action?currentPage=1&inAccountType.inaccounttype_id=<s:property value="inAccountType.inaccounttype_id"/>&startTime=<s:property value="startTime"/>&endTime=<s:property value="endTime"/>&inaccount_desc=<s:property value="inaccount_desc"/>">首页</a></li>
							<li class=""><a
								href="${pageContext.request.contextPath }/InAccountAction_list.action?currentPage=${pageBean.currentPage-1}&inAccountType.inaccounttype_id=<s:property value="inAccountType.inaccounttype_id"/>&startTime=<s:property value="startTime"/>&endTime=<s:property value="endTime"/>&inaccount_desc=<s:property value="inaccount_desc"/>"
								aria-label="Previous">上一页</a></li>
						</c:if>
						<!-- 中间页  设置初始化显示5页  -->
						<c:choose>
							<c:when test="${pageBean.totalPage<=5 }">
								<c:set var="begin" value="1" />
								<c:set var="end" value="${pageBean.totalPage }" />
							</c:when>
							<c:otherwise>
								<c:set var="begin" value="${pageBean.currentPage-1 }" />
								<c:set var="end" value="${pageBean.currentPage+3 }" />
								<c:if test="${begin-1<=0 }">
									<c:set var="begin" value="1" />
									<c:set var="end" value="5" />
								</c:if>
								<c:if test="${end >pageBean.totalPage}">
									<c:set var="begin" value="${pageBean.totalPage-4 }" />
									<c:set var="end" value="${pageBean.totalPage }" />
								</c:if>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${begin }" end="${end }">
							<c:choose>
								<c:when test="${i==pageBean.currentPage }">
									<li class="active"><a href="javascript:;">${i } <span
											class="sr-only">(current)</span></a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/InAccountAction_list.action?currentPage=${i}&inAccountType.inaccounttype_id=<s:property value="inAccountType.inaccounttype_id"/>&startTime=<s:property value="startTime"/>&endTime=<s:property value="endTime"/>&inaccount_desc=<s:property value="inaccount_desc"/>"
										onclick="">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageBean.currentPage<pageBean.totalPage }">
							<li class=""><a
								href="${pageContext.request.contextPath }/InAccountAction_list.action?currentPage=${pageBean.currentPage+1}&inAccountType.inaccounttype_id=<s:property value="inAccountType.inaccounttype_id"/>&startTime=<s:property value="startTime"/>&endTime=<s:property value="endTime"/>&inaccount_desc=<s:property value="inaccount_desc"/>"
								aria-label="Next"> 下一页</a></li>
							<li><a
								href="${pageContext.request.contextPath }/InAccountAction_list.action?currentPage=${pageBean.totalPage}&inAccountType.inaccounttype_id=<s:property value="inAccountType.inaccounttype_id"/>&startTime=<s:property value="startTime"/>&endTime=<s:property value="endTime"/>&inaccount_desc=<s:property value="inaccount_desc"/>">尾页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage==pageBean.totalPage }">
							<li class="disabled"><a href="javascript:;"
								aria-label="Next"> 下一页</a></li>
							<li class="disabled"><a href="javascript:;">尾页</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</s:else>
		<!--==================模态框=================-->
		<div class="modal fade" id="editForm" tabindex="-1" role="dialog"
			aria-labelledby="editFormLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" aria-label="Close"
							onclick="closeData()">
							<span aria-hidden="true">×</span>
						</button>
						<h5 class="modal-title" id="exampleModal3Label">
							<span class="glyphicon glyphicon-edit"></span>修改收入账单
						</h5>
					</div>
					<div class="modal-body" align="center">
						<form id="updateForm" action="${pageContext.request.contextPath }/InAccountAction_update.action" method="post">
							<div class="form-group form-inline">

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="" class="control-label" style="color: red;"><b>编号:</b></label>
								<input type="text"  class="form-control" id="outid" name="inaccount_id" readonly="readonly" style="width: 240px;">
							</div>
							<div class="form-group form-inline">
								<label for="recipient-name" class="control-label">收入类型:</label>
								<select class="form-control" style="width: 240px;" name="inAccountType.inaccounttype_id" id="intype1">
								</select>
							</div>
							<div class="form-group form-inline">
								<label for="recipient-name" class="control-label">收入金额:</label>
								<input class="form-control" type="text" style="width: 240px;" name="inaccount_money" required="required"/>
							</div>
							<div class="form-group form-inline">
								<label for="recipient-name" class="control-label">收入时间:</label>
								<input type="text" class="form-control" id="outaccounttime"
									style="width: 240px;" name="inaccount_datetime" readonly="readonly" required="required"/>
							</div>
							<div class="form-group form-inline">
								<label for="recipient-name" class="control-label">创建时间:</label>
								<input type="text" class="form-control" id="outcreatetime"
									style="width: 240px;" name="inaccount_createtime" readonly="readonly"/>
							</div>
							<div class="form-group form-inline">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="message-text" class="control-label">备注:</label>
								<textarea class="form-control" id="message-text"
									style="width: 240px;" name="inaccount_desc"></textarea>
							</div>
							<div class="form-group form-inline">
								<input class="form-control btn btn-warning" value="提交修改"
								type="submit" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="closeData()" id="closeData">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!--==================模态框 end==============-->
		<%@include file="/WEB-INF/user/common/foot.jsp" %>
	<script>
		$(function () {  
		    var picker1 = $('#startTime').datetimepicker({  
		    	pickerPosition: 'up-left',
		 	 	format: 'yyyy-mm-dd ',
		 	 	weekStart: 1,  
	            todayBtn:  1,  
	            autoclose: 1,  
	            todayHighlight: 1,  
	            startView: 2,  
	            minView: 2,  
	            forceParse: 0,  
		        language:  'zh-CN'
		        //minDate: '2016-7-1'  
		    });  
		    var picker2 = $('#endTime').datetimepicker({  
		        pickerPosition: 'up-left',
		 	 	format: 'yyyy-mm-dd ',
		 	 	weekStart: 1,  
	            todayBtn:  1,  
	            autoclose: 1,  
	            todayHighlight: 1,  
	            startView: 2,  
	            minView: 2,  
	            forceParse: 0,  
		        language:  'zh-CN'
		    });  
		    //动态设置最小值  
		    picker1.on('dp.change', function (e) {  
		        picker2.data('DateTimePicker').minDate(e.date);  
		    });  
		    //动态设置最大值  
		    picker2.on('dp.change', function (e) {  
		        picker1.data('DateTimePicker').maxDate(e.date);  
		    });  
		});  
		 $('#outaccounttime').datetimepicker({  
		 	 	pickerPosition: 'bottom-right',
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
		 //单个删除
		function delInAccountById(id){
			  Ewin.confirm({ message: "确认要删除编号为"+id+"的数据吗？" }).on(function (e) {
                 if (e) {
                   location.href="${pageContext.request.contextPath}/InAccountAction_delete.action?inaccount_id="+id;
                }
				});
		}
		function closeData(){	
			
			 $('#editForm').modal('hide');
			
		}
		//打开模态框
		function openData(id){
			var inaccounttypeid=0;
				//手动开启
				 $('#editForm').modal({backdrop: 'static', keyboard: false});  //禁止esc和点击模态框外部关闭
				 
				 //填充模态框表单
				 $.ajax({
					url : '${pageContext.request.contextPath}/InAccountAction_findById.action',
					type : 'POST',
					data:{"inaccount_id":id},
					async:false,
					dataType : 'json',
					success : function(data) {
						$("input[name=inaccount_id]").val(data[0].inaccount_id);
						$("input[name=inaccount_money]").val(data[0].inaccount_money);
						$("textarea[name=inaccount_desc]").val(data[0].inaccount_desc);
						$("input[name=inaccount_datetime]").val(data[0].inaccount_datetime_s);
						$("input[name=inaccount_createtime]").val(data[0].inaccount_createtime_s);
						inaccounttypeid=data[0].inAccountType.inaccounttype_id;
					},
					error : function(msg) {
						alert('查询收入账单失败！');
					}
				});
				 var intype1=$("#intype1");
					$.post("InTypeAction_listajax.action",{},function(data){
						$("#intype1").empty();
						 for(var i=0;i<data.length;i++){
							  intype1.append("<option value='"+data[i].inaccounttype_id+"'>"+data[i].inaccounttype_name+"</option>")
							//回显
		 					  $("#intype1 option[value='"+inaccounttypeid+"']").attr("selected",true);
						 }
					});
		}
		//初始化模态框数据
		 $("#showModal").on("hidden.bs.modal", function() {
             $(this).removeData("bs.modal");
         });
		
		$(function(){
			$("#myin").css("dispaly")
		})
		
		</script>
</body>

</html>