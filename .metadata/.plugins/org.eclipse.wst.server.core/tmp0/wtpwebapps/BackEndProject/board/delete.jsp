<%@page import="java.sql.SQLException"%>
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
<title>board/delete.jsp</title>
</head>
<body>
	<h1>board/delete.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
		String id = "";
		
		if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
			id = (String) session.getAttribute("id");
		}
		
		BoardDAO boardDAO = new BoardDAO();
		try{
			boardDAO.deleteBoard(num, id);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		response.sendRedirect("list.jsp");
	%>

</body>
</html>