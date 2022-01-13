package com.daily.share.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daily.share.service.ProjectService;

@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProjectService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("홈페이지 이동");

<<<<<<< HEAD
<<<<<<< HEAD
		return "HomePage";
=======
		return "homePage";
>>>>>>> dcfc58e259fe34041569407206be6de3cab0cd0d
=======

		return "HomePage";

>>>>>>> 414baa6a7117704460a0ba44c90dae09a98eb522
	}
	
}
