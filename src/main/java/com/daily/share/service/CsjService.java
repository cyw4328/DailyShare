package com.daily.share.service;

import java.io.IOException;
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
import com.daily.share.dto.CsjMenuDTO;

@Service
public class CsjService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjDAO dao;
	
	
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
		
		dao.com_regist(dto);
		int com_num = dto.getCom_num();
		logger.info("받아온 댓글번호 : "+ com_num);
		if(com_parent == 0) {
			dao.csj_com_parent(com_num);
		}
		
		dao.com_inAlarm(com_num,1,mem_id);
		
		
		
		
		
		
	}
	
	
	
	
	
	public ArrayList<CsjCommentDTO> csj_com(int board_Num) {
		ArrayList<CsjCommentDTO> comLists = dao.csj_com(board_Num);
		return comLists;
	}





	public void com_del(String com_num) {
		dao.com_del(com_num);
		
	}





	public ArrayList<CsjMenuDTO> csj_menuCall() {
		return dao.csj_menuCall();
	}





	public HashMap<String, Object> com_update(String com_num, String com_content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result  = dao.com_update(com_num,com_content);
		logger.info("업데이트 결과 : {}",result);
		map.put("updateResult", result);
		return map;
	}





	public String csj_postUpload(HashMap<String, String> params, String loginId, MultipartFile[] photos) {
		String board_subject = params.get("board_subject");
		String board_cont = params.get("board_cont");
		int board_scope =  Integer.parseInt(params.get("board_scope"));
		String mem_id = loginId;
		int menu_num = Integer.parseInt(params.get("menu_num"));
		
		logger.info("받아온 파라메터 : "+board_subject+"/"+board_cont+"/"+board_scope+"/"+mem_id+"/"+menu_num);
		
		CsjBoardDTO dtoB = new CsjBoardDTO();
		dtoB.setBoard_subject(board_subject);
		dtoB.setBoard_cont(board_cont);
		dtoB.setBoard_scope(board_scope);
		dtoB.setMem_id(mem_id);
		dtoB.setMenu_num(menu_num);
		
		//글등록
		dao.csj_postUpload(dtoB);
		String page = "redirect:/csj";
		
		int board_num = dtoB.getBoard_num();
		if (board_num >0) {
			page = "redirect:/csj";
			
			
			//사진등록
			csj_photoUpload(board_num,photos);
		}	
		return page;

	}





	private void csj_photoUpload(int board_num, MultipartFile[] photos) {
		for (MultipartFile photo : photos) {
				try {
					String photo_oriName= photo.getOriginalFilename();
					int index = photo_oriName.lastIndexOf(".");
					if (index>0) {
						String ext = photo_oriName.substring(index);
						String photo_newName = System.currentTimeMillis()+ext;
						byte[] bytes = photo.getBytes();
						
				
						}	 
				}catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			
			
			
		}
		
		
		
		
		
	}



	
	
	

	
	
}
