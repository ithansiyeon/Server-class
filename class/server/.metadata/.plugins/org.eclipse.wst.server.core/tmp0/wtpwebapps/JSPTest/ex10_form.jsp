<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ include file="../inc/asset.jsp" %>
<style>
	.table { width: 400px; }
	.table th { width: 150px; }
	.table td { width: 250px; }
</style>
</head>
<body>
	<!-- ex10_form.jsp -->
	<div class="container">
	
		<h1>버튼 만들기</h1>
		
		<form method="POST" action="ex10_process.jsp">
		
			<table class="table table-bordered">
				<tr>
					<th>버튼 너비</th>
					<td>
						<input type="number" name="width" min="100" max="500" step="10" value="150"> px
					</td>
				</tr>
				<tr>
					<th>버튼 높이</th>
					<td>
						<input type="number" name="height" min="20" max="300" step="10" value="30"> px
					</td>
				</tr>
				<tr>
					<th>배경색</th>
					<td>
						<input type="color" name="background" value="#FFFFFF">
					</td>
				</tr>
				<tr>
					<th>글자색</th>
					<td>
						<input type="color" name="foreground" value="#000000">	
					</td>
				</tr>
				<tr>
					<th>글자 크기</th>
					<td>
						<input type="number" name="fontsize" min="10" max="100" value="16"> px
					</td>
				</tr>
				<tr>
					<th>테두리 지정</th>
					<td>
						<select name="isBorder" id="isBorder">
							<option value="n">감추기</option>
							<option value="y">보이기</option>	
						</select>
					</td>
				</tr>
				<tr id="detail">
					<th>테두리 세부 지정</th>
					<td>
						<div>
							두께
							<input type="number" name="borderWidth" min="1" max="30" value="1">
						</div>
						<div>
							색상
							<input type="color" name="borderColor" value="#000000">
						</div>
						<div>
							스타일
							<select name="borderStyle">
								<option value="solid">실선</option>
								<option value="dashed">쇄선</option>
								<option value="dotted">점선</option>
							</select>
						</div>
						<div>
							모서리
							<input type="number" name="borderRadius" min="0" max="50" value="0">
						</div>
					</td>
				</tr>
				<tr>
					<th>버튼 갯수</th>
					<td>
						<input type="number" name="count" min="1" max="100" value="1">
					</td>
				</tr>
			</table>
		
			<div>
				<!-- <input type="submit"> -->
				<button class="btn btn-primary">만들기</button>
			</div>
		
		</form>
		
	</div>
	
	<script>
	
		$("#detail").hide();
		
		$("#isBorder").change(function() {
			//alert($(this).val());
			if ($(this).val() == "y") {
				$("#detail").show();		
			} else {
				$("#detail").hide();
			}
		});
	
	</script>
</body>
</html>















