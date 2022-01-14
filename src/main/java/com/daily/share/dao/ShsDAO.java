package com.daily.share.dao;

import java.util.HashMap;

import com.daily.share.dto.ShsDTO;

public interface ShsDAO {

	String overlay(String id);

	int join(HashMap<String, String> params);

	ShsDTO memberDe(String id);

	void userUp(String id, String pw, String email, String phone);

	int memberOut(Object object);

	






}
