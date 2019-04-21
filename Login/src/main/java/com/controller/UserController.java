package com.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.UserServiceImpl;
import net.sf.json.JSONObject;

 

@Controller
public class UserController {

	@Autowired
	UserServiceImpl userServiceImpl;

	/*
	 * @Description: 进入登陆界面
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {

		return "login";
	}

	 
	/*
	 * @Description:进行登陆验证
	 * 	前端发送过来的是json对象，此处以字符串形式接受前端数据 
	 * @param name：用户名
	 * @param password：用户密码
	 */
	@ResponseBody //以json对象格式进行返回
	@RequestMapping("/login")
	public String login(String name, String password) {
		 
		int p = userServiceImpl.isLegal(name, password);
		//数字3代表登陆成功
		if (p == 3) {
			return "3";
		}
		//数字2代表用户名或者密码错误
		else if (p == 2) {
			return "2";
		}
		//数字1代表用户不存在
		else
			return "1";
	}

	
	//登陆成功界面
	@RequestMapping("/welcome")
	public String welcome() {
		return "success";
	}

  
	 
	@RequestMapping("/toregister")
	public String toregister() {
		return "register";
	}

	
	/*
	 * @Description: 进行用户注册的验证
	 * @param userMessage：用来接受前端传来的json格式的字符串
	 * @return：返回注册结果，格式为json对象
	 */
	@ResponseBody
	@RequestMapping("/register")
	public String register(@RequestBody String userMessage) {
		//将string转换为静态的JSONObject
		JSONObject object = JSONObject.fromObject(userMessage);
		//获取与键关联的值
		String username = object.getString("name");
		String password = object.getString("password");
		//如果注册成功返回true，否则返回false
		boolean p = userServiceImpl.registerUser(username, password);
		if(p) {
			return "true";
		}
		else
		{
			return "false";
		}
	}
	 
	

}