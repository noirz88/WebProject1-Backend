<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
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
.vs { clear:both; width:100%; height:400px; 
background-image:url("./img/top2.png"); background-position: center center; 
background-size:150% auto; background-repeat:no-repeat; 
animation-name:ani1; animation-duration:2.5s; animation-fill-mode:both; }
.vs_tit { padding-top:100px; color:#fff; text-shadow:1px 1px 1px #333; font-size:40px; 
text-align: center; }
.vs_com { text-align: center; color:#fff; font-size:16px; padding:40px 150px; }
.page { clear:both; width: 100%; border-top:1px solid #f1f1f1;  }
.page_tit { padding-top: 28px; }
.more { text-decoration: none; font-size:14px; text-align:right; display:block; float:right; color:deepskyblue; }
.noti_lst { clear:both; width: 730px; margin:0 auto; }
.noti_lst li { clear:both;  margin:20px;  }
.noti_lst li a { color:#333; }
.noti_lst li dl { clear:both; }
.noti_lst li dl.tit_row dd { font-weight:bold; border-top:1px solid #333; border-bottom:1px solid #333; } 
.noti_lst li dl dd { float:left; line-height:40px; }
.noti_lst li dl dd:last-child { border-right:0; }
.noti_lst li:last-child dl dd { border-bottom:1px solid #333; }
.noti_num { width:50px; text-align:center; background:#ebe4e4;  }
.noti_tit { width:400px; padding-right:20px; padding-left:10px; overflow:hidden; white-space:no-wrap; text-overflow:ellipsis; }
.noti_author { width:100px; text-align:center; }
.noti_resdate { width:100px; text-align:center; }
.con_tit{margin-left: 46%; margin-top: 3%; margin-bottom: 35px;}
.page_fr { margin-bottom: 90px; }
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="header.jsp" %>
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
	<h1>회원 상세 보기</h1>
	<hr />
	<table border="1"  cellpadding="6" cellspacing="0"> 
		<tr>
			<th>아이디</th><th>비밀번호</th>
			<th>성명</th><th>연락처</th>
			<th>우편번호</th><th>상세주소</th>
			<th>직업</th><th>가입일</th>
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
		<tr>
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
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>