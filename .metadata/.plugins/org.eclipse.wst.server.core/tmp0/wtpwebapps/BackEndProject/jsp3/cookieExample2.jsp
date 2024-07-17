<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/cookieExample2.jsp</title>
</head>
<body>
<h1>jsp3/cookieExample2.jsp</h1>
<%
// http://localhost:8080/JspProject/jsp3/cookieExample2.jsp?language=korea
// http://localhost:8080/JspProject/jsp3/cookieExample2.jsp?language=english
// http가 사용자가 선택한 값을 서버에 전달 => 서버에 request기억장소(내장객체)에 저장 
// request에서 태그정보(language=korea / language=english 둘중에 하나)를 가져와서 => 변수에 저장

String lang = request.getParameter("language");

// 서버 상관없이, 사용자 컴퓨터 상관없이 => 언어설정값을 유지 => 쿠키 사용
// 쿠키 기억장소 만들기(객체생성) , 이름,값("clang", lang)  => 값을 설정
Cookie cookie = new Cookie("clang", lang);
// 시간을 설정  1800(30*60)초
cookie.setMaxAge(1800);
// 서버에 쿠키값을 사용자에게 전달하기 위해서 => response 기억장소(내장객체)에 저장=> 사용자 컴퓨터에 전달
response.addCookie(cookie);
%>
사용자가 폼에서 선택한 언어 : <%=lang %><br>
만든 쿠키의 이름 : <%=cookie.getName() %><br>
만든 쿠키의 값 : <%=cookie.getValue() %><br>
<a href="cookieExample1.jsp">cookieExample1.jsp 이동</a>
</body>
</html>
