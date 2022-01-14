package com.daily.share.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.daily.share.dto.CsjBoardDTO;
import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMenuDTO;

public interface CsjDAO {


	ArrayList<CsjCommentDTO> csj_com(int board_Num);

	void com_regist(CsjCommentDTO dto);

	void csj_com_parent(int com_num);

	void com_del(String com_num);

	void com_inAlarm(int com_num, int i, String mem_id);

	ArrayList<CsjMenuDTO> csj_menuCall();

	int com_update(String com_num, String com_content);

	void csj_postUpload(CsjBoardDTO dtoB);




}
