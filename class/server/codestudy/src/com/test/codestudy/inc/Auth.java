package com.test.codestudy.inc;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.codestudy.member.MemberDAO;

@WebServlet("/inc/auth.do")
public class Auth extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		//1. DB 작업 -> select count()
		//2. 결과 전달 + JSP 호출하기 
		
		//1. 
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		
		
		HashMap<String,Integer> map = dao.getCount((String)session.getAttribute("seq"));
		
		//2. 
		request.setAttribute("map", map);
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/inc/auth.jsp");
		dispatcher.include(request, response);
		
	}

}



