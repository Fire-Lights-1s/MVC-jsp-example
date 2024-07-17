<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="DB_Connector.MyDB_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/loginPro.jsp</title>
</head>
<body>
	<h1>jsp5/loginPro.jsp</h1>
	<%
	String id = "";
		String pass = "";
		boolean idCheck = false, passCheck = false;
		// id와 pass의 유효성 확인
		if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
			id = request.getParameter("id");
			idCheck = true;
		}
		if (request.getParameter("pass") != null && !request.getParameter("pass").equals("")) {
			pass = request.getParameter("pass");
			passCheck = true;
		}
		// DB connection 생성
		MyDB_DAO mydbConn = new MyDB_DAO();
		Connection conn = mydbConn.connection();
		
		if (idCheck && passCheck) {
			try {
		String sql = "select id, pass from members where id=?;";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			String passResult = rs.getString("pass");
			if (passResult.equals(pass)) {
				//로그인 id 세션에 저장
				session.setAttribute("id", id);
				//session.setAttribute("resultM", "로그인 성공");
				response.sendRedirect("main.jsp");
			} else {
				session.setAttribute("resultM", "비밀번호가 다름");
				response.sendRedirect("login.jsp");
			}// if pass 
		}else{
			session.setAttribute("resultM", "회원이 존재하지 않음");
			response.sendRedirect("login.jsp");
		} //if rs
			} catch (SQLException e) {
		//sql 예외를 잡아서 에러 메세지를 넘겨줌
		session.setAttribute("resultM", e.toString());
		response.sendRedirect("login.jsp");
			}//catch
		} else {
			// 넘겨받은 id와 pass가 유효하지 않음
			session.setAttribute("resultM", "필수 정보가 없음");
			response.sendRedirect("login.jsp");
		}// if check id, pass
	%>
</body>
</html>