package com.hot.service;

import java.util.Map;
import java.util.Random;

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
	public int phoneCheckNumber(int phone) {
		return memberDao.phoneCheckNumber(phone);
	}
	
	public int phoneCheck(int ren) {
		return memberDao.phoneCheck(ren);
	}
	public void createAuth(Map<String, Object> map) {
		char[] chars = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
		
		StringBuffer sb = new StringBuffer();
		Random rand = new Random();
		
		for(int i = 0 ; i < 10; i++) {
			int idx = rand.nextInt(chars.length);
			sb.append(chars[idx]);
		}
		map.put("code", sb.toString());
		System.out.println(map);
		memberDao.createAuth(map);
	}
}
