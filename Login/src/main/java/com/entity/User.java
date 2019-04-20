package com.entity;

/**
 * @ClassName:  User   
 * @Description:用户实体类
 * @author: caiji
 * @date: 2019年4月20日 下午10:44:04
 */
public class User {

	private int id;
	private String name;
	private String password;
	private String email;

	public User() {

	}

	public User(int id, String name, String password, String email) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}