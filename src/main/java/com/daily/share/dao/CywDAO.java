package com.daily.share.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import com.daily.share.dto.CywDTO;

public interface CywDAO {

	void bigCategoryAdd(String mainCategoryAdd, int mainAdminadmin);

	ArrayList<CywDTO> bigCategoryList();

	int bigCateFk(String main_num);

	void bigCategoryDel(String main_num);

	void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin);

	ArrayList<CywDTO> midCategoyrList();

	int midCateFk(String mid_num);

	void midCategoryDel(String mid_num);

	void menuAdd(String menuAdd, int daeCategory, int midCategory, String id);

	ArrayList<CywDTO> menuList();

	int menuCateFk(String menu_num);

	void menuDel(String menu_num);

	










}
