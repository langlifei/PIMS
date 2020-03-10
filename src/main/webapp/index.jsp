<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery-confirm.css"/>
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
  </head>
	<body>
		<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/><!-- 用来传递项目名 -->
		<div id = "all">
			<div class = "head">
				<div class = "title">
					个人信息管理系统
				</div>
			</div>
			<div class = "container">
				<div class = "left_image">	
				</div>
				<div class = "form">
					<form class= "form_log" action="login.do" method="post">
						<div id = "caption">用户登录</div>
						<input name = "userName" class = "inp_text" type = "text" placeholder = "userName"/>
						<input name = "password" class = "inp_text" type = "password" placeholder = "password"/>
						<div class = "but">
							<button  type = "button" id ="login">登录</button>
							<button  type = "reset">重置</button>
						</div>
					</form>
					<form class= "form_reg" action="regist.do" method="post" style="display: none;">
						<div id = "caption">用户注册</div>
						<input name = "userName1" class = "inp_reg" type = "text" placeholder = "userName"/>
						<input name = "password1" class = "inp_reg" type = "password" placeholder = "password"/>
						<input name = "realName" class = "inp_reg" type = "text" placeholder = "realName"/>
						<input name = "nationality" class = "inp_reg" type = "text" placeholder = "nationality"/>
						<input name = "ctype" class = "inp_reg" type = "text" placeholder = "IDNumber"/>
						<input name = "phone" class = "inp_reg" type = "text" placeholder = "phone"/>
						<input name = "email" class = "inp_reg" type = "text" placeholder = "email"/>
						<div class = "but">
							<button  type = "button" id ="regist">注册</button>
							<button  type = "reset">重置</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery-confirm.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</html>