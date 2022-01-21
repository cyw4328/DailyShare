package com.daily.share.dto;

import java.sql.Date;

public class CsjReportDTO {
	
	private int sol_num;
	private String sol_admin;
	private String sol_state;
	private int dec_num;
	private int dec_code;
	private Date sol_date;
	private int dec_target;
	private int dec_targetNum;
	private String dec_targetId;
	private String mem_id;
	private String dec_name;
	
	public int getSol_num() {
		return sol_num;
	}
	public void setSol_num(int sol_num) {
		this.sol_num = sol_num;
	}
	public String getSol_admin() {
		return sol_admin;
	}
	public void setSol_admin(String sol_admin) {
		this.sol_admin = sol_admin;
	}
	public String getSol_state() {
		return sol_state;
	}
	public void setSol_state(String sol_state) {
		this.sol_state = sol_state;
	}
	public int getDec_num() {
		return dec_num;
	}
	public void setDec_num(int dec_num) {
		this.dec_num = dec_num;
	}
	public int getDec_code() {
		return dec_code;
	}
	public void setDec_code(int dec_code) {
		this.dec_code = dec_code;
	}
	public Date getSol_date() {
		return sol_date;
	}
	public void setSol_date(Date sol_date) {
		this.sol_date = sol_date;
	}
	public int getDec_target() {
		return dec_target;
	}
	public void setDec_target(int dec_target) {
		this.dec_target = dec_target;
	}
	public int getDec_targetNum() {
		return dec_targetNum;
	}
	public void setDec_targetNum(int dec_targetNum) {
		this.dec_targetNum = dec_targetNum;
	}
	public String getDec_targetId() {
		return dec_targetId;
	}
	public void setDec_targetId(String dec_targetId) {
		this.dec_targetId = dec_targetId;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDec_name() {
		return dec_name;
	}
	public void setDec_name(String dec_name) {
		this.dec_name = dec_name;
	}
	
	
	

}
