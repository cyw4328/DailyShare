package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CywDTO;

public interface CywDAO {

	int bigCategory(String text, int radiobutton);

	int middleCategory(String text, int radiobutton);

	String bigCategoryList();

}
