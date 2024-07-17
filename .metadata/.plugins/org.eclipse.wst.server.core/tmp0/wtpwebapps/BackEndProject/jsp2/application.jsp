<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/application.jsp</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
	<h1>jsp2/application.jsp</h1>
	<%
	// p199
	// application 내장객체 : 서버 정보를 저장
	//                    : 서버 start하면 기억장소가 만들어지고 
	//                    : 서버 stop하면 기억장소 삭제 되어짐
	%>
	<table>
		<tr>
			<td>서버정보</td>
			<td><%=application.getServerInfo()%></td>
		</tr>
		<tr>
			<td>서버 물리적인 경로</td>
			<td><%=application.getRealPath("/")%></td>
		</tr>
		<tr>
			<td>application 내장객체에 값을 저장</td>
			<td><%application.setAttribute("appName", "appValue"); %></td>
		</tr>
		<tr>
			<td>application 내장객체에 저장된 값 가져와서 출력</td>
			<td><%=application.getAttribute("appName") %></td>
		</tr>
	</table>

</body>
</html>