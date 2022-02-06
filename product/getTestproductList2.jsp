<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.test.model.*" %>    
<%@ page import="com.test.biz.*" %>
<%@ page import="com.test.view.*" %>
<%
	ArrayList<TestproductVO> testproductList = (ArrayList<TestproductVO>) request.getAttribute("testproductList2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
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
.con_tit{margin-left: 46%; margin-top: 60px; margin-bottom: 35px;}
.notitable { border: 0 1px solid #333; }
.btn-group { display: block; float: right; margin-right: 200px; width: 100px; text-align: center; clear: both; margin-bottom: 30px;}
.btn-group a { font-size: 16px; clear: both; }
.table { clear: both; margin: 60px auto; }
.item1 { width:70px; text-align:center; background:#ebe4e4; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ; padding: 10px; margin-right: -2px;}
.item2 { width:120px; padding-right:20px; padding-left:10px; overflow:hidden; text-align: center;
    text-overflow:ellipsis; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item3 { width:300px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item4 { width:130px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item5 { width:100px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.item6 { width:100px; text-align:center; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">	
	<h2 class="con_tit">제품목록</h2>
	<form action="" method="post">
		<table class="table">
			 <tr class="notitable">
				<th class="item1">제품코드</th>
				<th class="item2">제품명</th>
				<th class="item3">제품설명</th>
				<th class="item4">가격</th>
				<th class="item5">등록인</th>
				<th class="item6">분류</th>
			</tr>
				<%
				for(int i=0;i<testproductList.size();i++) {
					TestproductVO testproduct = testproductList.get(i);
				%>
 
			<tr>
				<td class="item1"><a href="GetTestproductCtrl2?pcode=<%=testproduct.getPcode() %>"><%=testproduct.getPcode() %></td>
				<td class="item2"><%=testproduct.getPname() %></td>
				<td class="item3"><%=testproduct.getPinfo() %></td>
				<td class="item4"><%=testproduct.getPprice() %></td>
				<td class="item5"><%=testproduct.getPid() %></td>
				<td class="item6"><%=testproduct.getPstar() %></td>
			</tr>	
		
				<%
				}
				%>
		</table>	
	</form>
</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>