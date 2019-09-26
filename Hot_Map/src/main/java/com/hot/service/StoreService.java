package com.hot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.StoreDao;

@Service
public class StoreService {
	@Autowired
	StoreDao storeDao;
	
	public void storeInsert(Map<String, Object> map) {
		storeDao.storeInsert(map);
	}
}
