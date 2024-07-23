<%@page import="com.itwillbs.domain.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
<link rel='stylesheet' href="${pageContext.request.contextPath }/css/table.css">
</head>
<body>
	<h1>board/list.jsp</h1>
	<table>
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>글제목</td>
			<td>조회수</td>
			<td>글 작성 날짜</td>
		</tr>
		<c:set var="boardList" value="${requestScope.boardList }"></c:set>
		<c:if test="${! empty boardList }">
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td><a href="content.bo?num=${board.getNum()}">${board.getNum()}</a></td>
					<td>${board.getName()}</td>
					<td><a href="content.bo?num=${board.getNum()}">${board.getSubject()}</a></td>
					<td>${board.getReadCount()}</td>
					<td>${board.getDate()}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<a href="main.me">go to main</a>
	<br>
</body>
</html>