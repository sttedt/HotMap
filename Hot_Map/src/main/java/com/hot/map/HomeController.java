package com.hot.map;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hot.service.StoreService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	StoreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<Map<String,Object>> list = storeService.storeList();
		for(int i = 0 ; i< list.size();i++) {
			String tmpString = (String) list.get(i).get("img");
			List<String> imgList =  storeService.get_imgList(tmpString);
			Map<String, Object> tmp1 = list.get(i);
			tmp1.put("img", imgList.get(0));
			list.set(i,tmp1);
		}
		//별점순 랭킹 10위 출력
		List<Map<String, Object>> rank = storeService.nowRank();
		System.out.println("rank : " +  rank);
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("s_list", list);
		model.addAttribute("rank", rank);
		return "home";
	}
	
}
