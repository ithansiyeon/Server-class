package com.test.codestudy.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/delete.do")
public class Delete extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 가져오기 (seq)
		//2. JSP 호출하기 
		
		//1. 
		String seq = request.getParameter("seq");
		
		//2. 
		request.setAttribute("seq", seq);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/board/delete.jsp");
		dispatcher.forward(request, response);
		
		
	}

}

