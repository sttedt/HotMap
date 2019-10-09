package com.hot.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.service.MemberService;
import com.hot.service.ProfileService;

@Controller
public class ProfileController {

	@Autowired
	ProfileService ps;
	@Autowired
	MemberService ms;

	@RequestMapping(value = "profile_check", method = RequestMethod.GET)
	public String profile_check_get(Model model, HttpSession ss) {
		return "profile_check";
	}

	@RequestMapping(value = "profile_check", method = RequestMethod.POST)
	public String profile_check_post(Model model, @RequestParam Map<String, Object> map) {
		Map<String, Object> data = ms.loginSelect(map);
		if (data == null) {
			return "redirect:/profile_check";
		} else {
			return "redirect:/profile";
		}
	}

	@RequestMapping(value = "profile")
	public String show(Model model, HttpSession ss) {
		String mem_id = (String) ss.getAttribute("SID");
		model.addAttribute("pro", ps.profile(mem_id));
		return "profile";
	}

}
