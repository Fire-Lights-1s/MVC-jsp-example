package board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO2 {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Connection connection() {
		conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}finally {

		}
		return conn;
	}// connection
	public void dbClose(){
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}//dbClose
	public int checkMaxBoardNum() throws SQLException {
		String sql = "select max(num) as maxNum from fboard;";
		connection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int maxNum = 1;
		if(rs.next()){
			maxNum = rs.getInt("maxNum") + 1;
		}
		dbClose();
		return maxNum;
	}
	public void insertBoard(BoardDTO2 board) throws SQLException {
		String sql = "insert into fboard(num, name, subject, content, readcount, date, file) "+
				"values (?, ?, ?, ?, ?, ?, ?);";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, board.getNum());
		pstmt.setString(2, board.getName());
		pstmt.setString(3, board.getSubject());
		pstmt.setString(4, board.getContent());
		pstmt.setInt(5, board.getReadcount());
		pstmt.setTimestamp(6, board.getDate());
		pstmt.setString(7, board.getFile());
		pstmt.executeUpdate();
		
		dbClose();
	}
	public ArrayList<BoardDTO2> getBoardList() throws SQLException {
		ArrayList<BoardDTO2> boardList = new ArrayList<BoardDTO2>();
		int count=0;
		String sql = "select num, name, subject, readCount, date from fboard order by num desc;";
		connection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next() && rs != null){
			BoardDTO2 board = new BoardDTO2();
			board.setNum(rs.getInt("num"));
			board.setName(rs.getString("name"));
			board.setSubject(rs.getString("subject"));
			board.setReadcount(rs.getInt("readCount"));
			board.setDate(rs.getTimestamp("date"));
			boardList.add(board);
		}
		dbClose();
		return boardList;
	}
	public BoardDTO2 getBoard(int num) throws SQLException {
		BoardDTO2 board = new BoardDTO2();
		String sql = "select * from fboard where num = ?";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			board.setNum(rs.getInt("num"));
			board.setName(rs.getString("name"));
			board.setSubject(rs.getString("subject"));
			board.setContent(rs.getString("content"));
			board.setReadcount(rs.getInt("readCount"));
			board.setDate(rs.getTimestamp("date"));
			board.setFile(rs.getString("file"));
		}
		return board;
	}
	public void updateReadCount(int readCount, int num) throws SQLException {
		String sql = "update fboard set readCount = ? where num=?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, readCount);
		pstmt.setInt(2, num);
		pstmt.executeUpdate();
		dbClose();
	}//updateReadCount()
}
