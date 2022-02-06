<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_tel = request.getParameter("m_phone");
		String m_zip = request.getParameter("zipcode");
		String m_addr1 = request.getParameter("address1");
		String m_addr2 = request.getParameter("address2");
		String m_job = request.getParameter("job");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "insert into testmember(m_id, m_pw, m_name, m_phone, zipcode, address1, address2, job, regDate) values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			stmt.setString(2, m_pw);
			stmt.setString(3, m_name);
			stmt.setString(4, m_tel);
			stmt.setString(5, m_zip);
			stmt.setString(6, m_addr1);
			stmt.setString(7, m_addr2);
			stmt.setString(8, m_job);
			int n = stmt.executeUpdate();
			if(n>=1) {
				//회원가입 성공시 이동
				response.sendRedirect("login.html");
			} else {
				//회원가입 실패시 이동
				response.sendRedirect("join.jsp");
			}
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB연결이 실패되었거나 SQL을 처리하지 못했습니다.");
			e.printStackTrace();
		}
%>