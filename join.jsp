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
.fr { clear:both; width:960px; margin:10px auto; margin-bottom:80px;    }
.fr:after { content:""; display:block; clear:both; }
.fr_com { text-align:center; line-height:2.4; color:#6f87a1; font-weight:bold; }
.fr_tit { text-align:center; line-height:3; padding-top:1em;}
.fr_list li { clear:both;  }
.fr_list li:first-child { border-radius:30px 30px 0px 0px; }
.fr_list li:after { content:""; clear:both; display:block; }

.lb { display:block;  width:150px; height:42px; line-height:42px; float:left; padding-top:20px; padding-bottom:20px;
	padding-left:150px; color:#222; font-weight:bold;  }
.lb.rep:before { content:"* "; color:#6f87a1; font-size:12px; }
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
<%@ include file="header.jsp" %>
<div class="fr">	
	<form action="joinPro.jsp" class="frm" method="post" name="joinform" onsubmit="return joinCheck(this)">
	<h2 class="fr_tit">회원 가입</h2>
	<p class="fr_com">* 항목은 필수 입력 항목입니다.</p>
	<ul class="fr_list">
		<li>
			<label for="m_id" class="lb rep">아이디</label>
			<span class="lb_data">
				<input type="text" name="m_id" id="m_id" placeholder="8~12 문자 및 숫자로 입력" maxlength="12" class="in_data" required autofocus />
				<input type="button" value="ID중복 확인" onclick="idCheck()" class="in_btn"/>
				<input type="hidden" value="" name="idck" id="idck" />
			</span>
		</li>
		<li>
			<label for="m_pw" class="lb  rep">비밀번호</label>
			<span class="lb_data">
				<input type="password" name="m_pw" id="m_pw" placeholder="영문, 숫자를 반드시 포함할 것"  class="in_data" required />
			</span>
		</li>
		<li>
			<label for="m_pw2" class="lb rep">비밀번호 확인</label>
			<span class="lb_data">
				<input type="password" name="m_pw2" id="m_pw2" placeholder="영문, 숫자를 반드시 포함할 것" class="in_data" required />
			</span>
		</li>
		<li>
			<label for="m_name" class="lb rep">이름</label>
			<span class="lb_data">
				<input type="text" name="m_name" id="m_name" placeholder="한글 이름 입력" class="in_data" required />
			</span>
		</li>
		<li>
			<label for="m_phone" class="lb rep">전화번호</label>
			<span class="lb_data">
				<input type="text" name="m_phone" id="m_phone" placeholder="-를 제외하여 입력" class="in_data" required />
			</span>
		</li>
		<li><label for="zipcode" class="lb">우편번호</label>
			  <span class="lb_data">
			  		<input type="text" name="zipcode" id="zipcode" class="in_data" />
			  		<input type="button" value="주소찾기" onclick="findAddr()" class="in_btn"/>	
			  </span>
		</li>
		<li>
		    <label for="address1" class="lb">주소</label>
			<span class="lb_data">
				<input type="text" name="address1" id="address1" class="in_data" />
			</span>
		</li>
		<li>
			<label for="address2" class="lb">상세주소</label>
			<span class="lb_data">
				<input type="text" name="address2" id="address2" class="in_data" />
			</span>
		</li>
		<li>
			<label for="job" class="lb">직업</label>
			<span class="lb_data">
				<select name="job" id="job" class="in_data" >
					<option value="0">선택하세요</option>
					<option value="A1">회사원</option>
					<option value="A2" selected>전산직</option>
					<option value="A3">학생</option>
					<option value="A4">공무원</option>
					<option value="A5">주부</option>
					<option value="A6">기타</option>
				</select>
			</span>
		</li>
		<li>
			<span class="fr_col first">
				<input type="submit" value="회원가입"  class="in_btn"/>
			</span>
			<span class="fr_col last">
				<input type="reset" value="취소" class="in_btn"/>
			</span>
		</li>
	</ul>
	</form>
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
/* 	function emailCheck() {
		window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
	} */
	function joinCheck(f){
		if(f.idck.value!="yes"){
			alert("아이디 중복 검사를 진행하지 않으셨습니다.");
			return false;                                                      
		}
		if(f.m_pw.value!=f.m_pw2.value) {
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			return false;
		}
	}
	</script>
<%@ include file="footer.jsp" %>
</body>
</html>