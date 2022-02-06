<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />	
<style>
input { outline:0; border:0;  border-radius:0;  }
.content {  width: 1200px; margin:0 auto; clear:both; height: 400px;}
.con_tit{margin-left: 44%; margin-top: 100px; margin-bottom: 60px; clear:both;}
.list { margin: 40px auto; }  
.t1 { padding: 20px 18px; background-color:#bbc9d8; }
.t2 { padding: 0 18px;  background-color:#bbc9d8;}
.t3 { padding: 0 18px;  background-color:#bbc9d8;}
.t4 { padding: 0 50px;  background-color:#bbc9d8;}
.t5 { padding: 0 16px;  background-color:#bbc9d8;}
.t6 { padding: 0 110px;  background-color:#bbc9d8;}
.t7 { padding: 0 18px;  background-color:#bbc9d8;}
.t8 { padding: 0 30px;  background-color:#bbc9d8;}
.mem td { text-align:center; padding-top:10px; padding-bottom:10px}
.in_btn { display:block; height:40px; line-height:40px; width:130px; float:left; border-radius:22px; background:#333; color:#fff; margin-left:20px; 
cursor:pointer; }
.in_btn:hover { background-color:#6f87a1; }
.list { margin: 0 auto; }
.btn { clear: both; display: block; margin-left: 448px; margin-top: 60px; margin-bottom: 40px;}
</style>
</head>
<body>
<div class="wrap">
	<%@ include file="header.jsp" %>
	<div class="content">
	<%
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		String mid = request.getParameter("m_id");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			sql = "select * from testmember where m_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, m_id);
			rs = stmt.executeQuery();
	%>
	<h1 class="con_tit">마이페이지</h1>
		<table border="1"  cellpadding="6" cellspacing="0" class="list"> 
			<tr class="notitable">
				<th class="t1">아이디</th>
				<th class="t2">비밀번호</th>
				<th class="t3">성명</th>
				<th class="t4">연락처</th>
				<th class="t5">우편번호</th>
				<th class="t6">상세주소</th>
				<th class="t7">직업</th>
				<th class="t8">가입일</th>
			</tr>
		<%		
			if(rs.next()) {
				String job = rs.getString("job");		
				String m_zip = rs.getString("zipcode");
				String addr1 = rs.getString("address1");
				String addr2 = rs.getString("address2");
				m_zip = (m_zip==null) ? "" : m_zip;
				addr1 = (addr1==null) ? "" : addr1;
				addr2 = (addr2==null) ? "" : addr2;
				String addr_tot = addr1 + " " + addr2;
				if(job=="A1"){
					job="회사원";
				} else if(job=="A2") {
					job="전산직";
				} else if(job=="A3"){
					job="학생";
				} else if(job=="A4"){
					job="공무원";
				} else if(job=="A5"){
					job="주부";
				} else {
					job="기타";
				}
	
		%>			
			<tr class="mem">
				<td><%=rs.getString("m_id") %></td>
				<td><%=rs.getString("m_pw") %></td>
				<td><%=rs.getString("m_name") %></td>
				<td><%=rs.getString("m_phone") %></td>
				<td><%=m_zip %></td>
				<td><%=addr_tot %></td>
				<td><%=job %></td>
				<td><%=rs.getDate("regdate") %></td>
			</tr>
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
			
		</table>
		<div class="btn">
			<span class="fr_col first">
				<input type="reset" value="회원정보수정"  class="in_btn" onclick="goModify()"/>
			</span>
			<span class="fr_col last">
				<input type="reset" value="뒤로가기" class="in_btn" onclick="goBack()"/>
			</span>
		</div>
	</div>
</div>
<script>
function joinCheck(f){

	if(f.m_pw.value!=f.m_pw2.value) {
		alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
		return false;
	}
}
function goBack(){
		location.href = "main.jsp";
	}
	
	function goModify(){
		location.href = "memberModify.jsp"
	}
	</script>
	<%@ include file="footer.jsp" %>
</body>
</html>