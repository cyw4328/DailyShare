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
import com.daily.share.service.ShjService;

@Controller

public class CsjContoller {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjService service;
	@Autowired ShjService shjService;
	
	
	//댓글 파트
	@RequestMapping(value = "/csj_com", method = RequestMethod.GET)
	public String csj_com(Model model, HttpSession session) {
		//session.setAttribute("loginId", "admin");
		model.addAttribute("loginId",session.getAttribute("loginId"));
		int board_Num = 14; //게시글 번호 받아와 주세요
		ArrayList<CsjCommentDTO> comList = service.csj_com(board_Num);
		/* logger.info("댓글 목록 요청 : {}",comList); */
		model.addAttribute("comList",comList);
		return "comment";
	}
	
	
	@RequestMapping(value = "/csj_com_regist", method = RequestMethod.POST)
	public String csj_com_regist(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		/* session.setAttribute("loginId", "test"); */
		/* logger.info("댓글 등록 요청 : {} / {}", session,params); */
		service.com_regist(session,params);
		String com_boardId = params.get("com_boardId");
		return "redirect:/csj_detail?board_num="+params.get("board_num")+"&mem_id="+com_boardId;
	}
	
	@RequestMapping(value = "/csj_com_del", method = RequestMethod.GET)
	public String csj_com_del(Model model, @RequestParam String com_num,@RequestParam String board_num,@RequestParam String mem_id) {
		/* logger.info("삭제 요청 : {}", com_num); */
		service.com_del(com_num);
		return "redirect:/csj_detail?board_num="+board_num+"&mem_id="+mem_id;
	}
	
	
	@RequestMapping(value = "/csj_com_update", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> com_update(@RequestParam String com_content,@RequestParam String com_num) {
		/* logger.info("댓글 수정 요청 : {} / {}",com_num,com_content); */
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
		/* logger.info("글작성 요청"); */
		String page ="redirect:/MainPageShs";
		String loginId = (String) session.getAttribute("loginId");
			if (loginId != null) {
				page ="csjWriteForm";
				model.addAttribute("mem_id",loginId);
				ArrayList<CsjMenuDTO> menuDTO =service.csj_menuCall(loginId);
				/* logger.info("가져온 메뉴 : {}",menuDTO); */
				model.addAttribute("menu", menuDTO);
			}
			String mem_blog =service.blogName(loginId);
			/* logger.info("블로그 이름 요청 {}",mem_blog); */
			model.addAttribute("mem_blog",mem_blog);
		return page;
	}
	
	//게시글 업로드 요청
	@RequestMapping(value = "/csj_postUpload", method = RequestMethod.POST)
	public String csj_postUpload(Model model,@RequestParam HashMap<String, String> params,MultipartFile[] photos,HttpSession session) {
		String loginId= (String) session.getAttribute("loginId");
		/* logger.info("포스트 요청 : {},{}",params,photos); */
		/* logger.info("로그인 된 아이디 : {}",loginId); */
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
		String loginId = (String) session.getAttribute("loginId");
		
		/* logger.info("블로그 메인 이동 요청 : {}",mem_id); */
		model.addAttribute("mem_id",mem_id);
		
		String mem_blog =service.blogName(mem_id);
		/* logger.info("블로그 이름 요청 {}",mem_blog); */
		model.addAttribute("mem_blog",mem_blog);
		
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		/* logger.info("메뉴 리스트만 요청 : {}",menu); */
		model.addAttribute("menu",menu);
		
		//구독 정보 불러오기
		int subResult = service.subCall(loginId,mem_id);
		/* logger.info("구독 중 : {}",subResult); */
		model.addAttribute("subResult",subResult);
		
		
		ArrayList<CsjPersonalBlogDTO> boardList = service.boardCall(mem_id);
		/* logger.info("헤드라인용 블로그 게시글/메뉴/사진 요청 : {}", boardList); */
		model.addAttribute("boardList",boardList);
		
		return "csjBlogMain";
	}
	
	
	
	@RequestMapping(value = "/csj_pagingList", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_pagingList(@RequestParam String page,@RequestParam String cnt, @RequestParam String mem_id) {
		/* logger.info("리스트 요청 : {}페이지, {}개 씩",page,cnt); */
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		return service.csj_pagingList(currPage,pagePerCnt,mem_id);
	}
	
	
		//메뉴 글리스트 이동 요청
	@RequestMapping(value = "/csj_menuMain", method = RequestMethod.GET)
	public String csj_menuMain(Model model,HttpSession session,@RequestParam String mem_id,@RequestParam String menu_num) {
		/* logger.info("메뉴 이동 요청 : {}/{}",mem_id,menu_num); */
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("menu_num",menu_num);
		
		String mem_blog =service.blogName(mem_id);
		/* logger.info("블로그 이름 요청 {}",mem_blog); */
		model.addAttribute("mem_blog",mem_blog);
		
		
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		/* logger.info("메뉴 리스트만 요청 : {}",menu); */
		model.addAttribute("menu",menu);
		
		ArrayList<CsjPersonalBlogDTO> boardList = service.boardCall(mem_id);
		/* logger.info("메뉴글리스트용 블로그 게시글/메뉴/사진 요청 : {}", boardList); */
		model.addAttribute("boardList",boardList);

		return "csjMenuMain";
		}
		
		
	@RequestMapping(value = "/csj_pagingListMenu", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_pagingListMenu(@RequestParam String page,@RequestParam String cnt, @RequestParam String mem_id, @RequestParam String menu_num) {
		/* logger.info("리스트 요청 : {}페이지, {}개 씩",page,cnt); */
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		return service.csj_pagingListMenu(currPage,pagePerCnt,mem_id,menu_num);
		}

	
	@RequestMapping(value = "/csj_detail", method = RequestMethod.GET)
	public String csj_detail(Model model,HttpSession session,@RequestParam String board_num,@RequestParam String mem_id) {
		/* session.setAttribute("loginId", "admin"); */
		
		//게시글 작성자 아이디
		model.addAttribute("mem_id",mem_id);
		/* logger.info("상세보기 요청 : {}",board_num); */
		
		//게시글 작성자의 블로그
		String mem_blog =service.blogName(mem_id);
		/* logger.info("블로그 이름 요청 {}",mem_blog); */
		model.addAttribute("mem_blog",mem_blog);
		
		//게시글 작성자의 메뉴
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(mem_id);
		/* logger.info("메뉴 리스트만 요청 : {}",menu); */
		model.addAttribute("menu",menu);
		
		//게시글 요청
		CsjPersonalBlogDTO boardDetail =service.csj_detail(board_num);
		/* logger.info("불러온 게시글 내용 : {}",boardDetail); */
		model.addAttribute("boardDetail",boardDetail);
		
		//태그 요청
		ArrayList<String>tags = service.tagCall(board_num);
		/* logger.info("불러온 태그 사이즈 : {}",tags.size()); */
		model.addAttribute("tags",tags);
		
		
		//로그인된 아이디
		String loginId= (String) session.getAttribute("loginId");
		/* logger.info("상세보기 로그인 된 아이디 : {}",loginId); */
		model.addAttribute("loginId",loginId);
		
		//로그인된 아이디의 메뉴
		ArrayList<CsjMenuDTO>myMenu = service.csj_menuCall(loginId);
		/* logger.info("나의메뉴 리스트만 요청 : {}",myMenu); */
		model.addAttribute("myMenu",myMenu);
		
		//사진 요청
		ArrayList<CsjPhotoDTO> photos = service.photoCall(board_num);
		/* logger.info("가져온 사진 : {}",photos.size()); */
		model.addAttribute("photos",photos);
		
		
		//댓글 요청
		int board_Num = Integer.parseInt(board_num);
		ArrayList<CsjCommentDTO> comList = service.csj_com(board_Num);
		/* logger.info("댓글 목록 요청 : {}",comList); */
		model.addAttribute("comList",comList);
		
		//좋아요 여부 확인 요청
		int LikeCheck = shjService.LikeCheck(board_Num, loginId);
		/* logger.info("좋아요 여부 확인 요청 : {}",LikeCheck); */
		model.addAttribute("LikeCheck",LikeCheck);
		
		//좋아요 수 요청
		int likeNum = service.csj_likenum(board_Num);
		/* logger.info("좋아요 수 요청 : {}",likeNum); */
		model.addAttribute("likeNum",likeNum);
		
		
		//구독 정보 불러오기
		int subResult = service.subCall(loginId,mem_id);
		/* logger.info("구독 중 : {}",subResult); */
		model.addAttribute("subResult",subResult);
		
		return "csjboardDetail";
	}
		
	
	//게시글 수정csj_writeUpdate
	@RequestMapping(value = "/csj_UpdateForm", method = RequestMethod.GET)
	public String csj_writeUpdate(Model model,HttpSession session,@RequestParam String board_num) {
		/* session.setAttribute("loginId", "admin"); */
		String loginId= (String) session.getAttribute("loginId");
		/* logger.info("상세보기 로그인 된 아이디 : {}",loginId); */
		model.addAttribute("mem_id",loginId);
		/* logger.info("수정 요청 : {}",board_num); */
		model.addAttribute("board_num",board_num);
		
		
		String mem_blog =service.blogName(loginId);
		/* logger.info("블로그 이름 요청 {}",mem_blog); */
		model.addAttribute("mem_blog",mem_blog);
	
		ArrayList<CsjMenuDTO>menu = service.csj_menuCall(loginId);
		/* logger.info("메뉴 리스트만 요청 : {}",menu); */
		model.addAttribute("menu",menu);
		
		//게시글 요청
		CsjPersonalBlogDTO boardDetail =service.csj_detail(board_num);
		/* logger.info("불러온 게시글 내용 : {}",boardDetail); */
		model.addAttribute("boardDetail",boardDetail);
		
		//태그 요청
		ArrayList<String>tags = service.tagCall(board_num);
		/* logger.info("불러온 태그 사이즈 : {}",tags.size()); */
		model.addAttribute("tags",tags);
		
		
	
		
		//사진 요청
		ArrayList<CsjPhotoDTO> photos = service.photoCall(board_num);
		/* logger.info("가져온 사진 : {}",photos.size()); */
		model.addAttribute("photos",photos);
		
		
		
		
		
		return "csjWriteUpdate";
	}
	
	
	@RequestMapping(value = "/csj_tagCall", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_tagCall(@RequestParam String board_num) {
		/* logger.info("태그 요청 :{}",board_num); */
		HashMap<String, Object> map=new HashMap<String, Object>();
		ArrayList<String>tags = service.tagCall(board_num);
		/* logger.info("불러온 태그 사이즈 : {}",tags.size()); */
		map.put("tags", tags);
		
		return map;
	}
	
	
	@RequestMapping(value = "/csj_tagDel", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> csj_tagDel(@RequestParam String tag_content,@RequestParam String board_num) {
		/* logger.info("태그 삭제 요청 :{}/{}",tag_content,board_num); */
		
		return service.csj_tagDel(tag_content,board_num);
	}
	
	
	//게시글 업데이트 요청
		@RequestMapping(value = "/csj_postUpdate", method = RequestMethod.POST)
		public String csj_postUpdate(Model model,@RequestParam HashMap<String, String> params,MultipartFile[] photos,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			/* logger.info("게시글 수정 요청 : {},{}",params,photos); */
			/* logger.info("로그인 된 아이디 : {}",loginId); */
			
			
			return service.csj_postUpdate(params,loginId,photos);
		}
		
		//공유하기
		@RequestMapping(value = "/csj_share", method = RequestMethod.GET)
		public String csj_share(Model model,@RequestParam String menu_num,@RequestParam String board_num,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			
			/* logger.info("게시글 공유 요청 : 메뉴{}/게시글{}",menu_num,board_num); */
			/* logger.info("로그인 된 아이디 : {}",loginId); */
			
			
			
			return service.csj_share(menu_num,board_num,loginId);
		}
		
		//신고된내용 불러오기
		@RequestMapping(value = "/csj_singoCont", method = RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> csj_singoCont(@RequestParam String dec_target,@RequestParam String dec_targetNum,@RequestParam String dec_name) {
			/* logger.info("신고된 내용 요청 :{}/{}",dec_target,dec_targetNum); */
			return service.csj_singoCont(dec_target,dec_targetNum,dec_name);
		}
		
		//신고항목 미사용 처리
		@RequestMapping(value = "/csj_decDel", method = RequestMethod.GET)
		public String csj_decDel(Model model,@RequestParam String dec_code,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			
			/* logger.info("신고항목 미사용 처리 : {}",dec_code); */
			/* logger.info("로그인 된 아이디 : {}",loginId); */
			service.csj_decDel(dec_code);

			return "redirect:/decPage3";
		}
		
		//신고항목 내용 수정
		@RequestMapping(value = "/csj_decUpdate", method = RequestMethod.GET)
		public String csj_decUpdate(Model model,@RequestParam String dec_code,@RequestParam String dec_name,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			
			/* logger.info("신고항목 수정 요청 : {}/{}",dec_code,dec_name); */
			/* logger.info("로그인 된 아이디 : {}",loginId); */
			service.csj_decUpdate(dec_name,dec_code);

			return "redirect:/decPage3";
		}
		
		//신고 처리
		@RequestMapping(value = "/csj_resolRegist", method = RequestMethod.GET)
		public String csj_resolRegist(Model model,@RequestParam String sol_state,@RequestParam String dec_num,HttpSession session) {
			String loginId= (String) session.getAttribute("loginId");
			/* logger.info("로그인 된 아이디 : {}",loginId); */
			String sol_admin = loginId;
			/* logger.info("신고항목 처리 요청 : {}/{}",sol_state,dec_num); */
			service.csj_resolRegist(sol_state,dec_num,sol_admin);

			return "redirect:/decPage2";
		}
		
		
		//처리된 신고
		@ResponseBody
		@RequestMapping(value = "/csj_declist2", method = RequestMethod.GET)
		public HashMap<String, Object> csj_declist2(@RequestParam String page,@RequestParam String cnt) {	
		
			/* logger.info("신고리스트 요청 : {} 페이지, {} 개 씩",page, cnt); */
			HashMap<String, Object> map = new HashMap<String, Object>();	
			int currPage = Integer.parseInt(page);
			int pagePerCnt = Integer.parseInt(cnt);
			int offset = ((currPage-1) * pagePerCnt-1) >= 0  ? 
					((currPage-1) * pagePerCnt-1) : 0;		
			/* logger.info("offset : {}",offset); */
			int totalCount = service.csj_declist2Count(); 
			int range = totalCount%pagePerCnt > 0 ? 
					 (totalCount/pagePerCnt)+1 : (totalCount/pagePerCnt);
			/* logger.info("총 갯수 : {}",totalCount); */
			/* logger.info("만들 수 있는 총 페이지 : {}",range); */
			map.put("pages",range);
			map.put("list", service.csj_declist2(pagePerCnt, offset));
			return map;
		}
		
		//구독 요청 
		@RequestMapping(value = "/csj_inSub", method = RequestMethod.GET)
		public String csj_inSub(Model model,@RequestParam String sub_id,@RequestParam String mem_id,HttpSession session) {
			/* logger.info("구독 요청 : 구독당하는{}/구독하는{}",sub_id,mem_id); */
			service.csj_inSub(sub_id,mem_id);
			
			return "redirect:/csj_blogMain?mem_id="+sub_id;
		}
		//구독 요청 
		@RequestMapping(value = "/csj_delSub", method = RequestMethod.GET)
		public String csj_delSub(Model model,@RequestParam String sub_id,@RequestParam String mem_id,HttpSession session) {
			/* logger.info("구독 요청 : 구독당하는{}/구독하는{}",sub_id,mem_id); */
			service.csj_delSub(sub_id,mem_id);
			
			return "redirect:/csj_blogMain?mem_id="+sub_id;
		}
	
	
	
	
	
	
	
}
