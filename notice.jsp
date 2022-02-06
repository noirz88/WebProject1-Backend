<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드리스</title>
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
	<%@ include file="header.jsp"%>
	<div class="wrap">
		<div class="content">
			<div class="page">
				<section class="page_fr">
					<h2 class="con_tit">공지사항</h2>
					<ul class="noti_lst">
						<li>
							<dl class="tit_row">
								<dd class="noti_num">No.</dd>
								<dd class="noti_tit">제목</dd>
								<dd class="noti_author">작성자</dd>
								<dd class="noti_resdate">작성일</dd>
							</dl>
						</li>
						<li>
							<%
								//캐릭터셋을 UTF-8로 설정(request, response)
								request.setCharacterEncoding("UTF-8");
								response.setCharacterEncoding("UTF-8");
								
								//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
								//String mId = request.getParameter("id"); 
								//String mPw = request.getParameter("pw");
								
								//연결자, 상태정보자, 결과물저장 객체 선언 및 null 초기화
								Connection con = null;
								PreparedStatement ps = null;
								ResultSet rs = null;
								
								//접속정보를 선언 및 값 지정
								String url="jdbc:oracle:thin:@localhost:1521:xe";
								String id="scott";
								String pw="tiger";
								String sql;
								try {
									//드라이버로딩
									Class.forName("oracle.jdbc.OracleDriver");
									//접속
									con = DriverManager.getConnection(url, id, pw);
									//sql문 작성
									sql = "select * from m_notice";
									//상태정보 활성화 및 SQL문 처리
									ps = con.prepareStatement(sql);
									//ps.setString(1, mId);
									//ps.setString(2, mPw);
									
									//SQL을 처리하여 결과반환
									rs = ps.executeQuery();
									
									//반환결과를 출력 => 
									//로그인시에는 해당 사람의 id가 존재하면, 로그인 처리, 존재하지 않으면 회원가입 페이지로 이동
									while(rs.next()){
										//session.setAttribute("id", rs.getString("id"));
										//session.setAttribute("pw", rs.getString("pw"));
										String bd_no = rs.getString("bd_no");
										String user_id = rs.getString("user_id");
										String title = rs.getString("title");
										String contents = rs.getString("contents");
										String reg_date = rs.getString("reg_date").substring(0, 10);
										
									%>
									<dl>
										<dd class="noti_num"><%=bd_no %></dd>
										<dd class="noti_tit">
											<a href="detailNotice.jsp?bd_no=<%=bd_no%>"><%=title %></a>									
											<!-- <span>제목</span> -->
										</dd>
										<dd class="noti_author"><%=user_id %></dd>
										<dd class="noti_resdate"><%=reg_date %></dd>
									</dl>
									<%
									}
									//결과물 저장 객체, 상태정보자 객체, 접속 객체 닫기
									rs.close();
									ps.close();
									con.close();
								} catch(Exception e) {
									e.printStackTrace();
									//response.sendRedirect("e500.jsp");
									//out.print("시스템 오류 입니다.");
								}
							%>
						</li>
					</ul>
				</section>
			</div>
			<script src="./js/ban.js"></script>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>