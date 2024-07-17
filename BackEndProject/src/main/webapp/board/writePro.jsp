<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/writePro.jsp</title>
</head>
<body>
	<h1>board/writePro.jsp</h1>
	<%
	String id = "";

	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setName(request.getParameter("name"));
	boardDTO.setSubject(request.getParameter("subject"));
	boardDTO.setContent(request.getParameter("content"));
	boardDTO.setNum(1);
	boardDTO.setReadcount(0);
	boardDTO.setDate(new Timestamp(System.currentTimeMillis()));

	BoardDAO boardDAO = new BoardDAO();
	
	try{
		boardDTO.setNum(boardDAO.checkMaxBoardNum());
		boardDAO.insertBoard(boardDTO);
	}catch(SQLException e){
		session.setAttribute("resultM", "SQL 예외 발생");
		e.printStackTrace();
		response.sendRedirect("write.jsp");
	}
	response.sendRedirect("list.jsp");
	%>
</body>
</html>