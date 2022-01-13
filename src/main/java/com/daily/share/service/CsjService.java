package com.daily.share.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CsjDAO;
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




	
	
}
