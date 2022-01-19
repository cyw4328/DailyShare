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

import com.daily.share.dto.CywDTO;
import com.daily.share.service.CywService;

@Controller

public class CywController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	CywService service;

	@RequestMapping(value = "/cyw", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("카테고리");
		ArrayList<CywDTO> bigCategoryList = service.bigCategoryList();	
		model.addAttribute("bigCategoryList",bigCategoryList);
		ArrayList<CywDTO> midCategoryList = service.midCategoyrList();
		model.addAttribute("midCategoyrList",midCategoryList);
		
		 ArrayList<CywDTO> menuList = service.menuList(null);
		 model.addAttribute("menuList",menuList);
		

		return "cateGory";
	}

	
	
	@RequestMapping(value = "/bigCategoryAdd", method = RequestMethod.POST)
	public String bigCategoryAdd(Model model, @RequestParam String mainCategoryAdd, @RequestParam int mainAdmin) {
		logger.info("컨트롤러 도착 대분류" + mainCategoryAdd, mainAdmin);

		service.bigCategoryAdd(mainCategoryAdd, mainAdmin);

		return "redirect:/cyw";
	}
	
	@RequestMapping(value = "/bigCategoryDel", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> bigCategoryDel(Model model,@RequestParam String main_num) {
		logger.info("삭제요청 : {}",main_num); 
						
	
		return service.bigCateFk(main_num);
	}


	
	 @RequestMapping(value = "/middleCategoryAdd", method = RequestMethod.POST)
	 public String middleCategoryAdd(Model model, @RequestParam String middleCategoryAdd,  @RequestParam int daeCategory,
			@RequestParam int middle_admin) {
	 logger.info("컨트롤러 도착 중분류"+middleCategoryAdd+daeCategory+middle_admin);
	 
	 service.middleCategoryAdd(middleCategoryAdd,daeCategory,middle_admin);
	 
	 return "redirect:/cyw"; 
	 }
	 
	@RequestMapping(value = "/midCategoryDel", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> midCategoryDel(Model model,@RequestParam String mid_num) {
		logger.info("삭제요청 : {}",mid_num); 
							
	
		return service.midCateFk(mid_num);
	}
	@RequestMapping(value = "/menuAddPage", method = RequestMethod.GET)
	public String menuAddPage(Model model,HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");

		 ArrayList<CywDTO> bigCategoryList = service.bigCategoryList();	
			model.addAttribute("bigCategoryList",bigCategoryList);
			ArrayList<CywDTO> midCategoryList = service.midCategoyrList();
			model.addAttribute("midCategoyrList",midCategoryList);
			ArrayList<CywDTO> menuList = service.menuList(loginId);
			model.addAttribute("menuList",menuList);

		return "MenuAdd";
	}

	 @RequestMapping(value = "/menuAdd", method = RequestMethod.GET)
	 public String menuAdd(Model model, @RequestParam String menuAddName,@RequestParam int daeCategoryMenu, 
			 @RequestParam int midCategoryMenu,HttpSession session) {
	 logger.info("컨트롤러 도착 메뉴생성"+menuAddName,daeCategoryMenu,midCategoryMenu);
	 String id = (String) session.getAttribute("loginId");
	 logger.info("메뉴생성세션아이디:{}",id);
	 service.menuAdd(menuAddName,daeCategoryMenu,midCategoryMenu,id);
	 
	 return "redirect:/menuAddPage"; 
	 }
	 
	@RequestMapping(value = "/menuDel", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> menuDel(Model model,@RequestParam String menu_num) {
		logger.info("삭제요청 : {}",menu_num); 
							
	
		return service.menuFk(menu_num);
	}
		
	
	@RequestMapping(value = "/midCategoryCall", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> midCategoryCall(Model model,@RequestParam String selectValue) {
		logger.info("리스트호출 : {}",selectValue); 
							
	
		return service.midCategoryCall(selectValue);
	}	
	
	@RequestMapping(value = "/middleListCall", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> middleListCall(Model model,@RequestParam String middleListCall) {
		logger.info("리스트호출 : {}",middleListCall); 
							
	
		return service.middleListCall(middleListCall);
	}	
		
	// 게시물 자세히 보기
	 @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	 public String boardDetail(Model model, @RequestParam int board_num) {
		 
		 CywDTO dto = service.boardDetail(board_num,"detail");
		 model.addAttribute("boardDetail",dto);
		 
		 
	 return "boardDetail"; 
	 }
	
	 @RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	 public String updateForm(Model model, @RequestParam int board_num) {
		 
		 CywDTO dto = service.boardDetail(board_num,"update");
		 model.addAttribute("boardDetail",dto);
		 
	 return "updateForm"; 
	 }
	 
	// 게시글수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Model model, @RequestParam HashMap<String, String> params) {
		logger.info("update 요청:{}",params);
		service.update(params);
		return "redirect:/boardDetail?board_num="+params.get("board_num");
	}
	
	
	 @RequestMapping(value = "/boardDel", method = RequestMethod.GET)
	 public String boardDel(Model model, @RequestParam int board_num) {
		 
		 service.boardDel(board_num);

	 return "redirect:/"; 
	 }
	 
	 
	 
	 // 포럼페이지 이동
	 @RequestMapping(value = "/ForumBoard", method = RequestMethod.GET)
	 public String ForumBoard(Model model) {

	 return "ForumPage"; 
	 }
	 
	 // 포럼페이지 리스트 출력 (페이징)
	 @RequestMapping(value = "/forumBoardList", method = RequestMethod.POST)
	 @ResponseBody
	 public HashMap<String, Object> ForumBoardList(Model model,@RequestParam String page,@RequestParam String cnt) {
		 
		 int currPage = Integer.parseInt(page);
		 int pagePerCnt = Integer.parseInt(cnt);
		 
	 return service.ForumBoardList(currPage,pagePerCnt);
	 }
	 
	 
	 
	 
	 //포럼 해당 게시글 작성

	 @RequestMapping(value = "/ForumBoardAdd", method = RequestMethod.POST)
	 public String ForumBoardAdd(Model model, @RequestParam String ForumSub,@RequestParam String ForumCont
			 ,int MenuForum,HttpSession session, MultipartFile uploadFile) {
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
		 if (loginId != null) {
			 service.ForumBoardAdd(ForumSub,ForumCont,MenuForum,loginId);			
		}
		 
	 return "ForumPage"; 
	 }
	 
	 // 포럼페이지 검색기능
	 @RequestMapping(value = "/ForumSearch", method = RequestMethod.POST)
	 public String ForumSearch(Model model, @RequestParam String ForumSearch,  @RequestParam String SearchScope) {
		 logger.info("컨트롤러 도착 중분류"+ForumSearch+SearchScope);
	 
	 		ArrayList<CywDTO> dto = service.ForumSearch(ForumSearch,SearchScope);			
	 		model.addAttribute("list",dto);
	 		
	 return "ForumSearchPage"; 
	 }
	 
	 
	 // 피드페이지 이동
	 @RequestMapping(value = "/FeedPage", method = RequestMethod.GET)
	 public String FeedPage(Model model,HttpSession session) {
		 
		 String loginId = (String) session.getAttribute("loginId");
		 ArrayList<CywDTO> dto = service.FeedPageListCall(loginId);
		 logger.info("구독자가져왔니?:{}",dto);
		 model.addAttribute("subsBoard",dto);
		 
		 //구독자 수 알아오기
		 int subCont = service.subCount(loginId);
		 model.addAttribute("subCont",subCont);
		 
	 return "FeedPage"; 
	 }
	 
	 // 피드페이지 리스트 불러오기
		
		 @RequestMapping(value = "/feedListCall", method = RequestMethod.POST)
		 
		 @ResponseBody public HashMap<String, Object> feedListCall(Model model,@RequestParam String page,@RequestParam String cnt,HttpSession session){
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
		 int currPage = Integer.parseInt(page); 
		 int pagePerCnt =Integer.parseInt(cnt);
		 
		 return service.feedListCall(currPage,pagePerCnt,loginId); 
		 }
		 
		 
		 // 마이페이지 알림 페이지 이동
		 @RequestMapping(value = "/MyAlrimPage", method = RequestMethod.GET)
		 public String MyAlrimPage(Model model,HttpSession session) {
			 
			 String page = "MyPageAlram";
			 
			 String loginId = (String) session.getAttribute("loginId");
			 if (loginId == null) {
				 page ="redirect:/";
			}

		 return page; 
		 }
		 
		 

		 //마이페이지 알림 리스트
		 @RequestMapping(value = "/AlrimPageList", method = RequestMethod.POST)
		 
		 @ResponseBody public HashMap<String, Object> AlrimPageList(Model model,HttpSession session,@RequestParam String page,@RequestParam String cnt){
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
			int currPage = Integer.parseInt(page);
			int pagePerCnt = Integer.parseInt(cnt);

		 
		 return service.AlrimPageList(loginId,currPage,pagePerCnt); 
		 }
		 
		 
		 // 마이페이지 내 댓글리스트 이동
		 @RequestMapping(value = "/MyReviewControlPage", method = RequestMethod.GET)
		 public String MyReviewControlPage(Model model,HttpSession session) {
			 
			 String page = "reviewControl";
			 
			 String loginId = (String) session.getAttribute("loginId");
			 if (loginId == null) {
				 page ="redirect:/";
			}

		 return page; 
		 }
		 
		 
		 // 마이페이지 내가 쓴 댓글 관리
		 @RequestMapping(value = "/reviewList", method = RequestMethod.POST)
		 
		 @ResponseBody public HashMap<String, Object> reviewList(Model model,@RequestParam String page,@RequestParam String cnt,HttpSession session){
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
		 int currPage = Integer.parseInt(page); 
		 int pagePerCnt =Integer.parseInt(cnt);
		 
		 return service.reviewList(currPage,pagePerCnt,loginId); 
		 }
		 
		 // 마이페이지 내글리스트 이동
		 @RequestMapping(value = "/MyBoardControlPage", method = RequestMethod.GET)
		 public String MyBoardControlPage(Model model,HttpSession session) {
			 
			 String page = "MyBoardControl";
			 
			 String loginId = (String) session.getAttribute("loginId");
			 if (loginId == null) {
				 page ="redirect:/";
			}

		 return page; 
		 }
		 
		 
		 // 마이페이지 내가 쓴 댓글 관리
		 @RequestMapping(value = "/boardList", method = RequestMethod.POST)
		 
		 @ResponseBody public HashMap<String, Object> boardList(Model model,@RequestParam String page,@RequestParam String cnt,HttpSession session){
		 
		 String loginId = (String) session.getAttribute("loginId");
		 
		 int currPage = Integer.parseInt(page); 
		 int pagePerCnt =Integer.parseInt(cnt);
		 
		 return service.boardList(currPage,pagePerCnt,loginId); 
		 }
		 

	 
}
