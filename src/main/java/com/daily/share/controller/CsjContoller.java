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
import org.springframework.web.bind.annotation.ResponseBody;

import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMenuDTO;
import com.daily.share.service.CsjService;

@Controller

public class CsjContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjService service;
	
	@RequestMapping(value = "/csj_com", method = RequestMethod.GET)
	public String csj_com(Model model, HttpSession session) {
		session.setAttribute("loginId", "admin");
		model.addAttribute("loginId",session.getAttribute("loginId"));
		int board_Num = 1;
		ArrayList<CsjCommentDTO> comList = service.csj_com(board_Num);
		logger.info("댓글 목록 요청 : {}",comList);
		model.addAttribute("comList",comList);
		return "comment";
	}
	
	
	@RequestMapping(value = "/csj_com_regist", method = RequestMethod.POST)
	public String csj_com_regist(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		/* session.setAttribute("loginId", "test"); */
		logger.info("댓글 등록 요청 : {} / {}", session,params);
		service.com_regist(session,params);
		return "redirect:/csj_com";
	}
	
	@RequestMapping(value = "/csj_com_del", method = RequestMethod.GET)
	public String csj_com_del(Model model, @RequestParam String com_num) {
		logger.info("삭제 요청 : {}", com_num);
		service.com_del(com_num);
		return "redirect:/csj_com";
	}
	
	
	@RequestMapping(value = "/csj", method = RequestMethod.GET)
	public String csj(Model model) {
		return "csjWrite";
	}
	
	@RequestMapping(value = "/csj_writeForm", method = RequestMethod.GET)
	public String csj_write(Model model) {
		logger.info("글작성 요청");
		ArrayList<CsjMenuDTO> menuDTO =service.csj_menuCall();
		logger.info("가져온 메뉴 : {}",menuDTO);
		model.addAttribute("menu", menuDTO);
		return "csjWriteForm";
	}
	
	
	@RequestMapping(value = "/csj_com_update", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> com_update(@RequestParam String com_content,@RequestParam String com_num) {
		logger.info("댓글 수정 요청 : {} / {}",com_num,com_content);
		return service.com_update(com_num,com_content);
	}
	
	
	
	
	
}
