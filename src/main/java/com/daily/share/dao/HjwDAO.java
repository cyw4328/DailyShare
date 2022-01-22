package com.daily.share.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.daily.share.dto.CsjDecDTO;
import com.daily.share.dto.HjwDTO;

public interface HjwDAO {

	String login(String userId, String userPass);

	String IdS(String userName, String userPhone, String userEmail);

	String PwS(String userId, String userName, String userPhone, String userEmail);

	void PwC(String searchId, String userPass);

	ArrayList<HjwDTO> list();

	ArrayList<HjwDTO> memlist(int currPage, int pagePerCnt);

	int allCount();

	List<HjwDTO> SearchList(HjwDTO hjwdto);

	ArrayList<CsjDecDTO> declist1(int currPage, int pagePerCnt);

	List<HjwDTO> SearchList1(HjwDTO hjwdto);

	int allCount1();

	ArrayList<HjwDTO> declist3();

	int enr_decM(HashMap<String, String> params);

	int decupdate(HashMap<String, String> params);

	int adminCk(String loginId);

	/* 구글 */
	String snsLogin(String snsId);
	
	void snsIdInsert(String snsId, String snsName, String snsEmail);
	/*// 구글 */

}
