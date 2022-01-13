package com.daily.share.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.HjwDAO;

@Service
public class HjwService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired HjwDAO dao;
	public String login(String id, String pw) {
		String loginId = null;
		loginId = dao.login(id,pw);
		return loginId;
	}
	
	

}
