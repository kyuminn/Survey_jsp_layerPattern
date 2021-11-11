<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, survey.vo.SurveyVo,survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>

<%
	SurveyService service= new SurveyService(dao);
	List<SurveyVo> ls=service.selectAll();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
	<h2>설문조사 결과</h2>
	<table border="1">
		<tr>
			<th width="100"> 나라이름 </th>
			<th width="100"> 투표수 </th>
		</tr>    
		<% for(int i=0; i<ls.size(); i++){ %>
		<tr>
			<td align="center"><%= ls.get(i).getCountry() %></td>
			<td><%= ls.get(i).getCount() %>
		</tr>
		<% } %>
		<tr align="center">
			<td colspan="2"><button type="button" onclick="location.href='main.jsp'">메인으로</button></td>
		</tr>

	</table>
</body>
</html>