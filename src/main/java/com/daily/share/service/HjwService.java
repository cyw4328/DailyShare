package com.daily.share.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.HjwDAO;

@Service
public class HjwService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired HjwDAO dao;
	public String login(String userId, String userPass) {
		String loginId = null;
		loginId = dao.login(userId,userPass);
		return loginId;
	}
	public String IdS(String userName, String userPhone, String userEmail) {
		String IdS = "";
		IdS = dao.IdS(userName,userPhone,userEmail);
		logger.info("찾아온 아이디 : {}",IdS);
		return IdS;
	}
	public String PwS(String userId, String userName, String userPhone, String userEmail) {
		String PwS = "";
		PwS = dao.PwS(userId,userName,userPhone,userEmail);
		logger.info("찾아온 이메일 : {}",PwS);
		return PwS;
	}
	public void PwC(String userPass) {
		int row = dao.update(userPass);
		logger.info("변경 성공여부 : {}",row);	
		
	}


}
