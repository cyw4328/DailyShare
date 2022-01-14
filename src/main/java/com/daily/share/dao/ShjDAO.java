package com.daily.share.dao;

import java.util.ArrayList;
import java.util.List;

import com.daily.share.dto.ShjDTO;

public interface ShjDAO {

	ArrayList<ShjDTO> list();

	int allCount();

	List<ShjDTO> getSearchList(ShjDTO shjdto);
	
	


}
