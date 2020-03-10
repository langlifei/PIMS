<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateUserInfo.jsp' starting page</title>
    
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
					    	<h3 style="text-align: center;">修改个人信息</h3>
						</div>
			</div>
			<div class="panel-body">
				<form class= "form-horizontal">
					<div class="form-group" style="display:none;">
						<label for="_userName" class="col-sm-4 control-label">账户名</label>
						<div class="col-sm-4">
						  <input type="text" class="form-control" name="userName" id ="_userName" placeholder="请输入账户名"" >
						</div>
					</div>
					<div class="form-group">
						<label for="_realName" class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-4">
						  <input type="text" name="realName" class="form-control" id="_realName" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="_nationality" class="col-sm-4 control-label">国籍</label>
						<div class="col-sm-4">
						  <input type="text" name="nationality" class="form-control" id="_nationality" placeholder="请输入国籍">
						</div>
					</div>
					<div class="form-group">
						<label for="_ctype" class="col-sm-4 control-label">证件类型/证件号码</label>
						<div class="col-sm-4">
						  <input type="text" name="ctype" class="form-control" id="_ctype" placeholder="请输入证件号码">
						</div>
					</div>
					<div class="form-group">
						<label for="_phone" class="col-sm-4 control-label">手机号</label>
						<div class="col-sm-4">
						  <input type="text" name="phone" class="form-control" id="_phone" placeholder="请输入手机号">
						</div>
					</div>
					<div class="form-group">
						<label for="_email" class="col-sm-4 control-label">安全邮箱</label>
						<div class="col-sm-4">
						  <input type="text" name="email" class="form-control" id="_email" placeholder="请输入邮箱">
						</div>
					</div>
					<div class="form-group" style="text-align: center">
						<button class="btn btn-default" type="button" id="userInfo">修改</button>
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
	<script>
		$(function(){
			$("input[name=userName]").val("${User.userName}");
			$("input[name=realName]").val("${User.realName}");
			$("input[name=nationality]").val("${User.nationality}");
			$("input[name=ctype]").val("${User.ctype}");
			$("input[name=phone]").val("${User.phone}");
			$("input[name=email]").val("${User.email}");
		});
	</script>
</html>
