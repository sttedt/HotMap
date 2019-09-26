package com.hot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.service.BoardService;
import com.hot.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@RequestMapping(value="store", method = RequestMethod.GET)
	public String store(Model model) {
		return "store";
	}
	
	@RequestMapping(value = "store", method = RequestMethod.POST)
	public String storeUp(@RequestParam Map<String, Object> map,Model model) {
		storeService.storeInsert(map);
		return "redirect:/home";
	}
	
}
