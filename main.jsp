<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드리스</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="./js/jquery.js"></script>
<link rel="stylesheet" href="./css/ban.css">
<link rel="stylesheet" href="./css/newCommon.css" />	
<style>
/* 콘텐츠 스타일 */    
.content { clear:both; width: 100%; height:auto; font-family: 'Nanum Gothic', sans-serif;}    
.con_tit{margin-left: 46%; margin-top: 3%;}
.art01 > ul > li > img {width:300px;}
.art01 { width: 960px; margin: 20px auto;  }
.art01 li { float:left; width: 300px; margin: 10px; }
</style>

</head>
<body>
<div class="wrap">
<%@ include file="header.jsp" %>
		<div class="content">
			<figure class="vs">
				<ul class="img_box">
					<li><img src="./img/bed3.jpg" alt="bed3" class="vs_img"></li>
					<li><img src="./img/bed2.jpg" alt="bed2" class="vs_img"></li>
					<li><img src="./img/bed4.jpg" alt="bed4" class="vs_img"></li>
				</ul>
			</figure>
			<h2 class="con_tit">Best Product</h2>
            <article class="art01">
                <ul>
                    <li>
                        <img src="./img/product/녹턴 토퍼.jpg" alt="상품이미지">
                        <h3 class="pro_tit">녹턴 토퍼</h3>
                        <p class="pro_com">슬림 매트리스</p>
                    </li>
                    <li>
                        <img src="./img/product/녹턴 토퍼.jpg" alt="상품이미지">
                        <h3 class="pro_tit">녹턴 베이스</h3>
                        <p class="pro_com">독립코일 적용 파운데이션</p>
                    </li>
                    <li>
                        <img src="./img/product/녹턴베이스 라지킹.jpg" alt="상품이미지">
                        <h3 class="pro_tit">녹턴 베이스 라지킹</h3>
                        <p class="pro_com">독립코일 적용 파운데이션</p>
                    </li>
                    <li>
                        <img src="./img/product/모피어스 토퍼.jpg" alt="상품이미지">
                        <h3 class="pro_tit">모피어스 토퍼</h3>
                        <p class="pro_com">말총탑재 슬림 매트리스</p>
                    </li>
                    <li>
                        <img src="./img/product/모피어스 베이스.jpg" alt="상품이미지">
                        <h3 class="pro_tit">모피어스 베이스</h3>
                        <p class="pro_com">독립코일 적용 파운데이션</p>
                    </li>
                    <li>
                        <img src="./img/product/모피어스 베이스 라지킹.jpg" alt="상품이미지">
                        <h3 class="pro_tit">모피어스 베이스 라지킹</h3>
                        <p class="pro_com">독립코일 적용 파운데이션</p>
                    </li>
                </ul>
            </article>
			<script src="./js/ban.js"></script>
		</div>		
<%@ include file="footer.jsp" %>
	</div>
</body>
</html>