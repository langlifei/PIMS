<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'insertAccount.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
  </head>
  <style>
	#show tr td,th{
	text-align:center;}
	option{
		text-align: center;
	}
</style>
<body>
	<div class = "panel panel-default">
		<div class="panel-heading">
			<div class="row">
				<h3 style="text-align: center;">添加记录</h3>
			</div>
		</div>
		<table class="table" id = "show">
			<thead>
				<div class="row">
					<tr>
						<th class="col-xs-2">
							金额
						</th>
						<th class="col-xs-2">
							收入/支出
						</th>
						<th class="col-xs-2">
							类型
						</th>
						<th class="col-xs-1">
							时间
						</th>
						<th class="col-xs-2">
							方式
						</th>
						<th class="col-xs-2">
							备注
						</th>
						<th class="col-xs-1">
							<span class="glyphicon glyphicon-ok"></span>
						</th>
					</tr>
				</div>
			</thead>
			<tbody>
				<tr id = "templateRecord">
					<td>
						<input class = "form-control" type="text" onblur="if (!/^\d+(\.\d+)?$/.test(this.value)){this.value='';}" step="0.01" />
					</td>
					<td>
						<select class="form-control" onchange="selectedIncome(this);">
							<option value="0"  id = "templateOption">支出</option>
							<option value="1">收入</option>
						</select>
					</td>
					<td>
						<select class="form-control" id="eType">
						 </select>
					</td>
					<td>
						<input type="datetime-local" class="form-control"/>
					</td>
					<td>
						<select class="form-control" id="pType">
						</select>
					</td>
					<td>
						<textarea rows="1" class="form-control"></textarea>
					</td>
					<td>
						<input type="checkbox" checked="checked" style="margin-top:3px; zoom:200%; "/>
					</td>
			</tbody>
		</table>
		<div class="panel-footer" style="text-align: center; color: red;">
			<div class="form-group" style="text-align: center">
				<button class="btn btn-success" type="button" onclick="submitAccounts();">提交</button>
				<button class="btn btn-info" type="reset" id="incrementA">增加</button>
				<button class="btn btn-warning" type="button" id="decrementA">删除</button>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>
	$(function(){
		showType("eType");
		showType("pType");
	});
	</script>
</html>
