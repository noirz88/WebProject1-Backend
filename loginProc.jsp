<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<link  rel= "바로가기 아이콘"  href= "/img/favicon.ico"  type= "image/x-icon" > 
<link  rel= "icon"  href= "/img/favicon.ico"  type= "image/x-icon" >
<%
	//캐릭터셋을 UTF-8로 설정(request, response)
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	//login.html 에서 보내온 데이터 가져와서 임의 변수에 저장
	String mId = request.getParameter("m_id"); 
	String mPw = request.getParameter("m_pw");
	
	//연결자, 상태정보자, 결과물저장 객체 선언 및 null 초기화
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//접속정보를 선언 및 값 지정
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String id="scott";
	String pw="tiger";
	String sql;
	try {
		//드라이버로딩
		Class.forName("oracle.jdbc.OracleDriver");
		//접속
		con = DriverManager.getConnection(url, id, pw);
		//sql문 작성
		sql = "select * from testmember where m_id=? and m_pw=?";
		//상태정보 활성화 및 SQL문 처리
		ps = con.prepareStatement(sql);
		ps.setString(1, mId);
		ps.setString(2, mPw);
		
		//SQL을 처리하여 결과반환
		rs = ps.executeQuery();
		
		//반환결과를 출력 => 
		//로그인시에는 해당 사람의 id가 존재하면, 로그인 처리, 존재하지 않으면 회원가입 페이지로 이동
		if(rs.next()){
			session.setAttribute("m_id", rs.getString("m_id"));
			session.setAttribute("m_pw", rs.getString("m_pw"));
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
		//결과물 저장 객체, 상태정보자 객체, 접속 객체 닫기
		rs.close();
		ps.close();
		con.close();
	} catch(Exception e) {
		response.sendRedirect("e500.jsp");
		//out.print("시스템 오류 입니다.");
	}
%>