package com.hot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.service.searchService;

@Controller
public class searchController {

	@Autowired
	searchService searchService;
	
	@RequestMapping(value="search", method = RequestMethod.GET)
	public String search(Model model, Map<String, Object> map, @RequestParam("search") String search) {
		map.put("search" , search);
		List<Map<String, Object>> searchList = searchService.searchList(search);
		model.addAttribute("search_list", searchList);
		return "search";
	}

}
