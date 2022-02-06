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
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />

<script src="./js/jquery.js"></script>
<style>
	.art01 { width: 960px; margin: 20px auto;  }
	.art01 li { float:left; width: 300px; margin: 10px; }
	
	<style>
	/* 콘텐츠 스타일 */    
	.content { clear:both; width: 100%; min-height:1400px; }    
	.con_tit{ text-align:center; margin-top: 3%;}
	.art01 > ul > li > img {width:300px;}
	</style>

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="wrap">
		<div class="content">
			<h2 class="con_tit">Gallery</h2>
            <article class="art01">
                <ul>
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
							sql = "select * from m_gallery g left join m_product p on g.p_no = p.p_no ";
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
								String pName = rs.getString("p_name");
								String pInfo = rs.getString("p_info");
								String pImg = rs.getString("p_img");
								
					%>
					<li>
                        <img src="<%=pImg %>" alt="상품이미지">
                        <h3 class="pro_tit"><%=pName %></h3>
                        <p class="pro_com"><%=pInfo %></p>
                    </li>				
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
                </ul>
            </article>
			<script src="./js/ban.js"></script>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>