<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>

body {
		margin-bottom: 300px;
	}

form > div {
	margin-bottom: 15px;
}

#feedback {
	font-size: 1.4em;
}

#selectable .ui-selecting {
	background: #FECA40;
}

#selectable .ui-selected {
	background: #F39814;
	color: white;
}

#selectable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 60%;
}

#selectable li {
	margin: 3px;
	padding: 0.4em;
	font-size: 1.4em;
	height: 18px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<h1>데이터 전송하기</h1>

	<form method="POST" action="ex09_action.jsp">
		<div>
			<input type="text" name="name" placeholder="이름">
		</div>
		<div>
			<input type="number" name="age" placeholder="나이">
		</div>
		<div>
			<input type="submit" value="보내기">
		</div>
	</form>

	<h1>폼 컨트롤 전송하기</h1>

	<form method="POST" action="ex09_action.jsp">
		<div>
			텍스트 박스: <input type="text" name="txt1">
		</div>
		<div>
			암호상자: <input type="password" name="pw1">
		</div>
		<div>
			다중라인:
			<textarea name="txt2" cols="50" rows="5"></textarea>
		</div>
		<div>
			체크 박스 : <input type="checkbox" name="cb1" value="강아지">
		</div>
		<div>
			체크 박스 <input type="checkbox" name="cb2" value="m1">운동 <input
				type="checkbox" name="cb3" value="m2">독서 <input
				type="checkbox" name="cb4" value="m3">낮잠
		</div>
		<div>
			체크 박스 <input type="checkbox" name="cb" value="m1">운동 <input
				type="checkbox" name="cb" value="m2">독서 <input
				type="checkbox" name="cb" value="m3">낮잠
		</div>
		<div>
			라디오 버튼 <input type="radio" name="rb" value="y">동의함 <input
				type="radio" name="rb" value="n">동의안함
		</div>
		<div>
			셀렉트 <select name="sel1">
				<option value="1">크다</option>
				<option value="2">보통이다</option>
				<option value="3">작다</option>
			</select>
		</div>
		<div>
			달력 <input type="date" name="date1">
		</div>
		<div>
			범위 <input type="range" min="0" max="1000" name="range1">
		</div>
		<div>
			<ol id="selectable">
				<li class="ui-widget-content" data-no="1">Item 1</li>
				<li class="ui-widget-content" data-no="2">Item 2</li>
				<li class="ui-widget-content" data-no="3">Item 3</li>
				<li class="ui-widget-content" data-no="4">Item 4</li>
				<li class="ui-widget-content" data-no="5">Item 5</li>
				<li class="ui-widget-content" data-no="6">Item 6</li>
				<li class="ui-widget-content" data-no="7">Item 7</li>
			</ol>
			<input type="hidden" name="jvalue" id="jvalue">
		</div>
		<div>
			<input type="submit" value="전송하기">
		</div>
	</form>

	<script>

		    $("#selectable").selectable({
		    	selected: function(event,ui){
		    		//alert(ui.selected.dataset["no"]);
		    		$("#jvalue").val(ui.selected.dataset["no"]);
		    	}
		    });
		
	</script>
</body>
</html>