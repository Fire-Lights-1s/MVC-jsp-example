package DB_Connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class MyDB_DAO {
	public Connection connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2단계 JDBC 프로그램 이용해서 데이터베이스 접속
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
		String dbUser = "root";
		String dbPass = "1234";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public void closeConnection(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertMember(Connection conn, String id, String pass, String name, Timestamp date) throws SQLException {
		String sql = "insert into members(id, pass, name, date) values(?,?,?,?);";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, date);
		pstmt.executeUpdate();
	}
}
