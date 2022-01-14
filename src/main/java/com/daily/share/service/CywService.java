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


	public ArrayList<CywDTO> midCategoyrList() {
		
		ArrayList<CywDTO> midCategory = dao.midCategoyrList();
		
		return midCategory;
	}


	public void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin) {
		
		dao.middleCategoryAdd(middleCategoryAdd,daeCategory,middle_admin);
	}
	

	public void menuAdd(String menuAddName, int daeCategoryMenu, int midCategoryMenu, String id) {
		
		dao.menuAdd(menuAddName,daeCategoryMenu,midCategoryMenu,id);
		
	}

	public ArrayList<CywDTO> menuList() {
		
		ArrayList<CywDTO> menuList = dao.menuList();
		return menuList;
		
	}


	public HashMap<String, Object> bigCateFk(String main_num) {
		
		logger.info("서비스삭제요청값:{}",main_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= dao.bigCateFk(main_num);
		logger.info("일치하는 메뉴 수 : {}",row);
		
		if (row == 0) {
			//삭제다오
			dao.bigCategoryDel(main_num);
		}
		map.put("row", row);
		
		return map;
		
	}

	public HashMap<String, Object> midCateFk(String mid_num) {
		logger.info("서비스삭제요청값:{}",mid_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= dao.midCateFk(mid_num);
		logger.info("일치하는 메뉴 수 : {}",row);
		
		if (row == 0) {
			//삭제다오
			dao.midCategoryDel(mid_num);
		}
		map.put("row", row);
		
		return map;
	}

	public HashMap<String, Object> menuFk(String menu_num) {
		logger.info("서비스삭제요청값:{}",menu_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row= dao.menuCateFk(menu_num);
		logger.info("일치하는 메뉴 수 : {}",row);
		
		if (row == 0) {
			//삭제다오
			dao.menuDel(menu_num);
		}
		map.put("row", row);
		
		return map;
	}

	
	
	
	public HashMap<String, Object> midCategoryCall(String selectValue) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<CywDTO> list = dao.midCategoryCall(selectValue);
		map.put("list", list);
		
		return map;
	}






	
	
}
