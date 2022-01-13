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

import com.daily.share.service.CywService;

@Controller

public class CywController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	CywService service;

	@RequestMapping(value = "/cyw", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("카테고리");
		ArrayList<String> bigCategoryList = service.bigCategoryList();	
		model.addAttribute("bigCategoryList",bigCategoryList);
		ArrayList<String> midCategoryList = service.midCategoyrList();
		model.addAttribute("midCategoyrList",midCategoryList);
		
		return "cateGory";
	}

	@RequestMapping(value = "/bigCategoryAdd", method = RequestMethod.POST)
	public String bigCategoryAdd(Model model, @RequestParam String mainCategoryAdd, @RequestParam int admin) {
		logger.info("컨트롤러 도착 대분류" + mainCategoryAdd, admin);

		service.bigCategoryAdd(mainCategoryAdd, admin);

		return "redirect:/cyw";
	}
	
	@RequestMapping(value = "/bigCategoryDel", method = RequestMethod.GET)
	public String bigCategoryDel(Model model, HttpSession session, @RequestParam String bigCategory) {
		logger.info("삭제요청 : {}",bigCategory); 
		
		service.bigCategoryDel(bigCategory);
		

			
		return "redirect:/cyw";
	}


	
	 @RequestMapping(value = "/middleCategoryAdd", method = RequestMethod.POST)
	 public String middleCategoryAdd(Model model, @RequestParam String middleCategoryAdd, 
			@RequestParam int admin) {
	 logger.info("컨트롤러 도착 중분류"+middleCategoryAdd+admin);
	 
	 service.middleCategoryAdd(middleCategoryAdd,admin);
	 
	 return "redirect:/cyw"; 
	 }
	 
	@RequestMapping(value = "/midCategoryDel", method = RequestMethod.GET)
	public String midCategoryDel(Model model, HttpSession session, @RequestParam String midCategory) {
		logger.info("삭제요청 : {}",midCategory); 
		
		service.midCategoryDel(midCategory);
		
		return "redirect:/cyw";
	}
	 

	 

}
