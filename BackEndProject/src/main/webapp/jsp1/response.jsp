<%@page import="java.text.CollationKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/response.jsp</title>
</head>
<body>
<h1>jsp1/response.jsp</h1>
<% 
// 사용자의 http header 정보 변경 명령
response.setHeader("accept-language", "ko-KR");
//사용자의 내용타입 변경 명령
response.setContentType("text/html; charset=UTF-8");
//사용자의 컴퓨터에 쿠키값을 저장하는 명령
Cookie cookie = new Cookie("cookieID", "values");
response.addCookie(cookie);
//사용자에게 다른 페이지로 이동하게 만드는 명령(하이퍼링크)
response.sendRedirect("http://192.168.1.200:8080/JspProject/jsp1/request.jsp");
%>
</body>
</html>