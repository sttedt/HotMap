package com.hot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	public Map<String, Object> reviewOne(int St_NO) {
		return sessionTemplate.selectOne("review.reviewOne", St_NO);
	}

	public int reviewInsert(Map<String, Object> map) {
		return sessionTemplate.insert("review.reviewInsert", map);
	}
	public List<Map<String, Object>> reviewList() {
		return sessionTemplate.selectList("review.reviewList");
	}
}
