package com.daily.share.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.daily.share.dto.CywDTO;

public interface CywDAO {
	//대분류 추가
	void bigCategoryAdd(String mainCategoryAdd, int mainAdminadmin);
	//대분류 가져오기
	ArrayList<CywDTO> bigCategoryList();
	//대분류 블라인드 시 하위메뉴 확인
	int bigCateFk(String main_num);
	// 대분류 블라인드
	void bigCategoryDel(String main_num);
	// 중분류 추가
	void middleCategoryAdd(String middleCategoryAdd, int daeCategory, int middle_admin);
	// 중분류 가져오기
	ArrayList<CywDTO> midCategoyrList();
	// 중분류 블라인드 시 하위메뉴 확인
	int midCateFk(String mid_num);
	// 중분류 블라인드
	void midCategoryDel(String mid_num);
	// 메뉴 추가
	void menuAdd(String menuAddName, int daeCategoryMenu, int midCategoryMenu, String id);
	// 메뉴 가져오기
	ArrayList<CywDTO> menuList();
	// 메뉴 블라인드 시 하위게시글 확인
	int menuCateFk(String menu_num);
	// 메뉴 블라인드
	void menuDel(String menu_num);
	// 대분류별 중분류 호출
	ArrayList<CywDTO> midCategoryCall(String selectValue);
	
	// 대분류별 게시글 리스트 뽑기
	ArrayList<CywDTO> middleListCall(String middleListCall);
	
	// 클릭시 자세히 보기
	CywDTO boardDetail(int board_num);
	
	// 조회수 올리기
	void upHit(int board_num);
	
	// 게시글 삭제
	void boardDel(int board_num);
	
	// 게시글 수정
	int update(HashMap<String, String> params);
	

	


	










}
