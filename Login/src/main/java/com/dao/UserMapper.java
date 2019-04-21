package com.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.entity.User;

@Repository
public interface UserMapper {

	/*
	 * @Description:根据用户名和密码进行注册 
	 * @param username：用户名
	 * @param password：用户密码
	 * @Param注解的作用是给参数值命名，参数命名后就可以根据名字将参数值正确的写到sql语句中
	 */
	public void addUser(@Param("username") String username, @Param("password") String password);

	/*
	 * @Description:根据用户名查询密码进行登陆验证 
	 * @param name：用户名
	 * @return：返回用户的数据
	 */
	public User selectPasswordByName(String name);
	
	
	

}