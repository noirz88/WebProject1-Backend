<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOOD SLEEP</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />
	
<style>
input { outline:0; border:0;  border-radius:0;  }
.fr { clear:both; width:960px; margin:60px auto; margin-bottom:80px;  }
.fr:after { display:block; clear:both; }
.fr_com { text-align:center; line-height:2.4; color:#6f87a1; font-weight:bold; }
.fr_tit { text-align:center; padding-top:1em; text-align:center; }
.fr_list { margin-left: 130px;}
.fr_list li { clear:both; }
.fr_list li:first-child { border-radius:30px 30px 0px 0px; }
.fr_list li:after { clear:both; display:block; }
.lb { display:block;  width:125px; height:42px; line-height:42px; float:left; padding-top:20px; padding-bottom:20px;
padding-left:60px; color:#222; font-weight:bold;  }
.lb.rep:before { content:"* "; color:#6f87a1; font-size:18px; }
.lb_data { display:block;  height:42px; line-height:42px; float:left; padding-top:20px; padding-bottom:20px; }
.in_data { display:block; float:left; border:1px solid #333; width:400px; height:40px; line-height:40px; padding-left:20px; }
.in_btn { display:block; height:40px; line-height:40px; width:130px; float:left; border-radius:22px; background:#333; color:#fff; margin-left:20px; 
cursor:pointer; }
.in_btn:hover { background-color:#6f87a1; }
.fr_col { width:50%; float:left; padding-top:20px; padding-bottom:20px; display:block; }
.fr_col .in_btn { clear:both;  }
.fr_col.first .in_btn { float:right; margin-right:25px; }
.fr_col.last .in_btn { float:left; margin-left:25px; }
</style>
</head>
<body>
<div class="wrap">
<%@ include file="header.jsp" %>	
<div class="fr">
	<form action="memberModifyPro.jsp" class="frm" method="post" name="modifyform">
		<h2 class="fr_tit">회원 정보 수정</h2>
		<p class="fr_com">*아이디는 수정할 수 없습니다.</p>
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
			String mid="scott";
			String mpw="tiger";
			String sql;
			try {
				//드라이버로딩
				Class.forName("oracle.jdbc.OracleDriver");
				//접속
				con = DriverManager.getConnection(url, mid, mpw);
				//sql문 작성
				sql = "select * from testmember where m_id=?";
				//상태정보 활성화 및 SQL문 처리
				ps = con.prepareStatement(sql);
				System.out.println(session.getAttribute("m_id").toString());
				ps.setString(1, session.getAttribute("m_id").toString());
				
				//SQL을 처리하여 결과반환
				rs = ps.executeQuery();
				
				//반환결과를 출력 => 
				//로그인시에는 해당 사람의 id가 존재하면, 로그인 처리, 존재하지 않으면 회원가입 페이지로 이동
				if(rs.next()){
					String id = rs.getString("m_id");
					String m_pw = rs.getString("m_pw");
					String name = rs.getString("m_name");
					String m_phone = rs.getString("m_phone");
					String m_zipcode = rs.getString("zipcode");
					String m_addr1 = rs.getString("address1");
					String m_addr2 = rs.getString("address2");
					String job = rs.getString("job");
		%>
		<ul class="fr_list">
			<li>
				<label for="m_id" class="lb rep">아이디</label>
				<span class="lb_data">
					<input type="id" name="m_id" id="m_id" value="<%=m_id %>" class="in_data" required readonly/>
				</span>
			</li>
			<li>
				<label for="m_name" class="lb rep">이름</label>
				<span class="lb_data">
					<input type="text" name="m_name" id="m_name" value="<%=name %>" class="in_data"/>
				</span>
			</li>
			<li>
				<label for="m_pw" class="lb  rep">비밀번호</label>
				<span class="lb_data">
					<input type="password" name="m_pw" id="m_pw" placeholder="영문, 숫자를 반드시 포함할 것" value="<%=m_pw %>" class="in_data" required />
				</span>
			</li>
			<li>
				<label for="m_pw2" class="lb rep">비밀번호 확인</label>
				<span class="lb_data">
					<input type="password" name="m_pw2" id="m_pw2" placeholder="영문, 숫자를 반드시 포함할 것" value="<%=m_pw %>" class="in_data" required />
				</span>
			</li>
			<li>
				<label for="m_phone" class="lb rep">전화번호</label>
				<span class="lb_data">
					<input type="text" name="m_phone" id="m_phone" value="<%=m_phone %>" placeholder="-를 제외하여 입력" class="in_data" required />
				</span>
			</li>
			<li><label for="zipcode" class="lb">우편번호</label>
				  <span class="lb_data">
				  		<input type="text" name="zipcode" value="<%=m_zipcode %>" id="zipcode" class="in_data" />
				  		<input type="button" value="주소찾기" onclick="findAddr()" class="in_btn"/>	
				  </span>
			</li>
			<li>
			    <label for="address1" class="lb">주소</label>
				<span class="lb_data">
					<input type="text" name="address1" value="<%=m_addr1 %>" id="address1" class="in_data" />
				</span>
			</li>
			<li>
				<label for="address2" class="lb">상세주소</label>
				<span class="lb_data">
					<input type="text" name="address2" value="<%=m_addr2 %>" id="address2" class="in_data" />
				</span>
			</li>
			<li>
				<label for="job" class="lb">직업</label>
				<span class="lb_data">
					<input type="text" name="job" value="<%=job %>" id="job" class="in_data" />
				</span>
			</li>
			<li>
				<span class="fr_col first">
					<input type="submit" value="수정완료"  class="in_btn"/>
				</span>
				<span class="fr_col last">
					<input type="reset" value="취소" class="in_btn" onclick="goMypage()"/>
				</span>
			</li>
		</ul>		
	</form>
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
	
</div>
	<!-- 회원가입시 바뀐 형식의 주소 및 우편번호 취급 처리 스크립트 -->
    <script>
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);                   
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var jibunAddr = data.jibunAddress; // 지번 주소 변수
            
                    document.getElementById('zipcode').value = data.zonecode;
                    if(roadAddr !== ''){
                        document.getElementById("address1").value = roadAddr;
                    } 
                    else if(jibunAddr !== ''){
                        document.getElementById("address1").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	<!-- 아이디 중복 체크 및 유효성 검증 체크 스크립트 -->
	<script>
	//window.open("팝업창으로 열어야 할 URL 또는 파일명", "현재창의이름", "환경변수")
	function idCheck() {
		window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
	}
	
	var goMypage = function(){
		location.href="mypage.jsp";
	}
	

	function emailCheck() {
		window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
	} 
	function joinCheck(f){

		if(f.m_pw.value!=f.m_pw2.value) {
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			return false;
		}

	</script>
<%@ include file="footer.jsp" %>	
</div>
</body>
</html>