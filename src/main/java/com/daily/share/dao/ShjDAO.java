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

	void CancelBLike(int board_num);

	void updateBLike(int board_num);

	ArrayList<ShjDTO> adlist(int pagePerCnt, int offset);

	String AdRegist(String adminT);


	void AdRegistDW(String adminT);

	void AdRegistUP(String adminT);

	int adminCount();

	void AdRegistUP2(String adminT);

	void AdRegistDW2(String adminT);

	int checkAdmins(String adminT);

	int checkMembers(String adminT);
	
	


}
