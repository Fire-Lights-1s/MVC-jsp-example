<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/cookieSet.jsp</title>
</head>
<body>
<h1>jsp3/cookieSet.jsp</h1>
<%
//sesssion 서버 기억장소에 만들어져 있고 기억장소 안에 이름, 값으로 저장
// 세션 유지 시간 30분
session.setAttribute("id", "value");
//cookie 기억장소를 만들고 이름, 값을 저장
// 쿠키 시간 설정 => 시간 설정 한 만큼 유지
// 서버에서 => 사용자에게 전달 => 사용자 컴ㅍ터 하드웨어에 저장
Cookie cookie = new Cookie("cName","cookieValue");
out.println("cookie 기억장소 주소 : " + cookie);
cookie.setMaxAge(60*60);
out.println("<br>");
out.println("cookie 이름 : " + cookie.getName());
out.println("<br>");
out.println("cookie 이름에 해당하는 값 : " + cookie.getValue());
out.println("<br>");
out.println("cookie 유지 시간 : " + cookie.getMaxAge());
out.println("<br>");
response.addCookie(cookie);
%>
<a href="cookie.jsp">cookie.jsp 쿠키 가져오기</a>
</body>
</html>