<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
<%
	if(session.getAttribute("m_id") != null){
		session.removeAttribute("m_id");
		session.removeAttribute("m_pw");
		response.sendRedirect("main.jsp");
	}
%>