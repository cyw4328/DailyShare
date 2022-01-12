package com.daily.share.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daily.share.service.CywService;
import com.daily.share.service.ProjectService;

@Controller

public class CywController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CywService service;
	
	@RequestMapping(value = "/bigCategoryAdd", method = RequestMethod.POST)
	public String home(Model model, @RequestParam String text) {
		logger.info("컨트롤러 도착"+text);
		
		service.bigCategoryAdd(text);
		
		return "Alarm";
	}
	
}
