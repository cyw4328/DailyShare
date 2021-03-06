package com.daily.share.dto;

import java.sql.Timestamp;

public class CywDTO {

	private int main_num;
	private String main_name;
	private int main_admin;
	private int main_blind;
	public int getMain_num() {
		return main_num;
	}
	public void setMain_num(int main_num) {
		this.main_num = main_num;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	public int getMain_admin() {
		return main_admin;
	}
	public void setMain_admin(int main_admin) {
		this.main_admin = main_admin;
	}
	public int getMain_blind() {
		return main_blind;
	}
	public void setMain_blind(int main_blind) {
		this.main_blind = main_blind;
	}
	
	private int mid_num;
	private String mid_name;
	private int mid_admin;
	private int mid_blind;
	public int getMid_num() {
		return mid_num;
	}
	public void setMid_num(int mid_num) {
		this.mid_num = mid_num;
	}
	public String getMid_name() {
		return mid_name;
	}
	public void setMid_name(String mid_name) {
		this.mid_name = mid_name;
	}
	public int getMid_admin() {
		return mid_admin;
	}
	public void setMid_admin(int mid_admin) {
		this.mid_admin = mid_admin;
	}
	public int getMid_blind() {
		return mid_blind;
	}
	public void setMid_blind(int mid_blind) {
		this.mid_blind = mid_blind;
	}
	
	private String mem_id;
   private String mem_pw;
   private String mem_name;
   private String mem_email;
   private String mem_phone;
   private int mem_admin;
   private String mem_url;
   private int mem_out;
   private int mem_san;
   private String mem_blog;
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
	public String getMem_blog() {
		return mem_blog;
	}
	public void setMem_blog(String mem_blog) {
		this.mem_blog = mem_blog;
	}
	
	private int menu_num;
	private String menu_name;
	private int menu_blind;
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_blind() {
		return menu_blind;
	}
	public void setMenu_blind(int menu_blind) {
		this.menu_blind = menu_blind;
	}
   
	private int board_num;
	private String board_subject;
	private String board_cont;
	private Timestamp board_date;
	private Timestamp board_updateDate;
	private int board_views;
	private int board_like;
	private int board_scope;
	private int board_bilnd;
	private String board_thumFileName;
	
	public String getBoard_thumFileName() {
		return board_thumFileName;
	}
	public void setBoard_thumFileName(String board_thumFileName) {
		this.board_thumFileName = board_thumFileName;
	}
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
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public Timestamp getBoard_updateDate() {
		return board_updateDate;
	}
	public void setBoard_updateDate(Timestamp board_updateDate) {
		this.board_updateDate = board_updateDate;
	}
	public int getBoard_views() {
		return board_views;
	}
	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_scope() {
		return board_scope;
	}
	public void setBoard_scope(int board_scope) {
		this.board_scope = board_scope;
	}
	public int getBoard_bilnd() {
		return board_bilnd;
	}
	public void setBoard_bilnd(int board_bilnd) {
		this.board_bilnd = board_bilnd;
	}
	

	private int sub_num;
	private String sub_id;
	public int getSub_num() {
		return sub_num;
	}
	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}
	public String getSub_id() {
		return sub_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	
	private int alarm_num;
	private Timestamp alarm_date;
	private int alarm_targetNum;
	private int alarm_target;
	public int getAlarm_num() {
		return alarm_num;
	}
	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}
	public Timestamp getAlarm_date() {
		return alarm_date;
	}
	public void setAlarm_date(Timestamp alarm_date) {
		this.alarm_date = alarm_date;
	}
	public int getAlarm_targetNum() {
		return alarm_targetNum;
	}
	public void setAlarm_targetNum(int alarm_targetNum) {
		this.alarm_targetNum = alarm_targetNum;
	}
	public int getAlarm_target() {
		return alarm_target;
	}
	public void setAlarm_target(int alarm_target) {
		this.alarm_target = alarm_target;
	}
	
	private int com_num;
	private int com_parent;
	private int com_depth;
	private String com_cont;
	private Timestamp com_date;
	private int com_secret;
	private int com_blind;
	private String com_targetId;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
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
	public Timestamp getCom_date() {
		return com_date;
	}
	public void setCom_date(Timestamp com_date) {
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
	
	
	private int dec_code;
	private String dec_cont;
	private int dec_blind;
	private String dec_name;
	public int getDec_code() {
		return dec_code;
	}
	public void setDec_code(int dec_code) {
		this.dec_code = dec_code;
	}
	public String getDec_cont() {
		return dec_cont;
	}
	public void setDec_cont(String dec_cont) {
		this.dec_cont = dec_cont;
	}
	public int getDec_blind() {
		return dec_blind;
	}
	public void setDec_blind(int dec_blind) {
		this.dec_blind = dec_blind;
	}
	public String getDec_name() {
		return dec_name;
	}
	public void setDec_name(String dec_name) {
		this.dec_name = dec_name;
	}
	
	
	
	
}
