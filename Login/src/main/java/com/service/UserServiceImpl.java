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
	 
	
	/*
	 *	进行注销验证
	 */
	public boolean logout(String name, String password) {
		//根据name查询输入的密码是否正确
		User user = userMapper.selectPasswordByName(name);
		//如果没有此用户返回false
		if (user == null) {
			return false;
		}
		
		//如果用户存在:比较密码是否正确
		else {
			String password1 = user.getPassword();
			//如果密码正确返回true，否则返回false
			if (password.equals(password1)) {
				int id = user.getId();
				int p = userMapper.deleteUserByName(id);
				return true;
			} else {
				return false;
			}
		}

	}

	public String updateMessage(String name, String password,String newpassword) {
		
		User user = userMapper.selectPasswordByName(name);
		//如果用户不存在
		if(user == null)
		{
			return "1";
		}
		//如果用户存在
		else {
			//如果新密码与旧密码相同
			if(newpassword.equals(password))
			{
				return "2";
			}
			else {
				Integer p = userMapper.updateUserByName(name,newpassword);
				return "3";
			}
		}
	}

}
