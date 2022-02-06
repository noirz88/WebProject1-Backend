package com.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestnoticeDAO;
import com.test.model.TestnoticeVO;

@WebServlet("/DeleteTestnoticeCtrl")
public class DeleteTestnoticeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String ntit = request.getParameter("ntit");
		int cnt=0;
		TestnoticeVO vo = new TestnoticeVO();
		vo.setNtit(ntit);
		
		TestnoticeDAO dao = new TestnoticeDAO();
		cnt = dao.deleteTestnotice(vo);
		if(cnt!=0) response.sendRedirect("GetTestnoticeListCtrl");
	}
}