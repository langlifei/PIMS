<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class = "col-md-2" style="background-color: #f8f8f8;">
	<ul class = "nav nav-pills nav-stacked" id="nav">
		<li><a  class = "inactive">用户中心
			<span class="glyphicon glyphicon-home pull-right"></span>
		</a>
			<ul class = "nav nav-pills nav-stacked">
				<li><a  onclick="basicInfo();">基本信息</a></li>
				<li><a  onclick="updatePass();">修改密码</a></li>
			</ul>
		</li>
		<li><a  class = "inactive">朋友信息
			<span class="glyphicon glyphicon-piggy-bank pull-right"></span>
		</a>
			<ul class = "nav nav-pills nav-stacked">
				<li><a  onclick="insertFriends();">添加联系人</a></li>
				<li><a onclick="showFriends();">查看联系人</a></li>
			</ul>
		</li>
		<li><a  class = "inactive">日记信息
			<span class="glyphicon glyphicon-edit pull-right"></span>
		</a>
			<ul class = "nav nav-pills nav-stacked">
				<li><a onclick="editLog();">编写日记</a></li>
				<li><a onclick="showLog();">查看日记</a></li>
			</ul>
		</li>
		<li><a  class = "inactive">财务管理
			<span class="glyphicon glyphicon-credit-card pull-right"></span>
		</a>
			<ul class = "nav nav-pills nav-stacked">
				<!-- <li><a >财务总况</a></li> -->
				<li><a onclick="insertAccount();">添加记录</a></li>
				<li><a onclick="queryExpense();">支出情况</a></li>
				<!-- <li><a>收入情况</a></li>
				<li><a>财务清单</a></li> -->
			</ul>
		</li>
		<li><a  class = "inactive">文件管理
			<span class="glyphicon glyphicon-folder-open pull-right"></span>
		</a>
			<ul class = "nav nav-pills nav-stacked">
				<li><a onclick="uploadFile();">添加文件</a></li>
				<li><a onclick="showFiles();">查看文件</a></li>
				<!-- <li><a >删除文件</a></li> -->
			</ul>
		</li>
		<li>
			<a class = "inactive" onclick = "logOut();">退出系统
			<sapn class="glyphicon glyphicon-log-out pull-right"></sapn>
			</a>
		</li>
	</ul>
</div>