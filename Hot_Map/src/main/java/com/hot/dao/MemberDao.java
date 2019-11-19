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
	// 회원가입 이메일 인증번호 확인
	public String emailAuth(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.emailAuth", map);
	}
	// 회원가입 이메일 인증번호 보내기
	public int createAuth(Map<String, Object> map) {
		return sessionTemplate.insert("member.createAuth", map);
	}
	// 회원가입 이메일인증번호 삭제
	public int deleteAuth(Map<String, Object> map) {
		return sessionTemplate.delete("member.deleteAuth", map);
	}
	
	// 비번 찾기 아이디 확인
	public String find_pw(String id) throws Exception{
		return sessionTemplate.selectOne("member.find_pw", id);
	}
	//비밀번호 변경 이메일
	public int find_pw_email(Map<String, Object> map) {
		return sessionTemplate.insert("member.find_pw_email", map);
	}
	// 비밀번호 이메일 인증번호 확인
	public String pwemailAuth(Map<String, Object> map) {
		return sessionTemplate.selectOne("member.pwemailAuth", map);
	}
	// 비밀번호 이메일 인증번호 삭제
	public int pwdeleteAuth(Map<String, Object> map) {
		return sessionTemplate.delete("member.pwdeleteAuth", map);
	}
	// 비밀번호 재설정 페이지로 가기
	public Map<String, Object> pwup(String email) {
		return sessionTemplate.selectOne("member.pwup", email);
	}
	
	// 비밀번호 재설정 데이터 디비로 보내기
	public int pwUpdate(Map<String, Object> map) {
		return sessionTemplate.update("member.pwUpdate", map);
	}
	
	// 회원정보 수정페이지
	public Map<String, Object> profileup(String mem_id) {
		return sessionTemplate.selectOne("member.profileup", mem_id);
	}
	// 회원정보 수정 데이터를 디비로 보내기
	public int memberUpdate(Map<String, Object> map) {
		return sessionTemplate.update("member.memberUpdate", map);
		
	}
	
	// 아이디 찾기
	public String find_id(String email) throws Exception{
		return sessionTemplate.selectOne("member.find_id", email);
	}
	
//	// 비밀번호 변경
//	@Transactional
//	public int update_pw(MemberDao member) throws Exception{
//		return sessionTemplate.update("member.update_pw", member);
//	}
}
