<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>

<%	
	SurveyService service= new SurveyService(dao);
	String userValues= request.getParameter("value");
	// , 를 기준으로 하나의 문자열을 나눠서 문자열 배열에 저장
	String[] values = userValues.split(",");
	
	for (String value: values){
		service.revoke(value);
	}
	
	response.sendRedirect("main.jsp");
%>
