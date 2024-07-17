<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<h1>jsp1/request.jsp</h1>
<%

%>
서버 이름 : <%=request.getServerName() %><br>
서버 포트 : <%=request.getServerPort() %><br>
요청 URL(요청 주소) : <%=request.getRequestURL() %><br>
요청 URL(요청 주소에서 서버 뺀 나머지 주소) : <%=request.getRequestURI() %><br>
요청 프로젝트 : <%=request.getContextPath() %><br>
요청 프로젝트 뺀 나머지 주소 : <%=request.getServletPath() %><br>
http protocol info : <%=request.getProtocol() %><br>
데이터 전송 방식 : <%=request.getMethod() %><br>
user IPaddress : <%=request.getRemoteAddr() %><br>
http header info("accept-language") : <%=request.getHeader("accept-language") %><br>
http header info("user-agent") : <%=request.getHeader("user-agent") %><br>
http header info("host") : <%=request.getHeader("host") %><br>
<a href="response.jsp">My response</a>

</body>
</html>