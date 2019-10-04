package com.hot.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hot.dao.StoreDao;

@Service
public class StoreService {
	@Autowired
	StoreDao storeDao;

	public void storeInsert(Map<String, Object> map) {
		storeDao.storeInsert(map);
	}
	public void insertTest(Map<String, Object> map) {
		storeDao.insertTest(map);
	}
	public void saveFile(MultipartFile mFile) {
		String savePath = "C:/upload";
		File saveDir = new File(savePath);
		if (!saveDir.isDirectory()) {
			saveDir.mkdirs();
		}
		String fileName = mFile.getOriginalFilename();
		try {
			mFile.transferTo(new File(savePath + "/" + fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Map<String, Object>> storeList() {
		return storeDao.storeList();
	}
	
	public Map<String, Object> storeOne(int St_NO) {
//		boardDao.update(id); // 조회수 증가
		return storeDao.storeOne(St_NO);
	}

}
