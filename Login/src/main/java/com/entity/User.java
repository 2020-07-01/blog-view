package com.entity;

/**
 * @ClassName:  User   
 * @Description:用户实体类：包含三个属性：id，name，password
 * @author: caiji
 * @date: 2019年4月20日 下午10:44:04
 */
public class User {

	private int id;
	private String username;
	private String password;

	public User() {

	}

	public User(int id, String username, String password) {
		this.id = id;
		this.username = username;
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return username;
	}

	public void setName(String username) {
		this.username = username;
	}

}