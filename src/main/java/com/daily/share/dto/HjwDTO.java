package com.daily.share.dto;

import java.sql.Date;

public class HjwDTO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private int mem_admin;
	private String mem_url;
	private String mem_blog;
	private Date mem_date;
	
	private String SearchType;
	private String keyword;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
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
	public int getMem_admin() {
		return mem_admin;
	}
	public void setMem_admin(int mem_admin) {
		this.mem_admin = mem_admin;
	}
	public String getMem_url() {
		return mem_url;
	}
	public void setMem_url(String mem_url) {
		this.mem_url = mem_url;
	}
	public String getMem_blog() {
		return mem_blog;
	}
	public void setMem_blog(String mem_blog) {
		this.mem_blog = mem_blog;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	public String getSearchType() {
		return SearchType;
	}
	public void setSearchType(String searchType) {
		SearchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
