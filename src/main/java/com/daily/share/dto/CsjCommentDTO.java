package com.daily.share.dto;

import java.util.Date;

public class CsjCommentDTO {
	
	private int com_num;
	private String mem_id;
	private int board_num;
	private int com_parent;
	private int com_depth;
	private String com_cont;
	private Date com_date;
	private int com_secret;
	private int com_blind;
	private String com_targetId;
	
	
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getCom_parent() {
		return com_parent;
	}
	public void setCom_parent(int com_parent) {
		this.com_parent = com_parent;
	}
	public int getCom_depth() {
		return com_depth;
	}
	public void setCom_depth(int com_depth) {
		this.com_depth = com_depth;
	}
	public String getCom_cont() {
		return com_cont;
	}
	public void setCom_cont(String com_cont) {
		this.com_cont = com_cont;
	}
	public Date getCom_date() {
		return com_date;
	}
	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}
	public int getCom_secret() {
		return com_secret;
	}
	public void setCom_secret(int com_secret) {
		this.com_secret = com_secret;
	}
	public int getCom_blind() {
		return com_blind;
	}
	public void setCom_blind(int com_blind) {
		this.com_blind = com_blind;
	}
	public String getCom_targetId() {
		return com_targetId;
	}
	public void setCom_targetId(String com_targetId) {
		this.com_targetId = com_targetId;
	}
	
	
	
	

}
