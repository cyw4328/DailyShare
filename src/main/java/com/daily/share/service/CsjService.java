package com.daily.share.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.daily.share.dao.CsjDAO;
import com.daily.share.dto.CsjBoardDTO;
import com.daily.share.dto.CsjCommentDTO;
import com.daily.share.dto.CsjMembersDTO;
import com.daily.share.dto.CsjMenuDTO;
import com.daily.share.dto.CsjPersonalBlogDTO;
import com.daily.share.dto.CsjPhotoDTO;
import com.daily.share.dto.CsjSubDTO;

@Service
public class CsjService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjDAO dao;
	
	
	
	//댓글 등록 기능
	public void com_regist(HttpSession session, HashMap<String, String> params) {
	
		
		CsjCommentDTO dto = new CsjCommentDTO();
		String mem_id = (String) session.getAttribute("loginId");
		dto.setMem_id(mem_id);
		dto.setBoard_num(Integer.parseInt(params.get("board_num")));
		int com_parent = Integer.parseInt(params.get("com_parent"));
		dto.setCom_parent(com_parent);
		
		int com_depth = 0;
		if (com_parent != 0) {
			com_depth = 1;
		}
		dto.setCom_depth(com_depth);
		dto.setCom_cont( params.get("com_cont"));
		int com_secret = 0;
		if (params.get("com_secret") != null) {
			com_secret = Integer.parseInt(params.get("com_secret"));			
		}
		dto.setCom_secret(com_secret);
		
		String com_targetId = params.get("com_targetId");
		dto.setCom_targetId(com_targetId);
		
		
		//댓글 등록
		dao.com_regist(dto);
		int com_num = dto.getCom_num();
		logger.info("받아온 댓글번호 : "+ com_num);
		if(com_parent == 0) { //댓글 부모 등록
			dao.csj_com_parent(com_num);
		}
		
		
		//댓글 알람 등록
		dao.com_inAlarm(com_num,1,com_targetId);
		
		
		
		
		
		
	}
	
	
	
	
	//댓글 불러오기
	public ArrayList<CsjCommentDTO> csj_com(int board_Num) {
		ArrayList<CsjCommentDTO> comLists = dao.csj_com(board_Num);
		return comLists;
	}




	//댓글 삭제
	public void com_del(String com_num) {
		dao.com_del(com_num);
		
	}




	//게시글 작성에서 메뉴 불러오기
	public ArrayList<CsjMenuDTO> csj_menuCall(String mem_id) {
		return dao.csj_menuCall(mem_id);
	}




	//댓글 수정
	public HashMap<String, Object> com_update(String com_num, String com_content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result  = dao.com_update(com_num,com_content);
		logger.info("업데이트 결과 : {}",result);
		map.put("updateResult", result);
		return map;
	}




	//게시글 업로드
	public String csj_postUpload(HashMap<String, String> params, String loginId, MultipartFile[] photos) {
		String board_subject = params.get("board_subject");
		String board_cont = params.get("board_cont");
		int board_scope =  Integer.parseInt(params.get("board_scope"));
		String mem_id = loginId;
		int menu_num = Integer.parseInt(params.get("menu_num"));
		
		logger.info("받아온 파라메터 : "+board_subject+"/"+board_cont+"/"+board_scope+"/"+mem_id+"/"+menu_num);
		
		CsjPersonalBlogDTO dtoB = new CsjPersonalBlogDTO();
		dtoB.setBoard_subject(board_subject);
		dtoB.setBoard_cont(board_cont);
		dtoB.setBoard_scope(board_scope);
		dtoB.setMem_id(mem_id);
		dtoB.setMenu_num(menu_num);
		
		//글등록
		dao.csj_postUpload(dtoB);
		String page = "redirect:/csj";
		
		int board_num = dtoB.getBoard_num();
		logger.info("등록 결과 : {}",board_num);
		
		
		
		if (board_num >0) {
			page = "redirect:/csj_detail?board_num="+board_num+"&mem_id="+mem_id;
			
			//알림 등록 
			ArrayList<String> subList = new ArrayList<String>();
			subList = dao.searchSubId(mem_id);
			logger.info("구독자 목록/사이즈 : {}/{}",subList,subList.size());
			if (subList.size()>0) {
				for (int i = 0; i < subList.size(); i++) {
					logger.info("구독자 하나씩 : {}",subList.get(i));
					dao.com_inAlarm(board_num,2,subList.get(i));
				}				
			}
			
			
			//사진등록
			csj_photoUpload(board_num,photos);
			
			//태그 등록
			int tagLength= Integer.parseInt(params.get("tag_num"));
			logger.info("태그 개수 : {}",tagLength);
			
			if (tagLength>0) {
				for (int i = 0; i < tagLength; i++) {
					String tag = params.get("tag_content"+i);
					logger.info(tag);
					dao.csj_tagUpload(board_num,tag);
				}
			}
			
		}
		
		
		return page; //게시글 상세보기로 변경해주세요(했음)

	}





	//사진 업로드 기능
	private void csj_photoUpload(int board_num, MultipartFile[] photos) {
		String photo_newName = "";
		for (MultipartFile photo : photos) {
			try {
				String photo_oriName= photo.getOriginalFilename();
				int index = photo_oriName.lastIndexOf(".");
				logger.info("인덱스"+ index);
					if (index>0) {
					String ext = photo_oriName.substring(index);
					photo_newName = System.currentTimeMillis()+ext;
					byte[] bytes = photo.getBytes();
					
					//개인마다 경로 다름
					Path path = Paths.get("C:/upload/"+photo_newName);
					
					Files.write(path, bytes);
					logger.info(photo_oriName+" save ok");
					dao.csj_photoUpload(board_num,photo_oriName,photo_newName);
					}	
					dao.csj_thumbUpdate(board_num,photo_newName);
				Thread.sleep(1);
			}catch (Exception e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
		}
	
	}




	public ArrayList<CsjMembersDTO> testList() {
		return dao.testList();
		
	}




	public ArrayList<CsjPersonalBlogDTO> boardCall(String mem_id) {
		return dao.boardCall(mem_id);
	}




	public HashMap<String, Object> csj_pagingList(int currPage, int pagePerCnt, String mem_id) {
		logger.info("리스트 서비스 요청");
		
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; //어디서부터 보여줘야 하는가?
		logger.info("offset : {}",offset);
		
		int totalCount = dao.csjAllCount(mem_id); //bbs 테이블의 모든 데이터의 개수
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt)+1 : totalCount/pagePerCnt;
		logger.info("총 개수 : {}",totalCount);
		logger.info("만들 수 있는 총 페이지 : {}",range);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pages", range);
		ArrayList<CsjPersonalBlogDTO> pagingBoardCall= dao.pagingBoardCall(pagePerCnt,offset,mem_id);
		logger.info("가져온 리스트 : {}",pagingBoardCall.size());
		map.put("list", pagingBoardCall);
		return map;
	}




	public HashMap<String, Object> csj_pagingListMenu(int currPage, int pagePerCnt, String mem_id, String menu_num) {
		logger.info("리스트 서비스 요청");
		
		int offset = ((currPage-1) * pagePerCnt-1) >= 0 ? ((currPage-1) * pagePerCnt-1) : 0; //어디서부터 보여줘야 하는가?
		logger.info("offset : {}",offset);
		
		int totalCount = dao.csjAllCountMenu(mem_id,menu_num); //bbs 테이블의 모든 데이터의 개수
		int range = totalCount%pagePerCnt > 0 ? (totalCount/pagePerCnt)+1 : totalCount/pagePerCnt;
		logger.info("총 개수 : {}",totalCount);
		logger.info("만들 수 있는 총 페이지 : {}",range);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pages", range);
		ArrayList<CsjPersonalBlogDTO> pagingBoardCall= dao.pagingBoardCallMenu(pagePerCnt,offset,mem_id,menu_num);
		logger.info("가져온 리스트 : {}",pagingBoardCall.size());
		map.put("list", pagingBoardCall);
		return map;
	}




	public String blogName(String mem_id) {	
		return dao.blogName(mem_id);
	}




	public CsjPersonalBlogDTO csj_detail(String board_num) {
		return dao.csj_detail(board_num);
	}




	public ArrayList<String> tagCall(String board_num) {
		return dao.tagCall(board_num);
	}




	public ArrayList<CsjPhotoDTO> photoCall(String board_num) {
		return dao.photoCall(board_num);
	}




	public HashMap<String, Object> csj_tagDel(String tag_content, String board_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result=dao.csj_tagDel(tag_content,board_num);
		map.put("result",result);
		
		return map;
	}


	//게시글 수정
	public String csj_postUpdate(HashMap<String, String> params, String loginId, MultipartFile[] photos) {
		int iboard_num = Integer.parseInt(params.get("board_num"));
		String board_num = params.get("board_num");
		String board_subject = params.get("board_subject");
		String board_cont = params.get("board_cont");
		int board_scope =  Integer.parseInt(params.get("board_scope"));
		String mem_id = loginId;
		int menu_num = Integer.parseInt(params.get("menu_num"));
		
		logger.info("받아온 파라메터 : "+board_subject+"/"+board_cont+"/"+board_scope+"/"+mem_id+"/"+menu_num);
		
		CsjPersonalBlogDTO dtoB = new CsjPersonalBlogDTO();
		dtoB.setBoard_num(iboard_num);
		dtoB.setBoard_subject(board_subject);
		dtoB.setBoard_cont(board_cont);
		dtoB.setBoard_scope(board_scope);
		dtoB.setMem_id(mem_id);
		dtoB.setMenu_num(menu_num);
		
		//글업데이트
		int result = dao.csj_postUpdate(dtoB);
		String page = "redirect:/csj";
		logger.info("등록 결과 : {}",result);
		
		
		
		if (result >0) {
			page = "redirect:/csj_detail?board_num="+board_num+"&mem_id="+mem_id;
			

			
			if (photos.length>0) {
				//사진등록
				csj_photoUpload(iboard_num,photos);
			}
			
			//태그 등록
			int tagLength= Integer.parseInt(params.get("tag_num"));
			logger.info("태그 개수 : {}",tagLength);
			
			if (tagLength>0) {
				for (int i = 0; i < tagLength; i++) {
					String tag = params.get("tag_content"+i);
					logger.info(tag);
					dao.csj_tagUpload(iboard_num,tag);
				}
			}
			
		}
		int delPhotoNum=Integer.parseInt(params.get("delPhotoNum"));
		logger.info("지우려는 사진 수 : {}",delPhotoNum);
		if (delPhotoNum>0) {
			for (int i = 0; i < delPhotoNum; i++) {
				String photo_newName= params.get("photo_newName"+i);
				logger.info(photo_newName);
				//사진 삭제 요청
				photoDelete(board_num, photo_newName);
			}
		}
		
		
		return page; //게시글 상세보기로 변경해주세요(했음)

	}




	public void photoDelete(String board_num, String photo_newName) {
		dao.photoDelete(board_num,photo_newName);
		logger.info("삭제 진행: {}/{}",board_num,photo_newName);
		File file = new File("C:/upload/"+photo_newName);
		boolean yn = file.delete();
		logger.info(photo_newName+"삭제 : "+yn);
		ArrayList<CsjPhotoDTO> photoList= dao.photoCall(board_num);
		logger.info("게시글 사진 수: "+photoList.size());
		photo_newName = "noImage.png";
		if (photoList.size() > 0) {
			for (CsjPhotoDTO photo : photoList) {
				photo_newName = photo.getPhoto_newName();
				logger.info(photo_newName);
				dao.csj_thumbUpdateTwo(board_num, photo_newName);	
			}
		}else {
			logger.info("사진 no썸네일 업데이트"+board_num);
			dao.csj_thumbUpdateTwo(board_num,photo_newName);
		}

		
	}







	//구독 관련
	/*
	 * public ArrayList<CsjSubDTO> csjSubList(String loginId) { return
	 * dao.csjSubList(loginId); }
	 * 
	 * 
	 * 
	 * 
	 * public HashMap<String, Object> csjSubCall(String mem_id, String sub_id) {
	 * HashMap<String, Object> map = new HashMap<String, Object>(); int result =
	 * dao.csjSubCall(mem_id,sub_id); map.put("result", result); return map; }
	 */


	
	
	

	
	
}
