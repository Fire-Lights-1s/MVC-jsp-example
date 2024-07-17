<%@page import="java.sql.SQLException"%>
<%@page import="board.BoardDTO"%>
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
<title>board/content.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
<%
String id = "";
if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
	id = (String) session.getAttribute("id");
}
%>
</head>
<body>
	<h1>board/content.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	int readCount = 0;
	String name = "";

	BoardDTO board;
	BoardDAO boardDAO = new BoardDAO();
	
	try{
		board = boardDAO.getBoard(num);
	}catch(SQLException e){
			e.printStackTrace();	
		board = null;
	}

	if (board != null) {
		num = board.getNum();
		readCount = board.getReadcount() + 1;
		name = board.getName();
	%>
	<p>
		로그인 :
		<%=id%></p>
	<table>
		<tr>
			<td>글번호</td>
			<td><%=num%></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=readCount%></td>
		</tr>
		<tr>
			<td>글 작성 날짜</td>
			<td><%=board.getDate()%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><%=board.getSubject()%></td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><%=board.getContent().replace("\n", "<br>")%></td>
		</tr>
		<%
		if (name.equals(id)) {
		%>
		<tr>
			<td><a href="update.jsp?num=<%=num%>"
				class="button btnLightBlue">글 수정</a></td>
			<td><a href="delete.jsp?num=<%=num%>"
				class="button btnLightBlue">글 삭제</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
		try{
			boardDAO.updateReadCount(readCount, num);
		}catch(SQLException e){
			e.printStackTrace();	
		}
	} //if
	%>

	<a href="list.jsp">글 목록 돌아가기</a>
</body>
</html>