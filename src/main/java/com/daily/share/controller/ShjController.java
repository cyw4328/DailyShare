package com.daily.share.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daily.share.service.CywService;
import com.daily.share.service.ProjectService;
import com.daily.share.service.ShjService;

@Controller

public class ShjController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShjService service;
	
	@RequestMapping(value = "/shj", method = RequestMethod.GET)
	public String home(Model model) {

		return "HomePage";
	}
	
}
