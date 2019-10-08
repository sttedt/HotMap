package com.hot.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.service.MemberService;

@Controller // 컨트롤러니까 어노테이션을 써야댐
public class MemberController {
//memberservice라는것을 쓸거기때문에 
	@Autowired
	MemberService memberService;

	// 주소를 불러서 그쪽으로 출력 value값에 치고들어가는 주소를 적음
	// join이란 페이지를 불러오기위한 코드
	@RequestMapping(value="join", method = RequestMethod.GET)
	// param은 map을 받는다
	public String join(Model model) {
		return "join";
	}
	// join이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="join", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, Object> map) {
		memberService.joinInsert(map);
		memberService.phoneCheckDelete(map);
		memberService.deleteAuth(map);
		return "home";
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	// param은 map을 받는다
	public String login(Model model) {
		return "login";
	}
	
	// login이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam Map<String, Object> map , HttpSession httpSession, HttpServletRequest request) {
		Map<String, Object> map2 = memberService.loginSelect(map);
		System.out.println("map2 : " + map2);
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
	@RequestMapping(value = "logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpSession httpsession) {
		httpsession.invalidate(); //세션삭제
		
		request.setAttribute("type", "success");
		request.setAttribute("msg", "로그아웃");
		request.setAttribute("url", "home");
		return "alert";
		
	}
	
	// 해당 아이디 비번 등이 적힌 수정하는 페이지로 가는 코드
	@RequestMapping(value="profileup" , method = RequestMethod.GET)
	public String up(Model model, @RequestParam("mem_id") String mem_id) {
		System.out.println(memberService.profileup(mem_id));
		model.addAttribute("profileup", memberService.profileup(mem_id));
		return "profileup";
	}
	
	// 게시글 수정을 하고난 다음에  데이터베이스에 보내는 코드
	@RequestMapping(value="profileup", method = RequestMethod.POST)
	public String up(@RequestParam Map<String, Object> map,
			Model model, @RequestParam("mem_id") String mem_id) {
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
