package com.test.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestnoticeDAO;
import com.test.model.TestnoticeVO;

@WebServlet("/GetTestnoticeCtrl")
public class GetTestnoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntit = request.getParameter("ntit");
		
		TestnoticeVO vo = new TestnoticeVO();
		vo.setNtit(ntit);
		
		TestnoticeDAO dao = new TestnoticeDAO();
		TestnoticeVO testnotice = dao.getTestnotice(vo);
		
		if(testnotice != null) {
			request.setAttribute("testnotice", testnotice);
			RequestDispatcher view = request.getRequestDispatcher("/notice/getTestnotice.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetTestnoticeListCtrl");
		}
	}
}