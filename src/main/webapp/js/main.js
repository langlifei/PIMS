$('#login').on('click',function(){
	var checkLogin = true;
	$(".form_log input").each(function(){
		if(this.value=="")
		{
			checkLogin = false;
			var msg = $(this).attr("placeholder");
			$.alert(msg+"不能为空!");
			return false;
		}
	});
	checkLogin&&$.ajax({
		type:"POST",
		url:"userLogin.do",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify({
			"userName":$("input[name=userName]").val(),
			"password":$("input[name=password]").val()
		}),
		success:function(message){
			if(message["flag"]=="登录成功")
			{
				$(".form_log").submit();
			}else if(message["flag"]=="密码不正确!"){
				$.alert("密码错误!");
			}else{
				$.confirm({
					title: $(".title-c").attr("display","none"),
					content:'账户不存在,是否需要注册?',
					confirm:function(){
						$(".form_log").fadeOut("fast");
						$(".form_reg").fadeIn();
					}
				});
			}
		},
		error:function(){
			$.alert("错误");
		}
	});
});

//注册
$("#regist").on("click",function(){
	var checkRegist = true;
	var user = new Object();
	user.userName=$("input[name=userName1]").val();
	user.password=$("input[name=password1").val();
	user.realName=$("input[name=realName]").val();
	user.nationality=$("input[name=nationality]").val();
	user.ctype=$("input[name=ctype]").val();
	user.phone=$("input[name=phone]").val();
	user.email=$("input[name=email]").val();
	$('.form_reg input').each(function()
			{
				if(this.value=="")
				{
					checkRegist = false;
					var msg = $(this).attr("placeholder");
					$.alert(msg+"不能为空!");
					return false;
				}
			});
	checkRegist&&$.ajax({
		type:"post",
		url:"regist.do",
		dataType:"json",
		data:JSON.stringify(user),
		contentType:"application/json;charset=utf-8",
		success:function(message){
			if(message["flag"]=="该用户名已存在!")
			{
				$.alert("该用户名已存在,请重新输入!");
				$("input[name=userName1]").val("");
			}else if(message["flag"]=="注册成功!"){
				$.confirm({
					title: $(".title-c").attr("display","none"),
					content:'注册成功,是否跳转到登录页面?',
					confirm:function(){
						$(window).attr('location',$("#PageContext").val()+"/index.jsp");
					}
				});
			}else{
				$.alert("注册失败!");
			}
		},
		error:function(){
			$.alert("错误!");
		}
	});
});

/*
菜单伸缩
只保留一个伸缩,其余的关闭
*/

$(document).ready(function() {
		$('.inactive').eq(0).siblings('ul').slideDown(100);
		$('.inactive').click(function(){
		//var className=$(this).parents('li').parents().attr('class');
		if($(this).siblings('ul').css('display')=='none'){//展开过程
			//$(this).parents('li').siblings('li').children('a').removeClass('active');
			$(this).parent('li').siblings('li').children('ul').slideUp(500);
			//$(this).addClass('active');
			$(this).siblings('ul').slideDown(500);
		}else {//已展开,移除样式,收缩
			//$(this).removeClass('active');
			$(this).siblings('ul').slideUp(500);
		}
	});
});

//让菜单下的超链接都失效
$('#nav').find('a').attr("href","javascript:void(0);");

//注销
function logOut(){
	$.confirm({
		content:'您真的要退出吗?',
		confirm:function(){
			$(window).attr('location',$("#PageContext").val()+"/logout.do");
		}
	});
}
/*
 * 实现Iframe内嵌网页跳转
 * */
function subFunction(path){
	var src = $('#myIframe').attr('src');
	var suffix = src.substr(src.lastIndexOf('.'));
	if(suffix =='.jsp'){
		src = src.substr(0,src.lastIndexOf('/')+1);	
	}
	src+=path;
	$('#myIframe').attr('src',src);
}

/*
 * 更改iframe的src路径.
 * */
function basicInfo(){
	subFunction('basicInfo.jsp');
	$('#right').css("height","358px");
}
function updatePass(){
	subFunction('updatePass.jsp');
	$('#right').css("height","358px");
}
function insertFriends(){
	subFunction('insertFriends.jsp');
	$('#right').css("height","358px");
}
function showFriends(){
	subFunction('showFriends.jsp');
	$('#right').css("height","444px");
}

function updateUserInfo(){
	subFunction('updateUserInfo.jsp');
	$('#right').css("height","460px");
}

