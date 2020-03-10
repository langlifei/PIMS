<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'uploadFile.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fileinput.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-confirm.css"/>
  </head>
  <style>
	#show tr td,th{
	text-align:center;}
	option{
		text-align: center;
	}
</style>
<body>
	<div class = "panel panel-default">
		<div class="panel-heading">
					<div class="row">
						<h3 style="text-align: center;">添加文件</h3>
					</div>
		</div>
		<div class="panel-body">
			<form class= "form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="_fileDescribe" class="col-sm-4 control-label">文件描述</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="fileDescribe" id ="_fileDescribe" placeholder="请输入文件描述">
					</div>
				</div>
				<div class="form-group">
					<label for="_inp-file" class="col-sm-4 control-label">上传文件</label>
					<div class="col-sm-5">
					  <input type="file" name="myFile" id="_inp-file">
					</div>
				</div>
				<div class="form-group" style="text-align: center">
					<button class="btn btn-success" type="button" id="_submitFile">提交</button>
					<button class="btn btn-warning" type="reset">重置</button>
				</div>
			</form>
		</div>
	</div>
</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/fileinput.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/zh.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>
		/**
		 * 初始化文件上传插件
		 */
		$("#_inp-file").fileinput({
			uploadUrl:"uploadFile.do",//上传的地址
			uploadAsync:true,//默认为异步上传
			showUpload:false,
			showRemove:false,
			showCaption:true,//是否显示标题,就是文本框,但是不能输入
			showPreview:true,//是否显示预览
			dropZoneEnabled:false,//是否显示拖拽区域
			maxFileCount:1,
			enctype:"multipart/form-data",
			validateInitialCount:true,
			previewFileIcon:"<i class = 'glyphicon glyphicon-cloud-upload'></i>",
			msgFilesTooMany:"超过允许的最大数量{m}! ",
			language:'zh'
		});
		
		var uploaded  = false;
		
		//异步上传成功
		$("#_inp-file").on("fileuploaded",function(event,data,previewId,index){
			debugger;
			if(data.response.message != "上传成功!")//如果文件重复,调用;
			{
				var name = data.files[0].name;
				uploaded = true;
				$.alert(name+"已存在,无需重复上传!");
			}else{
				uploaded = false;
			}
		});
		//异步加载失败
		$("#_inp-file").on("fileerror",function(event,data,msg){
			$.alert("上传失败!");
		});
		
		$("#_submitFile").on("click",function(){
			 var checkUpload = true;
			if(!uploaded){
				
				var file = {};
				file.fName = $(".file-caption-name").val();//获取文件名;
				//判断是否选择文件
				if(file.fName=="")
				{
					checkUpload = false;
					$.alert("请先选择需要上传的文件!");
				}
				file.fDescribe = $("#_fileDescribe").val();
				//描述是否为空
				if(file.fDescribe=="")
				{
					checkUpload = false;
					if(file.fName!="")
					{
						$.alert("描述不能为空!");
					}
				}
				//判断文件是否上传
				if(file.fName !=""&&file.fDescribe!=""){
					if($(".kv-file-upload").css("display")!="none")
					{
						checkUpload = false;
						$.alert("请先上传选择的文件!");
					}
				}
				var temp = $(".file-size-info").find("samp").text();
				file.size = temp.substring(1,temp.length-1);
				checkUpload&&$.ajax({
					url:"submitFile.do",
					data:JSON.stringify(file),
					contentType:"application/json;charset=utf-8",
					type:"post",
					dataType:"json",
					success:function(message){
						$(".form-horizontal")[0].reset();
						$.alert(message["flag"]);
					},
					error:function(){
						$.alert("错误!");
					}
				});
			}else{
				$.alert($(".file-caption-name").val()+"已存在,无需重复提交!");
			}
		});
	</script>
</html>
