package com.test.view;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestproductDAO;
import com.test.model.TestproductVO;

@WebServlet("/GetTestproductCtrl2")
public class GetTestproductCtrl2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pcode = request.getParameter("pcode");
		
		TestproductVO vo = new TestproductVO();
		vo.setPcode(pcode);
		
		TestproductDAO dao = new TestproductDAO();
		TestproductVO testproduct2 = dao.getTestproduct(vo);
		
		if(testproduct2 != null) {
			request.setAttribute("testproduct2", testproduct2);
			RequestDispatcher view = request.getRequestDispatcher("/product/getTestproduct2.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("GetTestproductListCtrl2");
		}
	}
}