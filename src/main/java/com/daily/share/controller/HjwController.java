package com.daily.share.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping(value = "/PSN", method = RequestMethod.GET)
	public String PSN(Model model) {
		logger.info("이메일 인증 요청");

		return "PSN";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String userId,@RequestParam String userPass,HttpSession session) {
		logger.info("로그인 요청");
		logger.info(userId+"/"+userPass);
		String page = "redirect:/";
		String loginId = service.login(userId,userPass);
		logger.info("로그인 한 아이디 여부 : "+loginId);
		if(loginId != null) {
			page =  "redirect:/HomePage";
			session.setAttribute("loginId", loginId);
		}
		return page;
	}
	
	@RequestMapping(value = "/IdS", method = RequestMethod.POST)
	public String IdS(Model model,@RequestParam String userName,@RequestParam String userPhone,@RequestParam String userEmail) {
		logger.info("아이디 찾기 요청");
		logger.info(userName+"/"+userPhone+"/"+userEmail);
		String msg ="입력하신 정보와 일치하는 아이디가 없습니다.";
		String title ="아이디 찾기";
		String IdS = service.IdS(userName,userPhone,userEmail);
		if(IdS != null) {
			msg ="입력하신 정보와 일치하는 아이디 정보 입니다.";
			model.addAttribute("IdS",IdS);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("title",title);
		return "Search";
	}
	
	@RequestMapping(value = "/PwS", method = RequestMethod.POST)
	public String PwS(Model model,@RequestParam String userId,@RequestParam String userName,@RequestParam String userPhone,@RequestParam String userEmail,HttpSession session) {
		logger.info("비밀번호 찾기 요청");
		logger.info(userId+"/"+userName+"/"+userPhone+"/"+userEmail);
		String msg ="입력하신 정보를 찾을 수 없습니다.";
		String title ="비밀번호 찾기";
		String PwS = service.PwS(userId,userName,userPhone,userEmail);
		if(PwS != null) {
			session.setAttribute("PwS", PwS);
			msg ="입력하신 정보와 일치하는 이메일에 인증번호를 전송 했습니다.";
			model.addAttribute("PwS",PwS);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("title",title);
		return "Search";
	}
	
	@RequestMapping(value="loginPage", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("로그인 페이지 이동");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "login";        
        
    }
	
}
