package com.daily.share.dto;

import java.util.Date;

public class CsjBoardDTO {
	
	private int board_num;
	private String board_subject;
	private String board_cont;
	private Date board_date;
	private Date board_updateDate;
	private int board_views;
	private int board_likes;
	private int board_scope;
	private int board_blind;
	private String mem_id;
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_cont() {
		return board_cont;
	}
	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public Date getBoard_updateDate() {
		return board_updateDate;
	}
	public void setBoard_updateDate(Date board_updateDate) {
		this.board_updateDate = board_updateDate;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getBoard_likes() {
		return board_likes;
	}
	public void setBoard_likes(int board_likes) {
		this.board_likes = board_likes;
	}
	public int getBoard_scope() {
		return board_scope;
	}
	public void setBoard_scope(int board_scope) {
		this.board_scope = board_scope;
	}
	public int getBoard_blind() {
		return board_blind;
	}
	public void setBoard_blind(int board_blind) {
		this.board_blind = board_blind;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


}
