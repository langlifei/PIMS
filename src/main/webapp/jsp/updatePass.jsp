<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import = "java.lang.Integer" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
 </head>
 	<style>
		#message{
			text-align: center;
			display: none;
		}
	</style>
	  <body>
		<div class = "panel panel-default">
			<div class="panel-heading">
				<div class="row">
			    	<h3 style="text-align: center;">修改密码</h3>
				</div>
			</div>
			<div class="panel-body">
				<form class= "form-horizontal">
					<div class="form-group">
						<label for="_oldPassword" class="col-sm-2 control-label">旧密码</label>
						<div class="col-sm-10">
						  <input type="password" class="form-control" name="oldPassword" id = "_oldPassword" placeholder="请输入旧密码" required oninvalid="setCustomValidity('请输入您的密码');" oninput="setCustomValidity('');" >
						</div>
					</div>
					<div class="form-group">
						<label for="_password" class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-10">
						  <input type="password" name="password" class="form-control" id="_password" placeholder="请输入密码" placeholder = "输入您的新密码" required oninvalid="setCustomValidity('请输入您的新密码');" oninput="setCustomValidity('');">
						</div>
					</div>
					<div class="form-group">
						<label for="_rePassword" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-10">
						  <input type="password" name="repassword" class="form-control" id="_rePassword" placeholder="请再次输入密码" required oninvalid="setCustomValidity('请再次输入您的密码');" oninput="setCustomValidity('');">
						</div>
					</div>
					<div style="width:22%;height: inherit;margin: 0px auto;color:red;" id="message">
						<label>错误!两次密码需保持一致!</label>
						<span class="glyphicon glyphicon-alert pull-left"></span>
					</div>
					<div class="form-group" style="text-align: center">
						<button class="btn btn-default" type="button" id="update">修改</button>
						<button class="btn btn-default" type="reset" onclick="javascript:$('#message').css('display','none');$('#right').css('height','358.4px');">重置</button>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</html>
