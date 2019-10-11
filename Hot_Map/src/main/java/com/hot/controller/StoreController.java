package com.hot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hot.service.ReviewService;
import com.hot.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	StoreService storeService;
	
	@Autowired
	ReviewService reviewService;

	@RequestMapping(value = "store", method = RequestMethod.GET)
	public String store(Model model) {
		return "store";
	}

	@RequestMapping(value = "store", method = RequestMethod.POST)
	public String storeUp(@RequestParam("file") List<MultipartFile> img, @RequestParam Map<String, Object> map, Model model, @RequestParam("tag_end") String tag_end) throws Exception {
		
		map.put("hash", tag_end);
		
		System.out.println("map : " + map);
		storeService.storeInsert(map, img);
		return "redirect:/home";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test_get(Model model) {
		return "test";
	}

	@RequestMapping(value = "test", method = RequestMethod.POST)
	public String test_post(@RequestParam("file") List<MultipartFile> file, @RequestParam("test1") List<Object> list, @RequestParam Map<String, Object> map,
			Model model) throws Exception {
		Map<String, Object> tmp = new HashMap<String, Object>();
		
		for(MultipartFile mFile : file) {
			storeService.storeFile(mFile);
		}
		return "redirect:/test";
	}
	
	@RequestMapping(value="storel", method = RequestMethod.GET)
	public String list(Model model, Map<String, Object> map) {
		model.addAttribute("s_list", storeService.storeList());
		System.out.println("map : " + map);
		return "redirect:/home";
	}
	
	// 스토어 상세페이지
	@RequestMapping(value="storer")
	public String show(Model model, @RequestParam("St_NO") int St_NO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("St_NO",St_NO);
		storeService.hitUpdate(map);
		List<Map<String, Object>> rList = reviewService.reviewList(St_NO);
		
		//return받은 store map에서 img 필드만 가지고와서 string split 하는 작업
		List<String> imgList= storeService.get_imgList((String)storeService.storeOne(St_NO).get("img"));
		
		model.addAttribute("r_list", rList);
		model.addAttribute("detail", storeService.storeOne(St_NO));
		return "storer";
	}
	

}
