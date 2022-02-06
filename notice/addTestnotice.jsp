<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 추가</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="바로가기 아이콘" href="../img/favicon.ico" type="image/x-icon">
<link rel="icon" href="/img/favicon.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="../css/ban.css">
	<link rel="stylesheet" href="../css/newCommon.css" />	
<script src="../js/jquery.js"></script>

<style>
.wrap {
	clear: both;
	width: 100%;
	height: auto;
	font-family: 'Nanum Gothic', sans-serif;
    
}
.content { width: 1200px; margin: 0 auto; height: 600px; }
.con_tit{margin-left: 44%; margin-top: 90px; margin-bottom: 35px;}
.notitable { border: 0 1px solid #333; }
.btn-group { display: block; float: right; margin-right: 200px; width: 100px; text-align: center; clear: both; margin-bottom: 30px;}
.btn-group a { font-size: 16px; clear: both; }
.table { clear: both; margin: 60px auto; }
.item1 { width:100px; text-align:center; background:#ebe4e4; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ; padding: 10px; margin-right: -2px;}
.item2 { width:300px; padding-right:20px; padding-left:10px; overflow:hidden; text-align: center;
    text-overflow:ellipsis; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.btn-group { width: 500px; margin-right: 274px; margin-top: 10px; }
.btn-group a { padding: 0 50px;  text-align: center; font-size: 20px;}
.in_btn { display:block; height:40px; line-height:40px; width:130px; float:left; border-radius:22px; background:#333; color:#fff; margin-left:20px; 
cursor:pointer; }
.in_btn:hover { background-color:#6f87a1; }
.noticecon { height:120px; margin:10px; }
</style>
</head>
<body>
<%@ include file="../addheader.jsp"%>
<div class="wrap">
	<div class="content">
		<div class="page">
		<section class="page_fr">
			<h2 class="con_tit">게시글 추가</h2>
			<form action="../AddTestnoticeCtrl" method="post" name="frm">
				<table class="table">
				<tr>	
					<th class="item1">작성자</th>
					<td class="item2">
						<input type="text" name="nname" id="nname" value="" />
					</td>
				</tr>	
				<tr>	
					<th class="item1">제목</th>
					<td class="item2">
						<input type="text" name="ntit" id="ntit" value="" />
					</td>
				</tr>	
				<tr>	
					<th class="item1">내용</th>
					<td class="item2">
						<input type="text" name="ncon" id="ncon" value="" class="noticecon"/>
					</td>
				</tr>		
				</table>
				<div class="btn-group">
					<input type="submit" class="in_btn" value="등록" />
					<input type="reset" class="in_btn" value="취소" />
				</div>
			</form>
		</section>	
	</div>	
</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>