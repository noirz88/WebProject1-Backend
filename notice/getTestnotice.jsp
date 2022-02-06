<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"  %>    
<%@ page import="java.util.Date"  %>
<%@ page import="com.test.biz.*"  %>
<%@ page import="com.test.model.*"  %>
<%
   TestnoticeVO testnotice = (TestnoticeVO) request.getAttribute("testnotice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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
/* 콘텐츠 스타일 */
.content {
	clear: both;
	width: 100%;
	height: auto;
	font-family: 'Nanum Gothic', sans-serif;
}
.vs { clear:both; width:100%; height:400px; 
background-image:url("./img/top2.png"); background-position: center center; 
background-size:150% auto; background-repeat:no-repeat; 
animation-name:ani1; animation-duration:2.5s; animation-fill-mode:both; }
.vs_tit { padding-top:100px; color:#fff; text-shadow:1px 1px 1px #333; font-size:40px; 
text-align: center; }
.vs_com { text-align: center; color:#fff; font-size:16px; padding:40px 150px; }
.page { clear:both; width: 100%; border-top:1px solid #f1f1f1;  }
.page_tit { padding-top: 28px; }
.more { text-decoration: none; font-size:14px; text-align:right; display:block; float:right; color:deepskyblue; }
.noti_lst { clear:both; width: 730px; margin:0 auto; }
.noti_lst li { clear:both;  margin:20px;  }
.noti_lst li a { color:#333; }
.noti_lst li dl { clear:both; }
.noti_lst li dl.tit_row dd { font-weight:bold; border-top:1px solid #333; border-bottom:1px solid #333; } 
.noti_lst li dl dd { float:left; line-height:40px; }
.noti_lst li dl dd:last-child { border-right:0; }
.noti_lst li:last-child dl dd { border-bottom:1px solid #333; }
.noti_num { width:50px; text-align:center; background:#ebe4e4;  }
.noti_tit { width:400px; padding-right:20px; padding-left:10px; overflow:hidden; white-space:no-wrap; text-overflow:ellipsis; }
.noti_author { width:100px; text-align:center; }
.noti_resdate { width:100px; text-align:center; }
.con_tit{margin-left: 46%; margin-top: 3%; margin-bottom: 35px;}
.page_fr { margin-bottom: 90px; }
</style>
</head>
<body>
<div class="container">
<%@ include file="../header.jsp" %>
   <h2 class="tit">게시글 목록 보기</h2>
   <form action="" method="post" name="frm">
      <table class="table">
         <tr>
            <th class="item1">No.</th>
            <td class="item2"><%=testnotice.getSeq() %>
               <input type="hidden" name="seq" value="<%=testnotice.getSeq() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">작성자</th>
            <td class="item2"><%=testnotice.getNname() %>
               <input type="hidden" name="nname" value="<%=testnotice.getNname() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">제목</th>
            <td class="item2"><%=testnotice.getNtit() %>
               <input type="hidden" name="ntit" value="<%=testnotice.getNtit() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">내용</th>
            <td class="item2"><%=testnotice.getNcon() %>
               <input type="hidden" name="ncon" value="<%=testnotice.getNcon() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">등록일자</th>
            <td class="item2"><%=testnotice.getNregdate() %>
               <input type="hidden" name="nregdate" value="<%=testnotice.getNregdate() %>"/>
            </td>
         </tr>
         <tr>
            <th class="item1">방문횟수</th>
            <td class="item2"><%=testnotice.getNvisited() %>
               <input type="hidden" name="nvisited" value="<%=testnotice.getNvisited() %>"/>
            </td>
         </tr>
		</table>
      <div class="btn-group">
         <a href="GetTestnoticeListCtrl" class="btn btn-default">목록</a>
         <a href="DeleteTestnoticeCtrl?ntit=<%=testnotice.getNtit() %>" class="btn btn-default">제품삭제</button>
      </div>
   </form>
   <%@ include file="../footer.jsp" %>
</div>
</body>
</html>