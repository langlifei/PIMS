<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class = "container" id = "top">
	<div class = "row">
		<div class = "col-md-13">
			<div class = "navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a href="javascript:void(0);" class="navbar-brand" onclick="basicInfo();">个人信息管理系统</a>
				</div>
				<form action="##" class="navbar-form navbar-right">
					<div class = "btn-group">
						<button type="button" class="btn btn-default" onclick="basicInfo();"><span class = "glyphicon glyphicon-user"></span>&nbsp;${sessionScope.User.userName}</button>
						<button id = "dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
						class="btn btn-default dropdown-toggle" 
						type="button" style="margin-right: 18px;height:34px">
						<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="javascript:void(0);" onclick="updateUserInfo();">
									<span class="glyphicon glyphicon-cog pull-right"></span>
									修改个人信息
								</a>
							</li>
							<!-分割线--->
							<li role="presentation" class="divider"></li>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" onclick="logOut();" href="javascript:void(0);">
									<span class="glyphicon glyphicon-off pull-right"></span>
									注销
								</a>
							</li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
