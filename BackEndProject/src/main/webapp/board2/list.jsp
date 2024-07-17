<%@page import="java.util.ArrayList"%>
<%@page import="board2.BoardDTO2"%>
<%@page import="board2.BoardDAO2"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/list.jsp</title>
<link rel='stylesheet' href="../css/table.css">
</head>
<body>
	<h1>board2/list.jsp</h1>
	<%
	String id = "";

	int num, readCount;
	String name, subject;
	Timestamp date;

	if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
		id = (String) session.getAttribute("id");
	}

	BoardDAO2 boardDAO = new BoardDAO2();
	ArrayList<BoardDTO2> boardList = null;

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
		if (boardList != null && !boardList.isEmpty()) {
			for (BoardDTO2 board : boardList) {
		%>
		<tr>
			<td><a href="content.jsp?num=<%=board.getNum()%>"><%=board.getNum()%></a></td>
			<td><%=board.getNum()%></td>
			<td><a href="content.jsp?num=<%=board.getNum()%>"><%=board.getSubject()%></a></td>
			<td><%=board.getReadcount()%></td>
			<td><%=board.getDate()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<a href="../member2/main.jsp">go to main</a>
	<br>
</body>
</html>