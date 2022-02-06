<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
/* 내부 스타일 */
.frm fieldset { width:600px; padding:40px; margin:20px auto; margin-bottom: 50px; } 
.indata { display:block; width:400px; height:48px; line-height:48px; text-indent:16px; margin:20px auto; }
.btn_fr { width:600px; }
.btn_fr li:first-child { float:left; }
.btn_fr li:last-child { float:right; }
.inbtn { display:block; width:240px; height:48px; line-height:48px; text-align:center; 
background-color:#333; color:#fff; border:0; outline:0; border-radius:28px; }
.con_tit{ cleat:both; display:block; text-align:center; margin-top: 3%; margin-bottom: 20px; }
.inbtn:hover { background-color:#6f87a1; }

</style>

<script>
	var goMain = function(){
		location.href="main.jsp";
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="wrap">
        <section class="content" style="background-color: #fbf7f7;">
			<h2 class="con_tit">LOGIN</h2>
			<form action="loginProc.jsp" method="post" class="frm">
				<fieldset>
					<input type="text" class="indata" id="m_id" name="m_id" placeholder="아이디 입력" autofocus required />
					<input type="password" class="indata" id="m_pw" name="m_pw" placeholder="비밀번호 입력" required />
					<br /><br />
					<ul class="btn_fr">
						<li><input type="submit" class="inbtn" value="로그인"/></li>
						<li><input type="reset" class="inbtn" value="취소" onclick="goMain();"/></li>
					</ul>
				</fieldset>
			</form>
        </section>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>