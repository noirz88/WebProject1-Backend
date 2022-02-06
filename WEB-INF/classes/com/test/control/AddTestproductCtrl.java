package com.test.control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.TestproductDAO;
import com.test.model.TestproductVO;

@WebServlet("/AddTestproductCtrl")
public class AddTestproductCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String pcode = request.getParameter("pcode");
		String pname = request.getParameter("pname");
		String pinfo = request.getParameter("pinfo");
		String pprice = request.getParameter("pprice");
		String pid = request.getParameter("pid");
		String pstar = request.getParameter("pstar");
		
		TestproductVO vo = new TestproductVO();
		vo.setPcode(pcode);
		vo.setPname(pname);
		vo.setPinfo(pinfo);
		vo.setPprice(pprice);
		vo.setPid(pid);
		vo.setPstar(pstar);
		
		TestproductDAO dao = new TestproductDAO();
		int cnt = dao.addTestproduct(vo);
		
		if(cnt!=0) {
			response.sendRedirect("GetTestproductListCtrl");
		} else {
			response.sendRedirect("/product/addTestproduct.jsp");
		} 
	}
}
