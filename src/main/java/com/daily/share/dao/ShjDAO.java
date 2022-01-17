package com.daily.share.dao;

import java.util.ArrayList;
import java.util.List;

import com.daily.share.dto.ShjDTO;

public interface ShjDAO {

	ArrayList<ShjDTO> list(int pagePerCnt, int offset);

	int allCount();

	List<ShjDTO> getSearchList(ShjDTO shjdto);

	int LikeCheck(int board_num, String mem_id);

	void deleteLike(int board_num, String mem_id);

	void insertLike(int board_num, String mem_id);
	
	


}
