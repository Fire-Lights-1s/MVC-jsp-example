<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/pageContext.jsp</title>
</head>
<body>
	<h1>jsp2/pageContext.jsp</h1>
	<%

	%>
	<table>
		<tr>
			<td>현 페이지 정보(request)</td>
			<td><%=pageContext.getRequest().getParameter("id")%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(response)</td>
			<td><%=pageContext.getResponse()%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(page)</td>
			<td><%=pageContext.getPage()%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(session)</td>
			<td><%=pageContext.getSession().getAttribute("id")%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(application)</td>
			<td><%=pageContext.getServletContext()%></td>
		</tr>
		<tr>
			<td>현 페이지 정보(out)</td>
			<td><%=pageContext.getOut()%></td>
		</tr>
	</table>
</body>
</html>