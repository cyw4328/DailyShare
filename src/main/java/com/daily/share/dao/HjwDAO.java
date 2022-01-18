package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.HjwDTO;

public interface HjwDAO {

	String login(String userId, String userPass);

	String IdS(String userName, String userPhone, String userEmail);

	String PwS(String userId, String userName, String userPhone, String userEmail);

	void PwC(String searchId, String userPass);

	ArrayList<HjwDTO> list();


}
