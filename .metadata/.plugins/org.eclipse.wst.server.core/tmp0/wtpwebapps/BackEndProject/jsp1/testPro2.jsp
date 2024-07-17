<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/testPro2.jsp</title>
<link rel="stylesheet" href="../css/table.css">
</head>
<body>
<%
// method="post" => form태그에서만 사용되는 방식(특별한 방식) => request 한글처리 필요
// 톰캣 10버전 이상일 경우 => 필요없음
request.setCharacterEncoding("utf-8");

String userName = request.getParameter("name");
String userAge = request.getParameter("age").replaceAll(" ", "");
int userAgeNum = Integer.parseInt(userAge);
String userGender = request.getParameter("gender");
String[] country = {"A1", "B2", "C3", "D4","E5"};
%>
	<h1>jsp1/testPro2.jsp</h1>
	<table>
		<tr>
			<th>이름</th>
			<td><%=userName%></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=userAge%></td>
		</tr>
		<tr>
			<th>나이+100</th>
			<td><%=userAge+100%></td>
		</tr>
		<tr>
			<th>나이+100</th>
			<td><%=userAgeNum+100%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=userGender%></td>
		</tr>
		<%-- <%for(int i=0; i < country.length; i++){ %>
		<tr>
			<th><%="추가 행 " + (i+1)%></th>
			<td><%=country[i]%></td>
		</tr>
		
		<%} %> --%>
	</table>


</body>
</body>
</html>