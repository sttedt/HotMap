package com.hot.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hot.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	// 리뷰 쓰기 페이지 불러오기
	@RequestMapping(value="review", method = RequestMethod.GET)
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
	
	// 리뷰 데이터를 디비에 보내기
	@RequestMapping(value="review", method = RequestMethod.POST)
	public String re(@RequestParam("file") List<MultipartFile> list, @RequestParam Map<String, Object> map,
			@RequestParam("St_NO") int St_NO) throws Exception {
		map.put("St_NO", St_NO);
		reviewService.reviewInsert(map, list);
		return "redirect:/storer?St_NO="+St_NO;
	}
	
	// 리뷰 수정페이지
	@RequestMapping(value="reviewu", method = RequestMethod.GET)
	public String reviewu_get(Model model, @RequestParam Map<String, Object> map) {
		Map<String, Object> tmp = reviewService.getReview(map);
		model.addAttribute("data", tmp);
		return "reviewu";
	}
	
	// 리뷰 수정데이터디비 보내기
	@RequestMapping(value="reviewu", method = RequestMethod.POST)
	public String reviewu_post(@RequestParam("file") List<MultipartFile> file, @RequestParam Map<String, Object> map,@RequestParam(value = "uploadimg", defaultValue="") List<String> uploadimg, int St_NO) throws Exception {
		
		map.put("uploadimg", uploadimg);
		map.put("file", file);
		
		reviewService.reviewUpdate(map);
		
		return "redirect:/storer?St_NO="+St_NO;
	}
	
	// 리뷰 삭제
	@RequestMapping(value="reviewd", method = RequestMethod.GET)
	public String reviewd_get(Model model,HttpSession httpSession, HttpServletRequest request, @RequestParam Map<String, Object> map ) throws Exception {
		reviewService.reviewDelete(map);
		return "redirect:/storer?St_NO="+map.get("St_NO");
	}
	
}
