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
import org.springframework.web.multipart.MultipartFile;

import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMembersDTO;
import com.daily.share.dto.CsjMenuDTO;
import com.daily.share.dto.CsjPersonalBlogDTO;
import com.daily.share.service.CsjService;

@Controller

public class CsjContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjService service;
	
	
	//댓글 파트
	@RequestMapping(value = "/csj_com", method = RequestMethod.GET)
	public String csj_com(Model model, HttpSession session) {
		session.setAttribute("loginId", "admin");
		model.addAttribute("loginId",session.getAttribute("loginId"));
		int board_Num = 14;
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
	
	
	@RequestMapping(value = "/csj_com_update", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> com_update(@RequestParam String com_content,@RequestParam String com_num) {
		logger.info("댓글 수정 요청 : {} / {}",com_num,com_content);
		return service.com_update(com_num,com_content);
	}
	
	
	
	
	//게시글 작성 파트
	@RequestMapping(value = "/csj_write", method = RequestMethod.GET)
	public String csj(Model model){
		return "csjWrite";
	}
	
	//게시글 작성 폼 이동
	@RequestMapping(value = "/csj_writeForm", method = RequestMethod.GET)
	public String csj_writeForm(Model model,HttpSession session) {
		logger.info("글작성 요청");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("loginId",loginId);
		ArrayList<CsjMenuDTO> menuDTO =service.csj_menuCall(loginId);
		logger.info("가져온 메뉴 : {}",menuDTO);
		model.addAttribute("menu", menuDTO);
		
		return "csjWriteForm";
	}
	
	//게시글 업로드 요청
	@RequestMapping(value = "/csj_postUpload", method = RequestMethod.POST)
	public String csj_postUpload(Model model,@RequestParam HashMap<String, String> params,MultipartFile[] photos,HttpSession session) {
		String loginId= (String) session.getAttribute("loginId");
		logger.info("포스트 요청 : {},{}",params,photos);
		logger.info("로그인 된 아이디 : {}",loginId);
		return service.csj_postUpload(params,loginId,photos);
	}
	
	
	//회원 리스트 불러오기
	@RequestMapping(value = "/csj", method = RequestMethod.GET)
	public String csj(Model model,HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		ArrayList<CsjMembersDTO> memberList= service.testList();
		model.addAttribute("memberList",memberList);
		model.addAttribute("loginId",loginId);
		return "csjtestlist";
	}
	
	
	//블로그 메인 이동 요청
	@RequestMapping(value = "/csj_blogMain", method = RequestMethod.GET)
	public String csj_blogMain(Model model,HttpSession session,@RequestParam String mem_id) {
		logger.info("블로그 메인 이동 요청 : {}",mem_id);
		model.addAttribute("mem_id",mem_id);
			
		ArrayList<CsjPersonalBlogDTO> boardList = service.boardCall(mem_id);
		logger.info("해당 블로그 게시글/메뉴/사진 요청 : {}", boardList);
		model.addAttribute("boardList",boardList);
		for (CsjPersonalBlogDTO list : boardList) {
			logger.info(list.getBoard_subject());
		}
		
		return "csjBlogMain";
	}
	
	
	
	
	
}
