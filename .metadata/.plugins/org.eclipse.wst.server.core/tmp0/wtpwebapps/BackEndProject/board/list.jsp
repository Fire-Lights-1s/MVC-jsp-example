<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
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
<title>board/list.jsp</title>
<link rel='stylesheet' href="../css/table.css">
</head>
<body>
	<h1>board/list.jsp</h1>
	<%
	String id = "";
	ArrayList<BoardDTO> boardList = null;

	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}

	BoardDAO boardDAO = new BoardDAO();

	try {
		boardList = boardDAO.getBoardList();
	} catch (SQLException e) {
		e.printStackTrace();
	} //try catch
	%>
	<table>
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>글제목</td>
			<td>조회수</td>
			<td>글 작성 날짜</td>
		</tr>
		<%
		if (boardList != null) {
			for (int i = 0; i < boardList.size(); i++) {
				BoardDTO board = boardList.get(i);
		%>
		<tr>
			<td><a href="content.jsp?num=<%=board.getNum()%>"><%=board.getNum()%></a></td>
			<td><%=board.getName()%></td>
			<td><a href="content.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
			<td><%=board.getReadcount()%></td>
			<td><%=board.getDate()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<a href="../member/main.jsp">go to main</a>
	<br>
</body>
</html>