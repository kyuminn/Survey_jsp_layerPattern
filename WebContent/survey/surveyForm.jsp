<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 양식</title>
<style type="text/css">
	legend {
		color:blue;
	}
	
	button {
		background-color:blue;
		color:white;
		}
</style>
</head>
<body>
	<h2>설문조사 양식</h2>
	<form action="surveyProc.jsp" method="post">
		<fieldset>
			<legend><b>여행하고 싶은 나라</b></legend>
				<input type="checkbox" name="country" value="일본">일본<br>
				<input type="checkbox" name="country" value="미국">미국<br>
				<input type="checkbox" name="country" value="영국">영국<br>
				<input type="checkbox" name="country" value="스페인">스페인<br>
				<input type="text" name="other" placeholder="기타(직접입력)-ex)미얀마" size="20"><br><br>
				<input type="submit" value="투표하기" >
				<button type="button" onclick="location.href='main.jsp'">메인으로</button>
			
		</fieldset>
	</form>
</body>
</html>