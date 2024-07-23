package com.itwillbs.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class BoardService {
	BoardDAO boardDAO = new BoardDAO();
	
	public boolean insertBoard(HttpServletRequest request) {
		boolean result = false;
		BoardDTO board = new BoardDTO();
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setNum(1);
		board.setReadCount(0);
		board.setDate(new Timestamp(System.currentTimeMillis()));
		try {
			board.setNum(boardDAO.checkMaxBoardNum());
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("중복 체크 sql 오류");
		}
		try {
			boardDAO.insertBoard(board);
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("글쓰기 실패");
			result = false;
		}
		return result;
	}// insertBoard()
	
	public ArrayList<BoardDTO> getBoardList(){
		ArrayList<BoardDTO> boardList = null;
		try {
			boardList = boardDAO.getBoardList();
		} catch (SQLException e) {
			e.printStackTrace();
			boardList = null;
			System.out.println("게시글 리스트 조회 실패");
		}
		return boardList;
	}// getBoardList()
	
	public BoardDTO getBoard(int num) {
		BoardDTO board = null;
		try {
			board = boardDAO.getBoard(num);
		} catch (SQLException e) {
			e.printStackTrace();
			board = null;
			System.out.println("게시글 조회 실패");
		}
		return board;
	}// getBoard()
	
	public boolean updateReadCount(BoardDTO board) {
		boolean result = false; 
		try {
			boardDAO.updateReadCount(board.getReadCount(), board.getNum());
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("게시글 조회수 수정 실패");
			result = false;
		}
		return result;
	}// updateReadCount()
	
	public boolean updateBoard(HttpServletRequest request) {
		boolean result = false;
		BoardDTO board = new BoardDTO();
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null && 
				session.getAttribute("id").equals(request.getParameter("name"))) {
			board.setNum(Integer.parseInt(request.getParameter("num")));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			try {
				boardDAO.updateBoard(board);
				result = true;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("게시글 수정 실패");
				result = false;
			}
		}
		
		return result;
	}// updateBoard()
	
	public boolean deleteBoard(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		try {
			boardDAO.deleteBoard(num, (String)session.getAttribute("id"));
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("게시글 삭제 실패");
			result = false;
		}
		return result;
	}
}
