<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp7/main.jsp</title>
</head>
<body>
	<h1>jsp7/main.jsp</h1>
<%
	String id = null;
	if(session.getAttribute("id") != null && !session.getAttribute("id").equals("")){
		id = (String)session.getAttribute("id");
	}
	%>
	<%if(id != null){ %>
		<h2><%=	id%> 님이 로그인 했습니다.</h2>	
		<a href="logout.jsp">로그아웃</a><br>
		<a href="info.jsp">회원정보 보기</a><br>
		<a href="update.jsp">회원정보 수정</a><br>
		<a href="delete.jsp">회원정보 삭제</a><br>
		<a href="../jsp8/write.jsp">글쓰기</a><br>
		<a href="../jsp8/list.jsp">글목록</a><br>
		
		<%if(id.equals("admin")){ %>
			<a href="list.jsp">회원 목록</a><br>
		<%}//if admin %>
	<%
	}else{
		response.sendRedirect("login.jsp");
	%>
		<h2>로그인 정보가 없습니다.</h2>	
		<a href="login.jsp">로그인</a>
	<%} %>
</body>
</html>