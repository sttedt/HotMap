package com.hot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {
	

	@RequestMapping(value="store", method = RequestMethod.GET)
	public String store(Model model) {
		return "store";
	}
	
	@RequestMapping(value = "store", method = RequestMethod.POST)
	public String storeUp(Model model) {
		
		return "store";
	}
	
}
