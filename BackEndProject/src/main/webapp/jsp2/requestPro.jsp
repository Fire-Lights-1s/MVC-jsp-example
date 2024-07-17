<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/requestPro.jsp</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
	<h1>jsp2/requestPro.jsp</h1>
	<table>
		<tr>
			<td class="selfINFO">폼에서 입력한 아이디</td>
			<td><%=request.getParameter("id") %></td>
		</tr>
		<tr>
			<td class="selfINFO">폼에서 입력한 비밀번호</td>
			<td><%=request.getParameter("pass") %></td>
		</tr>
		<tr>
			<td>현 페이지 정보(request)</td>
			<td><%=pageContext.getRequest().getParameter("id")%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(session)</td>
			<td><%=pageContext.getSession().getAttribute("id")%></td>
		</tr>
		<tr>
			<td><a href="requestPro2.jsp?
			id=<%=request.getParameter("id")%>
			&pass=<%=request.getParameter("pass")%>">requestPro2.jsp</td>
			<td></td>
		</tr>
	</table>
</body>
</html>