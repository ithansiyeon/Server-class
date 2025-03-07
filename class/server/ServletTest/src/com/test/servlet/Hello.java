package com.test.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 서블릿 클래스 선언 (알바생 자격 획득)
public class Hello extends HttpServlet{
		
	//2. doGet/doPost 메소드 선언
	//2.a 매개변수 작성 
	//2.b 예외 미루기
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException , ServletException {
		
		//3. 동적 HTML 문서 구현 
		PrintWriter writer = resp.getWriter();
		writer.println("<html>");
		writer.println("<body>");
		writer.println("<h1>Time</h1>");
		writer.println("<p>");
		writer.printf("%tF %tT",Calendar.getInstance()
								,Calendar.getInstance());
		writer.println("</p>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		System.out.println("브라우저 요청에 따른 페이지 제작 완료"); 
		
	}
}
