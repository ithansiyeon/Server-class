package com.test.codestudy.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/registerok.do") // 주소록 등록 
public class RegisterOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 데이터 가져오기 
		//2. 파일 업로드 처리(프로필 사진)
		//2. DB 작업 > insert 
		//3. 결과 반환 > JSP 호출하기(X)
		
		//1. 
		req.setCharacterEncoding("UTF-8");
		
		// 1. + 2.
		String id = "";
		String name = "";
		String email = "";
		String pw = "";
		String pic =  "";
		int result = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, 
					req.getRealPath("/pic"),
					1024*1024*10,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			System.out.println(req.getRealPath("/pic"));
			// clean하면 첨부파일 다 날라가
			//첨부 파일 유무 확인?
			System.out.println(multi.getFilesystemName("pic"));
			
			id = multi.getParameter("id");
			name = multi.getParameter("name");
			email = multi.getParameter("email");
			pw = multi.getParameter("pw");
			pic = multi.getFilesystemName("pic") != null ?
					multi.getFilesystemName("pic") : "nopic.png";
					
			//DB 작업  -> 위임
			// - DB 작업 객체 -> XXXDAO
			// - Data Access Object 
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = new MemberDTO();
			
			dto.setId(id);
			dto.setName(name);
			dto.setEmail(email);
			dto.setPw(pw);
			dto.setPic(pic);
			
			//dao.add(id,name,email,pw,pic);
			result = dao.add(dto);
			
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		//JSP 작업 위임(X) -> Servlet 직접(O)
		if(result==1) {
			
			//회원 가입 성공
			resp.sendRedirect("/codestudy/index.do"); // 시작 페이지로 이동 
			
		} else {
			
			//회원 가입 실패 
			//resp.setCharacterEncoding("UTF-8"); => 한글로 쓰고 싶으면
			PrintWriter writer = resp.getWriter();
			writer.print("<html>");
			writer.print("<body>");
			writer.print("<script>");
			writer.print("alert('failed');history.back();");
			writer.print("</script>");
			writer.print("</body>");
			writer.print("</html>");
			writer.close();
			
		}
		
		
	}
	
	
}
