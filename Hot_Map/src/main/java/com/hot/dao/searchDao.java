package com.hot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class searchDao {
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<Map<String, Object>> searchList(String search){
		return sessionTemplate.selectList("search.searchList", search);
	}
}
