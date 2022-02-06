<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록보기</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="바로가기 아이콘" href="/img/favicon.ico" type="image/x-icon">
<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />	
<script src="./js/jquery.js"></script>

<style>
/* 콘텐츠 스타일 */
.content {
	clear: both;
	width: 100%;
	height: auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.tit { text-align: center; margin: 50px; } 
.list { margin: 40px auto; }  
.t1 { padding: 10px 30px; background-color:#bbc9d8; }
.t2 { padding: 0 26px;  background-color:#bbc9d8;}
.t3 { padding: 0 40px;  background-color:#bbc9d8;}
.t4 { padding: 0 110px;  background-color:#bbc9d8;}
.t5 { padding: 0 60px;  background-color:#bbc9d8;}
.t6 { padding: 0 30px;  background-color:#bbc9d8;}
.t7 { padding: 0 40px;  background-color:#bbc9d8;}
.com td { text-align: center; padding: 6px }

</style>
</head>
<body>
<content>
	<%@ include file="../header.jsp" %>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		stmt = conn.createStatement();
		sql = "select * from testmember";
		rs = stmt.executeQuery(sql);
%>
    <h2 class="tit" >회원목록</h2>
<table border="1"  cellpadding="6" cellspacing="0" class="list"> 
    <tr>
        <th class="t1">아이디</th><th class="t2">이름</th>
        <th class="t3">전화번호</th><th class="t4">주소</th>
        <th class="t5">상세주소</th><th class="t6">직업</th>
        <th class="t7">가입일</th>
<%		
		while(rs.next()) {
			String mid = rs.getString("m_id");
			String name = rs.getString("m_name");
			String tel = rs.getString("m_phone");
			String adress1 = rs.getString("address1");
			String adress2 = rs.getString("address2");
			String job = rs.getString("job");
			Date regDate = rs.getDate("regDate");
			
%>
		<tr class="com">
			<td><%=mid %></a></td>
			<td><%=name %></td>
			<td><%=tel %></td>
			<td><%=adress1 %></td>
			<td><%=adress2 %></td>
			<td><%=job %></td>
			<td><%=regDate %></td>
			
		</tr>
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
	</table>
	<!-- 푸터 -->
	<%@ include file="../footer.jsp" %>
</content>	
</body>
</html>