package com.hot.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
	public int phoneCheckNumber(Map<String, Object> map) {
		return sessionTemplate.insert("member.phoneCheckNumber", map);
	}
	
	public int phoneCheck(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.phoneCheck", map);
	}
	
	public int phoneCheckDelete(Map<String, Object> map) {
		return sessionTemplate.delete("member.phoneCheckDelete",map);
	}
	public String emailAuth(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.emailAuth", map);
	}
	public int createAuth(Map<String, Object> map) {
		return sessionTemplate.insert("member.createAuth", map);
	}
	public int deleteAuth(Map<String, Object> map) {
		return sessionTemplate.delete("member.deleteAuth", map);
	}
	public Map<String, Object> profileup(String mem_id) {
		return sessionTemplate.selectOne("member.profileup", mem_id);
	}
	public int memberUpdate(Map<String, Object> map) {
		return sessionTemplate.update("member.memberUpdate", map);
		
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		return sessionTemplate.selectOne("member.find_id", email);
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDao member) throws Exception{
		return sessionTemplate.update("member.update_pw", member);
	}
}
