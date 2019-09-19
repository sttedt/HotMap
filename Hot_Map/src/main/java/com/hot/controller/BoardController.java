package com.hot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.service.BoardService;

@Controller // 컨트롤러니까 어노테이션을 써야댐
public class BoardController {
//boardservice라는것을 쓸거기때문에 
	@Autowired
	BoardService boardService;

	// 주소를 불러서 그쪽으로 출력 value값에 치고들어가는 주소를 적음
	// board이란 페이지를 불러오기위한 코드
	@RequestMapping(value="boardw", method = RequestMethod.GET)
	// param은 map을 받는다
	public String board(Model model) {
		return "boardw";
	}
	// join이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="boardw", method = RequestMethod.POST)
	public String board(@RequestParam Map<String, Object> map) {
		boardService.boardInsert(map);
		
		return "boardw";
	}
	
	// join이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="board", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("b_list", boardService.boardList());
		
		return "board";
	}

}
