package com.special.app.vo;

public class SearchDTO {
	private String type;
	private String keyword;
	
	public SearchDTO() {;}

	public SearchDTO(String type, String keyword) {
		super();
		this.type = type;
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String[] getTypes() {
		return this.type != null ? this.type.split("") : new String[] {};
	}
}










