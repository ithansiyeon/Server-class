package com.test.servlet;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req
						, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8"); // 위에, 폼 태그에서 입력한 값을 전송할 때 한글이 깨지지 않게 하기 위해서
		PrintWriter writer = resp.getWriter();
		
		//test.html 읽기 
		// C:\Users\PC\OneDrive\바탕 화면\test.html
//		File file = new File("test.html");
//		System.out.println(file.getAbsolutePath());
		
		//JDBC -> 데이터 반환 
		String subject = "광고 메일입니다.";
		String sender = "쿠팡";
		String receiver = "홍길동";
		String time = "2020-07-20";
		
		Scanner scan = new Scanner(new FileReader("D:\\class\\server\\ServletTest\\test.html"));
		
		while(scan.hasNext()) {
//			System.out.println(scan.nextLine());
			String line = scan.nextLine();
			//{n} -> 실제 데이터와 치환
			line = line.replace("{1}", subject);
			line = line.replace("{2}", sender);
			line = line.replace("{3}", receiver);
			line = line.replace("{4}", time);
			
			writer.println(line);
		}
		writer.close();
	}
}
