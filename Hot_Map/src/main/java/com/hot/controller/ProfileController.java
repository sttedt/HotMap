package com.hot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hot.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService ps;

	@RequestMapping(value="profile")
	public String show(Model model, HttpSession ss) {
		String mem_id = (String)ss.getAttribute("SID");
		model.addAttribute("pro", ps.profile(mem_id));
		return "profile";
	}
	

}
