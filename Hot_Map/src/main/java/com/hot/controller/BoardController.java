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

import com.hot.service.BoardService;

@Controller // 컨트롤러니까 어노테이션 쓴다
public class BoardController {
	
	//boardservice라는것을 쓸거기때문에 
	@Autowired
	BoardService boardService;

	// 글쓰기 페이지 불러오기
	@RequestMapping(value="boardw", method = RequestMethod.GET)
	// param은 map을 받는다
	public String board(Model model,HttpSession httpSession, HttpServletRequest request) {
		String no = (String) httpSession.getAttribute("SID");
		System.out.println("no : " + no);
		if(no==null) {
			request.setAttribute("type", "error");
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("url", "login");
			return "alert";
		}
		return "boardw";
	}
	
	// 글쓰기페이지에서 데이터 디비로 보내기
	@RequestMapping(value="boardw", method = RequestMethod.POST)
	public String board(@RequestParam Map<String, Object> map) {
		boardService.boardInsert(map);
		
		return "redirect:board";
	}
	
	// 게시글 목록 페이지
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
	public String up(Model model, @RequestParam("Brd_NO") int Brd_NO, HttpSession httpSession, HttpServletRequest request) {
		model.addAttribute("upd", boardService.upd(Brd_NO));
		String no = (String) httpSession.getAttribute("SID");
		System.out.println("no : " + no);
		if(no==null) {
			request.setAttribute("type", "error");
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("url", "login");
			return "alert";
		}
		return "boardup";
	}
	
	// 게시글 수정 후 디비에 보내는 코드
	@RequestMapping(value="upd", method = RequestMethod.POST)
	public String up(@RequestParam Map<String, Object> map,
			Model model, @RequestParam("Brd_NO") int Brd_NO) {
		boardService.boardUpdate(map);//데이터넘기기
		model.addAttribute("upd", boardService.upd(Brd_NO));// model객체를 이용해서, view로 데이터전달/ 넘길 데이터의 이름과 변수에 넣을 데이터값을 넣음, 그값을 뷰로 넘겨줌
		return "redirect:/boardr?Brd_NO="+Brd_NO;
		//redirect: 경로설정
	}
	
	// 게시글 삭제 
	@RequestMapping(value="boardd" , method = RequestMethod.GET)
	public String del(@RequestParam Map<String, Object> map, 
			Model model,HttpServletRequest request, HttpSession httpSession) {
		boardService.boardDelete(map);//데이터넘기기
//		model.addAttribute("b_list", boardService.boardList()); 위에 보드에서 board.jsp 화면에서 데이터까지 나오게 되는 값
<<<<<<< HEAD
		String no = (String) httpSession.getAttribute("SID");
		System.out.println("no : " + no);
		if(no==null) {
			request.setAttribute("type", "error");
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("url", "login");
			return "alert";
		}
=======
>>>>>>> branch 'master' of https://github.com/sttedt/HotMap.git
		return "redirect:/board";
		// 주소가 boardd?Brd_NO=815 에서 결과값이 board의 주소창으로 된다
	}
}
