<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 스토리</title>
<link rel="stylesheet" href="./css/ban.css">
<link rel="stylesheet" href="./css/newCommon.css" />	
<style>
* { margin: 0; padding: 0; }
body, html { width: 100%; height: 100%;background-color:#fbf7f7;}
ul { list-style: none; }
a { text-decoration: none; }  


.wrap {font-family: 'Nanum Gothic', sans-serif;}    	
.con_tit{ cleat:both; display:block; text-align:center; margin-top: 3%;}
.art01 { clear: both; display: block; text-align: center; padding: 20px; }
.bs { clear: both; display: block; text-align: center; }
.bs_tit { clear: both; display: block; text-align: center;}
.img1 { height: 400px; }
.bs_line { border-top:1px solid #333; margin-bottom: 20px; margin-left: 100px; margin-right: 100px;}


</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="wrap">
	<h2 class="con_tit">브랜드 스토리</h2>
	       <ul class="art01">
				<li class="bs_line"></li>
	           <li class="bs">
	    	       <a href="Brandstory1.jsp" class="bs_tit">#1. 브랜드리스 탄생 스토리</a><br>	    
	               <img src="./img/Brandstory1.jpg" alt="기업설명" class="img1"><br><br><br><br>
	           </li>
	           <li>   	                
	    	       <a href="Brandstory2.jsp" class="bs_tit">#2. 브랜드리스 매트리스는 왜 좋은가요?</a><br>	    
	               <img src="./img/Brandstory2.jpg" alt="기업설명" class="img1"><br><br><br><br> 
	           </li>
	           <li>                   
	    	       <a href="Brandstory3.jsp" class="bs_tit">#3. 브랜드리스에 없는 4가지 과정</a><br>	    
	               <img src="./img/Brandstory3.jpg" alt="기업설명" class="img1">          
	           </li>           
	       </ul>
		<script src="./js/ban.js"></script>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>