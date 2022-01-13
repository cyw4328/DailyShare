package com.daily.share.dao;

import java.util.ArrayList;

import com.daily.share.dto.CywDTO;

public interface CywDAO {

	void bigCategoryAdd(String mainCategoryAdd, int mainAdminadmin);

	ArrayList<CywDTO> bigCategoryList();

	void bigCategoryDel(int bigCategory);



	ArrayList<CywDTO> midCategoyrList();


	void midCategoryDel(int midCategory);

	void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin);

	void menuAdd(String menuAdd, int daeCategory, int midCategory);

	ArrayList<CywDTO> menuList();

	void menuDel(int menu);




}
