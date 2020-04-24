package com.gxzy.salary.vo;

/**
 * 登录接口封装对象
 * @author Louis
 * @date Oct 29, 2018
 */
public class LoginBean {

	private String account;
	private String password;
	private String newPassword;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
