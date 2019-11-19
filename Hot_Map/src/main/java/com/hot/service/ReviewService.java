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

	// 리뷰 쓰기 불러오기
	public Map<String, Object> reviewOne(int St_NO) {
//		boardDao.update(id); // 조회수 증가
		return reviewDao.reviewOne(St_NO);
	}

	// 리뷰 디비 저장
	public void reviewInsert(Map<String, Object> map, List<MultipartFile> list) throws Exception {
		String img = "";
		for (int i = 0; i < list.size(); i++) {
			MultipartFile temp = list.get(i);
			String fileName = ss.storeFile(temp);

			if (i == 0) {
				img += fileName;
			} else {
				img += "," + fileName;
			}
		}
		map.put("img", img);

		reviewDao.reviewInsert(map);
	}

	// 리뷰 목록
	public List<Map<String, Object>> reviewList(int St_NO) {
		return reviewDao.reviewList(St_NO);
	}

	public void reviewStarUpdate(Map<String, Object> map) {
		reviewDao.reviewStarUpdate(map);
	}
	// 리뷰 수정페이지
	public Map<String, Object> getReview(Map<String, Object> map) {
		return reviewDao.getReview(map);
	}
	// 리뷰 수정데이터 넘기기
	public void reviewUpdate(Map<String, Object> map) throws Exception {

		String img = "";
		
		@SuppressWarnings("unchecked")
		List<MultipartFile> file = (List<MultipartFile>) map.get("file");
		@SuppressWarnings("unchecked")
		List<String> uploadimg = (List<String>) map.get("uploadimg");
		
		for(int i = 0 ; i< uploadimg.size(); i++) {
			if(i == 0) img += uploadimg.get(i);
			else img += "," + uploadimg.get(i);
		}
		
		for (int i = 0; i < file.size(); i++) {
			MultipartFile temp = file.get(i);
			String fileName = ss.storeFile(temp);
			img += "," + fileName;
		}
		
		map.put("img", img);
		reviewDao.reviewUpdate(map);
	}

	public void reviewDelete(Map<String, Object> map) throws Exception {
		Map<String,Object> reviewOne = reviewDao.getReview(map);
		String imgString = (String)reviewOne.get("img");
		String[] imgList = imgString.split(",");
		FTPHandler ftp = new FTPHandler("dndnp4.dothome.co.kr", "dndnp4", "dothome11!");
		String hostDir = "/html/image/";
		
		for(int i = 0 ; i< imgList.length; i++) {
			ftp.deleteFile(imgList[i], hostDir);
		}
		ftp.disconnect();
		reviewDao.reviewDelete(map);
	}

}
