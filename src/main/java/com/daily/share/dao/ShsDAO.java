package com.daily.share.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.daily.share.dto.ShsDTO;
import com.daily.share.dto.ShsFollowDTO;

public interface ShsDAO {

	String overlay(String id);

	int join(HashMap<String, String> params);

	ShsDTO memberDe(String id);

	void userUp(String id, String pw, String email, String phone);

	int memberOut(Object object);

	ArrayList<ShsFollowDTO> FollowerList(Object object);

	ArrayList<ShsFollowDTO> FollowingList(Object object);

	int followBtnShs(Object object);

	int followBtnShs(String mem_id, String sub_id);



	






}
