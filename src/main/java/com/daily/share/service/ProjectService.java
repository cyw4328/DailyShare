package com.daily.share.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daily.share.dao.ProjectDAO;

@Service
public class ProjectService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ProjectDAO dao;
	
	
}
