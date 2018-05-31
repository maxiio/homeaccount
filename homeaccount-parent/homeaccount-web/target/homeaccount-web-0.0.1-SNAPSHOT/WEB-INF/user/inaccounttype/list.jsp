<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>收入账单类型</title>
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
		 //单个删除
			function delInAccountTypeById(id){
				 Ewin.confirm({ message: "确认要删除编号为"+id+"的数据吗？" }).on(function (e) {
	                 if (e) {
	                	 $.post("${pageContext.request.contextPath}/InTypeAction_delete.action",{"inaccounttype_id":id},function(data){
	                		 if(data=="0"){
	                			 Ewin.alert({message:"删除成功！"});
	                			 window.location.reload();
	                		 }else{
	                			 Ewin.alert({message:"该收入类型下有账单,无法删除！"});
	                		 }
	                	 })
	                }
					});
			}
		</script>
		<style>
		table thead th{
			text-align: center;
		}
			table tr td{
				text-align: center;
			}
		</style>
	</head>

	<body>
	   <%@include file="/WEB-INF/user/common/head.jsp" %>
	   <div class="container-fluid">
		<!--路径墙-->
			<ol class="breadcrumb">
				<li>
					<a href="${pageContext.request.contextPath}/MainAction_forindex.action">首页</a>
				</li>
				<li>
					<a href="javascript:;">收入账单</a>
				</li>
				<li>
					收入账单类型
				</li>
			</ol>
		<!--路径墙end-->
			<!--搜索墙-->
		<div class="well">
			<form class="form-inline" action="${pageContext.request.contextPath }/InTypeAction_list.action" method="post">
				<span class=""><b>根据收入账单类型条件搜索</b></span>
				<strong style="margin-left: 20px;">支出类型名称:</strong>
				<input placeholder="输入收入账单类型名称" style="margin-right: 25px;" value="<s:property value="inaccounttype_name"/>" type="text" class="form-control" id="inaccounttype_name" name="inaccounttype_name"/>
				<button class="btn btn-primary" id="search" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button>
				<a class="btn btn-success pull-right" href="${pageContext.request.contextPath }/page_user_inaccounttype_add.action"><span class="glyphicon glyphicon-plus"></span>添加收入账单类型</a>
			</form>
		</div>
		<!--搜索墙end-->
		<s:if test="#pageBean.list.size!=0">
		<table class="table table-bordered table-striped">
				<thead>
					<th>编号</th>
					<th>收入类型名称</th>
					<th>账单数目</th>
					<th>收入类型备注</th>
					<th>添加时间</th>
					<th>操作</th>
				</thead>
				<tbody>
					<s:iterator var="intype" value="#pageBean.list" status="index">
						
						<tr>
							<td><s:property value="#index.count"/></td>
							<td><s:property value="#intype.inaccounttype_name"/></td>
							<td><s:property value="#intype.inaccounts.size"/>条</td>
							<td><s:property value="#intype.inaccounttype_desc"/></td>
							<td><s:property value="#intype.inaccounttype_createtime_s"/></td>
							<td style="font-size: 16px;">
								<a class="label label-danger" href="javascript:delInAccountTypeById(<s:property value="#intype.inaccounttype_id"/>)">删除</a>
								<a class="label label-primary" href="javascript:openData(<s:property value="#intype.inaccounttype_id"/>)">修改</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td align="center">
							<a class="label label-default" href="javascript:;" onclick="delByIds()">全删</a>
						</td>
						<td colspan="7" align="center">
							<span class="label label-default">共有<s:property value="#pageBean.totalCount"/>条数据</span>
							<span class="label label-default">每页显示<s:property value="#pageBean.pageSize"/>条数据</span>
							<span class="label label-default">共<s:property value="#pageBean.totalPage"/>页</span>
							<span class="label label-success">当前第<s:property value="#pageBean.currentPage"/>页</span>
						</td>
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
								href="${pageContext.request.contextPath }/InAccountAction_list?currentPage=1">首页</a></li>
							<li class=""><a
								href="${pageContext.request.contextPath }/InAccountAction_list?currentPage=${pageBean.currentPage-1}"
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
										href="${pageContext.request.contextPath }/InAccountAction_list?currentPage=${i}"
										onclick="">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageBean.currentPage<pageBean.totalPage }">
							<li class=""><a
								href="${pageContext.request.contextPath }/InAccountAction_list?currentPage=${pageBean.currentPage+1}"
								aria-label="Next"> 下一页</a></li>
							<li><a
								href="${pageContext.request.contextPath }/InAccountAction_list?currentPage=${pageBean.totalPage}">尾页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage==pageBean.totalPage }">
							<li class="disabled"><a href="javascript:;"
								aria-label="Next"> 下一页</a></li>
							<li class="disabled"><a href="javascript:;">尾页</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			
		</s:if>
		<s:else>
			<div align="center">
				<h2>暂无数据</h2>
			</div>
		</s:else>			
			<%@include file="/WEB-INF/user/common/foot.jsp" %>
		</div>
		<!-- ====================修改类型的模态框================================ -->
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
							<span class="glyphicon glyphicon-edit"></span>修改收入类型
						</h5>
					</div>
					<div class="modal-body" align="center">
						<form id="updateForm" action="${pageContext.request.contextPath }/InTypeAction_update.action" method="post">
							<div class="form-group form-inline">

								<label for="" class="control-label" style="color: red;"><b>编号:</b></label>
								<input type="text"  class="form-control" id="outid" name="inaccounttype_id" readonly="readonly" style="width: 240px;">
							</div>
							
							<div class="form-group form-inline" style="margin-right: 58px;">
								<label for="recipient-name" class="control-label">收入类型名称:</label>
								<input class="form-control" type="text" style="width: 240px;" name="inaccounttype_name" required="required"/>
							</div>
							<div class="form-group form-inline" style="margin-right: 28px;">
								<label for="recipient-name" class="control-label">创建时间:</label>
								<input type="text" class="form-control" style="width: 240px;" name="inaccounttype_createtime" readonly="readonly"/>
							</div>
							<div class="form-group form-inline">
								<label for="message-text" class="control-label">备注:</label>
								<textarea class="form-control" id="message-text"
									style="width: 240px;" name="inaccounttype_desc"></textarea>
							</div>
							<div class="form-group form-inline">
								<input class="form-control btn btn-warning" value="提交"
								   type="submit" />
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							onclick="closeData()" id="closeData">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- ========================/============================ -->
		<script type="text/javascript">
			function closeData(){	
				 $('#editForm').modal('hide');
			}
		//打开模态框
		function openData(id){
				//手动开启
				 $('#editForm').modal({backdrop: 'static', keyboard: false});  //禁止esc和点击模态框外部关闭
				 //填充模态框表单
				 $.post("${pageContext.request.contextPath}/InTypeAction_findById.action",{"inaccounttype_id":id},function(data){
						$("input[name=inaccounttype_id]").val(data.inaccounttype_id);
						$("input[name=inaccounttype_name]").val(data.inaccounttype_name);
						$("textarea[name=inaccounttype_desc]").val(data.inaccounttype_desc);
						$("input[name=inaccounttype_createtime]").val(data.inaccounttype_createtime_s);
				 });
			}
			//初始化模态框数据
			 $("#showModal").on("hidden.bs.modal", function() {
	            $(this).removeData("bs.modal");
	        });
		</script>
	</body>

</html>