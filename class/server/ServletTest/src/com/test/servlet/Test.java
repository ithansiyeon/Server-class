package com.test.servlet;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Calendar;

//알바생 -> 요청에 따른 페이지를 동적으로 만드는 사람
public class Test {
	
	public static void main(String[] args) {
		
		// 내 받은 편지함 페이지 
		//1. 홍길동 > 브라우저 > 메일 사이트에 접속
		//2. 받은 편지함 페이지 접속 
		//3. http://mail.naver.com/받은편지함.html -> 알바생에게 동적으로 페이지를 생성하라고 요청(Ctrl + F11) 
		//4. http://localhost:8090/servlet/mail.html
		String html = "";
		
		html+="<html>";
		html+="<head>";
		html+="<meta charset='UTF-8'>";
		html+="<title>받은 편지함</title>";
		html+="</head>";
		html+="<body>";
		html+="<h1>받은 편지함</h1>";
		html+=String.format("<p>메일이 도착했습니다. - %tT</p>",Calendar.getInstance());
		html+="</body>";
		html+="</html>";
		
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter("WebContent\\mail.html"));
			writer.write(html);
			writer.close();
			System.out.println("html created");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
	}
}
