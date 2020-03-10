<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'updateFriends.jsp' starting page</title>
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
			    	<h3 style="text-align: center;">修改联系人</h3>
				</div>
			</div>
			<div class="panel-body">
				<form class= "form-horizontal">
					<div class="form-group" style="display:none;">
						<label for="_fId" class="col-sm-4 control-label">logId</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" name="fId" id ="_fId" placeholder="请输入fId">
						</div>
					</div>
					<div class="form-group">
						<label for="_fName" class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" name="fName" id ="_fName" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="_fPhone" class="col-sm-4 control-label">手机号</label>
						<div class="col-sm-4">
						  <input type="text" name="fPhone" class="form-control" id="_fPhone" placeholder="请输入手机号">
						</div>
					</div>
					<div class="form-group">
						<label for="_fAddress" class="col-sm-4 control-label">地址</label>
						<div class="col-sm-4">
						  <input type="text" name="fAddress" class="form-control" id="_fAddress" placeholder="请输入地址">
						</div>
					</div>
					<div class="form-group">
						<label for="_relation" class="col-sm-4 control-label">关系</label>
						<div class="col-sm-4">
						  <input type="text" name="relation" class="form-control" id="_relation" placeholder="请输入关系">
						</div>
					</div>
					<div class="form-group" style="text-align: center">
						<button class="btn btn-default" type="button" id="updateFriends">修改</button>
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
