package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CsjCommentDTO;

public interface CsjDAO {

	int com_regist(String mem_id, int board_num, String com_cont, int com_secret);

	ArrayList<CsjCommentDTO> csj_com(int board_Num);




}
