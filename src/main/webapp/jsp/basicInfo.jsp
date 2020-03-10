<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'basicInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
  <style>
		.table tr td{
			text-align: center;
		}
	</style>
  <body>
		<div class = "panel panel-default">
			<div class="panel-heading">
					<div class="row">
						<h3 style="text-align: center;">基本信息</h3>
					</div>
			</div>
			<table class = "table">
				<tr>
					<td>
						<strong>账户名</strong>&nbsp;
					</td>
					<td >
						<strong>${sessionScope.User.userName}</strong>
					</td>
				</tr>
				<tr>
					<td >
						<strong>姓名</strong>&nbsp;
					</td>
					<td >
						<strong>${sessionScope.User.realName}</strong>
					</td>
				</tr>
				<tr>
					<td >
						<strong>国籍</strong>&nbsp;
					</td>
					<td>
						<strong>${sessionScope.User.nationality}</strong>
					</td>
				</tr>
				<tr>
					<td >
						<strong>证件类型/证件号码</strong>&nbsp;
					</td>
					<td>
						<strong>${sessionScope.User.ctype}</strong>
					</td>
				</tr>
				<tr>
					<td >
						<strong>手机号</strong>&nbsp;
					</td>
					<td>
						<strong>${sessionScope.User.phone}</strong>
					</td>
				</tr>
				<tr>
					<td >
						<strong>安全邮箱</strong>&nbsp;
					</td>
					<td>
						<strong>${sessionScope.User.email}</strong>
					</td>
				</tr>
			</table>
			<div class="panel-footer" style="text-align: center; color: red;">
				<div style="width:22%;height: inherit;margin: 0px auto;">
					<label>请注意保护自己的隐私信息</label>
					<span class="glyphicon glyphicon-alert pull-left"></span>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</html>
