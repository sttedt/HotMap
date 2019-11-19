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
	
	// 리뷰 쓰기 페이지 불러오기
	public Map<String, Object> reviewOne(int St_NO) {
		return sessionTemplate.selectOne("review.reviewOne", St_NO);
	}
	// 리뷰 디비 저장
	public int reviewInsert(Map<String, Object> map) {
		return sessionTemplate.insert("review.reviewInsert", map);
	}
	// 리뷰 목록
	public List<Map<String, Object>> reviewList(int St_NO) {
		return sessionTemplate.selectList("review.reviewList", St_NO);
	}
	public int reviewCount(int St_NO) {
		return sessionTemplate.selectOne("review.reviewCount",St_NO);
	}
	public int reviewStarUpdate(Map<String, Object> map) {
		return sessionTemplate.update("review.reviewStarUpdate", map);
	}
	// 리뷰 수정페이지
	public Map<String, Object> getReview(Map<String, Object> map) {
		return sessionTemplate.selectOne("review.getReview", map);
	}
	public void reviewUpdate(Map<String, Object> map) {
		sessionTemplate.update("review.reviewUpdate",map);
	}
	public void reviewDelete(Map<String, Object> map) {
		sessionTemplate.delete("review.reviewDelete",map);
	}
}

