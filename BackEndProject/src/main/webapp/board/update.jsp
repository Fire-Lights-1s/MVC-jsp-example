<%@page import="board.BoardDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.cj.jdbc.exceptions.SQLError"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/update.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
<h1>board/update.jsp</h1>
<%
String id = "";
	String subject = "";
	String content = "";
	int num = Integer.parseInt(request.getParameter("num"));
	
	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}
	
	BoardDTO board;
	BoardDAO boardDAO = new BoardDAO();
	Connection conn = boardDAO.connection();

	try{
		board = boardDAO.getBoard(num);
	} catch(SQLException e){
		e.printStackTrace();
		board = null;
	}

	if (board != null) {
		subject = board.getSubject();
		content = board.getContent();
	}
%>
<form action="updatePro.jsp" method="post">
	<table>
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="num" value="<%=num%>"
			class='input_border' readonly></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="name" value="<%=id%>"
			class='input_border' readonly></td>
		</tr>
		<tr>
			<td>글제목</td><td><input type="text" name="subject" value="<%=subject%>"
			class='input_border' ></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><textarea rows="10" cols="20" name="content" 
			class='input_border resize_none' ><%=content%></textarea></td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="글 수정"></td></tr>
	</table>
	</form>
</body>
</html>