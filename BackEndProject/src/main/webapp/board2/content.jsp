<%@page import="java.sql.SQLException"%>
<%@page import="board2.BoardDTO2"%>
<%@page import="board2.BoardDAO2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2/content.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
<%
String id = "";
if (session.getAttribute("id") != null && !session.getAttribute("id").equals("")) {
	id = (String) session.getAttribute("id");
}
%>
</head>
<body>
	<h1>board2/content.jsp</h1>
	<%
	int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO2 boardDAO = new BoardDAO2();
		BoardDTO2 board = null;
		try{
			board = boardDAO.getBoard(num);
		}catch(SQLException e){
			e.printStackTrace();
		}

		if (board != null) {
			board.setReadcount(board.getReadcount() + 1);
			String file = board.getFile();
	%>
	<p>
		로그인 :
		<%=id%></p>
	<table>
		<tr>
			<td>글번호</td>
			<td><%=board.getNum()%></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%=board.getName()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=board.getReadcount()%></td>
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
		if (file != null) {
		%>
		<tr>
			<td>첨부파일</td>
			<td><a href="./storage/<%=file%>" download><%=file%></a>
			<img src="./storage/<%=file%>"></td>
		</tr>
		<%
		}
		%>
		<%
		if (board.getName().equals(id)) {
		%>
		<tr>
			<td><a href="list.jsp" class="button btnLightBlue">글 목록</a></td>
			<td>
				<a href="update.jsp?num=<%=num%>" class="button btnLightBlue">글 수정</a> 
				<a href="delete.jsp?num=<%=num%>" class="button btnLightBlue">글 삭제</a>
			</td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td colspan="2"><a href="list.jsp" class="button btnLightBlue">글
					목록</a></td>
		</tr>

		<%
		}// if id
		%>
	</table>
	<%
	boardDAO.updateReadCount(board.getReadcount(), num);
	} //if
	%>

</body>
</html>