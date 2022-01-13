package com.daily.share.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;

@Service
public class CywService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CywDAO dao;
	
	public void bigCategoryAdd(String mainCategoryAdd,int admin) {
		
		logger.info("서비스 :{}",mainCategoryAdd,admin);
		
		dao.bigCategoryAdd(mainCategoryAdd,admin);
		
	}

	public ArrayList<String> bigCategoryList() {
		
		ArrayList<String> mainCategory = dao.bigCategoryList();
		logger.info("서비스 값?:{}",mainCategory);
		
		return mainCategory;
	}

	public void bigCategoryDel(String bigCategory) {
		
		dao.bigCategoryDel(bigCategory);
		
	}


	public void middleCategoryAdd(String middleCategoryAdd, int admin) {
		
		dao.middleCategoryAdd(middleCategoryAdd,admin);
		
	}

	public ArrayList<String> midCategoyrList() {
		
		ArrayList<String> midCategory = dao.midCategoyrList();
		
		return midCategory;
	}

	public void midCategoryDel(String midCategory) {
		
		dao.midCategoryDel(midCategory);
		
	}
	

	
	
}
