package com.cmd.domain;

import java.util.Date;

public class BookViewVO {

	private int bkNum;
	private String bkName;
	private String bkAuthor;
	private String cateCode;
	private String bkDes;
	private String bkImg;
	private Date bkDate;
	
	private String cateCodeRef;
	private String cateName;
	
	private String bkThumbImg;
	
	
	
	public String getBkThumbImg() {
		return bkThumbImg;
	}
	public void setBkThumbImg(String bkThumbImg) {
		this.bkThumbImg = bkThumbImg;
	}
	public int getBkNum() {
		return bkNum;
	}
	public void setBkNum(int bkNum) {
		this.bkNum = bkNum;
	}
	public String getBkName() {
		return bkName;
	}
	public void setBkName(String bkName) {
		this.bkName = bkName;
	}
	public String getBkAuthor() {
		return bkAuthor;
	}
	public void setBkAuthor(String bkAuthor) {
		this.bkAuthor = bkAuthor;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getBkDes() {
		return bkDes;
	}
	public void setBkDes(String bkDes) {
		this.bkDes = bkDes;
	}
	public String getBkImg() {
		return bkImg;
	}
	public void setBkImg(String bkImg) {
		this.bkImg = bkImg;
	}
	public Date getBkDate() {
		return bkDate;
	}
	public void setBkDate(Date bkDate) {
		this.bkDate = bkDate;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
}
