package com.test.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestnoticeDAO;
import com.test.model.TestnoticeVO;

@WebServlet("/GetTestnoticeListCtrl")
public class GetTestnoticeListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		TestnoticeDAO dao = new TestnoticeDAO();
		ArrayList<TestnoticeVO> testnoticeList = dao.getTestnoticeList();
		
		System.out.println(testnoticeList);	
		
		request.setAttribute("testnoticeList", testnoticeList);	//보낼 객체를 선언
		RequestDispatcher view = request.getRequestDispatcher("/notice/getTestnoticeList.jsp");	//보내질 곳 선언
		view.forward(request, response);  //실제 보낼 객체를 보내질 곳에 송신
	}
}