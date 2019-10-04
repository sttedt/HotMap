package com.hot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hot.dao.MemberDao;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao;
	public void joinInsert(Map<String, Object> map) {
		memberDao.joinInsert(map);
	}
	
	public void joinSelect(Map<String, Object> map) {
		memberDao.joinSelect(map);
	}
	public Map<String, Object> loginSelect(Map<String, Object> map) {
		return memberDao.loginSelect(map);
	}

	public int joinIdCheck(String id) {

		return memberDao.joinIdCheck(id);
	}
	public int phoneCheck(int phone) {
		return memberDao.phoneCheck(phone);
	}
	public Map<String, Object> profileup(int mem_id) {
		return memberDao.profileup(mem_id);
	}
	public void memberUpdate(Map<String, Object> map) {
		memberDao.memberUpdate(map);
	}
}
