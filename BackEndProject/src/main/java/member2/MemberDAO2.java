package member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import member2.MemberDTO2;

public class MemberDAO2 {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void connection() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
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
	}// dbClose
	public boolean userCheck(MemberDTO2 member) throws SQLException {
		String sql = "SELECT id, pass FROM members2 WHERE id = ?";
		boolean result = false;
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		rs = pstmt.executeQuery();
		if(rs.next()) {
			if(member.getId().equals(rs.getString("id")) && member.getPass().equals(rs.getString("pass"))) {
				result = true;
			}
		}//if rs
		dbClose();
		return result;
	}
	public void insertMember(MemberDTO2 member) throws SQLException {
		String sql = "insert into members2(id, pass, name, age, gender, email,date) values(?,?,?,?,?,?,?);";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPass());
		pstmt.setString(3, member.getName());
		pstmt.setInt(4, member.getAge());
		pstmt.setString(5, member.getGender());
		pstmt.setString(6, member.getEmail());
		pstmt.setTimestamp(7, member.getDate());
		pstmt.executeUpdate();
		
		dbClose();
	}//insert member
	public MemberDTO2 getMember(String id) throws SQLException {
		MemberDTO2 member = new MemberDTO2();

		String sql = "SELECT * FROM members2 WHERE id = ?";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			member.setId(rs.getString("id"));
			member.setPass(rs.getString("pass"));
			member.setName(rs.getString("name"));
			member.setAge(Integer.parseInt(rs.getString("age")));
			member.setGender(rs.getString("gender"));
			member.setEmail(rs.getString("email"));
			member.setDate(rs.getTimestamp("date"));
		}else {
			member = null;
		}//if rs 

		return member;
	}//getMember
	public ArrayList<MemberDTO2> getMemberList() throws SQLException{
		ArrayList<MemberDTO2> memberList = new ArrayList<MemberDTO2>();
		int count=0;
		String sql = "select id, pass, name, age, gender, email, date from members2;";
		connection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next() && rs != null){
			MemberDTO2 member = new MemberDTO2();
			member.setId(rs.getString("id"));
			member.setPass(rs.getString("pass"));
			member.setName(rs.getString("name"));
			member.setAge(Integer.parseInt(rs.getString("age")));
			member.setGender(rs.getString("gender"));
			member.setEmail(rs.getString("email"));
			member.setDate(rs.getTimestamp("date"));
			memberList.add(member);
		}
		return memberList;
	}
	public void updateMember(MemberDTO2 member) throws SQLException {
		String sql = "update members2 set name = ?, age = ?, gender = ?, email = ? where id = ?;";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setInt(2, member.getAge());
		pstmt.setString(3, member.getGender());
		pstmt.setString(4, member.getEmail());
		pstmt.setString(5, member.getId());
		pstmt.executeUpdate();
	}//setMember
	public void deleteMember(MemberDTO2 member) throws SQLException {
		String sql = "delete from members2 where id = ? && pass = ?";
		connection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPass());
		pstmt.executeUpdate();
		dbClose();
	}
}