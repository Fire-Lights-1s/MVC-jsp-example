<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<h1>jsp4/insertPro.jsp</h1>
<%
// 사용자 입력한 학생번호,학생이름을 => 서버에 전달 => request 기억장소 => 저장
// request에서 저장된 num, name 가져와서 => 변수에 저장
// String num = request.getParameter("num");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
%>
학생번호 : <%=num%><br>
학생이름 : <%=name%><br>
<%
// 1단계 JDBC 프로그램 가져오기
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 JDBC 프로그램 이용해서 데이터베이스 접속
String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

//3단계 sql구문을 만들어서 실행할 준비
// String sql = "insert into student(num,name) values(1,'김길동')";
// String sql = "insert into student(num,name) values("+num+",'"+name+"')";
String sql = "insert into student(num,name) values(?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
// ? 미완성 sql 구문
// set자료형(parameterIndex 물음표 순서, 입력할 값)
pstmt.setInt(1, num);
pstmt.setString(2, name);


// 4단계 sql구문 실행 => Query OK =>insert,update,delete
pstmt.executeUpdate();
%>
회원등록성공 <%=pstmt %>
</body>
</html>