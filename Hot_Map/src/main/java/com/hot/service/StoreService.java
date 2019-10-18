package com.hot.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
	
	public void storeInsert(Map<String, Object> map, List<MultipartFile> list) throws Exception {
		String img = "";
		for(int i = 0 ; i < list.size() ; i++) {
			MultipartFile temp = list.get(i);
			String fileName = storeFile(temp);
			
			if(i == 0) {
				img += fileName;
			}else {
				img += "," + fileName;
			}
		}
		map.put("img", img);
//		System.out.println("StoreService[storeInsert] : "+img);
		storeDao.storeInsert(map);
	}
	public void insertTest(Map<String, Object> map) {
		storeDao.insertTest(map);
	}
	public File saveFile(MultipartFile mFile) {
		String savePath = "C:/Temp";
		File saveDir = new File(savePath);
		
		
		if (!saveDir.isDirectory()) {
			saveDir.mkdirs();
		}
		String fileName = mFile.getOriginalFilename();
		File temp = new File(savePath + "/" + fileName);
		try {
			
			mFile.transferTo(temp);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return temp;
	}
	public String storeFile(MultipartFile mFile) throws Exception {
		// 임시파일 생성 후 전송한다. 웹브라우저 상에서 절대경로는 파악이 불가함.. 그래서 내가 경로를 정해줄거
		File temp = saveFile(mFile);
		RandomString rand = new RandomString();
		// 확장자 추출
		String ext = mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf(".") + 1, mFile.getOriginalFilename().length());
		String fileName = rand.run(30) +"." + ext;
		FTPUploader ftpUploader = new FTPUploader("dndnp4.dothome.co.kr", "dndnp4", "dothome11!");
        ftpUploader.uploadFile(temp.toString(), fileName, "/html/image/");
        ftpUploader.disconnect();

        // 임시파일삭제
        temp.delete();
        
        return fileName;
	}

	// 전체 스토어 목록
	public List<Map<String, Object>> storeListSum() {
		return storeDao.storeListSum();
	}
	
	// 홈에 신상핫플 6개 띄우기
	public List<Map<String, Object>> storeList() {
		return storeDao.storeList();
	}
	public List<String> get_imgList(String tmp){
		List<String> img = new ArrayList<String>();
		if(tmp == null) return null;
		String[] a = tmp.split(",");
		for(String b : a) {
			img.add(b);
		}
//		System.out.println("StoreService[get_imgList] : " + img);
		return img;
	}
	public Map<String, Object> storeOne(int St_NO) {
//		boardDao.update(id); // 조회수 증가
		return storeDao.storeOne(St_NO);
	}

	public void hitUpdate(Map<String, Object> map) {
		storeDao.hitUpdate(map);
	}
	
	public List<String> getAllImage(int St_NO) {
		List<String> list = new ArrayList<String>();
		List<Map<String, Object>> getlist = storeDao.getAllImage(St_NO);
		
		for(int i = 0; i< getlist.size(); i++) {
			list.addAll(get_imgList((String)getlist.get(i).get("img")));
		}
		return list;
	}
	public List<Map<String, Object>> nowRank() {
		return storeDao.nowRank();
	}

}
