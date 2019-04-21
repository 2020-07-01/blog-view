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

	/*
	 * @Description:通过用户名和密码进行注册
	 * @param username：用户名
	 * @param password：用户密码
	 * 	在注册之前先检查此用户是否已经注册过
	 */
	public boolean registerUser(String username, String password) {
		//进行注册之前先检查此用户是否已经注册过了
		User user = userMapper.selectPasswordByName(username);
		if (user == null) {
			userMapper.addUser(username, password);
			return true;//表示注册成功
		} else
			return false;//表示用户名已存在，注册失败
	}

	/*
	 *	进行登陆验证并返回代号
	 *	1：代表用户名不存在
	 *	2：代表用户名或者密码错误
	 *	3：代表用户登陆成功
	 */
	public int isLegal(String username, String password) {
		User user = userMapper.selectPasswordByName(username);

		if (user == null) {
			return 1;
		} else {
			String password1 = user.getPassword();
			if (password != null && password.equals(password1)) {
				return 3;
			} else {
				return 2;
			}
		}

	}
	
	
	

}
