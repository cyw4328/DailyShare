package com.daily.share.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dao.ProjectDAO;
import com.daily.share.dao.ShsDAO;

@Service
public class ShsService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShsDAO dao;
	
	
}
