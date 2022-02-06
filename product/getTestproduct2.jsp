<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>    
<%@ page import="java.util.Date"  %>
<%@ page import="com.test.biz.*"  %>
<%@ page import="com.test.model.*"  %>
<%
   TestproductVO testproduct = (TestproductVO) request.getAttribute("testproduct2");
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
.con_tit{margin-left: 46%; margin-top: 90px; margin-bottom: 35px;}
.notitable { border: 0 1px solid #333; }
.btn-group { display: block; float: right; margin-right: 200px; width: 100px; text-align: center; clear: both; margin-bottom: 30px;}
.btn-group a { font-size: 16px; clear: both; }
.table { clear: both; margin: 60px auto; }
.item1 { width:100px; text-align:center; background:#ebe4e4; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ; padding: 10px; margin-right: -2px;}
.item2 { width:300px; padding-right:20px; padding-left:10px; overflow:hidden; text-align: center;
    text-overflow:ellipsis; border-top: 1px solid#333 ;  border-bottom: 1px solid#333 ;}
.btn-group { width: 100px; margin-right: 638px; margin-top: 10px; }
.btn-group a { padding: 0 50px;  text-align: center; font-size: 20px;}
.in_btn { display:block; height:40px; line-height:40px; width:130px; float:left; border-radius:22px; background:#333; color:#fff; margin-left:20px; 
cursor:pointer; }
.in_btn:hover { background-color:#6f87a1; }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
    <h2 class="con_tit">제품 상세 보기</h2>
   <form action="" method="post" name="frm">
      <table class="table">
         <tr>
            <th class="item1">제품 코드</th>
            <td class="item2"><%=testproduct.getPcode() %>
               <input type="hidden" name="pcode" value="<%=testproduct.getPcode() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">제품명</th>
            <td class="item2"><%=testproduct.getPname() %>
               <input type="hidden" name="pname" value="<%=testproduct.getPname() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">제품 설명</th>
            <td class="item2"><%=testproduct.getPinfo() %>
               <input type="hidden" name="pinfo" value="<%=testproduct.getPinfo() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">가격</th>
            <td class="item2"><%=testproduct.getPprice() %>
               <input type="hidden" name="pprice" value="<%=testproduct.getPprice() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">등록인</th>
            <td class="item2"><%=testproduct.getPid() %>
               <input type="hidden" name="pid" value="<%=testproduct.getPid() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">분류</th>
            <td class="item2"><%=testproduct.getPstar() %>
               <input type="hidden" name="pstar" value="<%=testproduct.getPstar() %>"/>
            </td>
         </tr>
		</table>
      <div class="btn-group">
         <a href="GetTestproductListCtrl2" class="in_btn">목록</a>
      </div>
   </form>
   <%@ include file="../footer.jsp" %>
</div>
</body>
</html>