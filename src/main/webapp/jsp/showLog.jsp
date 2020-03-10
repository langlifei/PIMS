<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showLog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
	<style>
  		#show tr td,th{
  		text-align:center;}
  	</style>
  <body>
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row" id = "show">
					<h1 style="width: 392px;float: left;margin-left: 20px;">日记信息</h1>
					<form role="form">
						<div class="input-group" style="width: 362px;margin-top: 21px;">
							<input type="text" class="form-control" placeholder="请输入日记名" name="findByName" />
							<span class="input-group-addon btn glyphicon glyphicon-search" onclick="queryByName('queryLogBylogName.do');"></span>
						</div>
					</form>
				</div>
			</div>
			<table class="table table-bordered" id = "show">
				<thead>
					<tr>
						<th>ID</th>
						<th>标题</th>
						<th>简介</th>
						<th>日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr id="templateLog">
						<td id="logId"></td>
						<td id="logName"></td>
						<td id="logIntro"></td>
						<td id="content" style="display:none"></td>
						<td id="dateTime"></td>
						<td>
							<button class = "btn btn-default btn-sm btn-info" onclick="detailL(this)">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button class="btn btn-default btn-sm btn-danger" onclick="deleteF(this,'logId','deleteLog.do');" id="dele">
								<span class="glyphicon glyphicon-trash"></span>
							</button>
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
	//显示日志信息;
	var f = function showL(data){
		//移除现有行
		$("#templateLog").siblings().remove();
		//将模板显示
		$("#templateLog").css("display","");
		$.each(data,function(i,log){
		var row=$("#templateLog").clone();
		row.find("#logId").text(log.logId);
		row.find("#logName").text(log.logName);
		row.find("#logIntro").text(log.logIntro);
		row.find("#content").text(log.content);
		row.find("#dateTime").text(log.dateTime);
		row.appendTo($("tbody"));
		});
		$("#templateLog").css("display","none");//将模板行隐藏
	};
	
		$(function(){
			show("logName","showLog.do",f);
		});	
		
		function queryByName(url){
			var name="name=";
			name+=$("input[name=findByName]").val();
			showData(name,url,f);
		}
	</script>
</html>
