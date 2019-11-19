package com.hot.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao {
	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	public int insertTest(Map<String, Object> map) {
		return sessionTemplate.insert("store.insertTest",map);
	}
	public int storeInsert(Map<String, Object> map) {
		return sessionTemplate.insert("store.storeInsert",map);
	}
	
	public List<Map<String, Object>> storeListSum() {
		return sessionTemplate.selectList("store.storeListSum");
	}
	
	// 홈에 신상 스토어 6개띄우기
	public List<Map<String, Object>> storeList() {
		return sessionTemplate.selectList("store.storeList");
	}
	
	public Map<String, Object> storeOne(int St_NO) {
		return sessionTemplate.selectOne("store.storeOne", St_NO);
	}

	public void hitUpdate(Map<String, Object> map) {
		sessionTemplate.update("store.hitUpdate", map);
	}
	
	public List<Map<String, Object>> getAllImage(int St_NO) {
		return sessionTemplate.selectList("store.getAllImage", St_NO);
	}
	public List<Map<String, Object>> nowRank(){
		return sessionTemplate.selectList("store.nowRank");
	}
	
	public Map<String, Object> storeUpdateOne(int St_NO){
		return sessionTemplate.selectOne("store.storeUpdateOne", St_NO);
	}

}
