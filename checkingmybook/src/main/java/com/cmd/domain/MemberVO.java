package com.cmd.domain;

public class MemberVO {

//	create table cmd_member (
//		userId varchar2(50) not null, 
//		userPass varchar2(100) not null,
//		userName varchar2(50) not null,
//		userPhon varchar2(50) not null,
//		primary key(userId)
//		);
	
	private String userId;
	private String userPass;
	private String userName;
	private String userPhon;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhon() {
		return userPhon;
	}
	public void setUserPhon(String userPhon) {
		this.userPhon = userPhon;
	}
	
}
