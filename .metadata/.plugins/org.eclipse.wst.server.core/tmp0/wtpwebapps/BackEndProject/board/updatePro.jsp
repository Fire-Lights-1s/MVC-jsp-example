<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updatePro.jsp</title>
</head>
<body>
	<h1>board/updatePro.jsp</h1>
	<%
	BoardDTO board = new BoardDTO();

	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		board.setName((String) session.getAttribute("id"));
	}
	board.setNum(Integer.parseInt(request.getParameter("num")));
	board.setSubject(request.getParameter("subject"));
	board.setContent(request.getParameter("content"));

	BoardDAO boardDAO = new BoardDAO();
	try {
		boardDAO.updateBoard(board);
	} catch (SQLException e) {
		e.printStackTrace();
	}

	response.sendRedirect("content.jsp?num=" + board.getNum());
	%>


</body>
</html>