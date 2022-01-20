package com.daily.share.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dto.CywDTO;

@Service
public class CywService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	CywDAO dao;

	public void bigCategoryAdd(String mainCategoryAdd, int mainAdminadmin) {

		logger.info("서비스 :{}", mainCategoryAdd, mainAdminadmin);

		dao.bigCategoryAdd(mainCategoryAdd, mainAdminadmin);

	}

	public ArrayList<CywDTO> bigCategoryList() {

		ArrayList<CywDTO> mainCategory = dao.bigCategoryList();
		logger.info("서비스 값?:{}", mainCategory);

		return mainCategory;
	}

	public ArrayList<CywDTO> midCategoyrList() {

		ArrayList<CywDTO> midCategory = dao.midCategoyrList();

		return midCategory;
	}

	public void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin) {

		dao.middleCategoryAdd(middleCategoryAdd, daeCategory, middle_admin);
	}

	public void menuAdd(String menuAddName, int daeCategoryMenu, int midCategoryMenu, String id) {

		dao.menuAdd(menuAddName, daeCategoryMenu, midCategoryMenu, id);

	}

	public ArrayList<CywDTO> menuList(String loginId) {

		ArrayList<CywDTO> menuList = dao.menuList(loginId);
		return menuList;

	}

	public HashMap<String, Object> bigCateFk(String main_num) {

		logger.info("서비스삭제요청값:{}", main_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.bigCateFk(main_num);
		logger.info("일치하는 메뉴 수 : {}", row);

		if (row == 0) {
			// 삭제다오
			dao.bigCategoryDel(main_num);
		}
		map.put("row", row);

		return map;

	}

	public HashMap<String, Object> midCateFk(String mid_num) {
		logger.info("서비스삭제요청값:{}", mid_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.midCateFk(mid_num);
		logger.info("일치하는 메뉴 수 : {}", row);

		if (row == 0) {
			// 삭제다오
			dao.midCategoryDel(mid_num);
		}
		map.put("row", row);

		return map;
	}

	public HashMap<String, Object> menuFk(String menu_num) {
		logger.info("서비스삭제요청값:{}", menu_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.menuCateFk(menu_num);
		logger.info("일치하는 메뉴 수 : {}", row);

		if (row == 0) {
			// 삭제다오
			dao.menuDel(menu_num);
		}
		map.put("row", row);

		return map;
	}

	public HashMap<String, Object> midCategoryCall(String selectValue) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.midCategoryCall(selectValue);
		map.put("list", list);

		return map;
	}

	public HashMap<String, Object> middleListCall(String MainNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.middleListCall(MainNum);
		map.put("list", list);

		return map;
	}

	public CywDTO boardDetail(int board_num, String method) {

		if (method.equals("detail")) {
			dao.upHit(board_num);
		}

		return dao.boardDetail(board_num);
	}

	public CywDTO updateForm(int board_num) {

		return dao.boardDetail(board_num);
	}

	public void boardDel(int board_num) {

		dao.boardDel(board_num);

	}

	public void update(HashMap<String, String> params) {

		dao.update(params);

	}

	public void ForumBoardAdd(String forumSub, String forumCont, int menuForum, String loginId) {

		dao.ForumBoardAdd(forumSub, forumCont, menuForum, loginId);

	}

	public HashMap<String, Object> ForumBoardList(int currPage, int pagePerCnt) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		int offset = ((currPage - 1) * pagePerCnt - 1) >= 0 ? ((currPage - 1) * pagePerCnt - 1) : 0;
		int end = 0;

		ArrayList<CywDTO> list = dao.ForumBoardList(pagePerCnt, offset);

		map.put("list", list);

		return map;
	}

	public ArrayList<CywDTO> ForumSearch(String forumSearch, String searchScope) {
		ArrayList<CywDTO> dto = dao.ForumSearch(forumSearch, searchScope);
		logger.info("서치?:{}", dto);
		return dto;
	}


	// 구독자있는지 확인
	public ArrayList<CywDTO> FeedPageListCall(String loginId) {

	




		return dao.FeedPageListCall(loginId);

	}

	// 구독자수 알아오기
	public int subCount(String loginId) {

		return dao.subCount(loginId);
	}

	
	public HashMap<String, Object> feedListCall(int currPage, int pagePerCnt, String loginId){ 
		
		HashMap<String, Object> map = new HashMap<String,Object>();
	 
	 //어디서부터 보여줘야 하는가? 
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; logger.info("offset:{}",offset);
	 
	 int totalCount = dao.allCount(loginId); // bbs 테이블의 모든 글의 갯수 // 만들 수 있는 총 페이지의 수(전체 갯수 / 보여줄 갯수) 
	 int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	 
	 logger.info("총 갯수 : {}",totalCount); logger.info("만들수 있는 총 페이지 :{}",range);
	 
	 map.put("pages", range); map.put("list",dao.feedListCall(pagePerCnt,offset,loginId));
	 
	 return map; }

	


	public HashMap<String, Object> AlrimPageList(String loginId, int currPage, int pagePerCnt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//어디서부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; 
		logger.info("offset:{}",offset);
		
		int totalCount = dao.allCountAlrim(loginId); // bbs 테이블의 모든 글의 갯수
		// 만들 수 있는 총 페이지의 수(전체 갯수 / 보여줄 갯수)
		int range = totalCount%pagePerCnt > 0 ?  (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		
		logger.info("총 갯수 : {}",totalCount);
		logger.info("만들수 있는 총 페이지 :{}",range);
		map.put("loginId", loginId);
		map.put("pages", range);
		map.put("list", dao.AlrimPageList(loginId,pagePerCnt,offset));
		
		
		return map;
	}

	public HashMap<String, Object> reviewList(int currPage, int pagePerCnt, String loginId) {
		
	HashMap<String, Object> map = new HashMap<String,Object>();
		 
	 //어디서부터 보여줘야 하는가? 
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; logger.info("offset:{}",offset);
	 
	 int totalCount = dao.allCountReview(loginId); // bbs 테이블의 모든 글의 갯수 // 만들 수 있는 총 페이지의 수(전체 갯수 / 보여줄 갯수) 
	 int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
	 
	 logger.info("총 갯수 : {}",totalCount); logger.info("만들수 있는 총 페이지 :{}",range);
	 
	 map.put("pages", range); 
	 map.put("list",dao.reviewList(pagePerCnt,offset,loginId));
	 map.put("totalCount", totalCount);
	 return map; 
	}

	
	public HashMap<String, Object> boardList(int currPage, int pagePerCnt, String loginId) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		 
		 //어디서부터 보여줘야 하는가? 
			int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; logger.info("offset:{}",offset);
		 
		 int totalCount = dao.allCountBoard(loginId); // bbs 테이블의 모든 글의 갯수 // 만들 수 있는 총 페이지의 수(전체 갯수 / 보여줄 갯수) 
		 int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt+1) : (totalCount/pagePerCnt);
		 
		 logger.info("총 갯수 : {}",totalCount); logger.info("만들수 있는 총 페이지 :{}",range);
		 
		 map.put("pages", range); 
		 map.put("list",dao.boardList(pagePerCnt,offset,loginId));
		 map.put("totalCount", totalCount);
		 return map; 
	}

	
	public HashMap<String, Object> alrimDel(String alram_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.alrimDel(alram_num);


		return map;
	}

	public HashMap<String, Object> MyComDel(String com_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.MyComDel(com_num);


		return map;
	}

	public HashMap<String, Object> MyBoardDel(String board_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.MyBoardDel(board_num);


		return map;
	}

	public HashMap<String, Object> boardSingo(String board_num, String loginId) {
		
		dao.boardSingo(board_num,loginId);
		
		return null;
	}

	public HashMap<String, Object> MainPageBigCateGory() {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<CywDTO> list = dao.MainPageBigCateGory();
		
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> BestBoardList(String MainNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.BestBoardList(MainNum);
		map.put("Best", list);

		return map;
	}

	public ArrayList<CywDTO> MainSearch(String forumSearch, String searchScope) {
		ArrayList<CywDTO> dto = dao.MainSearch(forumSearch, searchScope);
		logger.info("서치?:{}", dto);
		return dto;
	}

	public HashMap<String, Object> OpenGoodBoardList() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.OpenGoodBoardList();
		map.put("list", list);

		return map;
	}

	public HashMap<String, Object> OpenBestBoardList() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.OpenBestBoardList();
		map.put("Best", list);

		return map;
	}

	public HashMap<String, Object> SingoCode() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<CywDTO> list = dao.SingoCode();
		logger.info("가져오냐:{}",list);
		map.put("Code", list);

		return map;
	}

	public ArrayList<CywDTO> Singo(String mem_id, String cont, int dec_code) {
		
		dao.Singo(mem_id,cont,dec_code);
		
		return null;
	}

	public void BoardSingo(String dec_targetId, int a, int b, String loginId) {
		
		dao.BoardSingo(dec_targetId,a,b,loginId);

	}

	public void CommentSingo(String dec_targetId, int dec_targetNum, int dec_code, String loginId) {
		dao.CommentSingo(dec_targetId,dec_targetNum,dec_code,loginId);
		
	}


	
	 

}
