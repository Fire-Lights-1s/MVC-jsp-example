<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/cookie.jsp</title>
</head>
<body>
<h1>jsp3/cookie.jsp</h1>
쿠키값 가져오기<br>
<%
// 사용자가 요청하면 http(서버정보, 사용자정보, 쿠키정보, 세션정보, http헤더정보, 태그정보) 가지고
// => 웹 서버에 도착 => 웹 애플리케이션 서버 도착 
// => 1. request, response 기억장소 만들고, request 요청정보저장
// 2. web.xml 참조
// 3. 서블릿 처리 작업
Cookie[] cookies = request.getCookies();
%>
<a href="cookieSet.jsp">쿠키값 만들기</a>
<a href="cookieDel.jsp">쿠키값 삭제</a>
</body>
</html>