function editLog(){
	subFunction('editLog.jsp');
	$('#right').css("height","410px");
}

function showLog(){
	subFunction('showLog.jsp');
	$('#right').css("height","460px");
}

function insertAccount(){
	subFunction('insertAccount.jsp');
	$('#right').css("height","460px");
}

function queryExpense(){
	subFunction('showExpenses.jsp');
	$('#right').css("height","460px");
}

function uploadFile(){
	subFunction('uploadFile.jsp');
	$('#right').css("height","630px");
}

function showFiles(){
	subFunction('showFile.jsp');
	$('#right').css("height","460px");
}


var checkPassFlag = false;
/*
 * 验证两次密码是否一致
 * */
$('#_rePassword').on('blur',function(){
	var pass = $("input[name=password]").val();
	var repass = $('#_rePassword').val();
	if(pass == repass)
	{
		checkPassFlag = true;
		$('#message').css('display','none');
		$('#right').css("height","358.4px");
	}else{
		$('#message').css('display','block');
		$('#right').css("height","400.4px");
	}
});

//如果不一致,阻止提交事件.
$('#update').on('click',function(event){
	var checkPass = true;
	$(".form-horizontal input").each(function(){
		if($(this).val()==""){
			checkPass = false;
			$.alert($(this).parent().siblings().text()+"不能为空!");
			return false;
		}
	});
	if(checkPass){
		if(!checkPassFlag)
		{
			$.alert('两次密码不一致,请更正后再来修改!');
		}
		checkPassFlag&&$.ajax({
			type:"POST",
			url:"updatePass.do",
			dataType:"json",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify({
				'oldPassword':$("input[name=oldPassword]").val(),
				'password':$("input[name=password]").val()
			}),
			success:function(data){
				$.alert(data.flag);
				if(data.flag!="初试密码错误!"){
					$(".form-horizontal")[0].reset();
				}
			},
			error:function(){
				$.alert("错误!");
			}
		});
	}
});

function universal(data,url){
	$.ajax({
		type:"POST",
		url:url,
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		success:function(data){
			$.alert(data.flag);
		},
		error:function(){
			$.alert("错误!");
		}
});
}

//添加朋友
$("#insert").on('click',function(){
	var checkFriends = true;
	$(".form-horizontal input").each(function(){
		if($(this).val()==""){
			checkFriends = false;
			$.alert($(this).parent().siblings().text()+"不能为空!");
			return false;
		}
	});
	if(checkFriends){
		var friends = new Object();
		friends.fName=$("input[name=fName]").val();
		friends.fPhone=$("input[name=fPhone]").val();
		friends.fAddress=$("input[name=fAddress]").val();
		friends.relation=$("input[name=relation]").val();
		universal(friends,"insertFriends.do");
		$(".form-horizontal")[0].reset();
	}
});


//增加日志
$("#submitLog").on("click",function(){
	var checkLog = true;
	$(".form-horizontal input").each(function(){
		if($(this).val()==""){
			checkLog = false;
			$.alert($(this).parent().siblings().text()+"不能为空!");
			return false;
		}
	});
	if(checkLog){
		var log = {};
		log.logName=$("input[name=logName]").val();
		log.logIntro=$("input[name=logIntro]").val();
		log.content=$("textarea[name=content]").val();
		universal(log,"submitLog.do");
		$(".form-horizontal")[0].reset();
	}
});

//显示分页按钮
function showPagingVO(pagingVO){
	var i;
	/* var href = "${pageContext.request.contextPath}/showFriends.do?currentPageNo=";
	//给分页中的a标签加上默认值;
	$(".pagination").find("a").attr("href",href);*/
	//使用a标签的name属性来暂存页码.
	//上一页
	$("#upPage").attr("name",pagingVO.upPageNo);
	//下一页
	$("#nextPage").attr("name",pagingVO.nextPageNo);
	//最后一页
	$("#lastPage").attr("name",pagingVO.totalCount);
	//获取ul下面的li
	var uArray = $("#paging li");
	//最多显示4个页面按钮
	for(i = 1 ; i <= 5;i++)
	{
		if(pagingVO.currentPageNo+i-1 <= pagingVO.totalCount){
			/* $(uArray[i]).find("a").attr("href",href+i);//更改href */
			$(uArray[i]).find("a").text(pagingVO.currentPageNo+i-1);//设置第几页
			$(uArray[i]).css("display","");
		}else{
			$(uArray[i]).css("display","none");//隐藏li
		}
	}
	//不许使用超链接跳转
	$(".pagination").find("a").attr("href","javascript:void(0);");
};

