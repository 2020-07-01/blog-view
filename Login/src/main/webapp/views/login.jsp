<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆首页</title>

<!-- 引入bootstrap3.3.7 -->
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- 引入jQuery1.14.0插件 -->
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>


<!-- 用户登陆验证 -->
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

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">菜鸡加油</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/login/toregister"><span
						class="glyphicon glyphicon-user"></span> 用户注册</a></li>
			</ul>
		</div>
	</nav>





	<div style="height: 3em; line-height: 9em; text-align: center">
		<h3>登 录</h3>
	</div>
	<form name="loginform" id="loginform" class="cmxform"
		style="margin-top: 10px; text-align: center">
		<!-- 登陆账号 -->
		<div class="form-group">
			<label for="name">用户名：</label> 
			<input type="text" class="form-control" id="name" name="name"style="display: inline; width: 200px;" autocomplete="off"
				placeholder="用户名" />
			<br>
		</div>

		<!-- 登陆密码 -->
		<div class="form-group">
			<label for="password">密　码：</label> 
			<input type="password"
				class="form-control" id="password"
				style="display: inline; width: 200px;" autocomplete="off"
				placeholder="密码" /><br>
		</div>

		<!-- 登陆按钮 -->
		<div class="form-group">
			 <button type="button" class="btn btn-default" onclick="login()">登录</button>  
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<button type="button" class=" btn btn-default"
				onclick="window.location.href='/login/toregister'">注册</button>

		</div>
	</form>



 


 



</body>
</html>
