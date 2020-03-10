<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'updateFile.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
  </head>
 <body>
	<div class = "panel panel-default">
		<div class="panel-heading">
			<div class="row">
		    	<h3 style="text-align: center;">修改文件</h3>
			</div>
		</div>
		<div class="panel-body">
			<form class= "form-horizontal">
				<div class="form-group" style="display:none;">
					<label for="_fId" class="col-sm-4 control-label">fId</label>
					<div class="col-sm-4">
					  <input type="text" class="form-control" name="fId" id ="_fId">
					</div>
				</div>
				<div class="form-group">
					<label for="_fName" class="col-sm-4 control-label">文件名</label>
					<div class="col-sm-4">
					  <input type="text" class="form-control" name="fName" id ="_fName" placeholder="请输入文件名">
					</div>
				</div>
				<div class="form-group">
					<label for="_fDescribe" class="col-sm-4 control-label">文件描述</label>
					<div class="col-sm-4">
					  <input type="text" name="fDescribe" class="form-control" id="_fDescribe" placeholder="请输入文件描述">
					</div>
				</div>
				<div class="form-group">
					<label for="_size" class="col-sm-4 control-label">文件大小</label>
					<div class="col-sm-4">
					  <input type="text" name="size" class="form-control" disabled id="_size">
					</div>
				</div>
				<div class="form-group" style="text-align: center">
					<button class="btn btn-default" type="button" id="updateFile">修改</button>
					<button class="btn btn-default" type="button" id="resetFile">重置</button>
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
