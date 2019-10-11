package com.hot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	// 게시판 글쓰기
	public int boardInsert(Map<String, Object> map) {
		return sessionTemplate.insert("board.boardInsert", map);
	}

	// 게시판 목록
	public List<Map<String, Object>> boardList() {
		return sessionTemplate.selectList("board.boardList");
	}
	
	// 게시판 상세페이지
	public Map<String, Object> boardOne(int Brd_NO) {
		return sessionTemplate.selectOne("board.boardOne", Brd_NO);
	}
	
	// 게시판 수정페이지 가기
	public Map<String, Object> upd(int Brd_NO) {
		return sessionTemplate.selectOne("board.upd", Brd_NO);
	}
	
	// 게시판 수정데이터 디비 보내기
	public int boardUpdate(Map<String, Object> map) {
		return sessionTemplate.update("board.boardUpdate", map);
		
	}
	
	// 게시판 삭제
	public int boardDelete(Map<String, Object> map){
		return sessionTemplate.delete("board.boardDelete", map);
	}
}
