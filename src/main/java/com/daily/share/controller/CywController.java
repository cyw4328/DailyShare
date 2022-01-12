package com.daily.share.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daily.share.dto.CywDTO;
import com.daily.share.service.CywService;
import com.daily.share.service.ProjectService;

@Controller

public class CywController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CywService service;
	
	@RequestMapping(value = "/cyw", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("카테고리");
		

		return "category";
	}
	
	@RequestMapping(value = "/bigCategoryAdd", method = RequestMethod.POST)
	public String bigCategoryAdd(Model model, @RequestParam String text, @RequestParam int radiobutton) {
		logger.info("컨트롤러 도착 대분류"+text+radiobutton);
		
		service.bigCategoryAdd(text,radiobutton);
		
		return "category";
	}
	
	@RequestMapping(value = "/middleCategoryAdd", method = RequestMethod.POST)
	public String middleCategoryAdd(Model model, @RequestParam String text, @RequestParam int radiobutton) {
		logger.info("컨트롤러 도착 중분류"+text+radiobutton);
		
		service.middleCategory(text,radiobutton);
		
		return "category";
	}
	
	@RequestMapping(value = "/bigCategorySearch", method = RequestMethod.POST)
	public String bigCategorySearch(Model model) {
		logger.info("컨트롤러 도착 대분류 찾기");
		
		String bigCategoryList = service.bigCategoryList();
		model.addAttribute("bigCategoryList",bigCategoryList);
		
		return "category";
	}
	
	
}