//获取当前Id删除记录
function deleteF(object,name,url){
	name=name+"="+$(object).parent().siblings().eq(0).text();//获取fId;
	$.confirm({
		title:'注意!',
		content:'你确定删除吗?',
		confirm:function(){
			$.ajax({
				url:url,
				type:"post",
				data:name,
				success:function(message){
					var flag=message["flag"];
					if(flag == "删除失败")
					{
						$.alert(flag);
					}else{
						$(object).parent().parent().remove();
					}
				},
				error:function(){
					$.alert("错误!");
				}
			});
		}
	});
};

//修改朋友信息,传递信息到修改页面
function updateF(data){
	//获取朋友信息
	var friends = new Object();
	friends.fId=$(data).parent().siblings().eq(0).text();
	friends.fName=$(data).parent().siblings().eq(1).text();
	friends.fPhone=$(data).parent().siblings().eq(2).text();
	friends.fAddress=$(data).parent().siblings().eq(3).text();
	friends.relation=$(data).parent().siblings().eq(4).text();
	$.ajax({
		type:"POST",
		url:"updateF.do",
		success:function(data){
			$("body").replaceWith(data);
			$("input[name=fId]").val(friends.fId);
			$("input[name=fName]").val(friends.fName);
			$("input[name=fPhone]").val(friends.fPhone);
			$("input[name=fAddress]").val(friends.fAddress);
			$("input[name=relation]").val(friends.relation);
			$("label").css("font-size","14px");
		},
		error:function(){
			$.alert("错误!");
	}
});
}

//修改日志信息,传递信息到修改页面
function detailL(data){
	//获取朋友信息
	var log = new Object();
	log.logId=$(data).parent().siblings().eq(0).text();
	log.logName=$(data).parent().siblings().eq(1).text();
	log.logIntro=$(data).parent().siblings().eq(2).text();
	log.content=$(data).parent().siblings().eq(3).text();
	log.dateTime=$(data).parent().siblings().eq(4).text();
	$.ajax({
		type:"POST",
		url:"updateL.do",
		success:function(data){
			$("body").replaceWith(data);
			$("input[name=logId]").val(log.logId);
			$("input[name=logName]").val(log.logName);
			$("input[name=logIntro]").val(log.logIntro);
			$("input[name=dateTime]").val(log.dateTime);
			$("textarea[name=content]").val(log.content);
			$("label").css("font-size","14px");
			$("input").attr("disabled","disabled");
			$("textarea[name=content]").attr("disabled","disabled");
		},
		error:function(){
			$.alert("错误!");
	}
});
}

$("#edit").on("click",function(){
	$("input").removeAttr("disabled");
	$("textarea[name=content]").removeAttr("disabled");
	$("#edit").addClass("disabled");
});


//将时间戳转换为具体日期
function formatDateTime(inputTime) {
	var date = new Date(inputTime);
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	m = m < 10 ? ('0' + m) : m;
	var d = date.getDate();
	d = d < 10 ? ('0' + d) : d;
	var h = date.getHours();
	h = h < 10 ? ('0' + h) : h;
	var minute = date.getMinutes();
	minute = minute < 10 ? ('0' + minute) : minute;
	return y + '-' + m + '-' + d + ' ' + h + ':' + minute;
};

//展现数据
function showData(data,url,f){
	$.ajax({
		type:"post",
		url:url,
		dataType:"json",
		data:data,
		success:function(message){
			if(message["flag"]=="没有该联系人"){
				$.alert("对不起,没有您要找的联系人!");
			}else{
				f(message["list"]);
				showPagingVO(message["pagingVO"]);
			}
		},
		error:function(){
			$.alert("错误!");
		}
	});
}

//根据朋友名字获取朋友信息


//修改朋友信息
$("#updateFriends").on("click",function(){
	var friends = new Object();
	friends.fId=$("input[name=fId]").val();
	friends.fName=$("input[name=fName]").val();
	friends.fPhone=$("input[name=fPhone]").val();
	friends.fAddress=$("input[name=fAddress]").val();
	friends.relation=$("input[name=relation]").val();
	/*$.ajax({
		type:"POST",
		url:"updateFriends.do",
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:friend,
		success:function(data){
			alert(data.flag);
		},
		error:function(){
			alert("错误!");
		}
});*/
	universal(friends,"updateFriends.do");
	alert("修改成功!");
});
//修改日记信息
$("#updateLog").on("click",function(){
	if($("input[name=logName]").attr("disabled")=="disabled"){
		alert("您没有进行修改,无需更新!");
	}else{
		var log = new Object();
		log.logId=$("input[name=logId]").val();
		log.logName=$("input[name=logName]").val();
		log.logIntro=$("input[name=logIntro]").val();
		log.dateTime=$("input[name=dateTime]").val();
		log.content=$("textarea[name=content]").val();
		universal(log,"updateLog.do");
		alert("修改成功!");
	}
});


