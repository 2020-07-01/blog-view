<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>welcome</title>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- 在页面加载的时候隐藏表单 -->
	<script type="text/javascript">
		function myFunction(){
			 $("#form1").hide();
		};
	</script>

	<!-- 点击注销按钮注销页面显示 -->
	<script type="text/javascript">
		$(document).ready(function(){
		  $("#logout").click(function(){
					 $("#form1").show();
		  });
		});
		
	</script>
 
	
	<!-- 点击表单注销按钮响应操作 -->
	<script type="text/javascript">
		function logout() {
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
				url : "/login/logout",//地址
				async : false,
				data : {//传动json对象
					"name" : name,
					"password" : password
				},
				dataType : "json",//预期的服务器响应的类型
				//登陆成功后进入welocme界面
				success : function(result) {
					//返回数据为result，将他转换为字符串进行判断是否登陆成功
					var s = JSON.stringify(result);
					//如果注销成功退出当前登陆到登陆页面
					if (s == "true") {
						window.location.href = "/login/index";
					}
					if (s == "false") {
						alert("注册失败，账号或者密码错误!");
					};
				},
				
				error : function() {
					alert("不好意思，服务器跑到火星去了，登陆异常!");
					
				}
			});
		}
	</script>

 
	
	
</head>
<body onload="myFunction()"><!-- 加载页面时执行 -->

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">菜鸡加油</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/login/toUpdatePassword"><span class="glyphicon glyphicon-user"></span>
						修改信息</a></li>
				<li><a  href="#" id="logout"><span class="glyphicon glyphicon-user"></span>
						注销</a></li>
				<li><a id="zhuxiao" href="/login/index"><span
						class="glyphicon glyphicon-log-in"></span>退出</a></li>
			</ul>
		</div>
	</nav>

	<H2 style="margin-top: 10px; text-align: center" >欢迎来到主页!</H2>

	<!-- 注销当前账号 -->
	<form id="form1" name="loginForm" style="margin-top: 100px; text-align: center" >
		<!-- 账号 -->
		<div class="form-group">
			<label for="name">用户名：</label> <input type="text"
				class="form-control" id="name"
				style="display: inline; width: 200px;" autocomplete="off"
				placeholder="用户名" /><br>
		</div>

		<!-- 密码 -->
		<div class="form-group">
			<label for="password">密　码：</label> <input type="password"
				class="form-control" id="password"
				style="display: inline; width: 200px;" autocomplete="off"
				placeholder="密码" /><br>
		</div>


		<!--注销当前用户 -->
		<div class="form-group">
			<button type="submit" class="btn btn-default" onclick="logout()">注销</button>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			
			<button type="submit" class=" btn btn-default"
				onclick="window.location.href='/login/toregister'">取消</button>
		</div>
	</form>


 

	 

</body>
</html>