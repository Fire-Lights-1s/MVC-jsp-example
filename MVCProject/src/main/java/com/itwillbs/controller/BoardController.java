package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.service.BoardService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		System.out.println("가상 주소 : " + sPath);
		
		if(sPath.equals("/write.bo")) {
			System.out.println("write.bo 가상 주소 일치 ");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/write.jsp");
			dispatcher.forward(request, response);
		}//if write.bo
		if(sPath.equals("/writePro.bo")) {
			System.out.println("writePro.bo 가상 주소 일치 ");
			BoardService boardService = new BoardService();
			
			if(boardService.insertBoard(request)) {
				response.sendRedirect("main.me");
			}else {
				response.sendRedirect("write.bo");
			}
		}//if writePro.bo
		if(sPath.equals("/list.bo")){
			System.out.println("list.bo 가상 주소 일치 ");
			BoardService boardService = new BoardService();
			ArrayList<BoardDTO> boardList = boardService.getBoardList();
			request.setAttribute("boardList", boardList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/list.jsp");
			dispatcher.forward(request, response);
		}//if list.bo
		if(sPath.equals("/content.bo")) {
			System.out.println("content.bo 가상 주소 일치 ");
			boolean checkFail = false;
			BoardService boardService = new BoardService();
			BoardDTO board = boardService.getBoard(Integer.parseInt(request.getParameter("num")));
			if(board != null) {
				board.setReadCount(board.getReadCount()+1);
				if(!boardService.updateReadCount(board)) checkFail = true;
				request.setAttribute("boardDTO", board);
			}else checkFail = true;
			
			if(checkFail){
				RequestDispatcher dispatcher = request.getRequestDispatcher("board/list.jsp");
				dispatcher.forward(request, response);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/content.jsp");
			dispatcher.forward(request, response);
		}//if context.bo
		if(sPath.equals("/update.bo")) {
			System.out.println("update.bo 가상 주소 일치 ");
			BoardService boardService = new BoardService();
			BoardDTO board = boardService.getBoard(Integer.parseInt(request.getParameter("num")));
			request.setAttribute("boardDTO", board);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("board/update.jsp");
			dispatcher.forward(request, response);
		}//if update.bo
		if(sPath.equals("/updatePro.bo")) {
			System.out.println("update.bo 가상 주소 일치 ");
			BoardService boardService = new BoardService();
			if(boardService.updateBoard(request)) {
				response.sendRedirect("content.bo?num="+request.getParameter("num"));
			}else {
				response.sendRedirect("list.bo");
			}
		}//if updatePro.bo
		if(sPath.equals("/delete.bo")) {
			System.out.println("delete.bo 가상 주소 일치 ");
			BoardService boardService = new BoardService();
			if(boardService.deleteBoard(request)) {
				response.sendRedirect("list.bo");
			}else {
				response.sendRedirect("content.bo?num="+request.getParameter("num"));
			}
		}//if delete.bo
	}
}
