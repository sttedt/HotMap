package com.hot.service;

import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hot.dao.MemberDao;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Inject
	JavaMailSender mailSender;
	
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
	public int phoneCheckNumber(Map<String, Object> map) {
		return memberDao.phoneCheckNumber(map);
	}
	
	public int phoneCheck(Map<String, Object> map ) {
		return memberDao.phoneCheck(map);
	}
	public int phoneCheckDelete(Map<String, Object> map) {
		return memberDao.phoneCheckDelete(map);
	}
	
	@Transactional
	public void createAuth(Map<String, Object> map) throws MessagingException, UnsupportedEncodingException {
		char[] chars = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
		
		StringBuffer sb = new StringBuffer();
		Random rand = new Random();
		
		for(int i = 0 ; i < 10; i++) {
			int idx = rand.nextInt(chars.length);
			sb.append(chars[idx]);
		}
		map.put("code", sb.toString());
		memberDao.createAuth(map);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("test");
		sendMail.setText("<h1>test Test..." + sb.toString() + "</h1>");
		sendMail.setFrom("devforthebest@gmail.com", "Admin");
		sendMail.setTo(map.get("email").toString());
		sendMail.send();
	}
	public String emailAuth(Map<String, Object> map){
		return memberDao.emailAuth(map);
	}
	public int deleteAuth(Map<String, Object> map) {
		return memberDao.deleteAuth(map);
	}
}
