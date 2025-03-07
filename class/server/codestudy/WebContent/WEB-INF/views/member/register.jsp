<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeStudy::Register</title>

<%@include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/codestudy/css/register.css">

<style>

</style>
</head>

<body>

	<!-- ########## 상단 헤더 시작 -->
	<%
		out.flush();
	    RequestDispatcher dheader = request.getRequestDispatcher("/inc/header.do");
	    dheader.include(request, response); 
	%>
	<!-- ########## 상단 헤더 끝 -->


	<!-- ########## 본문 시작 -->
	<div class="main">

		<!-- ########## 좌측 시작 -->
		<div class="menu col-sm-12 col-md-3">
			<!-- ########## 메뉴 시작 -->
			<%
				out.flush();
			    RequestDispatcher dmenu = request.getRequestDispatcher("/inc/menu.do");
				dmenu.include(request, response); //반복
			%>
			<!-- ########## 메뉴 끝 -->

			<!-- ########## 인증 시작 -->
			<%
				out.flush();
			    RequestDispatcher dauth = request.getRequestDispatcher("/inc/auth.do");
			    dauth.include(request, response);
			%>
			<!-- ########## 인증 끝 -->

			<!-- ########## 채팅 시작 -->
			<%
				out.flush();
			    RequestDispatcher dchat = request.getRequestDispatcher("/inc/chat.do");
				dchat.include(request, response);
			%>
			<!-- ########## 채팅 끝 -->
		</div>
		<!-- ########## 좌측 끝 -->



		<!-- ########## 내용 시작 -->
		<div class="content col-sm-12 col-md-9">
			<div>
				<h1>가입 <small>Register</small></h1>
                
                <form method ="POST" action ="/codestudy/member/registerok.do" enctype ="multipart/form-data">
                <div class="registerbox panel panel-default">
                    <div class="panel-heading">Register</div>
                    <div class="panel-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" id="id" name = "id" placeholder="ID" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="text" id="name" name = "name" placeholder="Name" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="email" id="email" name = "email" placeholder="Email" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="password" id="pw" name ="pw" placeholder="Password" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="password" id="cpw" name ="cpw" placeholder="Confirm Password" class="form-control" required>
                            </li>
                            <li class="list-group-item">
                                <input type="file" id="pic" name = "pic" placeholder="Picture" class="form-control">
                            </li>
                            <li class="list-group-item">
                                <button type="button" class="btn btn-default" id = "btnSubmit">
                                    <span class="glyphicon glyphicon-ok"></span>
                                    	가입
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
                </form>
			</div>
		</div>
		<!-- ########## 내용 끝 -->

	</div>
	<!-- ########## 본문 끝 -->


	<!-- ########## 하단 시작 -->
	<%@include file="/WEB-INF/views/inc/footer.jsp" %>
	<!-- ########## 하단 끝 -->
	
	<script>
    	
		function checkPassword(){
			//암호 확인 일치?
			if($("#pw").val() == $("#cpw").val()){
				return true;
			} 
			return false;
		}
		
		//자바스크립트 전송 + 유효성 검사 -> 패턴
		$("#btnSubmit").click(function(){
			if(checkPassword()){
				//전송O	- 에뮬레이터 함수 
				this.form.submit(); // 전송하기
				
			} else {
				//전송X
				alert("암호를 다시 확인하세요.");
			}
		}); 

	
    </script>
</body>

</html>