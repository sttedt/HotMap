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
	
	public int boardInsert(Map<String, Object> map) {
		return sessionTemplate.insert("board.boardInsert", map);
		
	}
	public List<Map<String, Object>> boardList() {
		return sessionTemplate.selectList("board.boardList");
	}
	
	public Map<String, Object> boardOne(int Brd_NO) {
		return sessionTemplate.selectOne("board.boardOne", Brd_NO);
	}
	public Map<String, Object> upd(int Brd_NO) {
		return sessionTemplate.selectOne("board.upd", Brd_NO);
	}
	public int boardUpdate(Map<String, Object> map) {
		return sessionTemplate.update("board.boardUpdate", map);
		
	}
}
