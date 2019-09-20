package com.hot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.service.MemberService;

@Controller
public class AjaxController {
	@Autowired
	MemberService MemberService;
	
	@RequestMapping(value="ajax_id_check", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
	public @ResponseBody Map<String, Object> ajaxIdCheck(
			@RequestParam Map<String, Object> map){
		map.get("id");
		System.out.println("map  : " + map);
		Map<String, Object> map2 = MemberService.joinIdCheck(map);
		
		System.out.println("map2 : " + map2);
		
		int map3 = Integer.parseInt( map2.get("CON").toString());
		System.out.println("map3 : " + map3);

		try {
			map.put("ret", "n");
			System.out.println("map n : " + map);
			if(map3 == 1) 
				map.put("ret", "y");
			System.out.println("map y : " + map);
			return map;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			map.put("ret", "n");
			return map;
		}
	}

}
