package com.hot.service;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;

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

	// 회원가입 쓰기
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

	public Map<String, Object> profileup(String mem_id) {
		return memberDao.profileup(mem_id);
	}

	public void memberUpdate(Map<String, Object> map) {
		memberDao.memberUpdate(map);
	}

	public int phoneCheck(Map<String, Object> map) {
		return memberDao.phoneCheck(map);
	}

	public int phoneCheckDelete(Map<String, Object> map) {
		return memberDao.phoneCheckDelete(map);
	}

	// 이메일 인증 보내는 코드
	@Transactional
	public void createAuth(Map<String, Object> map)
			throws MessagingException, UnsupportedEncodingException {
		RandomString rand = new RandomString();
		String code = rand.run(10);

		map.put("code", code);
		memberDao.createAuth(map);

		MailHandler sendMail = new MailHandler(mailSender);

			sendMail.setSubject("hot map 이메일 인증");
			sendMail.setText("<h1>test Test..." + code + "</h1>");
			sendMail.setFrom("devforthebest@gmail.com", "Admin");
			sendMail.setTo(map.get("email").toString());
			sendMail.send();
	}

	// 디비에 확인
	public String emailAuth(Map<String, Object> map) {
		return memberDao.emailAuth(map);
	}

	// 디비 지우기
	public int deleteAuth(Map<String, Object> map) {
		return memberDao.deleteAuth(map);
	}
	
	// 비번찾기 아이디 확인
		public String find_pw(HttpServletResponse response, String id) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String pw = memberDao.find_pw(id);

			if (pw == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return "find_pw";
			}
		}
	
	// 비밀번호 이메일 인증 보내는 코드
		@Transactional
		public void find_pw_email(Map<String, Object> map)
				throws MessagingException, UnsupportedEncodingException {
			RandomString rand = new RandomString();
			String code = rand.run(10);

			map.put("code", code);
			memberDao.find_pw_email(map);

			MailHandler sendMail = new MailHandler(mailSender);

				sendMail.setSubject("hot map 비밀번경 인증번호");
				sendMail.setText("<h1>test Test..." + code + "</h1>");
				sendMail.setFrom("devforthebest@gmail.com", "Admin");
				sendMail.setTo(map.get("email").toString());
				sendMail.send();
		}
		// 디비에 확인
		public String pwemailAuth(Map<String, Object> map) {
			return memberDao.pwemailAuth(map);
		}

		// 디비 지우기
		public int pwdeleteAuth(Map<String, Object> map) {
			return memberDao.pwdeleteAuth(map);
		}
		// 비밀번호 재설정페이지로 가기
		public Map<String, Object> pwup(String email) {
			return memberDao.pwup(email);
		}
		// 비밀번호 재설정 데이터를 디비로 보내기
		public void pwUpdate(Map<String, Object> map) {
			memberDao.pwUpdate(map);
		}
		
	// 아이디 찾기
	public String find_id(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = memberDao.find_id(email);

		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	
}
