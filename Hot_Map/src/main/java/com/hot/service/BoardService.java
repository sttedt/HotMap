package com.hot.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.BoardDao;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;
	public void boardInsert(Map<String, Object> map) {
		boardDao.boardInsert(map);
	}
	
	public List<Map<String, Object>> boardList() {
		return boardDao.boardList();
	}
	public Map<String, Object> boardOne(int Brd_NO) {
//		boardDao.update(id); // 조회수 증가
		return boardDao.boardOne(Brd_NO);
	}
	
}
