package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CsjCommentDTO;

public interface CsjDAO {


	ArrayList<CsjCommentDTO> csj_com(int board_Num);

	void com_regist(CsjCommentDTO dto);

	void csj_com_parent(int com_num);




}
