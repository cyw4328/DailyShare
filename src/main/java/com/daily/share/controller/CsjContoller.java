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

import com.daily.share.dto.CsjBoardDTO;
import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMembersDTO;
import com.daily.share.dto.CsjMenuDTO;
import com.daily.share.dto.CsjPersonalBlogDTO;
import com.daily.share.dto.CsjPhotoDTO;
import com.daily.share.dto.CsjSubDTO;
import com.daily.share.dto.CywDTO;
import com.daily.share.service.CsjService;

@Controller

public class CsjContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjService service;
	
	
	//댓글 파트
	@RequestMapping(value = "/csj_com", method = RequestMethod.GET)
	public String csj_com(Model model, HttpSession session) {
		//session.setAttribute("loginId", "admin");
		model.addAttribute("loginId",session.getAttribute("loginId"));
		int board_Num = 14; //게시글 번호 받아와 주세요
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
		String mem_id = params.get("mem_id");
		return "redirect:/csj_detail?board_num="+params.get("board_num")+"&mem_id="+mem_id;
	}
	
	@RequestMapping(value = "/csj_com_del", method = RequestMethod.GET)
	public String csj_com_del(Model model, @RequestParam String com_num,@RequestParam String board_num,@RequestParam String mem_id) {
		logger.info("삭제 요청 : {}", com_num);
		service.com_del(com_num);
		return "redirect:/csj_detail?board_num="+board_num+"&mem_id="+mem_id;
	}
	
	
	@RequestMapping(value = "/csj_com_update", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> com_update(@RequestParam String com_content,@RequestParam String com_num) {
		logger.info("댓글 수정 요청 : {} / {}",com_num,com_content);
		return service.com_update(com_num,com_content);
	}
	
	
	
	
	//게시글 작성 파트
	@RequestMapping(value = "/csj_write", method = RequestMethod.GET)
	public String csj_write(Model model, HttpSession session){
		session.setAttribute("loginId", "admin");
		return "csjWrite";
	}
	
	//게시글 작성 폼 이동
	@RequestMapping(value = "/csj_writeForm", method = RequestMethod.GET)
	public String csj_writeForm(Model model,HttpSession session) {
		logger.info("글작성 요청");
		String loginId = (String) session.getAttribute("loginId");
		model.addAttribute("mem_id",loginId);
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
	@RequestMapping(value = "/csj_memList", method = RequestMethod.GET)
	public String csj_memList(Model model,HttpSession session) {
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
		
		String mem_blog =service.blogName(mem_id);
		logger.info("블로그 이름 요청 {}",mem_blog);
		model.addAttribute("mem_blog",mem_blog);
		
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		logger.info("메뉴 리스트만 요청 : {}",menu);
		model.addAttribute("menu",menu);
		
		
		
		ArrayList<CsjPersonalBlogDTO> boardList = service.boardCall(mem_id);
		logger.info("헤드라인용 블로그 게시글/메뉴/사진 요청 : {}", boardList);
		model.addAttribute("boardList",boardList);
		
		return "csjBlogMain";
	}
	
	
	
	@RequestMapping(value = "/csj_pagingList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_pagingList(@RequestParam String page,@RequestParam String cnt, @RequestParam String mem_id) {
		logger.info("리스트 요청 : {}페이지, {}개 씩",page,cnt);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		return service.csj_pagingList(currPage,pagePerCnt,mem_id);
	}
	
	
		//메뉴 글리스트 이동 요청
	@RequestMapping(value = "/csj_menuMain", method = RequestMethod.GET)
	public String csj_menuMain(Model model,HttpSession session,@RequestParam String mem_id,@RequestParam String menu_num) {
		logger.info("메뉴 이동 요청 : {}/{}",mem_id,menu_num);
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("menu_num",menu_num);
		
		String mem_blog =service.blogName(mem_id);
		logger.info("블로그 이름 요청 {}",mem_blog);
		model.addAttribute("mem_blog",mem_blog);
		
		
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		logger.info("메뉴 리스트만 요청 : {}",menu);
		model.addAttribute("menu",menu);
		
		ArrayList<CsjPersonalBlogDTO> boardList = service.boardCall(mem_id);
		logger.info("메뉴글리스트용 블로그 게시글/메뉴/사진 요청 : {}", boardList);
		model.addAttribute("boardList",boardList);

		return "csjMenuMain";
		}
		
		
	@RequestMapping(value = "/csj_pagingListMenu", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_pagingListMenu(@RequestParam String page,@RequestParam String cnt, @RequestParam String mem_id, @RequestParam String menu_num) {
		logger.info("리스트 요청 : {}페이지, {}개 씩",page,cnt);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		return service.csj_pagingListMenu(currPage,pagePerCnt,mem_id,menu_num);
		}

	
	@RequestMapping(value = "/csj_detail", method = RequestMethod.GET)
	public String csj_detail(Model model,HttpSession session,@RequestParam String board_num,@RequestParam String mem_id) {
		/* session.setAttribute("loginId", "admin"); */
		model.addAttribute("mem_id",mem_id);
		logger.info("상세보기 요청 : {}",board_num);
		
		
		String mem_blog =service.blogName(mem_id);
		logger.info("블로그 이름 요청 {}",mem_blog);
		model.addAttribute("mem_blog",mem_blog);
		
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		logger.info("메뉴 리스트만 요청 : {}",menu);
		model.addAttribute("menu",menu);
		
		//게시글 요청
		CsjPersonalBlogDTO boardDetail =service.csj_detail(board_num);
		logger.info("불러온 게시글 내용 : {}",boardDetail);
		model.addAttribute("boardDetail",boardDetail);
		
		//태그 요청
		ArrayList<String>tags = service.tagCall(board_num);
		logger.info("불러온 태그 사이즈 : {}",tags.size());
		model.addAttribute("tags",tags);
		
		
		String loginId= (String) session.getAttribute("loginId");
		logger.info("상세보기 로그인 된 아이디 : {}",loginId);
		model.addAttribute("loginId",loginId);
		
		//사진 요청
		ArrayList<CsjPhotoDTO> photos = service.photoCall(board_num);
		logger.info("가져온 사진 : {}",photos.size());
		model.addAttribute("photos",photos);
		
		
		//댓글 요청
		int board_Num = Integer.parseInt(board_num);
		ArrayList<CsjCommentDTO> comList = service.csj_com(board_Num);
		logger.info("댓글 목록 요청 : {}",comList);
		model.addAttribute("comList",comList);
		
		
		return "csjboardDetail";
	}
		
	
	//게시글 수정csj_writeUpdate
	@RequestMapping(value = "/csj_UpdateForm", method = RequestMethod.GET)
	public String csj_writeUpdate(Model model,HttpSession session,@RequestParam String board_num) {
		/* session.setAttribute("loginId", "admin"); */
		String loginId= (String) session.getAttribute("loginId");
		logger.info("상세보기 로그인 된 아이디 : {}",loginId);
		model.addAttribute("mem_id",loginId);
		logger.info("수정 요청 : {}",board_num);
		model.addAttribute("board_num",board_num);
		
		
		String mem_blog =service.blogName(loginId);
		logger.info("블로그 이름 요청 {}",mem_blog);
		model.addAttribute("mem_blog",mem_blog);
	
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(loginId);
		logger.info("메뉴 리스트만 요청 : {}",menu);
		model.addAttribute("menu",menu);
		
		//게시글 요청
		CsjPersonalBlogDTO boardDetail =service.csj_detail(board_num);
		logger.info("불러온 게시글 내용 : {}",boardDetail);
		model.addAttribute("boardDetail",boardDetail);
		
		//태그 요청
		ArrayList<String>tags = service.tagCall(board_num);
		logger.info("불러온 태그 사이즈 : {}",tags.size());
		model.addAttribute("tags",tags);
		
		
	
		
		//사진 요청
		ArrayList<CsjPhotoDTO> photos = service.photoCall(board_num);
		logger.info("가져온 사진 : {}",photos.size());
		model.addAttribute("photos",photos);
		
		
		
		
		
		return "csjWriteUpdate";
	}
	
	
	@RequestMapping(value = "/csj_tagCall", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_tagCall(@RequestParam String board_num) {
		logger.info("태그 요청 :{}",board_num);
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<String>tags = service.tagCall(board_num);
		logger.info("불러온 태그 사이즈 : {}",tags.size());
		map.put("tags", tags);
		
		return map;
	}
	
	
	@RequestMapping(value = "/csj_tagDel", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_tagDel(@RequestParam String tag_content,@RequestParam String board_num) {
		logger.info("태그 삭제 요청 :{}/{}",tag_content,board_num);
		
		return service.csj_tagDel(tag_content,board_num);
	}
	
	
	//게시글 업데이트 요청
		@RequestMapping(value = "/csj_postUpdate", method = RequestMethod.POST)
		public String csj_postUpdate(Model model,@RequestParam HashMap<String, String> params,MultipartFile[] photos,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			logger.info("게시글 수정 요청 : {},{}",params,photos);
			logger.info("로그인 된 아이디 : {}",loginId);
			
			
			return service.csj_postUpdate(params,loginId,photos);
		}
	
	
	/*
	 * //나를 구독중인 아이디 목록 불러오기
	 * 
	 * @RequestMapping(value = "/csj_subtest", method = RequestMethod.GET) public
	 * String csj_subtest(Model model,HttpSession session) {
	 * session.setAttribute("loginId", "test03"); String loginId=(String)
	 * session.getAttribute("loginId"); ArrayList<CsjSubDTO> subList=
	 * service.csjSubList(loginId); model.addAttribute("subList",subList);
	 * model.addAttribute("loginId",loginId); return "csjsubtest"; }
	 * 
	 * //구독 여부 확인
	 * 
	 * @RequestMapping(value = "/csjSubCall", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public HashMap<String, Object> csjSubCall(Model
	 * model,HttpSession session,@RequestParam String sub_id) { String mem_id =
	 * (String) session.getAttribute("loginId"); return
	 * service.csjSubCall(mem_id,sub_id); }
	 */
	
	
	
	
	
}
