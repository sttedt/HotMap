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

	// 게시판 글쓰기
	public void boardInsert(Map<String, Object> map) {
		boardDao.boardInsert(map);
	}

	// 게시판 목록
	public List<Map<String, Object>> boardList() {
		return boardDao.boardList();
	}

	// 게시판 상세페이지
	public Map<String, Object> boardOne(int Brd_NO) {
//		boardDao.update(id); // 조회수 증가
		return boardDao.boardOne(Brd_NO);
	}

	// 게시판 수정페이지 가기
	public Map<String, Object> upd(int Brd_NO) {
		return boardDao.upd(Brd_NO);
	}
	
	// 게시판 수정데이터 디비에 보내기
	public void boardUpdate(Map<String, Object> map) {
		boardDao.boardUpdate(map);
	}

	// 게시판 삭제
	public void boardDelete(Map<String, Object> map) {
		boardDao.boardDelete(map);
	}
}