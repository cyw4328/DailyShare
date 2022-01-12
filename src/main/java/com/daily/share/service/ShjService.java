package com.daily.share.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.CywDAO;
import com.daily.share.dao.ProjectDAO;
import com.daily.share.dao.ShjDAO;

@Service
public class ShjService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ShjDAO dao;
	
	
}
