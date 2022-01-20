package com.daily.share.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import com.daily.share.dto.CywDTO;
import com.daily.share.dto.HjwDTO;
import com.daily.share.dto.ShjDTO;
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
	
	@RequestMapping(value = "/PwChange", method = RequestMethod.GET)
	public String PwChange(Model model) {
		logger.info("비밀번호변경페이지 이동");

		return "PwChange";
	}
	@RequestMapping(value = "/PwC", method = RequestMethod.POST)
	public String PwC(Model model,@RequestParam String userPass,@RequestParam String userPassCheck, HttpSession session) {
		logger.info("비밀번호변경 요청");
		String userId = (String) session.getAttribute("searchId");
		String msg ="비밀번호가 변경되었습니다.<br/> 다시 로그인해 주세요.";
		String title ="비밀번호 찾기";	
		logger.info("재설정할 아이디 : {}",userId);
		service.PwC(userId,userPass);
		logger.info("비밀번호변경 완료 : {}",userPass);
		model.addAttribute("msg",msg);
		model.addAttribute("title",title);
		return "Search";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam String userId,@RequestParam String userPass,HttpSession session) {
		logger.info("로그인 요청");
		logger.info(userId+"/"+userPass);
		String msg ="아이디 또는 패스워드를 확인하세요";
		String page = "login";
		String loginId = service.login(userId,userPass);
		logger.info("로그인 한 아이디 여부 : "+loginId);
		if(loginId != null) {
			page =  "HomePage";
			session.setAttribute("loginId", loginId);
			msg =null;
		}
		model.addAttribute("msg",msg);
		return page;
	}
	
	@RequestMapping(value = "/IdS", method = RequestMethod.POST)
	public String IdS(Model model,@RequestParam String userName,@RequestParam String userPhone,@RequestParam String userEmail) {
		logger.info("아이디 찾기 요청");
		logger.info(userName+"/"+userPhone+"/"+userEmail);
		String msg ="입력하신 정보와 일치하는 아이디가 없습니다.";
		String title ="아이디 찾기";	
		String IdS = service.IdS(userName,userPhone,userEmail);
		String search =IdS;
		if(IdS != null) {
			msg ="입력하신 정보와 일치하는 아이디 정보 입니다.";
			model.addAttribute("IdS",IdS);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("title",title);
		model.addAttribute("search",search);
		return "Search";
	}
	
	@RequestMapping(value = "/PwS", method = RequestMethod.POST)
	public String PwS(Model model,@RequestParam String userId,@RequestParam String userName,@RequestParam String userPhone,@RequestParam String userEmail,HttpSession session) {
		logger.info("비밀번호 찾기 요청");
		logger.info(userId+"/"+userName+"/"+userPhone+"/"+userEmail);
		String msg ="입력하신 정보를 찾을 수 없습니다.";
		String title ="비밀번호 찾기";
		session.setAttribute("searchId", userId);
		logger.info((String) session.getAttribute("searchId"));
		String PwS = service.PwS(userId,userName,userPhone,userEmail);
		String search =PwS;
		if(PwS != null) {
			session.setAttribute("PwS", PwS);
			msg ="입력하신 정보와 일치하는 이메일에 인증번호를 전송 했습니다.";
			model.addAttribute("PwS",PwS);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("title",title);
		model.addAttribute("search",search);
		return "Search";
	}
	
	@RequestMapping(value="/loginPage", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("로그인 페이지 이동");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "login";        
        
    }
	
	@RequestMapping(value = "/managerPage", method = RequestMethod.GET)
	public String managerPage(Model model) {
		logger.info("관리자페이지 이동");
		return "manager";
	}
	
	//리스트 요청
		@ResponseBody
		@RequestMapping(value = "/memlist", method = RequestMethod.GET)
		public HashMap<String, Object> memlist(@RequestParam String page,@RequestParam String cnt) {	
		
			logger.info("리스트 요청 : {} 페이지, {} 개 씩",page, cnt);	
			HashMap<String, Object> map = new HashMap<String, Object>();	
			int currPage = Integer.parseInt(page);
			int pagePerCnt = Integer.parseInt(cnt);
			int offset = ((currPage-1) * pagePerCnt-1) >= 0  ? 
					((currPage-1) * pagePerCnt-1) : 0;		
			logger.info("offset : {}",offset);				
			int totalCount = service.allCount(); 
			int range = totalCount%pagePerCnt > 0 ? 
					 (totalCount/pagePerCnt)+1 : (totalCount/pagePerCnt);
			logger.info("총 갯수 : {}",totalCount);
			logger.info("만들 수 있는 총 페이지 : {}",range);
			map.put("pages",range);
			map.put("list", service.memlist(pagePerCnt, offset));
			return map;
		}
		
		//검색 기능
		@ResponseBody
		@RequestMapping(value = "/SearchList", method = RequestMethod.GET)
		private List<HjwDTO> SearchList (@RequestParam("SearchType") String SearchType, @RequestParam("keyword") String keyword) {
			
			HjwDTO hjwdto = new HjwDTO();
			hjwdto.setKeyword(keyword);
			hjwdto.setSearchType(SearchType);
			
			return service.SearchList(hjwdto);
		}
		
		/*
		
		@ResponseBody
		@RequestMapping(value = "/declist1", method = RequestMethod.GET)
		public HashMap<String, Object> declist1(@RequestParam String page,@RequestParam String cnt) {	
		
			logger.info("리스트 요청 : {} 페이지, {} 개 씩",page, cnt);	
			HashMap<String, Object> map = new HashMap<String, Object>();	
			int currPage = Integer.parseInt(page);
			int pagePerCnt = Integer.parseInt(cnt);
			int offset = ((currPage-1) * pagePerCnt-1) >= 0  ? 
					((currPage-1) * pagePerCnt-1) : 0;		
			logger.info("offset : {}",offset);				
			int totalCount = service.allCount(); 
			int range = totalCount%pagePerCnt > 0 ? 
					 (totalCount/pagePerCnt)+1 : (totalCount/pagePerCnt);
			logger.info("총 갯수 : {}",totalCount);
			logger.info("만들 수 있는 총 페이지 : {}",range);
			map.put("pages",range);
			map.put("list", service.declist1(pagePerCnt, offset));
			return map;
		}
		
		@ResponseBody
		@RequestMapping(value = "/SearchList1", method = RequestMethod.GET)
		private List<HjwDTO> SearchList1 (@RequestParam("SearchType") String SearchType, @RequestParam("keyword") String keyword) {
			
			HjwDTO hjwdto = new HjwDTO();
			hjwdto.setKeyword(keyword);
			hjwdto.setSearchType(SearchType);
			
			return service.SearchList1(hjwdto);
		}
		*/
}
	
