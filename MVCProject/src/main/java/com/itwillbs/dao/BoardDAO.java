package com.itwillbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.domain.BoardDTO;

public class BoardDAO {
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
		String sql = "select max(num) as maxNum from board;";
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
	public void insertBoard(BoardDTO board) throws SQLException {
		String sql = "insert into board(num, name, subject, content, readcount, date) "+
				"values (?, ?, ?, ?, ?, ?);";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, board.getNum());
		pstmt.setString(2, board.getName());
		pstmt.setString(3, board.getSubject());
		pstmt.setString(4, board.getContent());
		pstmt.setInt(5, board.getReadCount());
		pstmt.setTimestamp(6, board.getDate());
		pstmt.executeUpdate();
		dbClose();
	}
	public ArrayList<BoardDTO> getBoardList() throws SQLException {
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		int count=0;
		String sql = "select num, name, subject, readCount, date from board order by num desc;";
		connection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next() && rs != null){
			BoardDTO board = new BoardDTO();
			board.setNum(rs.getInt("num"));
			board.setName(rs.getString("name"));
			board.setSubject(rs.getString("subject"));
			board.setReadCount(rs.getInt("readCount"));
			board.setDate(rs.getTimestamp("date"));
			boardList.add(board);
		}
		dbClose();
		return boardList;
	}
	public BoardDTO getBoard(int num) throws SQLException{
		BoardDTO board = null;
		String sql = "select * from board where num = ?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();

		while(rs.next() && rs != null){
			board = new BoardDTO();
			board.setNum(rs.getInt("num"));
			board.setName(rs.getString("name"));
			board.setSubject(rs.getString("subject"));
			board.setContent(rs.getString("content"));
			board.setReadCount(rs.getInt("readCount"));
			board.setDate(rs.getTimestamp("date"));
		}
		dbClose();
		return board;
	}
	public void updateBoard(BoardDTO board) throws SQLException {
		String sql = "update board set subject=?, content=? where num=?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, board.getSubject());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getNum());
		pstmt.executeUpdate();
		dbClose();
	}//updateBoard()
	public void updateReadCount(int readCount, int num) throws SQLException {
		String sql = "update board set readCount = ? where num=?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, readCount);
		pstmt.setInt(2, num);
		pstmt.executeUpdate();
		dbClose();
	}//updateReadCount()
	public void deleteBoard(int num, String name) throws SQLException {
		String sql = "delete from board where num=? && name=?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		dbClose();
	}
}//class
