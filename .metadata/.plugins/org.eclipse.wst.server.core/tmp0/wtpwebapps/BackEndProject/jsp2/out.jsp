<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/out.jsp</title>
</head>
<body>
	<h1>jsp2/out.jsp</h1>
	<%
	// out 내장객체
	out.print("web 출력<br>");
	out.print("출력 기억장소 크기 : "+ out.getBufferSize()+"<br>");
	out.print("남아있는 출력 기억장소 크기 : "+ out.getRemaining()+"<br>");
	//출력하고 종료
	out.close();
	out.print("종료 후 출력");
	%>

</body>
</html>