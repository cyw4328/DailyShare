package com.daily.share.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daily.share.dto.ShjDTO;
import com.daily.share.service.CywService;
import com.daily.share.service.ProjectService;
import com.daily.share.service.ShjService;

@Controller

public class ShjController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShjService service;
	
	@RequestMapping(value = "/shj", method = RequestMethod.GET)
	public String home(Model model) {

		return "memList";
	}
	
	
	
	//리스트 요청
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public HashMap<String, Object> list(@RequestParam String page,@RequestParam String cnt) {				
		logger.info("리스트 요청 : {} 페이지, {} 개 씩",page, cnt);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);		
		return service.list(currPage,pagePerCnt);
	}
	
	//검색 기능
	@RequestMapping(value = "/searchList", method = RequestMethod.GET)
	public String search_mem(Model model) {

		return "memList";
	}
	
}
