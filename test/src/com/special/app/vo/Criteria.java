package com.special.app.vo;

public class Criteria {
	private String keyword;
	private String type;
	private String order;
	
	public Criteria() {;}
	
	public Criteria(String keyword, String type, String order) {
		super();
		this.keyword = keyword;
		this.type = type;
		this.order = order;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	
	public String[] getTypes() {
		return this.type != null ? this.type.split("") : new String[] {};
	}
}
