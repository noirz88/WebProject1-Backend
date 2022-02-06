<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="hd">
	<div class="hd_wrap">
		<nav class="tnb">
			<ul class="left">
				<li><a href=""><strong>BRANDLESS</strong></a></li>
			</ul>
			<a href="main.jsp" class="logo"> <img src="./img/logob.jpg"
				alt="앰블럼이미지">
			</a>
			<ul class="right">
				<% 
					if(session.getAttribute("id") == null){
				%>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="agreement.jsp">회원가입</a></li>
				<li><a href="login.jsp">마이페이지</a></li>
				<% 
					}else{
				%>
				<li><a href="GetTestproductListCtrl">제품 관리</a></li>
				<li><a href="logoutProc.jsp">로그아웃</a></li>
				<li><a href="mypage.jsp">마이페이지</a></li>
				<% 
					}
				%>				
			</ul>
		</nav>
	</div>
	<div class="hd_wrap">
		<nav class="gnb">
			<ul>
				<li><a href="main.jsp" class="dp1">home</a></li>
				<li><a href="Brandstory.jsp" class="dp1">Brand story</a></li>
				<li><a href="showRoom.jsp" class="dp1">쇼룸안내</a></li>
				<li><a href="GetTestproductListCtrl2" class="dp1">제품목록</a></li>
				<li><a href="GetTestnoticeListCtrl" class="dp1">공지사항</a></li>
			</ul>
		</nav>
	</div>
</header>