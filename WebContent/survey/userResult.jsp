<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, survey.vo.SurveyVo, survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>
<%
	SurveyService service= new SurveyService(dao);
	List<SurveyVo> ls=service.selectAll();
	String userValues="";
	String[] values = request.getParameterValues("country");
	// request에 담긴 country 에 해당하는  values 를 가져와서 country1,country2,country3 ...형식으로 하나의 문자열로 합치기
	if (values!=null){
	userValues= String.join(",", values);
	}
	
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
		<tr> 
			<td colspan="2" align="center">
				<button type="button" onclick="location.href='main.jsp'">메인으로</button>
				
				<%if (request.getParameter("country")!=null){%>
				<input type="button" onclick="location.href='revokeProc.jsp?value=<%=userValues%>'" value="설문 취소">
				<%-- 사용자가 선택한 값을 value라는 이름의 파라미터로 넘겨주기 --%>
				<%} %>
			</td>
		</tr>
	</table>
</body>
</html>