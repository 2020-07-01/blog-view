package com.service;

import org.apache.ibatis.annotations.Param;

import com.entity.User;

public interface UserService {

	/*
	 * @Description:根据用户名和密码进行注册 
	 * @param username：用户名
	 * @param password：用户密码
	 * @Param注解的作用是给参数值命名，参数命名后就可以根据名字将参数值正确的写到sql语句中
	 */
	public boolean registerUser(@Param("username") String username, @Param("password") String password);

	/*
	 * @Description: 进行登录验证
	 * @param name：用户输入的用户名
	 * @param password：用户输入的密码
	 * @return:返回代号表示查询状态
	 */
	public int isLegal(String username, String password) ;

}