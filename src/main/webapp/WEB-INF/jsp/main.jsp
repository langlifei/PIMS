<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/universal.css"/>
  </head>
 
 <body>
 		<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/><!-- 用来传递项目名 -->
 		<jsp:include page="top.jsp"></jsp:include>
		<div class = "container" id = "content">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<div class = "col-md-10" style="height: 358.4px;" id = "right">
					<iframe src="${pageContext.request.contextPath}/jsp/basicInfo.jsp" height="100%" width="100%" id = "myIframe" scrolling="no" frameborder="0"></iframe>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
</html>
