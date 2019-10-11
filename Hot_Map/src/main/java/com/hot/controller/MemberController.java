package com.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	@RequestMapping(value="join", method = RequestMethod.GET)
	// param은 map을 받는다
	public String join(Model model) {
		return "join";
	}
	
	// 회원가입 데이터 보내기
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, Object> map,@RequestParam("pw") String pw) {
		System.out.println("map : " + map);
		System.out.println("pw : " + pw);
		String MD_PW = EncryptionClass.convertiMD5(pw);
		map.put("pw",  MD_PW);
		memberService.joinInsert(map);
		memberService.phoneCheckDelete(map);
		memberService.deleteAuth(map);
		return "home";
	}
	
	// 로그인 페이지 불러오기
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	// 로그인 데이터 디비 넣기
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam Map<String, Object> map , 
			HttpSession httpSession, HttpServletRequest request, @RequestParam("pw") String pw) {
		String MD_PW = EncryptionClass.convertiMD5(pw);
		map.put("pw",MD_PW);
		
		Map<String, Object> map2 = memberService.loginSelect(map);
		try {
			if(map2 !=null) {
				httpSession.setAttribute("SID", map.get("id"));
				
				String backUrl = (String) httpSession.getAttribute("BACK_URL");
				
				request.setAttribute("type", "success");
				request.setAttribute("msg", "로그인성공");
				request.setAttribute("url", "home");
				return "alert";
			}
		}
		catch (Exception e) {
			return "redirect:login";
		}
		request.setAttribute("type", "error");
		request.setAttribute("msg", "로그인실패");
		request.setAttribute("url", "login");
		return "alert";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpSession httpsession) {
		httpsession.invalidate(); //세션삭제
		
		request.setAttribute("type", "success");
		request.setAttribute("msg", "로그아웃");
		request.setAttribute("url", "home");
		return "alert";
		
	}
	
	// 회원정보 수정페이지로 가기
	@RequestMapping(value="profileup" , method = RequestMethod.GET)
	public String up(Model model, @RequestParam("mem_id") String mem_id) {
		
		
		model.addAttribute("profileup", memberService.profileup(mem_id));
		return "profileup";
	}
	
	// 회원정보 수정 데이터를 디비로 보내기
	@RequestMapping(value="profileup", method = RequestMethod.POST)
	public String up(@RequestParam Map<String, Object> map,
			Model model, @RequestParam("mem_id") String mem_id,
			@RequestParam("pw") String pw) {
		String MD_PW = EncryptionClass.convertiMD5(pw);
		
		map.put("pw", MD_PW);
		memberService.memberUpdate(map);//데이터넘기기
		model.addAttribute("profileup", memberService.profileup(mem_id));// model객체를 이용해서, view로 데이터전달/ 넘길 데이터의 이름과 변수에 넣을 데이터값을 넣음, 그값을 뷰로 넘겨줌
	
		return "redirect:/profile?mem_id="+mem_id;
		//redirect: 경로설정
	}

	@RequestMapping(value="createAuth", method = RequestMethod.POST)
	public String createAuth(@RequestParam Map<String, Object> map) throws UnsupportedEncodingException, MessagingException {
		memberService.createAuth(map);
		
		return "home";
	}
	
	@RequestMapping(value="emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(@RequestParam Map<String, Object> map, Model model) {
		String tmp = memberService.emailAuth(map);
		if(tmp.length() > 1) memberService.deleteAuth(map);
		return tmp;
	}
}
