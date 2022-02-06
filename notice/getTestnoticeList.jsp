<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.model.*" %>    
<%@ page import="com.test.biz.*" %>
<%@ page import="com.test.view.*" %>
<%
	ArrayList<TestnoticeVO> testnoticeList = (ArrayList<TestnoticeVO>) request.getAttribute("testnoticeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판리스트보기</title>
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
.wrap {
	clear: both;
	width: 100%;
	height: auto;
	font-family: 'Nanum Gothic', sans-serif;
    
}
.content { width: 1200px; margin: 0 auto; min-height: 600px; }
.con_tit{margin-left: 46%; margin-top: 60px; margin-bottom: 35px; clear:both;}
.notitable { border: 0 1px solid #333; }
.btn-group { display: block; float: right; margin-right: 200px; width: 100px; text-align: center; clear: both; margin-bottom: 30px;}
.btn-group a { font-size: 16px; clear: both; }
.table { clear: both; margin: 60px auto; }
.item1 { width:50px; text-align:center; background:#ebe4e4; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ; padding: 10px; margin-right: -2px;}
.item2 { width:400px; padding-right:20px; padding-left:20px; overflow:hidden; 
    text-overflow:ellipsis; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item3 {width:100px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item4 { width:100px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item5 { width:100px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.in_btn { display:block; height:40px; line-height:40px; width:130px; float:left; border-radius:22px; background:#333; color:#fff; margin-left:20px; 
cursor:pointer; }
.in_btn:hover { background-color:#6f87a1; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">	
	<h2 class="con_tit">게시판</h2>
	<form action="" method="post">
		<table class="table">
			 <tr class="notitable">
				<th class="item1">No.</th>
				<th class="item2">제목</th>
				<th class="item3">작성자</th>				
				<th class="item4">등록일자</th>
				<th class="item5">방문횟수</th>
			</tr>
				<%
				for(int i=0;i<testnoticeList.size();i++) {
					TestnoticeVO testnotice = testnoticeList.get(i);
				%>
 
			<tr>
				<td class="item1"><%=testnotice.getSeq() %></td>
				<td class="item2"><a href="GetTestnoticeCtrl?ntit=<%=testnotice.getNtit() %>"><%=testnotice.getNtit() %></td>
				<td class="item3"><%=testnotice.getNname() %></td>
				<td class="item4"><%=testnotice.getNregdate() %></td>
				<td class="item5"><%=testnotice.getNvisited() %></td>
			</tr>	
		
				<%
				}
				%>
			<!-- 버튼 -->
			<div class="btn-group">
				<a href="./notice/addTestnotice.jsp" class="in_btn">게시글추가</a>
			</div>
		</table>	
	</form>
</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>