<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showFriends.jsp' starting page</title>
    
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
  </style>
  
  <body>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<h1 style="width: 392px;float: left;margin-left: 20px;">朋友列表</h1>
					<form role="form">
						<div class="input-group" style="width: 362px;margin-top: 26px;">
							<input type="text" class="form-control" placeholder="请输入姓名" name="findByName" />
							<span class="input-group-addon btn" onclick="queryByName('queryFriendsByfName.do');">搜索</span>
						</div>
					</form>
				</div>
			</div>
			<table class="table table-bordered" id = "show">
				<thead>
					<tr>
						<th>ID</th>
						<th>姓名</th>
						<th>电话</th>
						<th>地址</th>
						<th>关系</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr id="templateFriend">
						<td id="fId"></td>
						<td id="fName"></td>
						<td id="fPhone"></td>
						<td id="fAddress"></td>
						<td id="relation"></td>
						<td>
							<button class="btn btn-default btn-sm btn-warning" onclick="updateF(this);">修改</button>
							<button class="btn btn-default btn-sm btn-danger" onclick="deleteF(this,'fId','deleteFriends.do');" id="dele">删除</button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="panel-footer" style="padding:0px 15px;">
					<nav style="text-align: center">
						<ul class="pagination" id = "paging">
							<li><a id = "upPage">&laquo;上一页</a></li>
							<li class="active" id="firstPage"><a>${pagingVO.curentPageNo}</a></li>
								<li><a></a></li>
								<li><a></a></li>
								<li><a></a></li>
								<li><a></a></li>
							<li><a id = "nextPage">下一页&raquo;</a></li>
							<li><a id = "lastPage">最后一页&raquo;</a></li>
						</ul>
					</nav>
			</div>
		</div>		
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
  <script type="text/javascript">
	//显示朋友信息
	 var f= function showF(data){
	  		//移除现有行
	  		$("#templateFriend").siblings().remove();
	  		//将模板显示
	  		$("#templateFriend").css("display","");
	  		$.each(data,function(i,friend){
	  		var row=$("#templateFriend").clone();
	  		row.find("#fId").text(friend.fId);
	  		row.find("#fName").text(friend.fName);
	  		row.find("#fPhone").text(friend.fPhone);
	  		row.find("#fAddress").text(friend.fAddress);
	  		row.find("#relation").text(friend.relation);
	  		row.appendTo($("tbody"));
	  		});
	  		$("#templateFriend").css("display","none");//将模板行隐藏
	  };
	  
	$(function(){
		show("fName","showFriends.do",f);
	});	
	
	function queryByName(url){
		var name="name=";
		name+=$("input[name=findByName]").val();
		showData(name,url,f);
	}
	</script>
</html>
