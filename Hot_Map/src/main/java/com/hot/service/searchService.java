package com.hot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.searchDao;

@Service
public class searchService {
	@Autowired
	searchDao searchDao;
	public List<Map<String, Object>> searchList(String search){
		return searchDao.searchList(search);
	}
}
