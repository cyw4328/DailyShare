package com.daily.share.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dao.ProjectDAO;
import com.daily.share.dao.ShsDAO;
import com.daily.share.dto.ShsDTO;

@Service
public class ShsService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShsDAO dao;
	public HashMap<String, Object> overlay(String id) {
		logger.info("중복체크 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String overlayId = dao.overlay(id);
		logger.info("중복 아이디 여부 : {}",overlayId);		
		boolean overlay = overlayId == null ? false : true;		
		map.put("overlay", overlay);		
		return map;
	}
	
	
	
	//회원가입 요청
	public HashMap<String, Object> join(HashMap<String, String> params) {
		logger.info("회원가입 요청 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.join(params);
		map.put("success", row);
		
		return map;
	}



	public ShsDTO memberDe(String id) {
		logger.info("회원정보 서비스 도착");
		return dao.memberDe(id);
	}



	public void userUp(String id, String pw, String email, String phone) {
		logger.info("회원수정 서비스 도착 : {}",id+pw+email+phone);
		dao.userUp(id,pw,email,phone);
		
	}



	public void memberOut(Object object) {
		
		logger.info("회원탈퇴 서비스 도착 : {}" );
		String id = (String) object;
		dao.memberOut(id);
		
		
	}




	
	
}
