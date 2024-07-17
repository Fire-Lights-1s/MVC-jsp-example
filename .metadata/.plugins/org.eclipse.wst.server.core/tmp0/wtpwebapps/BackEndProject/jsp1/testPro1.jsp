<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro1.jsp</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
<%
// test1.jsp에서 사용자가 입력한 아이디, 좋아하는 숫자를 => HTTP가 서버에 전달
// => 서버에서 기억장소를 만듬(request, respone 기억장소)
// => request 기억장소에 HTTP가 가져온 사용자가 입력한 아이디, 좋아하는 숫자를 저장

String sid = request.getParameter("id");
String snum = request.getParameter("num");
int num = Integer.parseInt(snum);
%>

<h1>jsp1/testPro1.jsp</h1>
<table>
			<tr>
				<td>아이디</td>
				<td><%=sid %></td>
			</tr>
			<tr>
				<td>좋아하는 숫자</td>
				<td><%=num %></td>
			</tr>
			<tr>
				<td>좋아하는 숫자 + 100</td>
				<td><%=num+100 %></td>
			</tr>
		</table>


</body>
</html>