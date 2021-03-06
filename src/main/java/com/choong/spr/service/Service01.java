package com.choong.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.mapper.Mapper01;
import com.choong.spr.mapper.Mapper02;

@Service
public class Service01 {

	@Autowired
	private Mapper01 mapper;
	
	@Autowired
	private Mapper02 replyMapper;
	
	public String getCustomerNameById(int id) {
		return mapper.selectCustomerNameById(id);
	}

	public String getEmployeeFirstNameById(int id) {
		return mapper.selectEmployeeFirstNameById(id);
	}

	public List<BoardDto> listBoard() {
		return mapper.selectBoard();
	}

	public BoardDto getBoard(int id) {
		return mapper.getBoard(id);
	}

	public boolean updateBoard(BoardDto board) {
		int cnt = mapper.updateBoard(board);
		
		return cnt == 1;
	}

	@Transactional
	public boolean removeBoardById(int id) {
		// 댓글 지우기
		replyMapper.deleteReplyByBoard(id);

		// for transaction
		// exception
//		int i = 3 / 0;
		
		// 게시물 지우기
		int cnt = mapper.deleteBoard(id);
		
		return cnt == 1;
	}

	public boolean addBoard(BoardDto board) {
//		board.setInserted(LocalDateTime.now());
		
		int cnt = mapper.insertBoard(board);
		
		return cnt == 1;
	}
}
