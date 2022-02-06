<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement stmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("address1");
		String addr2 = request.getParameter("address2");
		String job = request.getParameter("job");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "update testmember set m_pw = ?, m_name= ?, m_phone = ?, zipcode = ?, address1 = ?, address2 = ?, job=? where m_id = ?";
				
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_pw);
			stmt.setString(2, m_name);
			stmt.setString(3, m_phone);
			stmt.setString(4, zipcode);
			stmt.setString(5, addr1);
			stmt.setString(6, addr2);
			stmt.setString(7, job);
			stmt.setString(8, m_id);
			int result = stmt.executeUpdate();
			
			if(result == 1) {
				//회원정보수정 성공시 이동
				session.setAttribute("m_id", m_id);
				response.sendRedirect("mypage1.jsp");
			} else {
				//회원정보수정 실패시 이동
				response.sendRedirect("memberModify.jsp");
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