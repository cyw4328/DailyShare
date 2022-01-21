package com.daily.share.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.HjwDAO;
import com.daily.share.dto.CsjDecDTO;
import com.daily.share.dto.HjwDTO;
import com.daily.share.dto.ShjDTO;

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
	public void PwC(String searchId, String userPass) {
		dao.PwC(searchId,userPass);
	}
	public ArrayList<HjwDTO> memlist(int currPage, int pagePerCnt) {
		return dao.memlist(currPage,pagePerCnt);
	}
	public ArrayList<CsjDecDTO> declist1(int currPage, int pagePerCnt) {
		return dao.declist1(currPage,pagePerCnt);
	}
	public int allCount() {
		return dao.allCount();
	}
	public List<HjwDTO> SearchList(HjwDTO hjwdto) {
		return dao.SearchList(hjwdto);
	}
	
	public List<HjwDTO> SearchList1(HjwDTO hjwdto) {
		return dao.SearchList1(hjwdto);
	}
	public int allCount1() {
		return dao.allCount1();
	}

	public ArrayList<HjwDTO> declist3() {
		logger.info("list 쿼리 요청");
		return dao.declist3();
	}
	public void enr_decM(HashMap<String, String> params) {
		int row = dao.enr_decM(params);
		logger.info(" 입력된 건수 : {}",row);
	}
	public void decupdate(HashMap<String, String> params) {
		int row = dao.decupdate(params);
		logger.info("수정 성공여부 : {}",row);	
	}


}
