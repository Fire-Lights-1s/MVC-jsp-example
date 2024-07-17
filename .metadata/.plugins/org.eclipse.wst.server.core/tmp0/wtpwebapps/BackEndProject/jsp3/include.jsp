<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/include.jsp</title>
<link rel="stylesheet" href="../css/table.css?after">
</head>
<body>
	<h1>jsp3/include.jsp</h1>
	<%
	// 액션 태그 : jsp문법, 태그처럼 사용하게 만든 문법
	//  jsp:include 액션 태그 : 반복되는 메뉴를 파일로 분리하고 
	//						=> 파일을 가져와서(include) 사용
	//						=> 수정 최소화
	%>
	<%-- <jsp:include page=""></jsp:include> --%>
	<table>
		<tr>
			<td colspan="2" width="600" height="100">
			<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td height="400">왼쪽 메뉴</td>
			<td>본문1</td>
		</tr>
		<tr>
			<td colspan="2" width="600" height="100">
			<jsp:include page="battom.jsp"></jsp:include>
			</td>
		</tr>
	</table>

</body>
</html>