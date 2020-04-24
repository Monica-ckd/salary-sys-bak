package com.gxzy.salary.model;

import java.util.Date;

public class SysUserToken extends BaseModel {
	
    private Long userId;
    
    private String token;
    
    private Date expireTime;

	/**
	 * 是否首次登陆标记
	 */
	private Boolean firstLoginFlag;

	public Boolean getFirstLoginFlag() {
		return firstLoginFlag;
	}

	public void setFirstLoginFlag(Boolean firstLoginFlag) {
		this.firstLoginFlag = firstLoginFlag;
	}

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Date getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}
   
}