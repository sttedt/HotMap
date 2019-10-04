package com.hot.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired 
	SqlSessionTemplate sessionTemplate;
	
	public int joinInsert(Map<String, Object> map) {
		return sessionTemplate.insert("member.joinInsert", map);
		
	}
	
	public int joinSelect(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.joinSelect", map);
		
	}
	public Map<String, Object> loginSelect(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.loginSelect", map);
	}

	public int joinIdCheck(String id) {
		return sessionTemplate.selectOne("member.joinIdCheck", id);
	}
	
	public int phoneCheck(int phone) {
		return sessionTemplate.insert("member.phoneCheck", phone);
	}
	public Map<String, Object> profileup(int mem_id) {
		return sessionTemplate.selectOne("member.profileup", mem_id);
	}
	public int memberUpdate(Map<String, Object> map) {
		return sessionTemplate.update("member.memberUpdate", map);
		
	}
}
