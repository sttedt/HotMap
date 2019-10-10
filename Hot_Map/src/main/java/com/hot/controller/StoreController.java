package com.hot.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

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
	public String storeUp(@RequestParam("img1") MultipartFile img1, @RequestParam("img2") MultipartFile img2, @RequestParam("img3") MultipartFile img3, 
			@RequestParam Map<String, Object> map, Model model, @RequestParam("tag_end") String tag_end) throws Exception {
		
		map.put("hash", tag_end);
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
		if(img1.getSize() > 0) fileList.add(img1);
		if(img2.getSize() > 0) fileList.add(img2);
		if(img3.getSize() > 0) fileList.add(img3);
		System.out.println("map : " + map);
		storeService.storeInsert(map, fileList);
		return "redirect:/home";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test_get(Model model) {
		return "test";
	}

	@RequestMapping(value = "test", method = RequestMethod.POST)
	public String test_post(@RequestParam("file") MultipartFile file, @RequestParam("test1") List<Object> list, @RequestParam Map<String, Object> map,
			Model model) throws Exception {
		Map<String, Object> tmp = new HashMap<String, Object>();
		System.out.println(list);
		System.out.println(map);
		return "redirect:/test";
	}
	
	@RequestMapping(value="storel", method = RequestMethod.GET)
	public String list(Model model, Map<String, Object> map) {
		model.addAttribute("s_list", storeService.storeList());
		System.out.println("map : " + map);
		return "redirect:/home";
	}
	@RequestMapping(value="storer")
	public String show(Model model, @RequestParam("St_NO") int St_NO) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("St_NO",St_NO);
		storeService.hitUpdate(map);
		model.addAttribute("detail", storeService.storeOne(St_NO));
		return "storer";
	}
	

}
