package com.hot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hot.dao.ReviewDao;

@Service
public class ReviewService {
	@Autowired
	ReviewDao reviewDao;
	@Autowired
	StoreService ss;
	
	public Map<String, Object> reviewOne(int St_NO) {
//		boardDao.update(id); // 조회수 증가
		return reviewDao.reviewOne(St_NO);
	}

	public void reviewInsert(Map<String, Object> map, List<MultipartFile> list) throws Exception {
		String img = "";
		for(int i = 0 ; i < list.size() ; i++) {
			MultipartFile temp = list.get(i);
			String fileName = ss.storeFile(temp);
			
			if(i == 0) {
				img += fileName;
			}else {
				img += "," + fileName;
			}
		}
		map.put("img", img);
		
		reviewDao.reviewInsert(map);
	}

	public List<Map<String, Object>> reviewList(int St_NO) {
		return reviewDao.reviewList(St_NO);
	}
	
	

}
