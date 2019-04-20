package com.controller;

 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.UserMapper;
import com.entity.User;
import com.service.UserServiceImpl;
 

 
@Controller
public class UserController{
 
	@Autowired
	UserServiceImpl userServiceImpl;
	
	
	@RequestMapping("/index")
	public String index() {
		 User user = userServiceImpl.findByUserName("hello");
		System.out.println(user.getId());
		return "index";
	}
    
}