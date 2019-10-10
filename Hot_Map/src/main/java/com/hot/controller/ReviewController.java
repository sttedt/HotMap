package com.hot.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	// review이란 페이지를 불러오기위한 코드
	@RequestMapping(value="review", method = RequestMethod.GET)
	// param은 map을 받는다
	public String rev(Model model,HttpSession httpSession, HttpServletRequest request, 
			 @RequestParam("St_NO") int St_NO ) {
		
		
		String no = (String) httpSession.getAttribute("SID");
		System.out.println("no : " + no);
		model.addAttribute("detail", reviewService.reviewOne(St_NO));
		if(no==null) {
			request.setAttribute("type", "error");
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("url", "login");
			return "alert";
		}
		return "review";
	}
	// 리뷰페이지에서 리뷰글을 보내는 코드
	// review란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="review", method = RequestMethod.POST)
	public String re(@RequestParam Map<String, Object> map,
			@RequestParam("St_NO") int St_NO) {
		map.put("St_NO", St_NO);
		reviewService.reviewInsert(map);
		System.out.println(map);
		return "redirect:/storer?St_NO="+St_NO;
	}
	
		//	 게시글 목록 페이지
		// board이란 페이지에 데이터를 보내기 위한 코드
//		@RequestMapping(value="reviewr", method = RequestMethod.GET)
//		public String list(Model model, @RequestParam Map<String, Object> map) {
//			model.addAttribute("r_list", reviewService.reviewList());
//			System.out.println("map : " + map);
//
//			
//			return "reviewr";
//		}
}
