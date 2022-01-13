package com.daily.share.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.service.CsjService;

@Controller

public class CsjContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjService service;
	
	@RequestMapping(value = "/csj_com", method = RequestMethod.GET)
	public String csj_com(Model model) {
		int board_Num = 1;
		ArrayList<CsjCommentDTO> comList = service.csj_com(board_Num);
		logger.info("댓글 목록 요청 : {}",comList);
		model.addAttribute("comList",comList);
		return "comment";
	}
	
	
	@RequestMapping(value = "/csj_com_regist", method = RequestMethod.POST)
	public String csj_com_regist(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		session.setAttribute("loginId", "test");
		logger.info("댓글 등록 요청 : {} / {}", session,params);
		service.com_regist(session,params);
		return "redirect:/csj_com";
	}
	
	
	
	
	
	
}
