package com.daily.share.dao;

import java.util.HashMap;

public interface ShsDAO {

	String overlay(String id);

	int join(HashMap<String, String> params);

}
