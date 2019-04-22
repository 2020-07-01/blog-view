<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册首页</title>

    <!-- 新 Bootstrap3.3.7 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap3.3.7 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<!-- 注册表单响应 -->
<script type="text/javascript">
	function register() {
		//jQuery写法
		//获取用户输入
		var name = $("#name").val();
		var password = $("#password").val();
		
		var user = {
				"name" : name,
				"password" : password
			};
	 
		//转换为json格式的字符串
		var datajson = JSON.stringify(user);
		
		if (!name) {
			alert("用户名必填!");
			$("#name").focus();//获取焦点
			return;
		}
		if (!password) {
			alert("密码必填!");
			$("#password").focus();//获取焦点
			return;
		}
		
		$.ajax({
			type : "post",//提交方法
			url : "/login/register",//地址
			data :  datajson,
			dataType : "json",//预期的服务器响应的类型
			contentType:"application/json;charset=utf-8",//指定json字符串格式
			//注册成功后进入登陆界面
			success : function(result) {
				var s = JSON.stringify(result);

				if (s == "true") {
					//登陆成功后进入到登陆
					window.location.href = "/login/index";
				 
				}
				if (s == "false") {
					alert("用户名已经存在，请重新输入!");
				};
			},
			error : function() {
				alert("不好意思，服务器跑到火星去了，登陆异常！");
			}
		});
	}
</script>

</head>
<body>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">菜鸡加油</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/login/index"><span class="glyphicon glyphicon-user"></span>
						用户登陆</a></li>
			</ul>
		</div>
	</nav>


	<!-- 注册表单 -->
	<div style="height:3em;line-height: 9em;text-align:center">	
		<h3>注　册</h3>
	</div>
	<form name="loginForm" style=" margin-top:10px;text-align:center">
		<!-- 登陆账号 -->
		<div class="form-group">
			<label for="name">用户名：</label> 
			<input type="text" class="form-control" id="name" style="display:inline;width:200px;"autocomplete="off" 
			placeholder="用户名" /><br>
		</div>

		<!-- 登陆密码 -->
		<div class="form-group">
			<label for="password">密　码：</label> 
			<input  type="password" class="form-control" id="password" style="display:inline;width:200px;"autocomplete="off"
				placeholder="密码" /><br>
		</div>

		<!-- 登陆按钮 -->
		<div class="form-group">
			<button type="button" class= "btn btn-default" onclick="register()">确认注册</button>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
			<button type="reset" class=" btn btn-default" >重置</button>
		  
		</div>
	</form>
	
	

</body>
</html>
