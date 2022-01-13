package com.daily.share.dao;

import java.util.ArrayList;

public interface CywDAO {

	void bigCategoryAdd(String mainCategoryAdd, int admin);

	ArrayList<String> bigCategoryList();

	void bigCategoryDel(String bigCategory);



	ArrayList<String> midCategoyrList();

	void middleCategoryAdd(String middleCategoryAdd, int admin);

	void midCategoryDel(String midCategory);




}
