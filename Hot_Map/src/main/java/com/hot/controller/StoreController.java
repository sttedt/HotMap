package com.hot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hot.md5.EncryptionClass;
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
//		Map<String, Object> tmp = new HashMap<String, Object>();
//		
//		for(MultipartFile mFile : file) {
//			storeService.storeFile(mFile);
//		}
//		
//		String encrypttest = EncryptionClass.convertiMD5((String) map.get("test1"));
//		
//		System.out.println(encrypttest);
		String removeImg = (String)map.get("removeImg");
		storeService.deleteFile(removeImg);
		return "redirect:/test";
	}
	
	// 스토어 목록 
	@RequestMapping(value="storelist_sum", method = RequestMethod.GET)
	public String listSum(Model model, Map<String, Object> map) {
		model.addAttribute("s_list", storeService.storeListSum());
		System.out.println("map : " + map);
		return "storelist_sum";
	}
	
	// 스토어 목록 6개 띄우기
	@RequestMapping(value="storel", method = RequestMethod.GET)
	public String list(Model model, Map<String, Object> map) {
		model.addAttribute("s_list", storeService.storeList());
		System.out.println("map : " + map);
		return "redirect:/home";
	}
	
	// 스토어 상세페이지
	@RequestMapping(value="storer")
	public String show(Model model, @RequestParam("St_NO") int St_NO,
			HttpServletResponse response, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("St_NO",St_NO);
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		if(cookies != null&& cookies.length > 0 ) {
			for(int i=0; i< cookies.length; i++) {
				if(cookies[i].getName().equals("cookie" + St_NO)) {
					System.out.println("쿠키 생성후 돌아옴");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(viewCookie == null) {
			Cookie newCookie = new Cookie("cookie"+St_NO, "|" + St_NO + "|");
			response.addCookie(newCookie);
			storeService.hitUpdate(map);
			
		}
		//평균별점 업데이트
		reviewService.reviewStarUpdate(map);
		List<Map<String, Object>> rList = reviewService.reviewList(St_NO);
		List<String> imglist = storeService.getAllImage(St_NO);
		Map<String,Object> detail = storeService.storeOne(St_NO);
		//return받은 store map에서 img 필드만 가지고와서 string split 하는 작업... 필요하면쓰기...
//		List<String> imgList= storeService.get_imgList((String)storeService.storeOne(St_NO).get("img"));
		
		int slide_page_cnt = 1, slide_img_cnt = 4;
		
		slide_page_cnt += imglist.size() / slide_img_cnt;
		if(imglist.size() % slide_img_cnt == 0 ) slide_page_cnt--;
		
		int detail_star = 0;
		for(int i = 0; i< rList.size(); i++) {
			detail_star += (int)rList.get(i).get("star");
		}
		if(rList.size() > 0) detail.put("star", detail_star / rList.size());
		else detail.put("star", detail_star);
		model.addAttribute("slide_page_cnt", slide_page_cnt);
		model.addAttribute("slide_img_cnt", slide_img_cnt);
		model.addAttribute("imglist",imglist);
		model.addAttribute("reviewCount",rList.size());
		model.addAttribute("r_list", rList);
		model.addAttribute("detail", detail);
		return "storer";
	}
	@RequestMapping(value="storeUpdate", method = RequestMethod.GET)
	public String storUpdate(Model model, @RequestParam("St_NO") int St_NO, 
			HttpServletResponse response, HttpServletRequest request, HttpSession httpSession) {
			String no = (String) httpSession.getAttribute("SID");
			model.addAttribute("storeUpdateOne", storeService.storeUpdateOne(St_NO));
			if(no==null) {
				request.setAttribute("type", "error");
				request.setAttribute("msg", "세션이 만료되었습니다. 다시 로그인 해주세요");
				request.setAttribute("url", "login");
				return "alert";
			}
		
		
		return "storeUpdate";
	}

}
