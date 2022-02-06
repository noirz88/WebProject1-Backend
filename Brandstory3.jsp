<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드리스에는 없는 4가지 과정</title>
<link rel="stylesheet" href="./css/ban.css">
<link rel="stylesheet" href="./css/newCommon.css" />	
<style>
* { margin: 0; padding: 0; }
body, html { width: 100%; height: 100%;background-color:#fbf7f7;}
ul { list-style: none; }
a { text-decoration: none; }  
.wrap {font-family: 'Nanum Gothic', sans-serif;}    	
.con_tit{ cleat:both; display:block; text-align:center; margin-top: 3%; margin-bottom: 20px; }
.bs_line { border-top:1px solid #333; margin-bottom: 20px; margin-left: 100px; margin-right: 100px; text-align: center;}
.bs { clear: both; display: block; text-align: center;  }
.bs_tit { clear: both; display: block; text-align: left;  margin-left: 9%; margin-top: 40px;  font-size: 20px;}
.bs_sub { clear: both; display: block; text-align: right;  margin-right: 9%; font-size: 13px;}
.bs_line { border-top:1px solid #333; margin-bottom: 20px; margin-left: 100px; margin-right: 100px; }
.btn_wrap { line-height: 50px; font-weight: 600; font-size: 15px; text-align: center; font-weight: bold; border:1px; soild:#333;  }
.tc_con { text-align: center; }
.art01 { clear:both; width: 1200px; margin:0 auto; }
</style>
</head>
<body>
<div class="wrap">
<%@ include file="header.jsp" %>
	<h2 class="con_tit">브랜드 스토리</h2>
       <ul class="art01">
			<li class="bs_line"></li>
			<li class="bs">
    	       <p class="bs_tit">#3. 브랜드리스에 없는 4가지 과정</p><br>	    
    	    </li>
    	    <li>
    	    	<p class="bs_sub">작성자 대표 관리자 작성일 2018-08-21 15:41:30</p><br>	    
    	    </li>
    	    <li class="tc_con">   
               <img src="./img/st3_1.jpg" alt="기업설명" class="img1">   	                	    	       
               <img src="./img/st3_2.jpg" alt="기업설명" class="img2">
           </li>
		</ul>
		<div class="btn_wrap">
			<a href="Brandstory.jsp">list</a>
		
		</div>
</div>
<%@ include file="footer.jsp" %>				
</body>
</html>