<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
<%
	//기존에 로그인 했을 때 저장한 세션값을 불러와 저장
	String uid = (String) session.getAttribute("m_id");
	String upw = (String) session.getAttribute("m_pw");
	String uname = (String) session.getAttribute("m_name");
	
	//세션의 id 값이 저장되어 있지 않으면 if문 실행하지 않고, 세션의 id값이 값이 있으면
	//invalidate() 또는 removeAttribute() 로 세션 값을 비워 로그아웃 처리
	if(uid!=null) {
		session.invalidate();
		//session.removeAttribute("id");
		//session.removeAttribute("pw");
		//session.removeAttribute("name");
	}
	//로그아웃 처리 후에 index.jsp 페이지로 이동
	response.sendRedirect("index.jsp");
%>