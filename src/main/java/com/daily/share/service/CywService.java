package com.daily.share.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dto.CywDTO;

@Service
public class CywService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CywDAO dao;
	
	public void bigCategoryAdd(String mainCategoryAdd,int mainAdminadmin) {
		
		logger.info("서비스 :{}",mainCategoryAdd,mainAdminadmin);
		
		dao.bigCategoryAdd(mainCategoryAdd,mainAdminadmin);
		
	}

	public ArrayList<CywDTO> bigCategoryList() {
		
		ArrayList<CywDTO> mainCategory = dao.bigCategoryList();
		logger.info("서비스 값?:{}",mainCategory);
		
		return mainCategory;
	}

	public void bigCategoryDel(int bigCategory) {
		
		dao.bigCategoryDel(bigCategory);
		
	}




	public ArrayList<CywDTO> midCategoyrList() {
		
		ArrayList<CywDTO> midCategory = dao.midCategoyrList();
		
		return midCategory;
	}

	public void midCategoryDel(int midCategory) {
		
		dao.midCategoryDel(midCategory);
		
	}

	public void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin) {
		
		dao.middleCategoryAdd(middleCategoryAdd,daeCategory,middle_admin);
	}

	public void menuAdd(String menuAdd, int daeCategory, int midCategory) {
		
		dao.menuAdd(menuAdd,daeCategory,midCategory);
		
	}

	public ArrayList<CywDTO> menuList() {
		
		ArrayList<CywDTO> menuList = dao.menuList();
		return menuList;
		
	}

	public void menuDel(int menu) {
		
		dao.menuDel(menu);
		
	}






	
	
}
