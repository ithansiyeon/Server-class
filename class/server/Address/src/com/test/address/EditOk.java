package com.test.address;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditOk extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 데이터 가져오기(seq,name.age,address)
		//2. DB 작업 > update
		//3. JSP 호출하기 
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		
		Connection conn = null;
		PreparedStatement stat = null;
		
		try {
			DBUtil util = new DBUtil();
			conn = util.open();
			String sql = "update tblAddress set name = ?, age = ?, address = ? where seq = ?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, address);
			stat.setString(4, seq);
			
			int result = stat.executeUpdate();
			
			stat.close();
			conn.close();
			
			req.setAttribute("result", result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/editok.jsp");
		dispatcher.forward(req, resp);
		
	}
}
