<?xml version="1.0" encoding="UTF-8" ?>
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
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/onclock.js"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<style type="text/css">
#btn {
	width: 40px;
	height: 40px;
	display: none;
	position: fixed;
	left: 50%;
	margin-left: 610px;
	bottom: 30px;
	background: url("${pageContext.request.contextPath}/img/top_bg.png")
		no-repeat left top;
}

#btn:hover {
	background: url("${pageContext.request.contextPath}/img/top_bg.png")
		no-repeat left -40px;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/user/common/head.jsp"%>
	<!--内容主容器-->
	<div class="container-fluid">
		<div class="well">
			<div id="inform">
				<h1 style="display: inline;">
					尊敬的用户， <small style="color: red; font-family: '隶书';"><span
						id="hello"></span>好！</small>
				</h1>
				您目前的总积分是： <span class="badge" style="font-size: 18px;"><s:property
						value="#session.currentUser.score" /></span>
			</div>
			<p></p>
			<p id="timeMsg"></p>
			<p>
				您本月总支出额为：<span class="badge"
					style="font-size: 18px; background-color: red;"><s:property
						value="#out_money==null?0:#out_money" />¥</span>|您本月总收入额为：<span
					class="badge" style="font-size: 18px; background-color: green;"><s:property
						value="#in_money==null?0:#in_money" />¥</span>
			</p>
			<p style="font-weight: bolder;">
				<span class="badge" style="background-color: red;"> 温馨提示： </span>
				您使用系统进行的任何添加记录都会获得积分，并且每日使用还会获得额外积分，连续使用系统天数越长，积分越多。
			</p>
		</div>
		<!--内容墙 end-->

		<div class="alert alert-info" role="alert" style="margin-bottom: 0px;">系统功能模块</div>
		<!--栅格系统-->
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-4 col-md-4">
				<div class="thumbnail">
					<div class="caption">
						<h3>账单管理</h3>
						<p>在这里您可以实现支出账单和收入账单的统计、录入、修改、删除</p>
						<p>
							<a
								href="${pageContext.request.contextPath}/OutAccountAction_list.action"
								class="btn btn-primary" role="button">支出账单</a> <a
								href="${pageContext.request.contextPath}/InAccountAction_list.action"
								class="btn btn-default" role="button">收入账单</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-md-4">
				<div class="thumbnail">
					<div class="caption">
						<h3>我的账本</h3>
						<p>在这儿您可以进行记账，如别人借你钱或者你借别人钱都可以在这里登记、查看、修改、删除</p>
						<p>
							<a
								href="${pageContext.request.contextPath}/InvestAction_list.action"
								class="btn btn-primary" role="button">投资理财</a> <a
								href="${pageContext.request.contextPath}/LoanAction_list.action"
								class="btn btn-default" role="button">借款还贷</a>
						</p>
					</div>
				</div>

			</div>
			<div class="col-sm-4 col-md-4">
				<div class="thumbnail">
					<div class="caption">
						<h3>用户交流区</h3>
						<p>在这里，你可以和其他用户进行交流和讨论，一起在这里玩</p>
						<BR />
						<p>
							<a
								href="${pageContext.request.contextPath}/RegionAction_list.action"
								class="btn btn-primary" role="button">交流大区</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!--栅格系统 end-->
		<!--最近发的帖子-->
		<div class="alert alert-success" role="alert"
			style="margin-bottom: 0px;">
			我最近发的帖子<a class="pull-right"
				href="${pageContext.request.contextPath}/TopicAction_findByUser.action">查看更多<span
				class="glyphicon glyphicon-triangle-right"></span></a>
		</div>
		<s:if test="#topiclist.size==0">
			<h3>您最近没有发布任何帖子</h3>
		</s:if>
		<s:else>
			<ul class="list-group">
				<s:iterator var="topic" value="#topiclist">
	
					<li class="list-group-item"><span class="badge">回复数：<s:property
								value="#topic.replys.size" /></span> <span
						style="font-weight: bolder; font-size: 18px;"><s:if
								test="#topic.is_end=='0'">
								<span class="label label-default">【未结帖】</span>
							</s:if> <s:else>
								<span class="label label-warning">【已结帖】</span>
							</s:else>【标题】</span><a
						href="TopicAction_showContent.action?topic_id=<s:property value="#topic.topic_id"/>"><s:property
								value="#topic.topic_title" /></a> <span class="label label-info">发表日期：<s:property
								value="#topic.topic_datetime_s" /></span> <s:if
							test="#topic.is_good=='1'">
							<span class="label label-danger">【加精】</span>
						</s:if> <s:if test="#topic.is_top=='1'">
							<span class="label label-success">【置顶】</span>
						</s:if></li>
				</s:iterator>
			</ul>
		</s:else>
		<!--最近发的帖子 end-->
		<!--最近我的回复-->
		<div class="alert alert-success" role="alert"
			style="margin-bottom: 0px;">
			<span class="glyphicon glyphicon-star"></span>我最近的回复<a
				class="pull-right"
				href="${pageContext.request.contextPath}/TopicAction_findByUser.action">查看更多<span
				class="glyphicon glyphicon-triangle-right"></span></a>
		</div>
		<s:if test="#replylist.size==0">
			<H3>您最近没有任何回复</H3>
		</s:if>
		<s:else>
			<ul class="list-group">
			<s:iterator value="#replylist" var="reply">
				<a class="list-group-item" href="javascript:;"> <span class="badge"><span
						class="glyphicon glyphicon-thumbs-up"></span>
					<s:property value="#reply.zan" /></span> <span class="badge">回复时间：<s:property
							value="#reply.reply_datetime_s" /></span>
					<dl>
						<dt>
							<span style="font-weight: bolder;">【标题】</span>
							<s:property value="#reply.topic.topic_title" />
						</dt>
						<dd>
							【我的回复】
							<s:property value="#reply.reply_content" escape="false" />
						</dd>
					</dl>
				</a>
			</s:iterator>
			</ul>
		</s:else>
		<!--最近我的回复end-->
		<!--支出账单排行榜-->
		<div class="alert alert-warning" role="alert"
			style="margin-bottom: 0px;">
			<span class="glyphicon glyphicon-star"></span>支出账单排行榜<a
				class="pull-right" href="#">查看更多<span
				class="glyphicon glyphicon-triangle-right"></span></a>
		</div>
		<s:if test="#outaccountlist.size==0">
			<h3>您暂时还未添加支出账单</h3>
		</s:if>
		<s:else>
			<table class="table table-striped">
				<thead>
					<th>编号</th>
					<th>支出账单类型</th>
					<th>支出时间</th>
					<th>支出金额</th>
					<th>创建账单时间</th>
					<th>名次</th>
				</thead>
				<tbody>
					<s:iterator var="outaccount" value="#outaccountlist" status="index">
						<tr>
							<td><s:property value="#index.count" /></td>
							<td><s:property
									value="#outaccount.outAccountType.outaccounttype_name" /></td>
							<td><s:property value="#outaccount.outaccount_datetime_s" /></td>
							<td><s:property value="#outaccount.outaccount_money" /></td>
							<td><s:property value="#outaccount.outaccount_createtime_s" /></td>
							<td>第<s:property value="#index.count" />名 <s:if
									test="#index.count==1">
									<img src="${pageContext.request.contextPath}/img/jin.png" />
								</s:if> <s:elseif test="#index.count==2">
									<img src="${pageContext.request.contextPath}/img/yin.png" />
								</s:elseif> <s:elseif test="#index.count==3">
									<img src="${pageContext.request.contextPath}/img/tong.png" />
								</s:elseif>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:else>
		<!--支出账单排行表end-->
		<!--收入账单排行榜-->
		<div class="alert alert-success" role="alert"
			style="margin-bottom: 0px;">
			<span class="glyphicon glyphicon-star"></span>收入账单排行榜<a
				class="pull-right" href="#">查看更多<span
				class="glyphicon glyphicon-triangle-right"></span></a>
		</div>
		<s:if test="#inaccountlist.size==0">
			<h3>您暂时还未添加收入账单</h3>
		</s:if>
		<s:else>
			<table class="table table-striped">
				<thead>
					<th>编号</th>
					<th>收入账单类型</th>
					<th>收入时间</th>
					<th>收入金额</th>
					<th>创建账单时间</th>
					<th>名次</th>
				</thead>
				<tbody>
					
					<s:iterator var="inaccount" value="#inaccountlist" status="index">
						<tr>
							<td><s:property value="#index.count" /></td>
							<td><s:property
									value="#inaccount.inAccountType.inaccounttype_name" /></td>
							<td><s:property value="#inaccount.inaccount_datetime_s" /></td>
							<td><s:property value="#inaccount.inaccount_money" /></td>
							<td><s:property value="#inaccount.inaccount_createtime_s" /></td>
							<td>第<s:property value="#index.count" />名 <s:if
									test="#index.count==1">
									<img src="${pageContext.request.contextPath}/img/jin.png" />
								</s:if> <s:elseif test="#index.count==2">
									<img src="${pageContext.request.contextPath}/img/yin.png" />
								</s:elseif> <s:elseif test="#index.count==3">
									<img src="${pageContext.request.contextPath}/img/tong.png" />
								</s:elseif>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</s:else>
		<!--收入账单排行榜 end-->
		<a href="javascript:;" id="btn" title="回到顶部"></a>
	</div>
	<jsp:include page="/WEB-INF/user/common/foot.jsp"></jsp:include>
	<!--引入的弹出内容js-->
	<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>
</body>

</html>