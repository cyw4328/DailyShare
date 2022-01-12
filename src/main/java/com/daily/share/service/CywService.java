package com.daily.share.service;

import java.util.ArrayList;

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
	
	public void bigCategoryAdd(String text, int radiobutton) {
		logger.info(text,radiobutton);
		
		dao.bigCategory(text,radiobutton);
		
	}

	public void middleCategory(String text, int radiobutton) {
		logger.info(text,radiobutton);
		
		dao.middleCategory(text,radiobutton);
		
	}

	public String bigCategoryList() {
		
		String bigCategoryList = null;
		
		bigCategoryList = dao.bigCategoryList();
		
		logger.info("대분류리스트:{}",bigCategoryList);
		
		return bigCategoryList;
	}
	
	
}
