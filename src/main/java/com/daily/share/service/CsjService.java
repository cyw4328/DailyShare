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

@Service
public class CsjService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsjDAO dao;
	public int com_regist(HttpSession session, HashMap<String, String> params) {
		String mem_id = (String) session.getAttribute("loginId");
		int board_num = Integer.parseInt(params.get("board_num"));
		String com_cont = params.get("com_cont");
		int com_secret = 0;
		if (params.get("com_secret") != null) {
			com_secret = Integer.parseInt(params.get("com_secret"));			
		}
		logger.info("댓글 등록 요청 받은 아이디,글번호 : {},{}",mem_id,board_num);
		logger.info("댓글 등록 요청 받은 내용,비밀여부 : "+ com_cont+","+com_secret);
		int result = dao.com_regist(mem_id,board_num,com_cont,com_secret);
		logger.info("등록 결과 : "+result);
		
		return result;
	}
	public ArrayList<CsjCommentDTO> csj_com(int board_Num) {
		ArrayList<CsjCommentDTO> comLists = dao.csj_com(board_Num);
		return comLists;
	}




	
	
}
