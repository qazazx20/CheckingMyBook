package com.cmd.domain;

public class CategoryVO {
	
//	create table book_category (
//			cateName varchar2(50) not null,
//			cateCode varchar2(50) not null,
//			cateCodeRef varchar2(50) null,
//			primary key(cateCode),
//			foreign key(cateCodeRef) references book_category(cateCode)
//			);

	private String cateName;
	private String cateCode;
	private String cateCodeRef;
	private int level;

	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
}
