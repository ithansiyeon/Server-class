<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file = "inc/asset.jsp" %>
<style>

</style>
</head>
<body>
	<div class = "container">
		<h1>세션 만료시간 지정</h1>
		<%
			
			session.setMaxInactiveInterval(30);
			
		%>
		
		<a href = "ex17_session.jsp">돌아가기</a>
	</div>
	
	<script>

	</script>
</body>
</html>