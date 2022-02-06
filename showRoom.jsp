<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼룸 안내</title>

	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />	
    <style>
    .tit {  clear: both; text-align: center; margin: 40px; }
	.content { clear: both; text-align: center; }
	.list { clear: both; text-align: center; margin: 20px; }
    </style>
   
</head>
<body>
    <div class="wrap">
<%@ include file="header.jsp" %>
<h2 class="tit">쇼룸 안내</h2>
    <ul class="content">
  		<li>
  			<img src="./img/show.jpg" alt="쇼룸" class="sr_img">
  		</li>
  		<li>
  			<p><전국 매장 리스트></p>			
  		</li>
  	</ul>
  	<ul class="list" >		
  		<li><a href="Showroom_Gangnam.jsp">강남점</a></li>
  		<li><a href="Showroom_Myeongdong.jsp">명동점</a></li>
  		<li><a href="Showroom_Mokdong.jsp">목동점</a></li>
  		<li><a href="Showroom_suji.jsp">수지점</a></li>
  		<li><a href="Showroom_lisan.jsp">일산점</a></li>
  		<li><a href="Showroom_Busan.jsp">부산센텀점</a></li>
  		<li><a href="Showroom_Daegu.jsp">대구점</a></li>
  		<li><a href="Showroom_Daejeon.jsp">대전점</a></li>
  		<li><a href="Showroom_Gwangju.jsp">광주점</a></li>
  		<li><a href="Showroom_Changwon.jsp">창원점</a></li>
  		<li><a href="Showroom_Cheonan.jsp">천안점</a></li>
  		<li><a href="Showroom_Wonju.jsp">원주점</a></li>
  		<li><a href="Showroom_Ulsan.jsp">울산점</a></li>
  		<li><a href="Showroom_Jamsil.jsp">잠실점</a></li>
  		<li><a href="Showroom_Cheongju.jsp">청주점</a></li>	
  	</ul>	
    <%@ include file="footer.jsp" %>         
	</div>
</body>
</html>