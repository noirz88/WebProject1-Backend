package com.test.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.test.model.DBConn;
import com.test.model.TestnoticeVO;

public class TestnoticeDAO {
	
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public ArrayList<TestnoticeVO> getTestnoticeList() {
		ArrayList<TestnoticeVO> testnoticeList = null;
		try {
			con = DBConn.getConnection();
			String sql = "select * from testnotice order by seq desc";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			testnoticeList = new ArrayList<TestnoticeVO>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String nname = rs.getString("nname");
				String ntit = rs.getString("ntit");
				String ncon = rs.getString("ncon");
				Date nregdate = rs.getDate("nregdate");
				int nvisited = rs.getInt("nvisited");
				
				TestnoticeVO testnotice = new TestnoticeVO();
				testnotice.setSeq(seq);
				testnotice.setNname(nname);
				testnotice.setNtit(ntit);
				testnotice.setNcon(ncon);
				testnotice.setNregdate(nregdate);
				testnotice.setNvisited(nvisited);
				testnoticeList.add(testnotice);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 되지 않았습니다.");
			e.printStackTrace();
		}  catch(SQLException e) {
			System.out.println("SQL 구문 또는 열이름, 변수명 등이 서로 맞지 않습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return testnoticeList;
	}
	public TestnoticeVO getTestnotice(TestnoticeVO vo) {
		TestnoticeVO testnotice = null;
		String sql;
		try {
			int cnt=0;
			con = DBConn.getConnection();
			sql = "update testnotice set nvisited=nvisited+1 where ntit=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getNtit());
			cnt = stmt.executeUpdate();
			stmt.close();
			if(cnt>0) {
			con = DBConn.getConnection();
				sql = "select * from testnotice where ntit = ?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, vo.getSeq());
				rs = stmt.executeQuery();
				if(rs.next()) {
					testnotice = new TestnoticeVO();
					testnotice.setSeq(rs.getInt("seq"));
					testnotice.setNname(rs.getString("nname"));
					testnotice.setNtit(rs.getString("ntit"));
					testnotice.setNcon(rs.getString("ncon"));
					testnotice.setNregdate(rs.getDate("nregdate"));
					testnotice.setNvisited(rs.getInt("nvisited"));
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return testnotice;
	}
	
	
	public int deleteTestnotice(TestnoticeVO vo) {
		int cnt=0;
		try {
			con = DBConn.getConnection();
			String sql = "delete from testnotice where seq=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, vo.getSeq());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	
	public int addTestnotice(TestnoticeVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "insert into testnotice values(seq.NEXTVAL, ?, ?, ?, sysdate, 0)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getNname());
			stmt.setString(2, vo.getNtit());
			stmt.setString(3, vo.getNcon());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
}