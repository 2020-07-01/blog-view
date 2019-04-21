<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>登陆首页</title>

    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

    <!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
    <script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>



<script type="text/javascript">
	/*  该function用于用户登陆的验证，其功能如下：
		1.当用户账号为空时，警告：用户名必填！
		2.当用户密码为空时，警告：密码必填！
		3.通过ajax连接后端，如果账号密码验证成功，就跳转至主页，否则警告：账号或者密码错误！
	 */
	function login() {
		//jQuery写法
		//获取用户输入
		var name = $("#name").val();
		var password = $("#password").val();
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
			//几个参数需要注意一下
			type : "post",//提交方法
			url : "/login/login",//地址
			data : {
				"name" : name,
				"password" : password
			},
			dataType : "json",//预期的服务器响应的类型

			//登陆成功后进入welocme界面
			success : function(result) {
				//返回数据为result，将他转换为字符串进行判断是否登陆成功
				var s = JSON.stringify(result);

				if (s == "3") {
					//登陆成功后进入到主页面
					window.location.href = "/login/welcome";
				}
				if (s == "2") {
					alert("登陆失败，账号或者密码错误!");
				}
				if (s == "1") {
					//此时直接跳到到注册界面
					alert("账号不存在，请注册!");
				}
				;
			},
			error : function() {
				alert("不好意思，服务器跑到火星去了，登陆异常!");
			}
		});
	}
</script>

</head>
<body>

	<div style="height:3em;line-height: 9em;text-align:center">	
		<h1>登 陆 界 面</h1>
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
			<button type="submit" class= "btn btn-default" onclick="login()">登录</button>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
			<button type="submit" class=" btn btn-default"  onclick="window.location.href='/login/toregister'">注册</button>
 
		</div>
	</form>

</body>
</html>
