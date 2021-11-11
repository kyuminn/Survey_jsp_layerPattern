<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="survey.dao.SurveyDaoImpl, survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>

<%	
	SurveyService service= new SurveyService(dao);
	String userValues= request.getParameter("value");
	String[] values = userValues.split(",");
	
	for (String value: values){
		service.revoke(value);
	}
	
	response.sendRedirect("main.jsp");
%>
