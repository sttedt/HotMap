package com.hot.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hot.service.BoardService;
import com.hot.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;

	@RequestMapping(value = "store", method = RequestMethod.GET)
	public String store(Model model) {
		return "store";
	}

	@RequestMapping(value = "store", method = RequestMethod.POST)
	public String storeUp(@RequestParam("file") List<MultipartFile> list, @RequestParam Map<String, Object> map, Model model) {
		storeService.storeInsert(map);
		for (int i = 0; i < list.size(); i++) {
			storeService.saveFile(list.get(i));
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test_get(Model model) {
		return "test";
	}

	@RequestMapping(value = "test", method = RequestMethod.POST)
	public String test_post(@RequestParam("file") List<MultipartFile> list, @RequestParam Map<String, Object> map,
			Model model) {
		return "redirect:/test";
	}
	
	@RequestMapping(value="storel", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("s_list", storeService.storeList());
		
		return "redirect:/home";
	}
	@RequestMapping(value="storer")
	public String show(Model model, @RequestParam("St_NO") int St_NO) {
		System.out.println(storeService.storeOne(St_NO));
		model.addAttribute("detail", storeService.storeOne(St_NO));
		return "storer";
	}
}