//修改个人信息
$("#userInfo").on("click",function(){
	var user = new Object();
	user.userName=$("input[name=userName]").val();
	user.realName=$("input[name=realName]").val();
	user.nationality=$("input[name=nationality]").val();
	user.ctype=$("input[name=ctype]").val();
	user.phone=$("input[name=phone]").val();
	user.email=$("input[name=email]").val();
/*	$.ajax({
		type:"POST",
		url:"updateUserInfo.do",
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:_user,
		success:function(data){
			alert(data.flag);
		},
		error:function(){
			alert("错误!");
		}
});
*/		universal(user,"updateUserInfo.do");
});

function searchFinance(selectVal){
	var f={};
	if(selectVal == 1)
  	{
  		f.url = "queryIncome.do";
  	}else if(selectVal == 0)
  	{
  		f.url = "queryExpense.do";
  	}else if(selectVal == 2){
  		f.url = "queryAllFinance.do";
  	}
	var beginTime = $("input[name=beginTime]").val();
	var endTime = $("input[name=endTime]").val();
	debugger;
	f.data="beginTime="+beginTime+"&endTime="+endTime;
	return f;
}

/*
 * 根据链接发送请求,展现数据和分页
 * 参数为:链接和搜素条件(拼接)
 */
function show(name,url,f){
	showData('',url,f);
	//当a标签被点击后发出请求.
	$("#paging").find("a").on("click",function(){
		var data;
		//带名字的查询
		data=name+"="+$("input[name=findByName]").val();
//		//判断是否不为第一次访问
//		if(data.indexOf("&")!=-1){
//			data=data.substring(0, data.indexOf("&")-1);
//		}
//		debugger;
		//判断当前点击的是否为上一页,下一页或最后一页
		
		//根据财政分类,来发送不同的请求(仅限财政查询页面使用)
		var selectVal = $("#selectByDay").val();
	  	if(selectVal!=undefined){
	  		var m = searchFinance(selectVal);
	  		url = m.url;
	  		data = m.data;
	  	}
		if($(this).text()=="«上一页"||$(this).text()=="下一页»"||$(this).text()=="最后一页»")
		{
			data= data+"&currentPageNo="+$(this).attr("name");//name属性暂存了它们的页数.
		}else{
			data= data+"&currentPageNo="+$(this).text();
		}
		$.ajax({
			type:"POST",
			url:url,
			dataType:"json",
			data:data,
			success:function(data)
			{
				var list = data["list"];
				var pagingVO = data["pagingVO"];
				f(list);
				showPagingVO(pagingVO);
			},
			error:function(){
				$.alert("错误!");
			}
		});
	});
};

//增加一条新的财政记录
$('#incrementA').on("click",function(){
	var i = $("tbody").children().length;
	if(i<5){
		var row = $('#templateRecord').clone(true);
		$(row).children().eq(0).children().val("");
		$(row).children().eq(3).children().val("");
		$(row).children().eq(5).children().val("");
		row.appendTo($('tbody'));		
	}else{
		$.alert("每次最多添加5条记录,请提交后再次添加!");
	}
});

$('#decrementA').on("click",function(){
	var i = $("tbody").children().length;
	if(i>1){
		$("tbody").children(":last").remove();
	}else{
		$.alert("最少保持一条记录!");
	}
});

//当选择收入时,禁止消费类型和消费方式选择
function selectedIncome(obj){
	if(obj.selectedIndex==1){
		$(obj).parent().siblings().eq(1).children("select").attr("disabled","disabled");
		/*$(obj).parent().siblings().eq(3).children("select").attr("disabled","disabled");*/
	}else{
		$(obj).parent().siblings().eq(1).children("select").removeAttr("disabled");
		/*$(obj).parent().siblings().eq(3).children("select").removeAttr("disabled");*/
	}
};

