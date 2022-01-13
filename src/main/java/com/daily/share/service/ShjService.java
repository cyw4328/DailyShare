package com.daily.share.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dao.ProjectDAO;
import com.daily.share.dao.ShjDAO;
import com.daily.share.dto.ShjDTO;

@Service
public class ShjService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShjDAO dao;
	
	
	
	
	
	public HashMap<String, Object> list(int currPage, int pagePerCnt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();			
		
		//어디서 부터 보여줘야 하는가?
		int offset = ((currPage-1) * pagePerCnt-1) >= 0  ? 
				((currPage-1) * pagePerCnt-1) : 0;		
		logger.info("offset : {}",offset);		
				
		 int totalCount = dao.allCount(); // bbs 테이블의 모든 글의 갯수
		//만들수 있는 총 페이지의 수(전체 갯수/보여줄 수)
		 int range = totalCount%pagePerCnt > 0 ? 
				 (totalCount/pagePerCnt)+1 : (totalCount/pagePerCnt);
		 logger.info("총 갯수 : {}",totalCount);
		 logger.info("만들 수 있는 총 페이지 : {}",range);
		 
		 map.put("pages",range);
		 map.put("list", dao.list());		 
		return map;
	}





	public List<ShjDTO> searchList(ShjDTO shjDTO) {
		
		return dao.searchList(shjDTO);
	}
	
	
	

	
}
