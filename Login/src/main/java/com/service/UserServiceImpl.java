package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserMapper;
import com.entity.User;

@Service
public class UserServiceImpl implements UserService {

	//注入UserMapper接口

	@Autowired
	private UserMapper userMapper;

	/**
		* 登录
		* 根据用户名和密码进行查询
		*/

	public void print() {
		System.out.println(userMapper);
	}
	@Override
	public User login(String username, String password) {
		return userMapper.findByUserNameAndPassword(username, password);
	}

	/**
		* 注册
		* 增加用户
		*/

	@Override
	public void register(User user) {
		userMapper.addUser(user);
	}

	@Override
	public User findByUserName(String username) {

		return userMapper.findByUserName(username);
	}
}
