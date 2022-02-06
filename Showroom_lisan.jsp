<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼룸 안내</title>
    <!--여기부터 -->
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 
    <script> 
    function initialize() {
    var myLatlng = new google.maps.LatLng(37.65735344955799, 126.76976054045178);
    var mapOptions = {
        zoom: 17, 
        center: myLatlng
    }

    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: '일산점'
    });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
	<link rel="stylesheet" href="./css/ban.css">
	<link rel="stylesheet" href="./css/newCommon.css" />	
    <style>
	.con_data {width:calc(100% - 202px); clear:both; text-align: center;}
    .vs { clear:both; width:900px; margin: 0 auto; }
    .vs img { display:block; width: 100%; height:auto; }
    .map_area { width: 600px; height: 400px; clear:both; margin:20px auto; position:relative; }
    
    .tit { clear: both; text-align: center; margin: 30px; } 
    .tit2 { clear: both; text-align: center; margin-bottom: 30px; }  
    .address { clear: both; text-align: center; font-size: 15px; margin-top: 30px; }
    .all { clear: both; border: 1px solid #e6dfdf; margin-bottom: 40px; margin-left: 30%; margin-right: 30%; padding: 30px;}   
       
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body onload="initialize()">
    <div class="wrap">
<%@ include file="header.jsp" %>
<h2 class="tit">쇼룸 안내</h2>
<div class="all">
<h4 class="tit2">< 일산점 ></h4>
	<div class="map_area">
	    <div id="map_canvas" style="width:600px; height:400px"></div>
	</div> 
	<div class="address">
		<p class="address">
		 경기도 고양시 일산동구 중앙로1261번길 77<br>
		한신메트로폴리스 10층 1004호<br>
		031-902-1553<br>
		010-7409-2407(영업시간중 응대가능)<br>
		월-일 11시-20시<br>
		주차 가능<br>
		</p>
	</div>  
	</div>
    <%@ include file="footer.jsp" %>         
	</div>
</body>
</html>