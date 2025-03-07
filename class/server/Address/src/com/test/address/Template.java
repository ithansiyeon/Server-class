package com.test.address;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Template extends HttpServlet {
	//.jsp 실행 시키면 안돼 서블릿을 실행시켜야돼
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher 
			= req.getRequestDispatcher("/WEB-INF/views/template.jsp");
		
		dispatcher.forward(req, resp);
		
	}

}