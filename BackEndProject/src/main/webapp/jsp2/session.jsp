<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//session 내장객체 : 연결 정보를 저장하는 내장객체(기억장소) => 세견 ID부여
//session 내장객체(기억장소 해제) 
// 1. 사용자 브라우저의 세션 ID삭제
// 2. 30분 동안 작업(요청)이 없을 때 session 내장객체 삭제
// 3. session 내장객체 삭제하는 명령 session.invalidate() => 로그아웃
%>
세션 ID : <%=session.getId()%>
<br>
세션 생성 시간 : <%= session.getCreationTime() %>
<br>
세션 최근접근 시간 : <%= session.getLastAccessedTime() %>
<br>
세션 유지 시간 : <%=session.getMaxInactiveInterval() %> 초
<br>
세션 유지 시간 변경 : <%session.setMaxInactiveInterval(1800); %>
<br>
session에 정보 저장(이름, 값) : <%//session.setAttribute("sName", "session values"); %>
<br>
session에 저장된 값 출력 : <%=session.getAttribute("sName") %>
<br>
세션 연결정보 삭제 : <%session.invalidate(); %>
</body>
</html>