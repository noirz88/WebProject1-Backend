package com.test.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestproductDAO;
import com.test.model.TestproductVO;

@WebServlet("/DeleteTestproductCtrl")
public class DeleteTestproductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pcode = request.getParameter("pcode");
		int cnt=0;
		TestproductVO vo = new TestproductVO();
		vo.setPcode(pcode);
		
		TestproductDAO dao = new TestproductDAO();
		cnt = dao.deleteTestproduct(vo);
		if(cnt!=0) response.sendRedirect("GetTestproductListCtrl");
	}
}