package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMenuDTO;

public interface CsjDAO {


	ArrayList<CsjCommentDTO> csj_com(int board_Num);

	void com_regist(CsjCommentDTO dto);

	void csj_com_parent(int com_num);

	void com_del(String com_num);

	void com_inAlarm(int com_num, int i, String mem_id);

	ArrayList<CsjMenuDTO> csj_menuCall();




}
