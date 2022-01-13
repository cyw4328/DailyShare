package com.daily.share.controller;

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

import com.daily.share.service.HjwService;

@Controller

public class HjwController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired HjwService service;
	
	@RequestMapping(value = "/HomePage", method = RequestMethod.GET)
	public String HomePage(Model model) {
		logger.info("홈페이지 이동");

		return "HomePage";
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(Model model) {
		logger.info("로그인페이지 이동");

		return "login";
	}

	@RequestMapping(value = "/IdSearch", method = RequestMethod.GET)
	public String IdSearch(Model model) {
		logger.info("아이디찾기페이지 이동");

		return "IdSearch";
	}
	
	@RequestMapping(value = "/PwSearch", method = RequestMethod.GET)
	public String PwSearch(Model model) {
		logger.info("비밀번호찾기페이지 이동");

		return "PwSearch";
	}
	
	@RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
	public String JoinForm(Model model) {
		logger.info("회원가입페이지 이동");

		return "JoinForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String id,@RequestParam String pw,HttpSession session) {
		logger.info("로그인 요청");
		logger.info(id+"/"+pw);
		String page = "redirect:/";
		String loginId = service.login(id,pw);
		logger.info("로그인 한 아이디 여부 : "+loginId);
		if(loginId != null) {
			page =  "redirect:/HomePage";
			session.setAttribute("loginId", loginId);
		}
		return page;
	}
	
}
