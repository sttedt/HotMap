package com.hot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.ReviewDao;

@Service
public class ReviewService {
	@Autowired
	ReviewDao reviewDao;
	
	public Map<String, Object> reviewOne(int St_NO) {
//		boardDao.update(id); // 조회수 증가
		return reviewDao.reviewOne(St_NO);
	}

	public void reviewInsert(Map<String, Object> map) {
		reviewDao.reviewInsert(map);
	}

	public List<Map<String, Object>> reviewList() {
		return reviewDao.reviewList();
	}


}
