<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<body>
<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		String m_id = request.getParameter("id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "select * from testmember where m_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			rs = stmt.executeQuery();
%>
<%		
		if(rs.next()) {
			out.println("<p>해당 아이디는 사용하실 수 없는 아이디 입니다.</p>");
		} else {
			out.println("<p>사용 가능한 아이디 입니다.</p>");
			out.println("<a href='javascript:apply(\""+m_id+"\")'>"+m_id+" [적용]</a>");
			out.println("<p>적용을 눌러야만 입력하신 아이디를 사용할 수 있습니다.</p>");
%>
		<script>
		function apply(id){
			//opener 부모창
			//opener.document.폼이름.컨트롤이름.value
			opener.document.joinform.m_id.value=id;
			//opener.document.joinform.m_id.readonly=true;
			opener.document.joinform.idck.value="yes";
			window.close();
		}
		</script>
<%
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
</body>
</html>