package com.daily.share.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
//		logger.info("리스트 요청 : {} 페이지, {} 개 씩",page, cnt);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);		
		return service.list(currPage,pagePerCnt);
	}
	
	//검색 기능
	@ResponseBody
	@RequestMapping(value = "/getSearchList", method = RequestMethod.GET)
	private List<ShjDTO> getSearchList (@RequestParam("SearchType") String SearchType, @RequestParam("keyword") String keyword) {
		
		ShjDTO shjdto = new ShjDTO();
		shjdto.setKeyword(keyword);
		shjdto.setSearchType(SearchType);
		
		return service.getSearchList(shjdto);
	}
	
	//추천
	//session.setAttribute 는 세션 아이디를 지정해주기 위해서 설정.
	//실제로 할때는 뺄것.
	@ResponseBody
	@RequestMapping(value = "/updateLike", method = RequestMethod.GET)
	public HashMap<String, Object> updateLike (@RequestParam int board_num, HttpSession session) {
		/* session.setAttribute("loginId", "admin"); */
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			String loginId = (String) session.getAttribute("loginId");
//			logger.info("번호 : "+ board_num + ", sessionID : "+loginId);
			
			int LikeCheck = service.LikeCheck(board_num, loginId);
//			logger.info(loginId+":"+LikeCheck);
			
			if (LikeCheck == 1) {
				service.deleteLike(board_num, loginId);
				service.CancelBLike(board_num);
			}else {
				service.insertLike(board_num, loginId);
				service.updateBLike(board_num);
			}
			map.put("LikeCheck", LikeCheck);
//			logger.info("LikeCheck : "+LikeCheck);

			
			
			
				
		return map;
	}
	
	
	//관리자 등록
	@RequestMapping(value = "/AdRegist", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> adRegist(Model model, @RequestParam String adminT) {
		HashMap<String, Object> map = new HashMap<String, Object>();
//		logger.info("값 확인 : "+adminT);
		//멤버 테이블에서 회원 존재 확인
		int checkMembers = service.checkMembers(adminT);
		map.put("checkMembers", checkMembers);
		if (checkMembers>0) {
			//관리자 테이블에서 여부 확인
			int checkAdmins = service.checkAdmins(adminT);
			map.put("AdminsResult", checkAdmins);
			if ((int)checkAdmins == 0) {
				//service.AdRegist(adminT);
//				logger.info("관리자 등록 : {}",checkAdmins);
				service.AdRegistUP(adminT);
			}else if((int)checkAdmins == 1) {
//				logger.info("이미 관리자 : {}",checkAdmins);
			}
		}else {
//			logger.info("존재하지 않는 아이디 : {}",checkMembers);	
		}
		
		
		return map;
	}
	
	//관리자 등록 해제
	@RequestMapping(value = "/AdRegistDW", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> AdRegistDW(Model model, @RequestParam String adminT) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int checkAdmins = service.checkAdmins(adminT);
		map.put("checkAdmins", checkAdmins);
//		logger.info("값 확인 : "+adminT);
		if (checkAdmins>0) {
//		service.AdRegist(adminT);
//			logger.info("관리자 삭제 : {}",checkAdmins);
			service.AdRegistDW(adminT);
		}else {
//			logger.info("관리자가 아님: {}",checkAdmins);
		}
		
		return map;
	}
	
	
	@RequestMapping(value = "/shjadmin", method = RequestMethod.GET)
	public String shjadmin(Model model) {

		return "Shjadmin";
	}

	//관리자 리스트 요청
	@ResponseBody
	@RequestMapping(value = "/adlist", method = RequestMethod.GET)
	public HashMap<String, Object> adlist(@RequestParam String page,@RequestParam String cnt) {				
//		logger.info("리스트 요청 : {} 페이지, {} 개 씩",page, cnt);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);		
		return service.adlist(currPage,pagePerCnt);
	}
	
}
