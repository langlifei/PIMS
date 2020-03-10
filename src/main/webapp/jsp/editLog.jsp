<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editLog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
  <body>
		<div class = "panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<h3 style="text-align: center;">编写日记</h3>
				</div>
			</div>
			<div class="panel-body">
				<form class= "form-horizontal" method="post">
					<div class="form-group">
						<label for="_logName" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" name="logName" id = "_logName" placeholder="请输入标题" >
						</div>
					</div>
					<div class="form-group">
						<label for="_logIntro" class="col-sm-2 control-label">简介</label>
						<div class="col-sm-10">
						  <input type="text" name="logIntro" class="form-control" id="_logIntro" placeholder="请输入简要介绍" >
						</div>
					</div>
					<div class="form-group">
						<label for="_content" class="col-sm-2 control-label">正文</label>
						<div class="col-sm-10">
						  <textarea name="content" rows="6" class="form-control" id="_content" placeholder="请输入正文"></textarea>
						</div>
					</div>
					<div class="form-group" style="text-align: center">
						<button class="btn btn-default" type="button" id="submitLog">提交</button>
						<button class="btn btn-default" type="reset">重置</button>
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
