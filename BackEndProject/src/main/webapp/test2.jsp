<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 제목</title>
</head>
<body>
	<%="JSP 본문" %><br>
	<%=100 + 200 %><br>
	<%
	Random random = new Random(); 
	int num = random.nextInt(100);
	%>
	<%=num %>
</body>
</html>