package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.Service01;
import com.choong.spr.service.Service02;



@Controller
@RequestMapping("project")
public class Controller01 {
	
	@Autowired
	private Service01 service;
	
	@Autowired
	private Service02 replyService;
	
	@GetMapping("board/list")
	public void listBoard(Model model) {
		List<BoardDto> list = service.listBoard();
		
		model.addAttribute("boardList", list);
		
	}
	
	@GetMapping("board/{id}")
	public String getBoard(@PathVariable("id") int id, Model model) {
		System.out.println(id);
		
		BoardDto dto = service.getBoard(id);
		
		List<ReplyDto> replyList = replyService.listReplyByBoardId(id);
		
		model.addAttribute("board", dto);
		model.addAttribute("replyList", replyList);
		
		return "/project/board/get";
	}
	
	@PostMapping("board/modify")
	public String modifyBoard(BoardDto board) {
		boolean success = service.updateBoard(board);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/project/board/" + board.getId();
	}
	
	@PostMapping("/board/remove")
	public String removeBoard(int id) {
		boolean success = service.removeBoardById(id);
		
		if (success) {
			
		} else {
			
		}
		
		return "redirect:/project/board/list";
	}
	
	@GetMapping("board/write")
	public void writeBoard() {
		
	}
	
	@PostMapping("board/write")
	public String writeBoardProcess(BoardDto board) {
		boolean success = service.addBoard(board);
		
		if(success) {
			
		} else {
			
		}
		
		return "redirect:/project/board/" + board.getId();
	}
}

