package com.daily.share.dto;

public class ShjDTO {

	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private int mem_out;
	private int mem_san;
	
	//검색 필터
	private String type;
	private String keyword;
	
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
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public int getMem_out() {
		return mem_out;
	}
	public void setMem_out(int mem_out) {
		this.mem_out = mem_out;
	}
	public int getMem_san() {
		return mem_san;
	}
	public void setMem_san(int mem_san) {
		this.mem_san = mem_san;
	}
	
	
	
	
}
