package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMembersDTO;
import com.daily.share.dto.CsjMenuDTO;
import com.daily.share.dto.CsjPersonalBlogDTO;

public interface CsjDAO {


	ArrayList<CsjCommentDTO> csj_com(int board_Num);

	void com_regist(CsjCommentDTO dto);

	void csj_com_parent(int com_num);

	void com_del(String com_num);

	void com_inAlarm(int com_num, int i, String mem_id);

	ArrayList<CsjMenuDTO> csj_menuCall(String mem_id);

	int com_update(String com_num, String com_content);

	void csj_postUpload(CsjPersonalBlogDTO dtoB);

	void csj_photoUpload(int board_num, String photo_oriName, String photo_newName);

	void csj_tagUpload(int board_num, String tag);

	ArrayList<String> searchSubId(String mem_id);

	ArrayList<CsjMembersDTO> testList();

	ArrayList<CsjPersonalBlogDTO> boardCall(String mem_id);

	void csj_thumbUpdate(int board_num, String photo_newName);




}
