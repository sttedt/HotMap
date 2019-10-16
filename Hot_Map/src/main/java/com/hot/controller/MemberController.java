package com.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.md5.EncryptionClass;
import com.hot.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	// 회원가입 페이지
	@RequestMapping(value = "join", method = RequestMethod.GET)
	// param은 map을 받는다
	public String join(Model model) {
		return "join";
	}

	// 회원가입 데이터 보내기
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, Object> map, @RequestParam("pw") String pw) {
		System.out.println("map : " + map);
		String MD_PW = EncryptionClass.convertiMD5(pw);
		System.out.println("MD_PW : " + MD_PW);
		map.put("pw", MD_PW);
		memberService.joinInsert(map);
		memberService.phoneCheckDelete(map);
		memberService.deleteAuth(map);
		return "home";
	}

	// 로그인 페이지 불러오기
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	// 로그인 데이터 디비 넣기
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, @RequestParam Map<String, Object> map, HttpSession httpSession,
			HttpServletRequest request, @RequestParam("pw") String pw) {
		System.out.println("pw : " + pw);
		String MD_PW = EncryptionClass.convertiMD5(pw);
		map.put("pw", MD_PW);
		System.out.println("map : " + map);
		
		Map<String, Object> map2 = memberService.loginSelect(map);
		try {
			if (map2 != null) {
				httpSession.setAttribute("SID", map.get("id"));

				String backUrl = (String) httpSession.getAttribute("BACK_URL");

				request.setAttribute("type", "success");
				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", "home");
				return "alert";
			}
		} catch (Exception e) {
			return "redirect:login";
		}
		request.setAttribute("type", "error");
		request.setAttribute("msg", "로그인실패");
		request.setAttribute("url", "login");
		return "alert";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest request, HttpSession httpsession) {
		httpsession.invalidate(); // 세션삭제

		request.setAttribute("type", "success");
		request.setAttribute("msg", "로그아웃");
		request.setAttribute("url", "home");
		return "alert";

	}

	// 회원정보 수정페이지로 가기
	@RequestMapping(value = "profileup", method = RequestMethod.GET)
	public String up(Model model, @RequestParam("mem_id") String mem_id) {

		model.addAttribute("profileup", memberService.profileup(mem_id));
		return "profileup";
	}

	// 회원정보 수정 데이터를 디비로 보내기
	@RequestMapping(value = "profileup", method = RequestMethod.POST)
	public String up(@RequestParam Map<String, Object> map, Model model, @RequestParam("mem_id") String mem_id,
			@RequestParam("pw") String pw) {
		String MD_PW = EncryptionClass.convertiMD5(pw);

		map.put("pw", MD_PW);
		memberService.memberUpdate(map);// 데이터넘기기
		model.addAttribute("profileup", memberService.profileup(mem_id));// model객체를 이용해서, view로 데이터전달/ 넘길 데이터의 이름과 변수에
																		 // 넣을 데이터값을 넣음, 그값을 뷰로 넘겨줌

		return "redirect:/profile?mem_id=" + mem_id;
		// redirect: 경로설정
	}
	
	

	// 이메일 인증번호가 맞는지 확인
	@RequestMapping(value = "emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(@RequestParam Map<String, Object> map, Model model) {
		String tmp = memberService.emailAuth(map);
		if (tmp.length() > 1)
			memberService.deleteAuth(map);
		return tmp;
	}

	// 이메일 인증코드 보내기
	@RequestMapping(value = "createAuth", method = RequestMethod.POST)
	public String createAuth(@RequestParam Map<String, Object> map)
			throws UnsupportedEncodingException, MessagingException {
		System.out.println(map);
		memberService.createAuth(map);

		return "home";
	}
	
	// 비번 찾기 폼으로 가기
		@RequestMapping(value = "find_pw_form", method = RequestMethod.GET)
		// param은 map을 받는다
		public String find_pw_form(Model model) {
			return "find_pw_form";
		}
		
	// 비밀번호 찾기 아이디확인
		@RequestMapping(value = "find_pw_form", method = RequestMethod.POST)
		public String find_pw(HttpServletResponse response, @RequestParam("id") String id, Model md)
				throws Exception {
			md.addAttribute("id", memberService.find_pw(response, id));
			System.out.println("id : " + id);
			return "redirect:/find_pw";
			
		}
		// 페이지 받기
		@RequestMapping(value = "find_pw", method = RequestMethod.GET)
		// param은 map을 받는다
		public String find_pw(Model model) {
			return "find_pw";
		}
		
	// 비밀번호 이메일 인증코드 보내기 
	@RequestMapping(value = "find_pw_email", method = RequestMethod.POST)
	public String find_pw_email(@RequestParam Map<String, Object> map)
			throws UnsupportedEncodingException, MessagingException {
		memberService.find_pw_email(map);
		
		return "home";
	}
	
	// 비밀번호 이메일 인증번호가 맞는지 확인
	@RequestMapping(value = "pwemailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String pwemailAuth(@RequestParam Map<String, Object> map, Model model) {
		String tm = memberService.pwemailAuth(map);
		if (tm.length() > 1)
			memberService.deleteAuth(map);
		return tm;
	}
	
	
	// 비밀번호 재설정 페이지로 가기
	@RequestMapping(value = "pwup", method = RequestMethod.GET)
	public String pwrepw(Model model, @RequestParam("email") String email) {
		
		model.addAttribute("pwup", memberService.pwup(email));
		return "pwup";
	}
	
	// 비밀번호 재설정 데이터를 디비로 보내기
	@RequestMapping(value = "pwup", method = RequestMethod.POST)
	public String pwrepw(@RequestParam Map<String, Object> map, Model model, @RequestParam("email") String email,
			@RequestParam("pw") String pw) {
		String MD_PW = EncryptionClass.convertiMD5(pw);

		map.put("pw", MD_PW);
		memberService.pwUpdate(map);// 데이터넘기기
		model.addAttribute("pwup", memberService.pwup(email));// model객체를 이용해서, view로 데이터전달/ 넘길 데이터의 이름과 변수에
																		 // 넣을 데이터값을 넣음, 그값을 뷰로 넘겨줌

		return "redirect:/login";
		// redirect: 경로설정
	}
	

	// 아이디 찾기 폼
	@RequestMapping(value = "find_id_form", method = RequestMethod.GET)
	// param은 map을 받는다
	public String find_id_form(Model model) {
		return "find_id_form";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id_form", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md)
			throws Exception {
		md.addAttribute("id", memberService.find_id(response, email));
		System.out.println("email : " + email);
		return "find_id";
	}
	

}
