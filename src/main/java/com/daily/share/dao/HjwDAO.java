package com.daily.share.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.daily.share.dto.HjwDTO;
import com.daily.share.dto.ShjDTO;

public interface HjwDAO {

	String login(String userId, String userPass);

	String IdS(String userName, String userPhone, String userEmail);

	String PwS(String userId, String userName, String userPhone, String userEmail);

	void PwC(String searchId, String userPass);

	int allCount();

	Object MemberList(int pagePerCnt, int offset);

	List<HjwDTO> MemSearchList(HjwDTO hjwdto);



}
