package com.test.biz;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.test.model.DBConn;
import com.test.model.TestproductVO;

public class TestproductDAO {
	private Connection con = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public ArrayList<TestproductVO> getTestproductList() {
		ArrayList<TestproductVO> testproductList = null;
		try {
			con = DBConn.getConnection();
			String sql = "select * from testproduct order by pcode asc";
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			testproductList = new ArrayList<TestproductVO>();
			while(rs.next()) {
				String pcode = rs.getString("pcode");
				String pname = rs.getString("pname");
				String pinfo = rs.getString("pinfo");
				String pprice = rs.getString("pprice");
				String pid = rs.getString("pid");
				String pstar = rs.getString("pstar");
				
				TestproductVO testproduct = new TestproductVO();
				testproduct.setPcode(pcode);
				testproduct.setPname(pname);
				testproduct.setPinfo(pinfo);
				testproduct.setPprice(pprice);
				testproduct.setPid(pid);
				testproduct.setPstar(pstar);
				testproductList.add(testproduct);
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
		return testproductList;
	}
	public TestproductVO getTestproduct(TestproductVO vo) {
		TestproductVO testproduct = null;
		try {
			con = DBConn.getConnection();
				String sql = "select * from testproduct where pcode = ?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, vo.getPcode());
				rs = stmt.executeQuery();
				if(rs.next()) {
					testproduct = new TestproductVO();
					testproduct.setPcode(rs.getString("pcode"));
					testproduct.setPname(rs.getString("pname"));
					testproduct.setPinfo(rs.getString("pinfo"));
					testproduct.setPprice(rs.getString("pprice"));
					testproduct.setPid(rs.getString("pid"));
					testproduct.setPstar(rs.getString("pstar"));
					
				}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, stmt, con);
		}
		return testproduct;
	}
	
	
	public int deleteTestproduct(TestproductVO vo) {
		int cnt=0;
		try {
			con = DBConn.getConnection();
			String sql = "delete from testproduct where pcode=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getPcode());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
	
	public int addTestproduct(TestproductVO vo) {
		int cnt = 0;
		try {
			con = DBConn.getConnection();
			String sql = "insert into testproduct values(?, ?, ?, ?, '관리자', ?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, vo.getPcode());
			stmt.setString(2, vo.getPname());
			stmt.setString(3, vo.getPinfo());
			stmt.setString(4, vo.getPprice());
			stmt.setString(5, vo.getPstar());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(stmt, con);
		}
		return cnt;
	}
}
