package com.test.model;
import java.sql.*;
public class DBConn {
	final static String url="jdbc:oracle:thin:@localhost:1521:xe";
	final static String dbid = "scott";
	final static String dbpw = "tiger";
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, dbid, dbpw);		
		return con;
	}
	public static void close(ResultSet rs, PreparedStatement stmt, Connection con) {
		if( rs != null ) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if( stmt != null ) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if( con != null ) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement stmt, Connection con) {
		if( stmt != null ) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if( con != null ) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}