<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'expenses.jsp' starting page</title>
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
				<div class="row">
					<h1 style="width: 320px;float: left;margin-left: 20px;">财务信息</h1>
					<form class = "form-inline">
						<div class = "form-group">
							<select class="form-control" style="margin-top:26px;" id = "selectByDay">
								<option value="2">全部</option>
								<option value="1">收入</option>
								<option value="0">支出</option>
							</select>
						</div>
						<div class="input-group" style="width:395px;margin-top: 26px;">
							<input type="date" class="form-control" name="beginTime" style="width:152px"/>
							<span class="input-group-addon glyphicon glyphicon-minus" style="position:initial;"></span>
							<input type="date" class="form-control" name="endTime" style="width:152px"/>
							<span class="input-group-addon btn" onclick="queryByDate();">搜索</span>
						</div>
					</form>
				</div>
			</div>
			<table class="table table-striped" id = "show">
				<thead>
					<tr>
						<th>ID</th>
						<th>金额</th>
						<th>类型</th>
						<th>时间</th>
						<th>方式</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
					<tr id="templateExpense">
						<td id="fId"></td>
						<td id="amount"></td>
						<td id="eType"></td>
						<td id="dateTime"></td>
						<td id="pType"></td>
						<td id="notes"></td>
						<!-- <td>
							<button class="btn btn-default btn-sm btn-warning" onclick="updateF(this);">修改</button>
							<button class="btn btn-default btn-sm btn-danger" onclick="deleteF(this,'fId','deleteFriends.do');" id="dele">删除</button>
						</td> -->
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
	 var f= function showE(data){
	  		//移除现有行
	  		$("#templateExpense").siblings().remove();
	  		//将模板显示
	  		$("#templateExpense").css("display","");
	  		$.each(data,function(i,finance){
	  		var row=$("#templateExpense").clone();
	  		row.find("#fId").text(finance.fId);
	  		row.find("#amount").text(finance.amount);
	  		row.find("#eType").text(finance.eName);
	  		row.find("#dateTime").text(formatDateTime(finance.dateTime));
	  		row.find("#pType").text(finance.pName);
	  		row.find("#notes").text(finance.notes);
	  		row.appendTo($("tbody"));
	  		});
	  		$("#templateExpense").css("display","none");//将模板行隐藏
	  };
	  
	  $(function(){
			show("dateTime","queryAllFinance.do",f);
		});	
		
	  function queryByDate(){
		  	var selectVal = $("#selectByDay").val();
		  	var m = searchFinance(selectVal);
			showData(m.data,m.url,f);
		}
	</script>
</html>