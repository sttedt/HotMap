package com.hot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hot.service.BoardService;

@Controller // 컨트롤러니까 어노테이션을 써야댐
public class BoardController {
//boardservice라는것을 쓸거기때문에 
	@Autowired
	BoardService boardService;

	// 글쓰기 페이지
	// 주소를 불러서 그쪽으로 출력 value값에 치고들어가는 주소를 적음
	// board이란 페이지를 불러오기위한 코드
	@RequestMapping(value="boardw", method = RequestMethod.GET)
	// param은 map을 받는다
	public String board(Model model) {
		return "boardw";
	}
	
	// 글쓰기페이지에서 글을 보내는 코드
	// boardw란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="boardw", method = RequestMethod.POST)
	public String board(@RequestParam Map<String, Object> map) {
		boardService.boardInsert(map);
		
		return "boardw";
	}
	
	// 게시글 목록 페이지
	// board이란 페이지에서 데이터를 보내기 위한 코드
	@RequestMapping(value="board", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("b_list", boardService.boardList());
		
		return "board";
	}
	
	// 게시글 상세페이지
	@RequestMapping(value="boardr")
	public String show(Model model, @RequestParam("Brd_NO") int Brd_NO) {
		model.addAttribute("detail", boardService.boardOne(Brd_NO));
		return "boardr";
	}
	
	// 게시글 수정페이지로 가기위한 코드
	@RequestMapping(value="upd" , method = RequestMethod.GET)
	public String up(Model model, @RequestParam("Brd_NO") int Brd_NO) {
		model.addAttribute("upd", boardService.upd(Brd_NO));
		return "boardup";
	}
	
	// 게시글 수정을 하고난 다음에  데이터베이스에 보내는 코드
	@RequestMapping(value="upd", method = RequestMethod.POST)
	public String up(@RequestParam Map<String, Object> map,
			Model model, @RequestParam("Brd_NO") int Brd_NO) {
		boardService.boardUpdate(map);//데이터넘기기
		model.addAttribute("upd", boardService.upd(Brd_NO));// model객체를 이용해서, view로 데이터전달/ 넘길 데이터의 이름과 변수에 넣을 데이터값을 넣음, 그값을 뷰로 넘겨줌
	
		return "redirect:/boardr?Brd_NO="+Brd_NO;
		//redirect: 경로설정
	}
	
	// 게시글 삭제 하기위한 코드
	@RequestMapping(value="boardd" , method = RequestMethod.GET)
	public String del(@RequestParam Map<String, Object> map, 
			Model model) {
		boardService.boardDelete(map);//데이터넘기기
//		model.addAttribute("b_list", boardService.boardList());
		
		return "redirect:/board";
	}

}
