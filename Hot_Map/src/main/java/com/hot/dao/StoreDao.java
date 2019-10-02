package com.hot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao {
	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	public int storeInsert(Map<String, Object> map) {
		return sessionTemplate.insert("store.storeInsert",map);
	}
	public List<Map<String, Object>> storeList() {
		return sessionTemplate.selectList("store.storeList");
	}
	
}