//查询已有类型,根据搜素结果添加select中的option
function showType(object){
	var tName="tName="+object;
	$.ajax({
		type:"post",
		url:"queryType.do",
		data:tName,
		dataType:"json",
		success:function(message){
			var list = message["list"];
			$.each(list,function(i,item){
				var option = $("#templateOption").clone(true);
				$(option).val(item.id);
				$(option).text(item.name);
				$(option).appendTo($("#"+object));
			});
		},
		error:function(){
			$.alert("错误!");
		}
	});
};

//提交记录
function submitAccounts(){
	var checkAccount = true;
	//获取编写的所有数据.
	var i,j=0;
	var obj = [];
	var trs = $("tbody").children();
	for(i = 0 ; i < trs.length;i++){
		if(!($(trs[i]).children().eq(6).children().prop("checked")))
			{
				j++;
				continue;
			}
		var item = {};
		item.amount = $(trs[i]).children().eq(0).children().val();
		if(item.amount==""){
			$.alert("第"+(i+1)+"条记录的金额不能为空!");
			checkAccount = false;
			return ;
		}
		item.IncomeOrExpense=$(trs[i]).children().eq(1).children().val();
		item.dateTime=$(trs[i]).children().eq(3).children().val();
		if(item.dateTime==""){
			$.alert("第"+i+1+"条记录的时间不能为空!");
			checkAccount = false;
			return ;
		}
		var pType = {};
		var eType = {};
		eType.id=$(trs[i]).children().eq(2).children().find("option:selected").val();
		eType.name=$(trs[i]).children().eq(2).children().find("option:selected").text();
		pType.id=$(trs[i]).children().eq(4).children().find("option:selected").val();
		pType.name=$(trs[i]).children().eq(4).children().find("option:selected").text();
		item.eType=eType;
		item.pType=pType;
		item.notes=$(trs[i]).children().eq(5).children().val();
		obj.push(item);
	}
	//使用ajax发送请求处理提交的数据.
//	universal(obj,"insertAccounts.do");
	checkAccount&&$.ajax({
		type:"post",
		url:"insertAccounts.do",
		data:"params="+JSON.stringify(obj),
		dataType:"json",
		success:function(message){
			if(message["flag"]=="添加成功!")
			{
				$.alert(message["num"]+"条记录添加成功");
				//添加成功后保持一条记录,并清空数据.
				$("#templateRecord").siblings().remove();
				$("#templateRecord").children().eq(0).children().val("");
				$("#templateRecord").children().eq(3).children().val("");
				$("#templateRecord").children().eq(5).children().val("");
			}
			else{
				$.alert(obj.length+1-message["num"]+"添加失败!");
			}
		},
		error:function(){
			$.alert("错误!");
		}
	});
}

//修改文件,传递文件信息到修改页面
function updateFile(data){
	//获取朋友信息
	var file = new Object();
	file.fId=$(data).parent().siblings().eq(0).text();
	file.fName=$(data).parent().siblings().eq(1).text();
	file.fDescribe=$(data).parent().siblings().eq(2).text();
	file.size=$(data).parent().siblings().eq(3).text();
	$.ajax({
		type:"POST",
		url:"translateInfoToUpdate.do",
		success:function(data){
			$("body").replaceWith(data);
			$("input[name=fId]").val(file.fId);
			$("input[name=fName]").val(file.fName);
			$("input[name=fDescribe]").val(file.fDescribe);
			$("input[name=size]").val(file.size);
			$("label").css("font-size","14px");
		},
		error:function(){
			$.alert("错误!");
	}
	});
}

$("#updateFile").on("click",function(){
	debugger;
	var file = new Object();
	file.fId=$("input[name=fId]").val();
	file.fName=$("input[name=fName]").val();
	file.fDescribe=$("input[name=fDescribe]").val();
	file.size=$("input[name=size]").val();
	//universal(file, "updateFile.do");
	$.ajax({
		type:"POST",
		url:"updateFile.do",
		dataType:"json",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(file),
		success:function(data){
			alert(data["flag"]);
		},
		error:function(){
			$.alert("错误!");
		}
});
});

$("#resetFile").on("click",function(){
	$("input[name=fName]").val("");
	$("input[name=fDescribe]").val("");
});

function downloadFile(data){
	//var fId=$(data).parent().siblings().eq(0).text();
	var fName=$(data).parent().siblings().eq(1).text();
	//universal(myFile, "downloadFile.do");//不能使用ajax发送下载请求.
	$(window).attr('location',$("#PageContext").val()+"/downloadFile.do?fName="+fName);
}