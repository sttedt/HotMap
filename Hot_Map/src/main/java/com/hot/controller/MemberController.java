package com.hot.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "home";
	}
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	// param은 map을 받는다
	public String login(Model model) {
		return "login";
	}
	// join이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(Model model,@RequestParam("id") String id , HttpSession httpSession) {
		model.addAttribute("id",memberService.loginSelect(id));
		System.out.println(id);
		
		return "home";
	}
}
