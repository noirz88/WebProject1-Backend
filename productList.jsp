<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
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
	<%@ include file="admin_header.jsp" %>
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
		sql = "select * from m_product";
		rs = stmt.executeQuery(sql);
%>
	<table border="1"  cellpadding="5" cellspacing="0"> 
		<tr>
			<th>제품코드</th><th>제품명</th>
			<th>제품가격</th><th>수량</th><th>제품이미지</th>
			<th>편집 또는 삭제</th>
		</tr>
<%		
		while(rs.next()) {
			String p_num = rs.getString("p_num");
			String p_name = rs.getString("p_name");
			int p_price = rs.getInt("p_price");
			int p_cnt = rs.getInt("p_cnt");
			String p_img = rs.getString("p_img");
%>
		<tr>
			<td><a href="updateProduct.jsp?p_num=<%=p_num %>"><%=p_num %></a></td>
			<td><%=p_name %></td>
			<td><%=p_price %></td>
			<td><%=p_cnt %></td>
			<td><img src='./img/<%=p_img %>'  alt='' /></td>
			<td><a href="deleteProductPro.jsp?p_num=<%=p_num %>">삭제</a>	</td>
		</tr>
<%			
		}
		//out.println("작업이 올바르게 처리되었습니다.");
		stmt.close();
		conn.close();
%>
</table>	

	
	<!-- 푸터 -->
	<%@ include file="footer.jsp" %>
</body>
</html>